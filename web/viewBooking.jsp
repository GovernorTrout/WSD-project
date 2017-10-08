<%-- 
    Document   : viewBooking
    Created on : 08/10/2017, 2:33:25 PM
    Author     : sawicky
--%>
<%@page import="uts.wsd.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%Tutor tutor = (Tutor)session.getAttribute("tutor");%>
        <%Student student = (Student)session.getAttribute("student");%>
        <%String submitted = request.getParameter("submitted");
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
        <%studentApp.saveStudents();%>
        <link rel = "stylesheet" type = "text/css" HREF = "main.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="logopic"><img class ="logopic" src="logo2.png"></div>
        <ul class ="navigationbar">
	<li class ="navigation"><a class ="active" href="viewBooking.jsp">View a booking</a></li>
	<li class ="navigation"><a href="booking.jsp">Booking Menu</a></li>
        </ul>
        <p id ="p2">Please enter your booking ID to view</p>
        <form method ="post" action ="viewBooking.jsp">
            <table class ="register">
                <tr><td>Booking ID:</td><td><input type ="number" name="id"></td></tr>\
                <tr><td><input type = "submit" value ="Submit"></td></tr>
            </table>
            <input type="hidden" name ="submitted" value ="yes">
        </form>
        <% if (submitted != null && submitted.equals("yes")) {
            int id = Integer.parseInt(request.getParameter("id"));
            if (id == bookings.getBooking(id).getId()) {
                if (student != null) {
                    if (student.getName().equals(bookings.getBooking(id).getStudentName()) && student.getEmail().equals(bookings.getBooking(id).getStudentEmail())) {
                        %><p id ="p2">Booking details:</p>
                        <table class ="register">
                            <tr><td>ID:</td><td><%=id%></td></tr>
                            <tr><td>Student Name:</td><td><%=bookings.getBooking(id).getStudentName()%></td></tr>
                            <tr><td>Student Email:</td><td><%=bookings.getBooking(id).getStudentEmail()%></td></tr>
                            <tr><td>Tutor Name:</td><td><%=bookings.getBooking(id).getTutorName()%></td></tr>
                            <tr><td>Tutor Email:</td><td><%=bookings.getBooking(id).getTutorEmail()%></td></tr>
                            <tr><td>Subject:</td><td><%=bookings.getBooking(id).getSubject()%></td></tr>
                            <tr><td>Status:</td><td><%=bookings.getBooking(id).getStatus()%></td></tr>
                        </table> <%
                    } else {
                        %><p id ="p2">You do not own this booking</p><%  
                    }             
                } else if (tutor != null) {
                    if (tutor.getName().equals(bookings.getBooking(id).getTutorName()) && tutor.getEmail().equals(bookings.getBooking(id).getTutorEmail())) {
                        %><p id ="p2">Booking details:</p>
                        <table class ="register">
                            <tr><td>ID:</td><td><%=id%></td></tr>
                            <tr><td>Student Name:</td><td><%=bookings.getBooking(id).getStudentName()%></td></tr>
                            <tr><td>Student Email:</td><td><%=bookings.getBooking(id).getStudentEmail()%></td></tr>
                            <tr><td>Tutor Name:</td><td><%=bookings.getBooking(id).getTutorName()%></td></tr>
                            <tr><td>Tutor Email:</td><td><%=bookings.getBooking(id).getTutorEmail()%></td></tr>
                            <tr><td>Subject:</td><td><%=bookings.getBooking(id).getSubject()%></td></tr>
                            <tr><td>Status:</td><td><%=bookings.getBooking(id).getStatus()%></td></tr>
                        </table> <%
                    } else {
                        %><p id ="p2">You do not own this booking</p><%  
                    }  
                } else {
                    %><p id="p2">You're not logged in</p><br>
                    <p id="p2"><a href="login.jsp">Login</a> | <a href="register.jsp"> Register</a></p> 
             <% }     
            }
        }%>
    </body>
</html>