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

@WebServlet(name = "controllers.EditAdServlet", urlPatterns = "/edit")
public class EditAdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().removeAttribute("failed");
        request.setAttribute("ad", DaoFactory.getAdsDao().searchAdById(
                (Long) request.getSession().getAttribute("adId")
        ));
        request.getRequestDispatcher("/WEB-INF/edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().removeAttribute("failed");
        if(request.getParameter("title").trim().isEmpty()) {
                System.out.println("empty title field");
//                request.getSession().setAttribute("adId", Long.parseLong(request.getParameter("adId")));

                request.getSession().setAttribute("failed", true);
                response.sendRedirect("/edit");

        } else {
            Long id = (Long) request.getSession().getAttribute("adId");
            String title = request.getParameter("title");
            String description = request.getParameter("description");

            DaoFactory.getAdsDao().update(new Ad(
                    id,
                    ((User) request.getSession().getAttribute("user")).getId(),
                    title,
                    description
            ));
            response.sendRedirect("/profile");
        }
    }
}
