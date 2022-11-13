package com.simplon.marjane.controller.SuperAdmin;

import com.simplon.marjane.Dao.AdminDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ManagerServlet", value = "/super-admin/manager")
public class ManagerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminDao adminDao = new AdminDao();
        request.setAttribute("managers", adminDao.getAllAdminsList());
        request.getRequestDispatcher("/views/SuperAdmin/manager.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
