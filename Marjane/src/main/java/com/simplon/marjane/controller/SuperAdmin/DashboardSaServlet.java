package com.simplon.marjane.controller.SuperAdmin;

import com.simplon.marjane.Dao.AdminDao;
import com.simplon.marjane.Dao.CategoryDao;
import com.simplon.marjane.Dao.PromotionDao;
import com.simplon.marjane.Dao.RespRayonDao;
import com.simplon.marjane.entity.AdminEntity;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "DashboardSaServlet", value = "/super-admin/dashboard")
public class DashboardSaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PromotionDao promotionDao = new PromotionDao();
        RespRayonDao respRayonDao = new RespRayonDao();
        AdminDao adminDao = new AdminDao();
        CategoryDao categoryDao = new CategoryDao();
        request.setAttribute("categories", categoryDao.getAllCategories());
        request.setAttribute("managers", adminDao.getAllAdminsList());
        request.setAttribute("RespRayons", respRayonDao.getAllRespRayons());
        request.setAttribute("promotions", promotionDao.getAllPromotions());
        request.getRequestDispatcher("/views/SuperAdmin/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
