<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register Page</title>
</head>
<body>

<%
    if(session.getAttribute("user") != null){
        response.sendRedirect("/home");
    }%>

<h3>Register:</h3>
<form action="/register" method="post">
   Name:<input name="name" type="text"><br>
    Surname:<input name="surname" type="text"><br>
    Email:<input name="email" type="text"><br>
    Password:<input name="password" type="password"><br>
    <select name="type">
        <option VALUE="ADMIN">ADMIN</option>
        <option VALUE="USER">USER</option>
    </select><br>
    <input type="submit" value="register"><br>
</form>
<h4><a href="/">Back</a></h4>
</body>
</html>