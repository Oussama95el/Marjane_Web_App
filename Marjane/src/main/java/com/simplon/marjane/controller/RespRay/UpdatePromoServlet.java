package com.simplon.marjane.controller.RespRay;

import com.simplon.marjane.Dao.CommentDao;
import com.simplon.marjane.Dao.PromotionDao;
import com.simplon.marjane.entity.CommentEntity;
import com.simplon.marjane.entity.PromotionEntity;
import com.simplon.marjane.entity.RespRayonEntity;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

@WebServlet(name = "UpdatePromoServlet", value = "/resp-ray/update-promotion")
public class UpdatePromoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // get values from url action and id
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        // if action is confirm then set the promotion status to ACCEPTED
        if (action.equals("confirm")) {
            // get the promotion by id and set the status to ACCEPTED
            PromotionEntity promotion = new PromotionDao().getPromotionById(Integer.parseInt(id));
            new PromotionDao().updatePromotionStatusBasedOnTime(promotion , "ACCEPTED");
            // redirect to all promotions page
            response.sendRedirect("/resp-ray/all-promotions");
        }else if (action.equals("reject")) {
            // get the promotion by id and set the status to REJECTED
            PromotionEntity promotion = new PromotionDao().getPromotionById(Integer.parseInt(id));
            promotion.setPStatus("REJECTED");
            // redirect to all promotions page
            request.setAttribute("promotion", promotion);
            request.getRequestDispatcher("/views/RespRayon/promoComment.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // get the promotion id from the form
        String id = request.getParameter("id");
        // get the promotion by id and set the status to REJECTED
        PromotionEntity promotion = new PromotionDao().getPromotionById(Integer.parseInt(id));
        // update the promotion status
        new PromotionDao().updatePromotionStatusBasedOnTime(promotion , "REJECTED");
        // get the comment from the form
        String comment = request.getParameter("comment");
        assert comment != null;
        CommentEntity commentEntity = new CommentEntity();
        commentEntity.setCContent(comment);
        commentEntity.setCPromotion(promotion);
        commentEntity.setCDate(Date.valueOf(LocalDate.now()).toLocalDate());
        // get user from session
        HttpSession session = request.getSession();
        RespRayonEntity respRayon = (RespRayonEntity) session.getAttribute("respRayon");
        commentEntity.setCUser(respRayon);
        // if the comment is saved redirect to all promotions page
        if (new CommentDao().createComment(commentEntity)) {
//            PromotionDao promotionDao = new PromotionDao();
//            promotionDao.updatePromotionComment(promotion, commentEntity);
            // update comment in promotion
            response.sendRedirect("/resp-ray/promotions");
        }else {
            request.setAttribute("message", "Something went wrong");
            request.getRequestDispatcher("/views/RespRayon/promoComment.jsp").forward(request, response);
        }

    }
}
