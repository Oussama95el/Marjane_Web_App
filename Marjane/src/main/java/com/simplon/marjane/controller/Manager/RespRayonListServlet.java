package com.simplon.marjane.controller.Manager;

import com.simplon.marjane.Dao.RespRayonDao;
import com.simplon.marjane.entity.RespRayonEntity;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "RespRayonListServlet", value = "/RespRayonListServlet")
public class RespRayonListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RespRayonDao respRayonDao = new RespRayonDao();
        request.setAttribute("respRayons", respRayonDao.getAllRespRayons());
        request.getRequestDispatcher("/views/Manager/respRayon.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
