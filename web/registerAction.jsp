<%-- 
    Document   : registerAction
    Created on : 02/10/2017, 2:00:51 AM
    Author     : sawicky
--%>

<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
       <link rel = "stylesheet" type = "text/css" HREF = "main.css">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
             String filePathStudent = application.getRealPath("WEB-INF/students.xml");
             String filePathTutor = application.getRealPath("WEB-INF/tutors.xml");
             String filePathBooking = application.getRealPath("WEB-INF/bookings.xml"); %>
             <jsp:useBean id="userApp" class = "uts.wsd.UserApplication" scope ="application">
                 <jsp:setProperty name ="userApp" property="filePath" value ="<%=filePathStudent%>"/>
             </jsp:useBean>
            <%Users users = userApp.getUsers();%>
            
    </head>
    <body>
            <%
                
                    
                String type = request.getParameter("type");
                String email = request.getParameter("email");
                String name = request.getParameter("name");
                String password = request.getParameter("password");
                String dob = request.getParameter("dob");
                if (users.getUser(email) == null)
                {
                    if (type.equals("Student")) {
                        User user = new User(name, email, password, dob, type);
                        session.setAttribute("user",user); 
                        users.addUser(user);
                        userApp.updateXML(users, filePathStudent);
                    }
                    else {
                        String specialty = request.getParameter("specialty");
                        User user = new User(name, email, password, dob, type, specialty);
                        session.setAttribute("user",user);
                        users.addUser(user);
                        userApp.updateXML(users, filePathTutor);
                    } %>       
           
                     <script LANGUAGE="JavaScript">
                        // redirect to main after 5 seconds

                        var time = 5; 
                        var timelong = 0;
                        //reduce time
                        function diplaytime() {
                                document.all.his.innerHTML = time - timelong;
                                timelong++;
                        }
                        //redirection
                        function redirect() {
                                window.location.href = "main.jsp";
                        }
                        timer = setInterval('diplaytime()', 1000);
                        timer = setTimeout('redirect()', time * 1000);

                     </script>
                     <p id="p2">Thank you for registering!<br>You will be taken to the main page momentarily..</p>
                     <% } else { %>
                     <p id ="p2"> User already exists, exiting</p>
                     <% } %>
                     

    </body>
</html>
