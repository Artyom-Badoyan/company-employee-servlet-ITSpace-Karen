<%@ page import="com.example.companyemployeeservletitspacekaren.model.Employee" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.companyemployeeservletitspacekaren.model.User" %>
<%@ page import="com.example.companyemployeeservletitspacekaren.model.UserType" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employees</title>
    <a href="/">Back</a>
</head>
<%List<Employee> employeeList = (List<Employee>) request.getAttribute("employeeList");
    User user = (User) session.getAttribute("user");
%>
<body>
<h2>Employees</h2> <a href="/createEmployee"> Create Employee</a>
<table border="1">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>surname</th>
        <th>email</th>
        <th>company name</th>
        <% if (user.getUserType() == UserType.ADMIN) { %>
        <th>delete</th>
        <th>update</th>
        <%}%>
    </tr>
    <% if(employeeList != null && !employeeList.isEmpty()) {%>
    <% for (Employee employee : employeeList) {%>
            <tr>
                <td><%= employee.getId()%></td>
                <td><%= employee.getName()%></td>
                <td><%= employee.getSurname()%></td>
                <td><%= employee.getEmail()%></td>
                <td><%= employee.getCompany()%></td>
                <% if (user.getUserType() == UserType.ADMIN) { %>
                <td> <a href="/removeEmployee?id=<%= employee.getId()%>">delete</a> </td>
                <td> <a href="/updateEmployee?id=<%= employee.getId()%>">update</a> </td>
                <%}%>
            </tr>
       <%}%>
       <%}%>

</table>
</body>
</html>
