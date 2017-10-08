<%-- 
    Document   : completeBooking
    Created on : 08/10/2017, 9:54:11 PM
    Author     : sawicky
--%>
<%@page import="uts.wsd.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%Tutor tutor = (Tutor)session.getAttribute("tutor");%>
        <%String filePathBooking = application.getRealPath("WEB-INF/bookings.xml");
         String filePathTutor = application.getRealPath("WEB-INF/tutors.xml");%>
        <jsp:useBean id="bookingApp" class = "uts.wsd.BookingApplication" scope ="application">
                 <jsp:setProperty name ="bookingApp" property="filePath" value ="<%=filePathBooking%>"/>    
        </jsp:useBean>
        <jsp:useBean id="tutorApp" class = "uts.wsd.TutorApplication" scope ="application">
                 <jsp:setProperty name ="tutorApp" property="filePath" value ="<%=filePathTutor%>"/>    
        </jsp:useBean>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complete</title>
        <link rel = "stylesheet" type = "text/css" HREF = "main.css">
        <%bookingApp.setFilePath(filePathBooking);%>
        <%tutorApp.setFilePath(filePathTutor);%>
        <%Bookings bookings = bookingApp.getBookings();%>
        <%Tutors tutors = tutorApp.getTutors();%>
    </head>
    <body>
        <div class="logopic"><img class ="logopic" src="logo2.png"></div>
        <ul class ="navigationbar">
	<li class ="navigation"><a class ="active" href="viewBooking.jsp">View a booking</a></li>
        <li class ="navigation"><a href="viewMyBookings.jsp">My Bookings</a></li>
	<li class ="navigation"><a href="booking.jsp">Booking Menu</a></li>
        <li class ="navigation"><a href="main.jsp">Main Menu</a></li>
        <li class ="navigation"><a href="logout.jsp">Logout</a></li>
        </ul>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            if (bookings.getBooking(id).getStatus().equals("Completed") || bookings.getBooking(id).getStatus().equals("Cancelled")) {
                %><p id ="p2"><font color ="red">Booking is either completed or cancelled</font></p><%
            } else {
                tutor.setAvailability("Available");
                bookings.getBooking(id).setStatus("Completed");
                tutorApp.updateTutors(tutors, filePathTutor);
                bookingApp.updateBookings(bookings, filePathBooking);%>
                <p id ="p2">Booking <%=id%> completed</p>
            <% } %>
        
            
        
    </body>
</html>
