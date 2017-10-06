<%-- 
    Document   : logout
    Created on : 02/10/2017, 1:31:17 PM
    Author     : Proma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel = "stylesheet" type = "text/css" HREF = "main.css">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            session.invalidate();
        %>
        <p id ="p2">You have been logged out, Click <a href="index.jsp">here</a> to return to the landing page.</p>
    </body>
</html>
