package com.simplon.marjane.controller.RespRay;

import com.simplon.marjane.Dao.PromotionDao;
import com.simplon.marjane.Dao.RespRayonDao;
import com.simplon.marjane.entity.CategoryEntity;
import com.simplon.marjane.entity.RespRayonEntity;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.Instant;
import java.time.LocalTime;

@WebServlet(name = "PromoRrServlet", value = "/resp-ray/promotions")
public class PromoRrServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // get the id of the resp rayon from the session
        HttpSession session = request.getSession();
        if (session.getAttribute("respRayon") != null) {
            RespRayonEntity respRayon = (RespRayonEntity) session.getAttribute("respRayon");
            CategoryEntity category = respRayon.getRrRayon();
            // creat objects from promotions and resp rayon dao and set them to the request as statistics
            PromotionDao promotionDao = new PromotionDao();

            // if current time is between 8 and 12
            LocalTime currentTime = LocalTime.now();
            if (currentTime.isAfter(LocalTime.of(8, 0)) && currentTime.isBefore(LocalTime.of(12, 0))) {
                request.setAttribute("promotions", promotionDao.getAllPromotionByCategory(category).stream().sorted((p1, p2) -> p1.getPStatus().compareTo(p2.getPStatus())).toList());
                request.getRequestDispatcher("/views/RespRayon/promotions.jsp").forward(request, response);
            }else {
                request.setAttribute("message", "You can't access to this page at this time come back between 8 and 12");
                request.getRequestDispatcher("/views/RespRayon/promotions.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("/index.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
