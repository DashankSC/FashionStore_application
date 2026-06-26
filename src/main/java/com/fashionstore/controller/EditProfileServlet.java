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
import jakarta.servlet.http.HttpSession;

@WebServlet("/edit-profile")
public class EditProfileServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {

        userDAO = new UserDAOImpl();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        User user =
                (User) session.getAttribute(
                        "loggedInUser");

        request.setAttribute(
                "user",
                user);

        request.getRequestDispatcher(
                "/WEB-INF/views/profile/edit-profile.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        User user =
                (User) session.getAttribute(
                        "loggedInUser");

        user.setFullName(
                request.getParameter("fullName"));

        user.setPhone(
                request.getParameter("phone"));

        user.setGender(
                request.getParameter("gender"));

        user.setAddress(
                request.getParameter("address"));

        userDAO.updateProfile(user);

        session.setAttribute(
                "loggedInUser",
                user);

        response.sendRedirect(
                request.getContextPath()
                + "/profile");
    }
}