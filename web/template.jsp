<%-- 
    Document   : template
    Created on : 18/09/2017, 12:13:23 PM
    Author     : Riley
--%>

<%@page import="uts.wsd.*"  import="java.util.*"contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <link rel = "stylesheet" type = "text/css" HREF = "main.css">
    <link rel = "stylesheet" type = "text/css" HREF = "template.css">    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Template</title>
    </head>
    <body>
        <%Tutor tutor = (Tutor) session.getAttribute("tutor");%>
        <%Student student = (Student) session.getAttribute("student");%>

        <div class="container">

            <div class="menu">
                <div class="menuleft"><a href="main.jsp">Main</a> | <a href="booking.jsp">Bookings</a></div>
                <div class="menuright">
                    <% if (session.getAttribute("student") != null) {
                            if (student != null) {%>
                    <a href="logout.jsp">Logout</a> | <a href="edit_user.jsp"> Account </a> <% } %>
                    <% } else if (session.getAttribute("tutor") != null) {
                        if (tutor != null) {%>
                    <a href="logout.jsp">Logout</a> | <a href="edit_user.jsp"> Account </a> <% } %>
                    <% } else {%> <a href="login.jsp">Login</a> | <a href="register.jsp">Register</a> <% }%>
                </div>
            </div>
            <div class="content">
                
                Content goes here.
            
            </div>
            <div class="footer"></div>
        </div>
    </body>
</html>