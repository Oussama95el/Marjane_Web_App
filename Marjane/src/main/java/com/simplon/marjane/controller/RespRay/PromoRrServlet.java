package com.simplon.marjane.controller.RespRay;

import com.simplon.marjane.Dao.PromotionDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "PromoRrServlet", value = "/resp-ray/promotions")
public class PromoRrServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // get the id of the resp rayon from the session
        HttpSession session = request.getSession();
        double id = (double) session.getAttribute("rr_rayon");

        // creat objects from promotions and resp rayon dao and set them to the request as statistics
        PromotionDao promotionDao = new PromotionDao();
        request.setAttribute("promotions", promotionDao.getPromotionByCategory(id));
        request.getRequestDispatcher("/views/RespRayon/promotions.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
