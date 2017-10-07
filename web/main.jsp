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
        <%Tutor tutor = (Tutor)session.getAttribute("tutor");%>
        <%Student student = (Student)session.getAttribute("student");%>
        
        <div class="logopic"><img class ="logopic" src="logo2.png"></div>
        <% if (session.getAttribute("student") != null) { 
            if (student != null) { %>
                <p id="p2">You are logged in as <%=student.getName()%> &lt; <%=student.getEmail() %> &gt;</p>
                <p id="p2"> Search for a tutor </a></p>
                <form method="post" action ="main.jsp">
                <table class="register">
                    <tr><td>Subject: <select name="subject">
                                    <option value="WSD">WSD</option>
                                    <option value="USP">USP</option>
                                    <option value="SEP">SEP</option>
                                    <option value="AppProg">AppProg</option>
                                    <option value="MobileApp">MobileApp</option>
                                    </select>
                        </td></tr>
                    <tr><td>Tutor name: <input type="name" name="tutorname"></td></tr>
                    <tr><td>Tutor status: <input type="checkbox" name="tutoravail">Available</tr>
                    <tr><td><input type="submit" value="Search"</td></tr>
                </table>
                </form>
                <p id="p2">Click <a href="logout.jsp"> Logout </a></p>   
                <p id="p2"><a href="edit_user.jsp"> My account </a></p>
                <p id="p2"><a href="booking.jsp"> Booking </a></p>
                <% } %>
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