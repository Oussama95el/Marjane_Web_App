package com.simplon.marjane.controller.Manager;

import com.simplon.marjane.Dao.PromotionDao;
import com.simplon.marjane.Dao.RespRayonDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "DashboardServlet", value = "/DashboardServlet")
public class DashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // creat objects from promotions and resp rayon dao and set them to the request as statistics
        PromotionDao promotionDao = new PromotionDao();
        RespRayonDao respRayonDao = new RespRayonDao();
        request.setAttribute("RespRayons", respRayonDao.getAllRespRayons());
        request.setAttribute("promotions", promotionDao.getAllPromotions());
        request.getRequestDispatcher("/views/Manager/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
