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
        <div class="logopic"><img class ="logopic" src="logo2.png"></div>
        
        <%
            session.invalidate();
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
