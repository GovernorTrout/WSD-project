<%-- 
    Document   : one
    Created on : 07/08/2017, 7:00:11 PM
    Author     : Proma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel = "stylesheet" type = "text/css" HREF = "main.css">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <input type="hidden" name="submitted" value="no">
           <%
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String dob = request.getParameter("dob");
        String type = request.getParameter("type");
        %>
    </head> 
    <body>
                <p>Welcome, <%=name%>!</p>
                <p>Your Email is <%=email%></p>
                <p>Your password is <%=password%></p>
    </body>
</html>