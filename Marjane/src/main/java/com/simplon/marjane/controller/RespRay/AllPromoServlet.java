package com.simplon.marjane.controller.RespRay;

import com.simplon.marjane.Dao.PromotionDao;
import com.simplon.marjane.entity.PromotionEntity;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "AllPromoServlet", value = "/resp-ray/all-promotions")
public class AllPromoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PromotionDao promotionDao = new PromotionDao();
        // stream all promotions and show pending promotions first
        List<PromotionEntity> promotions = promotionDao.getAllPromotions().stream().sorted(Comparator.comparing(PromotionEntity::getPStartDate)).collect(Collectors.toList());
        request.setAttribute("promotions", promotions);
        request.getRequestDispatcher("/components/RespRayon/PromotionsList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
