package com.simplon.marjane.controller.SuperAdmin;

import com.simplon.marjane.Dao.PromotionDao;
import com.simplon.marjane.entity.PromotionEntity;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "PromotionsServlet", value = "/super-admin/promotions/*")
public class PromotionsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PromotionDao promotionDao = new PromotionDao();
        // stream through promotions and to order them by status
        List<PromotionEntity> promotions = promotionDao.getAllPromotions().stream().sorted((p1, p2) -> p1.getPStatus().compareTo(p2.getPStatus())).toList();
        // get the number of page from url path
        String[] queryParams = request.getRequestURI().split("/");

        int pages = 1;
        int limit = 5;

        if(queryParams.length > 4){
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        // check if pages parameter is an int
        try{
            if(queryParams.length == 4){
                pages = Integer.parseInt(queryParams[3]);
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
        request.getRequestDispatcher("/views/SuperAdmin/promotions.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
