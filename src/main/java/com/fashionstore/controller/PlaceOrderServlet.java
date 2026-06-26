package com.fashionstore.controller;

import java.io.IOException;
import java.util.List;

import com.fashionstore.dao.CartDAO;
import com.fashionstore.dao.OrderDAO;
import com.fashionstore.dao.ProductDAO;
import com.fashionstore.daoimpl.CartDAOImpl;
import com.fashionstore.daoimpl.OrderDAOImpl;
import com.fashionstore.daoimpl.ProductDAOImpl;
import com.fashionstore.model.CartItem;
import com.fashionstore.model.Order;
import com.fashionstore.model.OrderItem;
import com.fashionstore.model.Product;
import com.fashionstore.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/place-order")
public class PlaceOrderServlet extends HttpServlet {

    private CartDAO cartDAO;
    private OrderDAO orderDAO;
    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {

        cartDAO = new CartDAOImpl();
        orderDAO = new OrderDAOImpl();
        productDAO = new ProductDAOImpl();
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if(session == null ||
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

        String address =
                request.getParameter("address");

        String paymentMethod =
                request.getParameter("paymentMethod");

        Order order = new Order();

        order.setUserId(userId);
        order.setTotalAmount(cartTotal);
        order.setPaymentMethod(paymentMethod);
        order.setOrderStatus("PLACED");
        order.setDeliveryAddress(address);

        int orderId =
                orderDAO.createOrder(order);

        for(CartItem cartItem : cartItems) {

            Product product =
                    productDAO.getProductById(
                            cartItem.getProductId());

            OrderItem orderItem =
                    new OrderItem();

            orderItem.setOrderId(orderId);

            orderItem.setProductId(
                    cartItem.getProductId());

            orderItem.setProductName(
                    product.getProductName());

            orderItem.setQuantity(
                    cartItem.getQuantity());

            orderItem.setUnitPrice(
                    cartItem.getUnitPrice());

            orderItem.setSubtotal(
                    cartItem.getQuantity()
                    * cartItem.getUnitPrice());

            orderItem.setSizeLabel(
                    cartItem.getSizeLabel());

            orderDAO.addOrderItem(
                    orderItem);
        }
        cartDAO.clearCart(userId);
        response.sendRedirect(
                request.getContextPath()
                + "/order-success");
    }
}