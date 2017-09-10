<%-- 
    Document   : index
    Created on : 10/09/2017, 1:49:56 PM
    Author     : sawicky
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
        <%User user = (User)session.getAttribute("user");%>
        <div class="logopic"><img class ="logopic" src="logo2.png"></div>
        <% if (user!= null)
        { %>
        <p id="p2">You are logged in as <%=user.getName()%> &lt; <%=user.getEmail() %> &gt;</p>
         <p id="p2">Click <a href="logout.jsp"> Logout </a></p>   
         <p id="p2"><a href="edit_user.jsp"> My account </a></p>
         <% } else { %>
         <p id="p2">You're not logged in</p><br>
         <p id="p2"><a href="login.jsp">Login</a> | <a href="register.jsp"> Register</a></p> <% } %>           


    </body>
</html>