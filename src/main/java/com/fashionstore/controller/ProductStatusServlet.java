package com.fashionstore.controller;

import java.io.IOException;

import com.fashionstore.dao.ProductDAO;
import com.fashionstore.daoimpl.ProductDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/product-status")
public class ProductStatusServlet
extends HttpServlet {

    private ProductDAO productDAO;

    @Override
    public void init()
            throws ServletException {

        productDAO =
                new ProductDAOImpl();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException,
            IOException {

        int productId =
                Integer.parseInt(
                        request.getParameter(
                                "productId"));

        boolean active =
                Boolean.parseBoolean(
                        request.getParameter(
                                "active"));

        productDAO.updateProductStatus(
                productId,
                active);

        response.sendRedirect(
                request.getContextPath()
                + "/admin/products");
    }
}