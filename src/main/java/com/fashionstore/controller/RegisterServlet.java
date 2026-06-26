package com.fashionstore.controller;

import java.io.IOException;

import com.fashionstore.dao.UserDAO;
import com.fashionstore.daoimpl.UserDAOImpl;
import com.fashionstore.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.fashionstore.dao.CartDAO;
import com.fashionstore.daoimpl.CartDAOImpl;
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserDAO userDAO;
    private CartDAO cartDAO;

    @Override
    public void init() throws ServletException {
    	userDAO = new UserDAOImpl();
    	cartDAO = new CartDAOImpl();
    }
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher(
                "/WEB-INF/views/auth/register.jsp")
                .forward(request, response);
    }
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");

        // Check if email already exists
        if (userDAO.isEmailExists(email)) {

            request.setAttribute(
                    "errorMessage",
                    "Email already registered");

            request.getRequestDispatcher(
                    "/WEB-INF/views/auth/register.jsp")
                    .forward(request, response);

            return;
        }

        // Create User Object
        User user = new User();

        user.setFullName(fullName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setPassword(password);
        user.setGender(gender);
        user.setAddress(address);

        // Register User
        boolean status = userDAO.registerUser(user);

        if (status) {

            response.sendRedirect(
                    request.getContextPath() + "/login");
            User registeredUser =
                    userDAO.loginUser(email, password);

            cartDAO.createCart(
                    registeredUser.getUserId());
        } else {

            request.setAttribute(
                    "errorMessage",
                    "Registration Failed");

            request.getRequestDispatcher(
                    "/WEB-INF/views/auth/register.jsp")
                    .forward(request, response);
        }
    }
}