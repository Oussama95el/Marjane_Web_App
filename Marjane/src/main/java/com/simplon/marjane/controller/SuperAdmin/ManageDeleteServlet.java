package com.simplon.marjane.controller.SuperAdmin;

import com.simplon.marjane.Dao.AdminDao;
import com.simplon.marjane.entity.AdminEntity;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ManageDeleteServlet", value = "/super-admin/delete")
public class ManageDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminDao adminDao = new AdminDao();
        // get id from the request
        long id = Long.parseLong(request.getParameter("id"));
        // delete the admin
        AdminEntity adminEntity = adminDao.getAdminById(id);
        if (adminEntity != null) {
            adminDao.deleteAdmin(adminEntity);
            // redirect to the manager page
            response.sendRedirect("/super-admin/manager");
        }else {
            request.setAttribute("message", "Admin not found");
            // redirect to the manager page
            response.sendRedirect("/super-admin/manager");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
