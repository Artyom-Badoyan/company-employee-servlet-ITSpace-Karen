<%@ page import="com.example.companyemployeeservletitspacekaren.model.Company" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Employee</title>
</head>

<%List<Company> companyData = (List<Company>) request.getAttribute("companyList");%>

<body>

<a href="/employees">Back</a>
<h2>Create Employee</h2>

<form action="/createEmployee" method="post">
    name: <input type="text" name="name"><br>
    surname: <input type="text" name="surname"><br>
    email: <input type="email" name="email"><br>
        company name: <select name="company name">
        <%for (Company company : companyData) {%>
        <option value="<%=company.getId()%>"><%=company.getName()%>></option>
        <% }%>
    </select>
    <input type="submit" value="create">
</form>
</body>
</html>
