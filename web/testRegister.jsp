<%-- 
    Document   : testRegister
    Created on : 02/10/2017, 2:01:51 PM
    Author     : sawicky
--%>

<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <%
                    Users users = new Users();
             String filePathStudent = application.getRealPath("WEB-INF/students.xml");
             String filePathTutor = application.getRealPath("WEB-INF/tutors.xml");
             String filePathBooking = application.getRealPath("WEB-INF/bookings.xml"); %>
             <jsp:useBean id="userApp" class = "uts.wsd.UserApplication" scope ="application">
                 <jsp:setProperty name ="userApp" property="filePath" value ="<%=filePathStudent%>"/>
                 <jsp:setProperty name ="userApp" property="users" value="<%=users%>"/>
    </jsp:useBean>
    </head>
    <body>
        <h1>Hello World!</h1>
         <%
                
                    
                String type = request.getParameter("type");
                String email = request.getParameter("email");
                String name = request.getParameter("name");
                String password = request.getParameter("password");
                String dob = request.getParameter("dob");
                  if (type.equals("Student")) {
                        String specialty = "Student";
                        User user = new User(email, name, password, dob, type, specialty);
                        session.setAttribute("user",user); 
                        if (users != null) {
                            users.addUser(user);
                            %><%=user.getName()%><%
                            %><%=user.getEmail()%><%
                            %><%=user.getDob()%><%
                            %><%=user.getType()%><%
                            %><%=user.getSubject()%><%
                            userApp.saveUsers();
                            userApp.updateXML(users, filePathStudent);
                        }
                        else {
                            %>Null user<%
                        }
                        
                    }
                    else if (type.equals("Tutor")){
                        String specialty = request.getParameter("specialty");
                        User user = new User(name, email, password, dob, type, specialty);
                        session.setAttribute("user",user);
                        users.addUser(user);
                       // userApp.updateXML(users, filePathTutor);
                    } 
                    else {
                        %>Type invalid <%
           }%>     
    </body>
</html>
