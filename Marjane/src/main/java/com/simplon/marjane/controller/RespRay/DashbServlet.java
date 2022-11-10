package com.simplon.marjane.controller.RespRay;

import com.simplon.marjane.Dao.PromotionDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "DashbServlet", value = "/resp-ray/dashboard")
public class DashbServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // creat objects from promotions and resp rayon dao and set them to the request as statistics
        PromotionDao promotionDao = new PromotionDao();
        request.setAttribute("promotions", promotionDao.getAllPromotions());
        request.getRequestDispatcher("/views/RespRayon/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
