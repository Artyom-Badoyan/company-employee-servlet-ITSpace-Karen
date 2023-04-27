package com.example.companyemployeeservletitspacekaren.servlet;

import com.example.companyemployeeservletitspacekaren.manager.CompanyManager;
import com.example.companyemployeeservletitspacekaren.model.Company;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet("/createCompany")
public class CreateCompanyServlet extends HttpServlet {

    private CompanyManager companyManager = new CompanyManager();
    List<String> countries = Arrays.asList("Armenai", "USA", "Russia", "France");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("countryList", countries);
        req.getRequestDispatcher("WEB-INF/createCompany.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String country = req.getParameter("country");
        Company company = Company.builder()
                .name(name)
                .country(country)
                .build();
        companyManager.save(company);
        resp.sendRedirect("/companies");
    }
}
