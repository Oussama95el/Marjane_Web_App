package com.simplon.marjane.controller.Manager;

import com.simplon.marjane.Dao.CategoryDao;
import com.simplon.marjane.Dao.RespRayonDao;
import com.simplon.marjane.entity.CategoryEntity;
import com.simplon.marjane.entity.RespRayonEntity;
import com.simplon.marjane.utils.SimpleEmail;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "RespRayonServlet", value = "/RespRayon/create")
public class RespRayonServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // get all resp rayon from the database and set it to the request
        CategoryDao categoryDao = new CategoryDao();
        request.setAttribute("categories", categoryDao.getAllCategories());
        request.getRequestDispatcher("/components/Manager/RespRayonForm.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RespRayonEntity respRayon = new RespRayonEntity();
        RespRayonDao respRayonDao = new RespRayonDao();
        // get the resp rayon properties
        long category = Long.parseLong(request.getParameter("category"));
        CategoryDao categoryDao = new CategoryDao();
        assert category != 0;
        CategoryEntity categoryEntity = categoryDao.getCategoryById(category);
        String rrName = request.getParameter("name");
        String rrEmail = request.getParameter("email");
        String rrPassword = request.getParameter("password");
        // set all the resp rayon properties
        respRayon.setRrRayon(categoryEntity);
        respRayon.setRrName(rrName);
        respRayon.setRrEmail(rrEmail);
        respRayon.setRrPassword(rrPassword);

        if (respRayonDao.createRespRayon(respRayon)) {
            //Send email to the resp rayon using class SimpleEmail
            SimpleEmail.sendSimpleEmail("oussamaelbechari@gmail.com",
                    "Welcome to Marjane",
                    "Welcome to Marjane, your account has been created successfully"
            );
            // redirect to the resp rayon page
            request.getRequestDispatcher("/RespRayonListServlet").forward(request, response);
        } else {
            // redirect to the 404 page
            request.setAttribute("type", "error");
            request.getRequestDispatcher("/views/components/404.jsp").forward(request, response);
        }

    }
}
