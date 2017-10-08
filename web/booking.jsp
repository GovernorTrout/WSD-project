<%-- 
    Document   : booking
    Created on : 07/10/2017, 5:04:31 PM
    Author     : sawicky
--%>
<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel = "stylesheet" type = "text/css" HREF = "main.css">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Page</title>
    </head>
    <body>
        <div class="logopic"><img class ="logopic" src="logo2.png"></div>
        <ul class ="navigationbar">
	<li class ="navigation"><a class ="active" href="booking.jsp">Booking Menu</a></li>
	<li class ="navigation"><a href="booking.jsp">Booking Menu</a></li>
        </ul>
        <%Tutor tutor = (Tutor)session.getAttribute("tutor");%>
        <%Student student = (Student)session.getAttribute("student");%>
        <p id ="p2"><a href ="viewBookings.jsp">View all bookings</a></p><br>
        <p id ="p2"><a href ="viewBooking.jsp">View a specific booking</a></p><br>
        <p id ="p2"><a href="cancelBooking.jsp">Cancel a booking</a></p><br>
        <%if (student!=null) {%>
            <p id ="p2"><a href ="createBooking.jsp">Create a booking</a></p>
        <%}%>
        
    </body>
</html>
