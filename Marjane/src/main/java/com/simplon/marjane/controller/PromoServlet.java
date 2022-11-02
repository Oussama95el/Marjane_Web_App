package com.simplon.marjane.controller;

import com.simplon.marjane.Dao.CategoryDao;
import com.simplon.marjane.Dao.PromotionDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "PromoServlet", value = "/PromoServlet")
public class PromoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PromotionDao promotionDao = new PromotionDao();
        CategoryDao categoryDao = new CategoryDao();
        request.setAttribute("categories", categoryDao.getAllCategories());
        request.setAttribute("promotions", promotionDao.getAllPromotions());
        // redirect to the promo page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/Manager/CreatPromo.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
