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

@WebServlet("/updateEmployee")
public class UpdateEmployeeServlet extends HttpServlet {
    private EmployeeManager employeeManager = new EmployeeManager();
    private CompanyManager companyManager = new CompanyManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Employee employee = employeeManager.getById(id);
        List<Company> all = companyManager.getAll();
        req.setAttribute("employee", employee);
        req.setAttribute("company", all);
        req.getRequestDispatcher("WEB-INF/updateEmployee.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String email = req.getParameter("email");
        int company_id = Integer.parseInt(req.getParameter("company"));
        Employee employee = new Employee(id, name, surname, email, companyManager.getById(company_id));
        employeeManager.update(employee);
        resp.sendRedirect("/employees");
    }
}
