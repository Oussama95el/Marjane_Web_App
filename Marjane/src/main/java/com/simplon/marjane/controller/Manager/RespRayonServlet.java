package com.simplon.marjane.controller.Manager;

import com.simplon.marjane.Dao.CategoryDao;
import com.simplon.marjane.Dao.RespRayonDao;
import com.simplon.marjane.entity.CategoryEntity;
import com.simplon.marjane.entity.RespRayonEntity;
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
        assert category != 0;
        // set all the resp rayon properties
        respRayon.setRrRayon(category);
        respRayon.setRrName(request.getParameter("name"));
        respRayon.setRrEmail(request.getParameter("email"));
        respRayon.setRrPassword(request.getParameter("password"));

        if (respRayonDao.createRespRayon(respRayon)) {
            // redirect to the resp rayon page
            request.getRequestDispatcher("/views/Manager/respRayon.jsp").forward(request, response);
        } else {
            // redirect to the 404 page
            request.getRequestDispatcher("/views/components/404.jsp").forward(request, response);
        }

    }
}
