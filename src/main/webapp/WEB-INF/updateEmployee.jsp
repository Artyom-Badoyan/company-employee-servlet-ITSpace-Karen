<%@ page import="com.example.companyemployeeservletitspacekaren.model.Company" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.companyemployeeservletitspacekaren.model.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Employee</title>
</head>
<body>
<% Employee employee = (Employee) request.getAttribute("employee");%>
<% List<Company> companyData = (List<Company>) request.getAttribute("company");%>
<a href="/employees">Back</a>
<h2>Create Employee</h2>

<form action="/updateEmployee" method="post">
    <input name="id" type="hidden" value="<%= employee.getId()%>">
    name: <input type="text" name="name" value="<%= employee.getName()%>"><br>
    surname: <input type="text" name="surname" value="<%= employee.getSurname()%>"><br>
    email: <input type="email" name="email" value="<%= employee.getEmail()%>"><br>
    company name: <select name="company">
    <%for (Company company : companyData) {%>
    <option value="<%=company.getId()%>"><%=company.getName()%>></option>
    <% }%>
</select>
    <input type="submit" value="update">
</form>
</body>
</html>
