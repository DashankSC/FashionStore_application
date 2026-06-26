package com.fashionstore.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.fashionstore.dao.UserDAO;
import com.fashionstore.dao.ProductDAO;
import com.fashionstore.dao.OrderDAO;
import com.fashionstore.daoimpl.UserDAOImpl;
import com.fashionstore.daoimpl.ProductDAOImpl;
import com.fashionstore.daoimpl.OrderDAOImpl;
@WebServlet("/admin")
public class AdminDashboardServlet extends HttpServlet {

    private UserDAO userDAO;
    private ProductDAO productDAO;
    private OrderDAO orderDAO;

    private static final long serialVersionUID = 1L;

    @Override
    public void init() throws ServletException {

        userDAO = new UserDAOImpl();

        productDAO = new ProductDAOImpl();

        orderDAO = new OrderDAOImpl();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if(session == null ||
           session.getAttribute("isAdmin") == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/login");

            return;
        }

        request.setAttribute(
                "userCount",
                userDAO.getUserCount());

        request.setAttribute(
                "productCount",
                productDAO.getProductCount());

        request.setAttribute(
                "orderCount",
                orderDAO.getOrderCount());

        request.setAttribute(
                "revenue",
                orderDAO.getTotalRevenue());

        request.getRequestDispatcher(
                "/WEB-INF/views/admin/admin-dashboard.jsp")
                .forward(
                        request,
                        response);
    }
}