<%-- 
    Document   : cancelBooking
    Created on : 08/10/2017, 1:45:32 PM
    Author     : sawicky
--%>

<%@page import="uts.wsd.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel = "stylesheet" type = "text/css" HREF = "main.css">
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel booking</title>
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
        
    </head>
    <body>
        <div class="logopic"><img class ="logopic" src="logo2.png"></div>
        <ul class ="navigationbar">
	<li class ="navigation"><a class ="active" href="cancelBooking.jsp">Cancel a booking</a></li>
	<li class ="navigation"><a href="booking.jsp">Booking Menu</a></li>
        </ul>
        <p id ="p2">Please enter your booking ID to cancel</p>
        <form method ="post" action ="cancelBooking.jsp">
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
                        bookings.getBooking(id).setStatus("Cancelled");
                        tutors.getTutor(bookings.getBooking(id).getTutorEmail()).setAvailability("Available");
                        tutorApp.updateTutors(tutors, filePathTutor);
                        bookingApp.updateBookings(bookings, filePathBooking); 
                        %><p id ="p2">Booking cancelled!</p><%
                    } else {
                        %><p id ="p2">You do not own this booking</p><%  
                    }             
                } else if (tutor != null) {
                    if (tutor.getName().equals(bookings.getBooking(id).getTutorName()) && tutor.getEmail().equals(bookings.getBooking(id).getTutorEmail())) {
                        bookings.getBooking(id).setStatus("Cancelled");
                        tutors.getTutor(bookings.getBooking(id).getTutorEmail()).setAvailability("Available");
                        tutorApp.updateTutors(tutors, filePathTutor);
                        bookingApp.updateBookings(bookings, filePathBooking); 
                        %><p id ="p2">Booking cancelled!</p><%  
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
