package com.simplon.marjane.controller.SuperAdmin;

import com.simplon.marjane.Dao.AdminDao;
import com.simplon.marjane.Dao.CategoryDao;
import com.simplon.marjane.Dao.PromotionDao;
import com.simplon.marjane.Dao.RespRayonDao;
import com.simplon.marjane.entity.AdminEntity;
import com.simplon.marjane.entity.SuperAdminEntity;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "DashboardSaServlet", value = "/super-admin/dashboard")
public class DashboardSaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("superAdmin") == null) {
            response.sendRedirect("/index.jsp");
        } else {
            // creat objects from promotions and resp rayon dao and set them to the request as statistics
            PromotionDao promotionDao = new PromotionDao();
            RespRayonDao respRayonDao = new RespRayonDao();
            AdminDao adminDao = new AdminDao();
            CategoryDao categoryDao = new CategoryDao();
            request.setAttribute("categories", categoryDao.getAllCategories());
            request.setAttribute("managers", adminDao.getAllAdminsList());
            request.setAttribute("RespRayons", respRayonDao.getAllRespRayons());
            request.setAttribute("promotions", promotionDao.getAllPromotions().stream().sorted((p1, p2) -> p1.getPStatus().compareTo(p2.getPStatus())).toList());
            request.getRequestDispatcher("/views/SuperAdmin/dashboard.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
