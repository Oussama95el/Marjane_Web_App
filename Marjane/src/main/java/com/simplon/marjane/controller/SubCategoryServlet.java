package com.simplon.marjane.controller;

import com.simplon.marjane.Dao.SubCategoryDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SubCategoryServlet", value = "/getSubCategories")
public class SubCategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String category = request.getParameter("category");
        // cast category to long
        long id = Long.parseLong(category);
        SubCategoryDao subCategoryDao = new SubCategoryDao();
        // get the subcategory list  from the database and send it to the front end
         request.setAttribute("subcategories", subCategoryDao.getAllSubCategoriesByCategoryId(id));
         // send data to ajax

    }
}
