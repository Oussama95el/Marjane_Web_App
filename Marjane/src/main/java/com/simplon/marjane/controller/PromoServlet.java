package com.simplon.marjane.controller;

import com.simplon.marjane.Dao.CategoryDao;
import com.simplon.marjane.Dao.PromotionDao;
import com.simplon.marjane.entity.PromotionEntity;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@WebServlet(name = "PromoServlet", value = "/PromoServlet")
public class PromoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PromotionDao promotionDao = new PromotionDao();
        List<PromotionEntity> promotionEntity =  promotionDao.getAllPromotions();
        request.setAttribute("promotions", promotionEntity);
        // redirect to the promo page
        request.getRequestDispatcher("/views/Manager/promotion.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // get the promotion category
        int category = Integer.parseInt(request.getParameter("category"));
        // create promotion object
        PromotionEntity promotion = new PromotionEntity();
        CategoryDao categoryDao = new CategoryDao();
        promotion.setPCategory(categoryDao.getCategoryById(category));
        promotion.setPStartDate(LocalDate.parse(request.getParameter("startDate")));
        promotion.setPExpireDate(LocalDate.parse(request.getParameter("expireDate")));
        promotion.setPRate(new BigDecimal(request.getParameter("rate")));
        promotion.setPPointFidelite(10 * promotion.getPRate().intValue());
        // create promotion dao object
        PromotionDao promotionDao = new PromotionDao();
        // if promotion is created successfully redirect to the promotion.jsp page
        if (promotionDao.createPromotion(promotion)){
            response.sendRedirect("/PromoServlet");
        }else{
            // else redirect to the error page
            response.sendRedirect("/views/Manager/error.jsp");
        }

    }
}
