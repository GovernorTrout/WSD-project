<%-- 
    Document   : createBooking
    Created on : 07/10/2017, 10:40:22 PM
    Author     : sawicky
--%>
<%@page import="java.lang.String"%>
<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel = "stylesheet" type = "text/css" HREF = "main.css">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <input type ="hidden" name="created" value ="no">
        <title>Create Booking</title>
        <%Student student = (Student)session.getAttribute("student");%>
        <%String created = request.getParameter("created");
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
	<li class ="navigation"><a class ="active" href="createBooking.jsp">Create a booking</a></li>
	<li class ="navigation"><a href="booking.jsp">Bookings menu</a></li>
        <li class ="navigation"><a href="main.jsp">Main Menu</a></li>
        <li class ="navigation"><a href="logout.jsp">Logout</a></li>
        </ul>
            <br>
        <form method ="post" action="createBooking.jsp">
            <div class ="main">
            <table class ="register">
                
                <tr><td>Tutor email:</td><td><input type ="text" name ="tutorEmail" value="${param.email}"></td></tr>
                <tr><td>Subject</td><td><input type ="text" name ="subject" value ="${param.subject}"></td></tr>
                <tr><td><input type ="submit"></td></tr>
                    
            </table>
                </div>
            <input type ="hidden" name="created" value ="yes">
        </form>
        <% if (created!=null) { 
            int id = 0;
            for (Booking booking : bookings.getList()) {
                if (id == booking.getId()) {
                    id++;
                }
            }
            String studentEmail = student.getEmail();
            String studentName = student.getName();
            String tutorEmail = request.getParameter("tutorEmail");
            String tutorName = tutors.getTutor(tutorEmail).getName();
            String avail = tutors.getTutor(tutorEmail).getAvailability();
            String subject = request.getParameter("subject");
            //First check if the tutor is available
            if (avail!=null && avail.equals("Unavailable")) {
                %><p id ="p2">Tutor is currently unavailable, please select another tutor</p><%
            } else if (avail!=null){
                String status = "Active";
                //if not, then make a new booking, add it to the unmarshalled object list, then make tutor Unavailable then marshal both back to XML
                Booking booking = new Booking(id, studentEmail, studentName, tutorEmail, tutorName, subject, status);
                bookings.addBooking(booking);
                tutors.getTutor(tutorEmail).setAvailability("Unavailable");
                tutorApp.updateTutors(tutors, filePathTutor);
                bookingApp.updateBookings(bookings, filePathBooking);
                
                %>
                <p id ="p2">Booking created! Details:<br></p>
                <p id ="p2">Tutor name: <%=tutorName%></p>
                <p id ="p2">Subject name: <%=subject%></p>
                <p id ="p2">Student name: <%=student.getName()%></p>
                <p id ="p2">Student email: <%=student.getEmail()%></p> 
                <p id ="p2">Your unique booking ID: <%=id%></p>
            <%}%>
        <%}%>
    </body>
</html>
