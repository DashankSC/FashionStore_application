package com.fashionstore.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.fashionstore.dao.OrderDAO;
import com.fashionstore.model.Order;
import com.fashionstore.model.OrderItem;
import com.fashionstore.utility.DBConnection;

public class OrderDAOImpl implements OrderDAO {

    private Connection connection;

    public OrderDAOImpl() {

        connection = DBConnection.getConnection();
    }
    @Override
    public double getTotalRevenue() {

        double revenue = 0;

        try {

            String query =
                    "SELECT SUM(total_amount) FROM orders";

            PreparedStatement ps =
                    connection.prepareStatement(query);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                revenue = rs.getDouble(1);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return revenue;
    }
    @Override
    public int getOrderCount() {

        int count = 0;

        try {

            String query =
                    "SELECT COUNT(*) FROM orders";

            PreparedStatement ps =
                    connection.prepareStatement(query);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                count = rs.getInt(1);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return count;
    }
    @Override
    public List<Order> getAllOrders() {

        List<Order> orderList =
                new ArrayList<>();

        try {

            String query =
                    "SELECT * FROM orders ORDER BY order_id DESC";

            PreparedStatement ps =
                    connection.prepareStatement(query);

            ResultSet rs =
                    ps.executeQuery();

            while(rs.next()) {

                Order order =
                        new Order();

                order.setOrderId(
                        rs.getInt("order_id"));

                order.setUserId(
                        rs.getInt("user_id"));

                order.setOrderDate(
                        rs.getTimestamp("order_date"));

                order.setTotalAmount(
                        rs.getDouble("total_amount"));

                order.setPaymentMethod(
                        rs.getString("payment_method"));

                order.setOrderStatus(
                        rs.getString("order_status"));

                order.setDeliveryAddress(
                        rs.getString("delivery_address"));

                orderList.add(order);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return orderList;
    }
    @Override
    public boolean placeOrder(Order order) {

        boolean status = false;

        try {

            String query =
                    "INSERT INTO orders(user_id, order_date, total_amount, "
                    + "payment_method, order_status, delivery_address) "
                    + "VALUES(?, NOW(), ?, ?, ?, ?)";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setInt(1, order.getUserId());
            preparedStatement.setDouble(2, order.getTotalAmount());
            preparedStatement.setString(3, order.getPaymentMethod());
            preparedStatement.setString(4, order.getOrderStatus());
            preparedStatement.setString(5, order.getDeliveryAddress());

            int rowsAffected =
                    preparedStatement.executeUpdate();

            if (rowsAffected > 0) {

                status = true;
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return status;
    }

    @Override
    public boolean addOrderItem(OrderItem orderItem) {

        boolean status = false;

        try {

            String query =
                    "INSERT INTO order_items(order_id, product_id, "
                    + "product_name, quantity, unit_price, subtotal, size_label) "
                    + "VALUES(?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setInt(1, orderItem.getOrderId());
            preparedStatement.setInt(2, orderItem.getProductId());
            preparedStatement.setString(3, orderItem.getProductName());
            preparedStatement.setInt(4, orderItem.getQuantity());
            preparedStatement.setDouble(5, orderItem.getUnitPrice());
            preparedStatement.setDouble(6, orderItem.getSubtotal());
            preparedStatement.setString(7, orderItem.getSizeLabel());

            int rowsAffected =
                    preparedStatement.executeUpdate();

            if (rowsAffected > 0) {

                status = true;
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return status;
    }

    @Override
    public List<Order> getOrdersByUser(int userId) {

        List<Order> orderList =
                new ArrayList<>();

        try {

            String query =
                    "SELECT * FROM orders WHERE user_id = ?";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setInt(1, userId);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            while (resultSet.next()) {

                Order order =
                        new Order();

                order.setOrderId(
                        resultSet.getInt("order_id"));

                order.setUserId(
                        resultSet.getInt("user_id"));

                order.setOrderDate(
                        resultSet.getTimestamp("order_date"));

                order.setTotalAmount(
                        resultSet.getDouble("total_amount"));

                order.setPaymentMethod(
                        resultSet.getString("payment_method"));

                order.setOrderStatus(
                        resultSet.getString("order_status"));

                order.setDeliveryAddress(
                        resultSet.getString("delivery_address"));

                orderList.add(order);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return orderList;
    }

    @Override
    public Order getOrderById(int orderId) {

        Order order = null;

        try {

            String query =
                    "SELECT * FROM orders WHERE order_id = ?";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setInt(1, orderId);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            if (resultSet.next()) {

                order = new Order();

                order.setOrderId(
                        resultSet.getInt("order_id"));

                order.setUserId(
                        resultSet.getInt("user_id"));

                order.setOrderDate(
                        resultSet.getTimestamp("order_date"));

                order.setTotalAmount(
                        resultSet.getDouble("total_amount"));

                order.setPaymentMethod(
                        resultSet.getString("payment_method"));

                order.setOrderStatus(
                        resultSet.getString("order_status"));

                order.setDeliveryAddress(
                        resultSet.getString("delivery_address"));
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return order;
    }

    @Override
    public List<OrderItem> getOrderItems(int orderId) {

        List<OrderItem> orderItemList =
                new ArrayList<>();

        try {

            String query =
                    "SELECT * FROM order_items WHERE order_id = ?";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setInt(1, orderId);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            while (resultSet.next()) {

                OrderItem orderItem =
                        new OrderItem();

                orderItem.setOrderItemId(
                        resultSet.getInt("order_item_id"));

                orderItem.setOrderId(
                        resultSet.getInt("order_id"));

                orderItem.setProductId(
                        resultSet.getInt("product_id"));

                orderItem.setProductName(
                        resultSet.getString("product_name"));

                orderItem.setQuantity(
                        resultSet.getInt("quantity"));

                orderItem.setUnitPrice(
                        resultSet.getDouble("unit_price"));

                orderItem.setSubtotal(
                        resultSet.getDouble("subtotal"));

                orderItem.setSizeLabel(
                        resultSet.getString("size_label"));

                orderItemList.add(orderItem);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return orderItemList;
    }

    @Override
    public boolean updateOrderStatus(int orderId, String statusValue) {

        boolean status = false;

        try {

            String query =
                    "UPDATE orders SET order_status = ? "
                    + "WHERE order_id = ?";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setString(1, statusValue);
            preparedStatement.setInt(2, orderId);

            int rowsAffected =
                    preparedStatement.executeUpdate();

            if (rowsAffected > 0) {

                status = true;
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return status;
    }
    
    @Override
    public int createOrder(Order order) {

        int orderId = 0;

        try {

            String query =
                "INSERT INTO orders(user_id, order_date, total_amount, "
              + "payment_method, order_status, delivery_address) "
              + "VALUES(?, NOW(), ?, ?, ?, ?)";

            PreparedStatement preparedStatement =
                connection.prepareStatement(
                    query,
                    PreparedStatement.RETURN_GENERATED_KEYS);

            preparedStatement.setInt(
                1,
                order.getUserId());

            preparedStatement.setDouble(
                2,
                order.getTotalAmount());

            preparedStatement.setString(
                3,
                order.getPaymentMethod());

            preparedStatement.setString(
                4,
                order.getOrderStatus());

            preparedStatement.setString(
                5,
                order.getDeliveryAddress());

            preparedStatement.executeUpdate();

            ResultSet resultSet =
                preparedStatement.getGeneratedKeys();

            if(resultSet.next()) {

                orderId =
                    resultSet.getInt(1);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return orderId;
    }
}