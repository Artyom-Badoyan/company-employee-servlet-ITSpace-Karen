<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Main Page</title>
</head>
<body>

<%
    if (session.getAttribute("user") != null) {
        response.sendRedirect("/home");
    }%>

<% String msg = (String) session.getAttribute("msg");%>
<% if (msg != null) {%>
<span style="color:red"><%=msg%>></span><br>
<%
session.removeAttribute("msg");
}%>

<h3>Login:</h3>
<form action="/login" method="post">
    Email:<input name="email" type="text"><br>
    Password:<input name="password" type="password"><br>
    <input type="submit" value="login"><br>
</form>
<h4><a href="/register.jsp">Register</a></h4>
</body>
</html>