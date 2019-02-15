package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO: show the registration form
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        // TODO: ensure the submitted information is valid
        // TODO: create a new user based off of the submitted information
        // TODO: if a user was successfully created, send them to their profile
        request.removeAttribute("failed");
        request.removeAttribute("badPass");

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirm = request.getParameter("passwordConfirm");
        if (!password.equals("") && password.equals(passwordConfirm)) {
            User user = new User();
            user.setUsername(username);
            user.setEmail(email);
            user.setPassword(Password.hash(password));
            user.setId(DaoFactory.getUsersDao().insert(user));
            if (user.getId() == -12L){
                request.setAttribute("username", username);
                request.setAttribute("email",email);
                request.setAttribute("failed",true);
                request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
                return;
            }
            request.getSession().setAttribute("user", user);
            response.sendRedirect("/login");
        } else {
            request.setAttribute("username", username);
            request.setAttribute("email",email);
            request.setAttribute("badPass",true);
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);

        }

    }
}
