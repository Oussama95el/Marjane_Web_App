package com.simplon.marjane.controller.SuperAdmin;

import com.simplon.marjane.Dao.AdminDao;
import com.simplon.marjane.Dao.BranchDao;
import com.simplon.marjane.entity.AdminEntity;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ManagerCreatServlet", value = "/super-admin/manager-creat")
public class ManagerCreatServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BranchDao brandDao = new BranchDao();
        request.setAttribute("branches", brandDao.getAllBranches());
        request.getRequestDispatcher("/components/SuperAdmin/ManagerForm.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // get the parameters from the form
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        // set the parameters to the admin entity
        AdminEntity adminEntity = new AdminEntity();
        adminEntity.setaName(name);
        adminEntity.setaEmail(email);
        adminEntity.setaPassword(password);
        // create the admin
        AdminDao adminDao = new AdminDao();
        if (adminDao.createAdmin(adminEntity)) {
            response.sendRedirect("/super-admin/manager");
        } else {
            request.setAttribute("error", "Error while creating the manager");
            response.sendRedirect("/super-admin/manager-creat");
        }
    }
}
