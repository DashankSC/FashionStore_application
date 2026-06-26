package com.fashionstore.controller;

import java.io.IOException;
import com.fashionstore.dao.CartDAO;
import com.fashionstore.dao.UserDAO;
import com.fashionstore.daoimpl.CartDAOImpl;
import com.fashionstore.model.CartItem;
import com.fashionstore.model.User;
import java.util.List;
import com.fashionstore.dao.ProductDAO;
import com.fashionstore.daoimpl.ProductDAOImpl;
import com.fashionstore.model.Product;
import com.fashionstore.model.CartItem;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private CartDAO cartDAO;
    private ProductDAO productDAO;
    
    @Override
    public void init() throws ServletException {

        cartDAO = new CartDAOImpl();
        productDAO = new ProductDAOImpl();
    }
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);
        String action =
                request.getParameter("action");

        if ("remove".equals(action)) {

            int cartItemId =
                    Integer.parseInt(
                        request.getParameter("cartItemId"));

            cartDAO.removeCartItem(cartItemId);

            response.sendRedirect(
                    request.getContextPath() + "/cart");

            return;
        }
        if("update".equals(action)) {

            int cartItemId =
                Integer.parseInt(
                    request.getParameter("cartItemId"));

            int quantity =
                Integer.parseInt(
                    request.getParameter("quantity"));

            if(quantity <= 0) {

                cartDAO.removeCartItem(cartItemId);

            } else {

                cartDAO.updateCartItemQuantity(
                        cartItemId,
                        quantity);
            }

            response.sendRedirect(
                request.getContextPath() + "/cart");

            return;
        }
        // Check Login
        if (session == null ||
                session.getAttribute("loggedInUser") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login");

            return;
        }

        User user =
                (User) session.getAttribute("loggedInUser");

        int userId =
                user.getUserId();

        int cartId =
                cartDAO.getCartIdByUserId(userId);

        List<CartItem> cartItems =
                cartDAO.getCartItemsByUser(cartId);

        double cartTotal =
                cartDAO.getCartTotal(cartId);

        request.setAttribute(
                "cartItems",
                cartItems);

        request.setAttribute(
                "cartTotal",
                cartTotal);

        request.getRequestDispatcher(
                "/WEB-INF/views/cart/cart.jsp")
                .forward(request, response);
    }

  
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        // Check Login
        if (session == null ||
                session.getAttribute("loggedInUser") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login");

            return;
        }

        User user =
                (User) session.getAttribute("loggedInUser");

        int userId =
                user.getUserId();

        int productId =
                Integer.parseInt(
                        request.getParameter("productId"));

        String sizeLabel =
                request.getParameter("sizeLabel");

        int quantity =
                Integer.parseInt(
                        request.getParameter("quantity"));

        // TEMP price
        Product product =
                productDAO.getProductById(productId);
        if(product == null || !product.isActive()) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/products");

            return;
        }
        double unitPrice =
                product.getPrice();

        CartItem cartItem = new CartItem();

        int cartId =cartDAO.getCartIdByUserId(userId);

        cartItem.setCartId(cartId);

        cartItem.setProductId(productId);

        cartItem.setSizeLabel(sizeLabel);

        cartItem.setQuantity(quantity);

        cartItem.setUnitPrice(unitPrice);

        boolean status =
                cartDAO.addToCart(cartItem);

        if (status) {

            response.sendRedirect(
                    request.getContextPath() + "/cart");

        } else {

            response.sendRedirect(
                    request.getContextPath()
                            + "/products");
        }
    }
}