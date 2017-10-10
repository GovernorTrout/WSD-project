<%-- 
    Document   : testRegister
    Created on : 02/10/2017, 2:01:51 PM
    Author     : Proma
--%>

<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel = "stylesheet" type = "text/css" HREF = "main.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <jsp:useBean id="bookingApp" class = "uts.wsd.BookingApplication" scope ="application">
                 <jsp:setProperty name ="bookingApp" property="filePath" value ="<%=filePathBooking%>"/>    
        </jsp:useBean>
        <%studentApp.setFilePath(filePathStudent);%>
        <%tutorApp.setFilePath(filePathTutor);%>
        <%bookingApp.setFilePath(filePathBooking);%>
        <%Students students = studentApp.getStudents();%>
        <%Tutors tutors = tutorApp.getTutors();%>
        <%studentApp.saveStudents();%>

    </head>
    <body>
        <div class="logopic"><img class ="logopic" src="logo2.png"></div>
        <ul class ="navigationbar">
	<li class ="navigation"><a class ="active" href="register.jsp">Register</a></li>
        <li class ="navigation"><a href="main.jsp">Main Menu</a></li>
        <li class ="navigation"><a href="logout.jsp">Logout</a></li>
        </ul>
        <%
            String type = request.getParameter("type"); 
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");
            //Methods to see which one of our fields were empty. Can be multiple errors.
             if (dob.isEmpty()) {
                %><p id ="p2"><font color="red">You cannot leave your date of birth empty!</font></p><%
            }
            if (password.isEmpty()) {
                %><p id ="p2"><font color="red">You cannot leave your password empty!</font></p><%
            } 
            if (name.isEmpty()) {
                %><p id ="p2"><font color="red">You cannot leave your name empty!</font></p><%
            }
            if (email.isEmpty()) {
                %><p id ="p2"><font color="red">You cannot leave your email empty!</font></p><%
            }
            if (email.isEmpty() || dob.isEmpty() || name.isEmpty() || password.isEmpty()) {
                %><p id ="p2">Invalid registration, please try again <a href="register.jsp">here</a></p><%
            }
            else if (students.getStudent(email) == null && tutors.getTutor(email) == null && !dob.isEmpty() && !password.isEmpty() && !name.isEmpty() && !email.isEmpty()) {
                //If we picked the student type, then create a student object, add it to the unmarshalled list of students we got from top of page then marshal it back to XML.
                if (type.equals("Student") && type!=null) {
                    Student student = new Student(name, email, password, type, dob);             
                    session.setAttribute("student", student);
                    
                    if (students != null) {
                        students.addStudent(student);
                        studentApp.updateStudents(students, filePathStudent);
                    } else {
                        %>Null user<%
                    }
                } else if (type.equals("Tutor") && type!=null) {
                    String status = "Available";
                    String specialty = request.getParameter("specialty");
                    Tutor tutor = new Tutor(name, email, password, type, dob, specialty, status);
                    session.setAttribute("tutor", tutor);
                    if (tutors!=null) {
                        tutors.addTutor(tutor);
                        tutorApp.updateTutors(tutors, filePathTutor);
                    } else {
                        %>Null user<%
                    }                  
                } else {
                    %>Type invalid <%
                } %>
                <script LANGUAGE="JavaScript">
                         // redirect to main after 3 seconds
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
                <p id="p2">Thank you for registering!<br>You will be taken to the main page momentarily..</p>\
                <% //If the email we type already exists (the email will be our Primary Key) then user already exists %>
            <% } else if (students.getStudent(email) != null || tutors.getTutor(email) != null){ %>
            <p id ="p2"> User already exists, please try again <a href="register.jsp">here</a></p>
            <% } %>
    </body>
</html>
