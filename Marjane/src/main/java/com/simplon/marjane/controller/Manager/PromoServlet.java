package com.simplon.marjane.controller.Manager;

import com.simplon.marjane.Dao.CategoryDao;
import com.simplon.marjane.Dao.PromotionDao;
import com.simplon.marjane.entity.CategoryEntity;
import com.simplon.marjane.entity.PromotionEntity;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Comparator;
import java.util.List;


@WebServlet(name = "PromoServlet", value = "/PromoServlet/*")
public class PromoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PromotionDao promotionDao = new PromotionDao();
        List<PromotionEntity> promotions =  promotionDao.getAllPromotions().stream().sorted(Comparator.comparing(PromotionEntity::getPStatus)).toList();

        String[] queryParams = request.getRequestURI().split("/");

        int pages = 1;
        int limit = 5;

        if(queryParams.length > 3){
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        // check if pages parameter is an int
        try{
            if(queryParams.length == 3){
                pages = Integer.parseInt(queryParams[2]);
                if(pages <= 0)
                    throw new NumberFormatException();
            }
        }catch(NumberFormatException exception){
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        int offset = (pages-1)*limit;
        int max = offset + limit;

        int rows = promotions.size();
        int totalOfPages = rows % limit == 0 ? rows / limit : rows / limit + 1;
        if (pages == totalOfPages){
            max = Math.min(max,rows);
        }
        promotions = promotions.subList(offset,max);

        request.setAttribute("totalOfPages", totalOfPages);
        request.setAttribute("currentPage", pages);
        request.setAttribute("promotions", promotions);
        // redirect to the promo page
        request.getRequestDispatcher("/views/Manager/promotion.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // get the promotion category
        long category = Long.parseLong(request.getParameter("category"));
        // create promotion object
        PromotionDao promotionDao = new PromotionDao();
        PromotionEntity promotion = new PromotionEntity();
        // set the promotion category
        CategoryDao categoryDao = new CategoryDao();
        CategoryEntity categoryEntity = categoryDao.getCategoryById(category);
        // set the promotion properties
        LocalDate startDate = LocalDate.parse(request.getParameter("startDate"));
        LocalDate endDate = LocalDate.parse(request.getParameter("expireDate"));
        BigDecimal discount = new BigDecimal(Integer.parseInt(request.getParameter("rate")));
        Integer points = 10 * Integer.parseInt(request.getParameter("rate"));
        promotion.setPCategory(categoryEntity);
        promotion.setPStartDate(startDate);
        promotion.setPExpireDate(endDate);
        promotion.setPRate(discount);
        promotion.setPPointFidelite(points);

        // if promotion is created successfully redirect to the promotion.jsp page
        if (promotionDao.createPromotion(promotion)){
            response.sendRedirect("/PromoServlet");
        }else{
            // else redirect to the error page
            response.sendRedirect("/views/Manager/error.jsp");
        }

    }
}
