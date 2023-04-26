package com.example.companyemployeeservletitspacekaren.servlet;

import com.example.companyemployeeservletitspacekaren.manager.CompanyManager;
import com.example.companyemployeeservletitspacekaren.manager.EmployeeManager;
import com.example.companyemployeeservletitspacekaren.model.Company;
import com.example.companyemployeeservletitspacekaren.model.Employee;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/createEmployee")
public class CreateEmployeeServlet extends HttpServlet {

    private CompanyManager companyManager = new CompanyManager();
    private EmployeeManager employeeManager = new EmployeeManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Company> all = companyManager.getAll();
        req.setAttribute("companyList", all);
        req.getRequestDispatcher("WEB-INF/createEmployee.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String email = req.getParameter("email");
        int company_id = Integer.parseInt(req.getParameter("company name"));
        Employee employee = new Employee();
        employee.setName(name);
        employee.setSurname(surname);
        employee.setEmail(email);
        employee.setCompany(companyManager.getById(company_id));
        employeeManager.save(employee);
        resp.sendRedirect("/employees");
    }
}
