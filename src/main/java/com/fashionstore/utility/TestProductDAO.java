package com.fashionstore.utility;

import java.util.List;

import com.fashionstore.dao.ProductDAO;
import com.fashionstore.daoimpl.ProductDAOImpl;
import com.fashionstore.model.Product;

public class TestProductDAO {

    public static void main(String[] args) {

        ProductDAO productDAO =
                new ProductDAOImpl();

        List<Product> productList =
                productDAO.getAllProducts();

        for (Product product : productList) {

            System.out.println(
                    "Product ID : "
                    + product.getProductId());

            System.out.println(
                    "Category ID : "
                    + product.getCategoryId());

            System.out.println(
                    "Product Name : "
                    + product.getProductName());

            System.out.println(
                    "Description : "
                    + product.getDescription());

            System.out.println(
                    "Discount : "
                    + product.getDiscountPercent());

            System.out.println(
                    "Image URL : "
                    + product.getImageUrl());

            System.out.println(
                    "Active : "
                    + product.isActive());

            System.out.println(
                    "==================================");
        }
    }
}