package com.fashionstore.dao;

import java.util.List;

import com.fashionstore.model.Order;
import com.fashionstore.model.OrderItem;

public interface OrderDAO {

    boolean placeOrder(Order order);

    boolean addOrderItem(OrderItem orderItem);

    List<Order> getOrdersByUser(int userId);

    Order getOrderById(int orderId);

    List<OrderItem> getOrderItems(int orderId);

    boolean updateOrderStatus(int orderId, String status);
    
    int createOrder(Order order);
    
    List<Order> getAllOrders();
    
    int getOrderCount();

    double getTotalRevenue();
}