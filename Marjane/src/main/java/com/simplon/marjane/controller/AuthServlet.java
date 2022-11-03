package com.simplon.marjane.controller;

import com.simplon.marjane.Dao.AdminDao;
import com.simplon.marjane.Dao.RespRayonDao;
import com.simplon.marjane.Dao.SuperAdminDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AuthServlet", value = "/auth")
public class AuthServlet extends HttpServlet {
    Integer id;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get the parameters from the form
        SuperAdminDao superAdminDao = new SuperAdminDao();
        AdminDao adminDao = new AdminDao();
        RespRayonDao respRayonDao = new RespRayonDao();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String member = request.getParameter("member");
        Object[] fields = {email, password};
        // switch case to check user type member if ( SA ) or ( M ) or ( RR )
        switch (member) {
            case "SA":
                //check if the user is in the database
                if (superAdminDao.validateSuperAdminLogin(fields)) {
                    //redirect to the admin page
                    response.sendRedirect("/views/SuperAdmin/DashboardSa.jsp");
                    //request session to get superAdmin object
                    HttpSession session = request.getSession();
                    session.setAttribute("superAdmin", superAdminDao.getSuperAdminByEmail(email));
                } else {
                    //redirect to the login page
                    response.sendRedirect("/components/404.jsp");
                }
                break;
            case "M":
                //check if the user is in the database
                if (adminDao.validateAdminLogin(fields)) {
                    //redirect to the member page
                    response.sendRedirect("/views/Manager/dashboard.jsp");
                    HttpSession session = request.getSession();
                    session.setAttribute("manager", adminDao.getAdminByEmail(email));
                }else {
                    //redirect to the login page
                    response.sendRedirect("/components/404.jsp");
                    response.getWriter().println("error login");
                }
                break;
            case "RR":
                //check if the user is in the database
                if (respRayonDao.validateRespRayonLogin(fields)) {
                    //redirect to the RR page
                    response.sendRedirect("/views/RespRayon/DashboardRR.jsp");
                    HttpSession session = request.getSession();
                    session.setAttribute("respRayon", respRayonDao.getRespRayonByEmail(email));
                } else {
                    //redirect to the login page
                    response.sendRedirect("/components/404.jsp");
                }
                break;
        }
    }
}
