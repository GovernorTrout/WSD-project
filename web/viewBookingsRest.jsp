<%-- 
    Document   : viewBookingsRest
    Created on : 09/10/2017, 10:56:11 PM
    Author     : sawicky
--%>

<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel = "stylesheet" type = "text/css" HREF = "main.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="logopic"><img class ="logopic" src="logo2.png"></div>
        <ul class ="navigationbar">
	<li class ="navigation"><a class ="active" href="viewBooking.jsp">View a booking</a></li>
	<li class ="navigation"><a href="booking.jsp">Booking Menu</a></li>
        <li class ="navigation"><a href="main.jsp">Main Menu</a></li>
        <li class ="navigation"><a href="logout.jsp">Logout</a></li>
        </ul>
        <% String submitted = request.getParameter("submitted"); %>
        <p id="p2"> Search for a booking </a></p>
                <form method="post" action ="viewBookingsRest.jsp">
                <table class="register">
                    <tr><td>Subject: </td><td><select name="subject">
                                <option value =""></option>
                                    <option value="WSD">WSD</option>
                                    <option value="USP">USP</option>
                                    <option value="SEP">SEP</option>
                                    <option value="AppProg">AppProg</option>
                                    <option value="MobileApp">MobileApp</option>
                                    </select>
                        </td></tr>
                    <tr><td>Student name: </td><td><input type="name" name="studentname"></td></tr>
                    <tr><td>Student email:</td><td> <input type="name" name="studentemail"></td></tr>
                    <tr><td>Booking status: </td><td><input type="checkbox" name="bookingavail" value="Active">Active<input type="checkbox" name="bookingavail" value ="Cancelled">Cancelled<input type="checkbox" name="bookingavail" value ="Completed">Completed</td></tr>
                    <tr><td><input type="submit" value="Search"</td></tr>
                </table>
                    <input type ="hidden" name="submitted" value ="yes">
                </form>
    <% 
 if (submitted!=null) {
    String subject = request.getParameter("subject");
    String studentname = request.getParameter("studentname");
    String studentemail = request.getParameter("studentemail");
    String bookingavail = request.getParameter("bookingavail");
    //Return all bookings
    if (subject.isEmpty() && studentname.isEmpty() && studentemail.isEmpty() && bookingavail ==null ) {
        response.sendRedirect("rest/bookingApp/bookings");
        }
    //Search by subject
    else if (subject!=null && studentname.isEmpty() && studentemail.isEmpty() && bookingavail ==null) {
        }
    //Search by subject and student name
    else if (subject!=null && studentname.isEmpty() && studentemail.isEmpty() && bookingavail ==null) {
        }
    //Search by subject, student name, student email
    else if (subject!=null && studentname.isEmpty() && studentemail.isEmpty() && bookingavail ==null) {
        }
    //Search by subject, student name, student email, status
    else if (subject!=null && studentname.isEmpty() && studentemail.isEmpty() && bookingavail ==null) {
        }
    //Search by Student Name
    else if (subject.isEmpty() && studentname!=null && studentemail.isEmpty() && bookingavail ==null) {
        response.sendRedirect("rest/bookingApp/bookings?id=01&name=1");
        }
    //Search by student name, student email
    else if (subject!=null && studentname.isEmpty() && studentemail.isEmpty() && bookingavail ==null) {
        }
    //Search by student name, student email, status
    else if (subject!=null && studentname.isEmpty() && studentemail.isEmpty() && bookingavail ==null) {
        }
    //Search by Student Email
    else if (subject!=null && studentname.isEmpty() && studentemail.isEmpty() && bookingavail ==null) {
        }
    //Search by email, status
    else if (subject!=null && studentname.isEmpty() && studentemail.isEmpty() && bookingavail ==null) {
        }
    //Search by Status
    else if (subject!=null && studentname.isEmpty() && studentemail.isEmpty() && bookingavail ==null) {
        }
    } %>
    </body>
</html>
