package com.fashionstore.controller;

import java.io.IOException;
import java.util.List;

import com.fashionstore.dao.OrderDAO;
import com.fashionstore.daoimpl.OrderDAOImpl;
import com.fashionstore.model.Order;
import com.fashionstore.model.OrderItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/order-details")
public class OrderDetailsServlet extends HttpServlet {

    private OrderDAO orderDAO;

    @Override
    public void init() throws ServletException {

        orderDAO = new OrderDAOImpl();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int orderId =
                Integer.parseInt(
                        request.getParameter(
                                "orderId"));

        Order order =
                orderDAO.getOrderById(
                        orderId);

        List<OrderItem> orderItems =
                orderDAO.getOrderItems(
                        orderId);

        request.setAttribute(
                "order",
                order);

        request.setAttribute(
                "orderItems",
                orderItems);

        request.getRequestDispatcher(
                "/WEB-INF/views/order/order-details.jsp")
                .forward(
                        request,
                        response);
    }
}