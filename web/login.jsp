<%-- 
    Document   : login
    Created on : 07/10/2017, 4:41:08 PM
    Author     : sawicky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel = "stylesheet" type = "text/css" HREF = "main.css">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page</title>
    </head>
    <body>
        <p id ="h">Please enter your login details</p>
        <form method="post" action="loginAction.jsp">
            <table class ="register">
                <tr><td>Email:</td><td><input type ="text" name ="email"></td></tr>
                <tr><td>Password:</td><td><input type ="text" name ="password"></td></tr>
                <tr><td></td><td><input type ="submit"></td><td></td></tr>
            </table>
        </form>
        <p id ="p2">If you do not have an account, please register <a href="register.jsp">here.</a></p>
    </body>
</html>
