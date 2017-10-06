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
            String filePathStudent = application.getRealPath("WEB-INF/students.xml");
            String filePathTutor = application.getRealPath("WEB-INF/tutors.xml");
            String filePathBooking = application.getRealPath("WEB-INF/bookings.xml");
            String type = request.getParameter("type"); %>
            
        <jsp:useBean id="userApp" class = "uts.wsd.UserApplication" scope ="application">
                 <jsp:setProperty name ="userApp" property="filePathStudent" value ="<%=filePathStudent%>"/>
                <jsp:setProperty name ="userApp" property="filePathTutor" value ="<%=filePathTutor%>"/>          
        </jsp:useBean>
        <%Users users = userApp.getUsers();%>

    </head>
    <body>
        <h1>Hello World!</h1>
        <%

 
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");
            if (type.equals("Student") && type!=null) {
                User user = new User(type, name, email, password, dob);
                session.setAttribute("user", user);
                if (users != null) {
                    users.addUser(user);
                    userApp.updateStudents(users, filePathStudent);
        } else {
        %>Null user<%
            }

        } else if (type.equals("Tutor") && type!=null) {
            String specialty = request.getParameter("specialty");
            User user = new User(type, name, email, password, dob, specialty);
            session.setAttribute("user", user);
            if (users!=null) {
                users.addUser(user);
                userApp.updateTutors(users, filePathTutor);
                } else {
                %>Null user<%
                }
                    
        } else {
        %>Type invalid <%
            }%>     
    </body>
</html>
