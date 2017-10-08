<%-- 
    Document   : loginAction
    Created on : 07/10/2017, 4:46:58 PM
    Author     : sawicky
--%>
<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel = "stylesheet" type = "text/css" HREF = "main.css">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page</title>
    </head>
        <%
            String filePathStudent = application.getRealPath("WEB-INF/students.xml");
            String filePathTutor = application.getRealPath("WEB-INF/tutors.xml");
            String filePathBooking = application.getRealPath("WEB-INF/bookings.xml");
        %>
            
        <jsp:useBean id="studentApp" class = "uts.wsd.StudentApplication" scope ="application">
                 <jsp:setProperty name ="studentApp" property="filePath" value ="<%=filePathStudent%>"/> 
        </jsp:useBean>
        <jsp:useBean id="tutorApp" class = "uts.wsd.TutorApplication" scope ="application">
                 <jsp:setProperty name ="tutorApp" property="filePath" value ="<%=filePathTutor%>"/>    
        </jsp:useBean>
        <%Students students = studentApp.getStudents();%>
        <%Tutors tutors = tutorApp.getTutors();%>   
    <body>
          <div class="logopic"><img class ="logopic" src="logo2.png"></div>
        <ul class ="navigationbar">
	<li class ="navigation"><a class ="active" href="login.jsp">Login</a></li>
	<li class ="navigation"><a href="main.jsp">Main Page</a></li>
        <li class ="navigation"><a href="register.jsp">Register</a></li>
        

        </ul>
        <% 
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Student student = students.login(email, password);
            Tutor tutor = tutors.login(email, password);
            if (student != null) {
                session.setAttribute("student", student); %>
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
                <p id="p2">Thank you for logging in!<br>You will be taken to the main page momentarily..</p>                
            <%} else if (tutor != null ) {
                session.setAttribute("tutor", tutor); %>
         <script LANGUAGE="JavaScript">
                         // redirect to main after 5 seconds
                    var time = 3; 
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
                <p id="p2">Thank you for logging in!<br>You will be taken to the main page momentarily..</p>               
            <% } else if (tutor == null && student == null) {
                boolean emailFlag = false;
                boolean passwordFlag = false;
                %><p id ="p2"><font color ="red">Invalid login details! Please try again</font></p><%
                    for (Tutor t : tutors.getList()) {
                        if (email!= null && !email.equals(t.getEmail())) {
                         emailFlag = true;
                        } else if (email != null && email.equals(t.getEmail())) {
                         passwordFlag = true;   
                        }
                    }
                for (Student s : students.getList()) {
                        if (email!= null && !email.equals(s.getEmail())) {
                         emailFlag = true;
                        } else if (email != null && email.equals(s.getEmail())) {
                         passwordFlag = true;   
                        }
                }
                if (emailFlag == true && passwordFlag == false) {
                    %><p id ="p2"><font color ="red">Email not found</font></p><%
                 } else if (passwordFlag == true) {
                    %><p id ="p2"><font color ="red">Incorrect password</font></p><%
                 }
            %>
                <p id ="h">Please enter your login details</p>
                <form method="post" action="loginAction.jsp">
                <table class ="register">
                    <tr><td>Email:</td><td><input type ="text" name ="email"></td></tr>
                    <tr><td>Password:</td><td><input type ="password" name ="password"></td></tr>
                    <tr><td></td><td><input type ="submit"></td><td></td></tr>
                </table>
                </form>
                <p id ="p2">If you do not have an account, please register <a href="register.jsp">here.</a></p>
                    
            <% } %>
    </body>
</html>
