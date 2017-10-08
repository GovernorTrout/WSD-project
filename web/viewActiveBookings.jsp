<%-- 
    Document   : viewActiveBookings
    Created on : 08/10/2017, 9:31:08 PM
    Author     : sawicky
--%>
<%@page import="uts.wsd.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%Tutor tutor = (Tutor)session.getAttribute("tutor");%>
        <%Student student = (Student)session.getAttribute("student");%>
        <%
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
        <title>Active Bookings</title>
    </head>
    <body>
        <div class="logopic"><img class ="logopic" src="logo2.png"></div>
        <ul class ="navigationbar">
	<li class ="navigation"><a class ="active" href="viewBooking.jsp">View active bookings</a></li>
	<li class ="navigation"><a href="booking.jsp">Booking Menu</a></li>
        <li class ="navigation"><a href="main.jsp">Main Menu</a></li>
        <li class ="navigation"><a href="logout.jsp">Logout</a></li>
        </ul>
        <table class ="results">
            <tr class ="results2"><td>ID</td><td>Student Name</td><td>Student Email</td><td>Tutor Name</td><td>Tutor Email</td><td>Subject</td></tr>
        <%
            for (Booking b : bookings.getList()) {
                    if (b.getStatus().equals("Active")) {%>
                        <tr><td><%=b.getId()%></td><td><%=b.getStudentName()%></td><td><%=b.getStudentEmail()%></td><td><%=b.getTutorName()%></td><td><%=b.getTutorEmail()%></td><td><%=b.getSubject()%></td></tr>
                    <%
                }               
            }
           %>
        </table>
        
    </body>
</html>
