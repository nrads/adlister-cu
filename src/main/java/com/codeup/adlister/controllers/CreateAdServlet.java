package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Array;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp")
            .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if(request.getParameter("title").trim().isEmpty()) {
            try {
                request.setAttribute("failed", true);
                request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            }
        } else {

            Ad ad = new Ad( // replace the hardcoded user id with the current logged in user's id
                    ((User) request.getSession().getAttribute("user")).getId(),
                    request.getParameter("title"),
                    request.getParameter("description")
            );
          
            String[] array = {
                    request.getParameter("Art"),
                    request.getParameter("Cars"),
                    request.getParameter("Computers"),
                    request.getParameter("Electronics"),
                    request.getParameter("Furniture"),
                    request.getParameter("IT Services"),
                    request.getParameter("Jewelery"),
                    request.getParameter("Other"),
                    request.getParameter("Sports"),
                    request.getParameter("Trade")
            };

            DaoFactory.getAdsDao().setAdCategory(DaoFactory.getAdsDao().insert(ad), array);

            response.sendRedirect("/profile");
        }
    }

}
