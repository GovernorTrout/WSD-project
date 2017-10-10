<%-- 
    Document   : index
    Created on : 10/09/2017, 1:49:56 PM
    Author     : Proma
--%>

<%@page import="uts.wsd.*"  import="java.util.*"contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <link rel = "stylesheet" type = "text/css" HREF = "main.css">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        
        <%
        Tutor tutor = (Tutor)session.getAttribute("tutor");
        Student student = (Student)session.getAttribute("student");
        String submitted = request.getParameter("submitted");
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
        
        <div class="logopic"><img class ="logopic" src="logo2.png"></div>
        <ul class ="navigationbar">
	<li class ="navigation"><a class ="active" href="register.jsp">Register</a></li>
        <li class ="navigation"><a href="main.jsp">Main Menu</a></li>
        <% if (student!=null || tutor!=null) { %>
	<li class ="navigation"><a href="booking.jsp">Booking Menu</a></li>
        <li class ="navigation"><a href="edit_user.jsp">Account</a></li>       
        <% } %>
        <li class ="navigation"><a href="logout.jsp">Logout</a></li>
        </ul>
        <% if (session.getAttribute("student") != null) { 
            if (student != null) { %>
                <p id="p2">You are logged in as <%=student.getName()%> &lt; <%=student.getEmail() %> &gt;</p>
                <p id="p2"> Search for a tutor </a></p>
                <form method="post" action ="main.jsp">
                <table class="register">
                    <tr><td>Subject: <select name="subject">
                                <option value =""></option>
                                    <option value="WSD">WSD</option>
                                    <option value="USP">USP</option>
                                    <option value="SEP">SEP</option>
                                    <option value="AppProg">AppProg</option>
                                    <option value="MobileApp">MobileApp</option>
                                    </select>
                        </td></tr>
                    <tr><td>Tutor name: <input type="name" name="tutorname"></td></tr>
                    <tr><td>Tutor status: <input type="checkbox" name="tutoravail" value="Available">Available</td><td><input type="checkbox" name="tutoravail" value ="Unavailable">Unavailable</td></tr>
                    <tr><td><input type="submit" value="Search"</td></tr>
                </table>
                    <input type ="hidden" name="submitted" value ="yes">
                </form>
                <p id="p2">Click <a href="logout.jsp"> Logout </a></p>   
                <p id="p2"><a href="edit_user.jsp"> My account </a></p>
                <p id="p2"><a href="booking.jsp"> Booking </a></p>
                <% } 
                if (submitted!=null) {
                    String subject = null;
                    String tutorName = null;
                    subject = request.getParameter("subject");
                    tutorName = request.getParameter("tutorname");
                    String tutorStatus = request.getParameter("tutoravail");
                    %><table class = "results">
                        <tr class ="results2"><td>Tutor Name</td><td>Tutor Email</td><td>Subject</td><td>Status</td></tr><%
                        if (subject!=null && tutorName.isEmpty() && tutorStatus ==null ) {
                        //Search using subject only
                            for (Tutor t : tutors.getList()) {
                            if (subject.equals(t.getSubject())) {
                            %><tr><td><a href ="createBooking.jsp?email=<%=t.getEmail()%>&subject=<%=t.getSubject()%>"><%=t.getName()%></a></td><td><%=t.getEmail()%></td><td><%=t.getSubject()%></td><td><%=t.getAvailability()%></td></tr><%
                            }    
                            }
                        } 
                        else if (!subject.isEmpty() && !tutorName.isEmpty() && tutorStatus!=null) {
                        //Search using subject and Tutor name
                            for (Tutor t : tutors.getList()) {
                            if (subject.equals(t.getSubject()) && tutorName.equals(t.getName())) {
                                %><tr><td><a href ="createBooking.jsp?email=<%=t.getEmail()%>&subject=<%=t.getSubject()%>"><%=t.getName()%></a></td><td><%=t.getEmail()%></td><td><%=t.getSubject()%></td><td><%=t.getAvailability()%></td></tr><%
                            }   
                        } }
                        else if (!subject.isEmpty() && !tutorName.isEmpty() && (tutorStatus=="Available" || tutorStatus=="Unavailable")) {
                        //Search using subject, tutorname and availability
                            for (Tutor t : tutors.getList()) {
                            if (subject.equals(t.getSubject()) && tutorName.equals(t.getName()) && tutorStatus.equals(t.getAvailability())) {
                                %><tr><td><a href ="createBooking.jsp?email=<%=t.getEmail()%>&subject=<%=t.getSubject()%>"><%=t.getName()%></a></td><td><%=t.getEmail()%></td><td><%=t.getSubject()%></td><td><%=t.getAvailability()%></td></tr><%
                            }   
                        } }
                        else if (!subject.isEmpty() && tutorName.isEmpty() && (tutorStatus=="Available" || tutorStatus=="Unavailable")) {
                        //Search using subject and availability
                        for (Tutor t : tutors.getList()) {
                        if (subject.equals(t.getSubject()) && tutorStatus.equals(t.getAvailability())) {
                                %><tr><td><a href ="createBooking.jsp?email=<%=t.getEmail()%>&subject=<%=t.getSubject()%>"><%=t.getName()%></a></td><td><%=t.getEmail()%></td><td><%=t.getSubject()%></td><td><%=t.getAvailability()%></td></tr><%
                            }
                        } }
                        else if (subject.isEmpty() && !tutorName.isEmpty() && tutorStatus==null) {
                        //Search using tutor name
                        for (Tutor t : tutors.getList()) {
                        if (tutorName.equals(t.getName())) {
                                %><tr><td><a href ="createBooking.jsp?email=<%=t.getEmail()%>&subject=<%=t.getSubject()%>"><%=t.getName()%></a></td><td><%=t.getEmail()%></td><td><%=t.getSubject()%></td><td><%=t.getAvailability()%></td></tr><%
                            }   
                        } }
                        else if (subject.isEmpty() && !tutorName.isEmpty() && tutorStatus!=null) {
                        //Search using tutor name and availability
                        for (Tutor t : tutors.getList()) {
                        if (tutorName.equals(t.getName()) && tutorStatus.equals(t.getAvailability())) {
                                %><tr><td><a href ="createBooking.jsp?email=<%=t.getEmail()%>&subject=<%=t.getSubject()%>"><%=t.getName()%></a></td><td><%=t.getEmail()%></td><td><%=t.getSubject()%></td><td><%=t.getAvailability()%></td></tr><%
                            }   
                        } }
                        else if (subject.isEmpty() && tutorName.isEmpty() && tutorStatus!=null) {
                        //Search using availability
                        for (Tutor t : tutors.getList()) {
                        if (tutorStatus.equals(t.getAvailability())) {
                                %><tr><td><a href ="createBooking.jsp?email=<%=t.getEmail()%>&subject=<%=t.getSubject()%>"><%=t.getName()%></a></td><td><%=t.getEmail()%></td><td><%=t.getSubject()%></td><td><%=t.getAvailability()%></td></tr><%
                            }   
                        } }
                        else {
                        //Search all results
                                for (Tutor t : tutors.getList()) {
                                %><tr><td><a href ="createBooking.jsp?email=<%=t.getEmail()%>&subject=<%=t.getSubject()%>"><%=t.getName()%></a></td><td><%=t.getEmail()%></td><td><%=t.getSubject()%></td><td><%=t.getAvailability()%></td></tr><%
                        } }                       
                    
                } %>
         <% } else if (session.getAttribute("tutor") != null) {
            if (tutor != null) { %>
                <p id="p2">You are logged in as <%=tutor.getName()%> &lt; <%=tutor.getEmail() %> &gt;</p>
                <p id="p2">Click <a href="logout.jsp"> Logout </a></p>   
                <p id="p2"><a href="edit_user.jsp"> My account </a></p>
                <p id="p2"><a href="booking.jsp"> Booking </a></p>
                <% } %>
         <% } else {%>
         <p id="p2">You're not logged in</p><br>
         <p id="p2"><a href="login.jsp">Login</a> | <a href="register.jsp"> Register</a></p> <% } %>           


    </body>
</html>