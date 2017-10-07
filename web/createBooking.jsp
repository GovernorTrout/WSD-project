<%-- 
    Document   : createBooking
    Created on : 07/10/2017, 10:40:22 PM
    Author     : sawicky
--%>
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
        <%studentApp.saveStudents();%>
    </head>
    <body>
        <form method ="post" action="createBooking.jsp">
            <table class ="register">
                <tr><td>Tutor name:</td><td><input type ="text" name ="tutorName"></td></tr>
                <tr><td>Subject</td><td><input type ="text" name ="subject"></td></tr>
                <tr><td><input type ="submit"></td>
            </table>
            <input type ="hidden" name="created" value ="yes">
        </form>
        <% if (created!=null) { %>
            <% String tutorName = request.getParameter("tutorName");
            String subject = request.getParameter("subject");%>
            <p id ="p2">Booking created! Details:<br></p>
            <p id ="p2">Tutor name: <%=tutorName%></p>
            <p id ="p2">Subject name: <%=subject%></p>
            <p id ="p2">Student name: <%=student.getName()%></p>
            <p id ="p2">Student email: <%=student.getEmail()%></p>  
        <%}%>
    </body>
</html>
