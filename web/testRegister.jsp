<%-- 
    Document   : testRegister
    Created on : 02/10/2017, 2:01:51 PM
    Author     : Proma
--%>

<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            String filePathStudent = application.getRealPath("WEB-INF/students.xml");
            String filePathTutor = application.getRealPath("WEB-INF/tutors.xml");
            String filePathBooking = application.getRealPath("WEB-INF/bookings.xml");
            String type = request.getParameter("type"); %>
            
        <jsp:useBean id="studentApp" class = "uts.wsd.StudentApplication" scope ="application">
                 <jsp:setProperty name ="studentApp" property="filePath" value ="<%=filePathStudent%>"/>    
        </jsp:useBean>
        <jsp:useBean id="tutorApp" class = "uts.wsd.TutorApplication" scope ="application">
                 <jsp:setProperty name ="tutorApp" property="filePath" value ="<%=filePathTutor%>"/>    
        </jsp:useBean>
        <%Students students = studentApp.getStudents();%>
        <%Tutors tutors = tutorApp.getTutors();%>

    </head>
    <body>
        <h1>Hello World!</h1>
        <%

 
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");
            if (type.equals("Student") && type!=null) {
                Student student = new Student(name, email, password, type, dob);
                session.setAttribute("student", student);
                if (students != null) {
                    students.addStudent(student);
                    studentApp.updateStudents(students, filePathStudent);
                } else {
                    %>Null user<%
                }

            } else if (type.equals("Tutor") && type!=null) {
                String specialty = request.getParameter("specialty");
                Tutor tutor = new Tutor(name, email, password, type, dob, specialty);
                session.setAttribute("tutor", tutor);
                if (tutors!=null) {
                    tutors.addTutor(tutor);
                    tutorApp.updateTutors(tutors, filePathTutor);
                } else {
                    %>Null user<%
                }                  
            } else {
                %>Type invalid <%
            }%>     
    </body>
</html>
