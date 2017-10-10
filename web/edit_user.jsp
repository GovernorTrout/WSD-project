<%-- 
    Document   : edit_user
    Created on : 14/08/2017, 6:54:00 PM
    Author     : Proma
--%>

<%@page import="uts.wsd.*"  import="java.util.*"contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel = "stylesheet" type = "text/css" HREF = "main.css">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="logopic"><img class ="logopic" src="logo2.png"></div>
        <ul class ="navigationbar">
	<li class ="navigation"><a class ="active" href="createBooking.jsp">Create a booking</a></li>
	<li class ="navigation"><a href="booking.jsp">Bookings menu</a></li>
        <li class ="navigation"><a href="main.jsp">Main Menu</a></li>
        <li class ="navigation"><a href="logout.jsp">Logout</a></li>
        </ul>
       <%Student student = (Student)session.getAttribute("student");
       Tutor tutor = (Tutor)session.getAttribute("tutor");
       String created = request.getParameter("created");
          String filePathStudent = application.getRealPath("WEB-INF/students.xml");
          String filePathTutor = application.getRealPath("WEB-INF/tutors.xml");
          String filePathBooking = application.getRealPath("WEB-INF/bookings.xml");%>
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
        <%Bookings bookings = bookingApp.getBookings();%>
        <%bookingApp.saveBookings();%>
        <%tutorApp.saveTutors();%>
        <%studentApp.saveStudents();
        if (student!=null) { %>
        
            <form method="post" action="edit_user.jsp">
                <table class ="register">
                    <tr><td>Email</td> <td><input type="text" name="email" value="<%=student.getEmail()%>"></td></tr>
                    <tr><td>Full name</td> <td><input type="text" name="name" value="<%=student.getName()%>"> </td></tr>
                    <tr><td>Password</td> <td><input type="password" name="password" value="<%=student.getPassword()%>"></td></tr>
                    <tr><td>Date of Birth</td><td><input type="date" name="dob" value ="<%=student.getDob()%>"></td></tr>
                    <tr><td>Cancel my account</td><td><input type="checkbox" name="cancel"></td></tr>
                    <tr><td></td><td><input type="submit" value="Save"</td></tr>      
                    <p id ="p2">Return to the main page <a href="index.jsp">Main page</a></p>        
                </table>    
                <input type="hidden" name="created" value ="yes">
            </form>
        <% }else if (tutor!=null) { %>
        <form method="post" action="edit_user.jsp">
            <table class ="register">
                <tr><td>Email</td> <td><input type="text" name="email" value="<%=tutor.getEmail()%>"></td></tr>
                <tr><td>Full name</td> <td><input type="text" name="name" value="<%=tutor.getName()%>"> </td></tr>
                <tr><td>Password</td> <td><input type="password" name="password" value="<%=tutor.getPassword()%>"></td></tr>
                <tr><td>Date of Birth</td><td><input type="date" name="dob" value ="<%=tutor.getDob()%>"></td></tr>
                <tr><td>Specialty subject</td><td><select name="subject"> 
                            <option value="WSD">WSD</option>
                            <option value="USP">USP</option>
                            <option value="SEP">SEP</option>
                            <option value="AppProg">AppProg</option>
                            <option value="MobileApp">MobileApp</option></select></td></tr>
                <tr><td>Cancel my account</td><td><input type="checkbox" name="cancel"></td></tr>
                <tr><td></td><td><input type="submit" value="Save"</td></tr>
                <p id ="p2">Return to the main page <a href="index.jsp">Main page</a></p>        
            </table>       
            <input type="hidden" name="created" value ="yes">
        </form>
        <% } else { %>
            <p id="p2">You're not logged in</p><br>
            <p id="p2"><a href="login.jsp">Login</a> | <a href="register.jsp"> Register</a></p> 
        <% } %>          
        <%
            if (created!=null) {
                String cancel = request.getParameter("cancel");
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String dob = request.getParameter("dob");
                if (student!= null) {
                    if (cancel==null) {
                        Student s = students.getStudent(student.getEmail());
                        //Null checking otherwise java will throw null ptr exception
                        if (students!=null && student!=null && dob!=null && email!=null && password!=null && name!=null) {
                            //update our object
                            s.setDob(dob);
                            s.setEmail(email);
                            s.setPassword(password);
                            s.setName(name);
                            //update our session
                            student.setDob(dob);
                            student.setEmail(email);
                            student.setPassword(password);
                            student.setName(name);
                            studentApp.updateStudents(students, filePathStudent);
                            %><p id ="p2">Account updated</p><%
                        }
                        //If our checkbox is on, then proceed to cancel the account. Iterate through all bookings attached to the account then set their statuses to Cancelled
                    } else if (cancel.equals("on")) {
                        %><p id ="p2">Account Cancelled, you have been logged out.</p><%
                        for (Booking b : bookings.getList()) {
                            if (student.getName().equals(b.getStudentName()) && student.getEmail().equals(b.getStudentEmail())) {
                                b.setStatus("Cancelled");
                            }
                        }
                        //Remove the object from our unmarshalled list, then marshal the object back to XML and kill the session.
                        students.removeStudent(students.getStudent(student.getEmail()));
                        bookingApp.updateBookings(bookings, filePathBooking);
                        studentApp.saveStudents();
                        session.invalidate();
                    }
                }
                if (tutor!= null) {
                    if(cancel==null) {
                        String subject = request.getParameter("subject");
                        Tutor t= tutors.getTutor(tutor.getEmail());
                        if (tutors!=null && tutor!=null && dob!=null && email!=null && password!=null && name!=null) {
                            //update our object
                            t.setDob(dob);
                            t.setEmail(email);
                            t.setPassword(password);
                            t.setName(name);
                            t.setSubject(subject);
                            //update our session
                            tutor.setDob(dob);
                            tutor.setEmail(email);
                            tutor.setPassword(password);
                            tutor.setName(name);
                            tutor.setSubject(subject);
                            tutorApp.updateTutors(tutors, filePathTutor);
                            %><p id ="p2">Account updated</p><%
                        }
                    } else if (cancel.equals("on")) {
                        %><p id ="p2">Account Cancelled, you have been logged out.</p><%
                        for (Booking b : bookings.getList()) {
                            if (tutor.getName().equals(b.getTutorName()) && tutor.getEmail().equals(b.getTutorEmail())) {
                                b.setStatus("Cancelled");
                            }
                        }
                        tutors.removeTutor(tutors.getTutor(tutor.getEmail()));
                        bookingApp.updateBookings(bookings, filePathBooking);
                        tutorApp.saveTutors();
                        session.invalidate();
                    }
                }
            }%>
    </body>
</html>
