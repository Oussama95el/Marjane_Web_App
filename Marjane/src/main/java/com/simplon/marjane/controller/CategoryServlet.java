package com.simplon.marjane.controller;

import com.simplon.marjane.Dao.CategoryDao;
import com.simplon.marjane.Dao.SubCategoryDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "CategoryServlet", value = "/CategoryServlet")
public class CategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     CategoryDao categoryDao = new CategoryDao();
        SubCategoryDao subCategoryDao = new SubCategoryDao();
        request.setAttribute("subcategories", subCategoryDao.getAllSubCategories());
        request.setAttribute("categories", categoryDao.getAllCategories());
        // redirect to the category page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/Manager/CreatPromo.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
