
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel = "stylesheet" type = "text/css" HREF = "main.css">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>

    </head>
    <body>
    
        <h1 id="h">Register</h1>
        <form method="post" action="main.jsp">
                 <script type="text/javascript">
                function tutorFunc($i){
                    if ($i == "Tutor") {;
                        document.getElementById("specialityTD").innerHTML = "Specialty Subject";
                        document.getElementById("specialtySelect").style = "visibility:visible";
                        document.getElementById("specialtySelect").innerHTML = ('<option value="WSD">WSD</option><option value="USP">USP</option><option value="SEP">SEP</option><option value="AppProg">AppProg</option><option value="MobileApp">MobileApp</option>');
                    }
                    else {
                        document.getElementById("specialityTD").innerHTML = '';
                        document.getElementById("specialtySelect").style = "visibility:hidden";
                        document.getElementById("specialtySelect").innerHTML = '';
                    }
                }
            </script>
            <table class="register">
                <tr><td>Full name</td> <td><input type="text" name="name"></td></tr>
                <tr><td>Email</td> <td><input type="text" name="email"></td></tr>
                <tr><td>Password</td> <td><input type="password" name="password"></td></tr>
                <tr><td>Date of Birth</td><td><input type="date" name="dob"></td></tr>
                <tr><td>User type</td><td><select name="type" onchange="tutorFunc(value);"> 
                            <option value="Student">Student</option>
                            <option value="Tutor">Tutor</option></select></td></tr>
                <tr><td id="specialityTD"></td><td><select id="specialtySelect" name="specialty" style="visibility:hidden"></select></td></tr>
                <tr><td></td><td><input type="submit" value="Register"</td></tr>
            </table>
            
        </form>

    </body>

</html>
