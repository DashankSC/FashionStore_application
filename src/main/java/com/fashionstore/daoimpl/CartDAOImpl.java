package com.fashionstore.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.fashionstore.dao.CartDAO;
import com.fashionstore.model.CartItem;
import com.fashionstore.utility.DBConnection;

public class CartDAOImpl implements CartDAO {

    private Connection connection;

    public CartDAOImpl() {

        connection = DBConnection.getConnection();
    }

   
    @Override
    public boolean addToCart(CartItem cartItem) {

        boolean status = false;

        try {

            // CHECK EXISTING PRODUCT
            String checkQuery =
                "SELECT * FROM cart_items "
                + "WHERE cart_id = ? "
                + "AND product_id = ? "
                + "AND size_label = ?";

            PreparedStatement checkStatement =
                    connection.prepareStatement(checkQuery);

            checkStatement.setInt(
                    1,
                    cartItem.getCartId());

            checkStatement.setInt(
                    2,
                    cartItem.getProductId());

            checkStatement.setString(
                    3,
                    cartItem.getSizeLabel());

            ResultSet resultSet =
                    checkStatement.executeQuery();

            // IF PRODUCT ALREADY EXISTS
            if (resultSet.next()) {

                int existingQuantity =
                        resultSet.getInt("quantity");

                int newQuantity =
                        existingQuantity
                        + cartItem.getQuantity();

                String updateQuery =
                    "UPDATE cart_items "
                    + "SET quantity = ? "
                    + "WHERE cart_id = ? "
                    + "AND product_id = ? "
                    + "AND size_label = ?";

                PreparedStatement updateStatement =
                        connection.prepareStatement(updateQuery);

                updateStatement.setInt(
                        1,
                        newQuantity);

                updateStatement.setInt(
                        2,
                        cartItem.getCartId());

                updateStatement.setInt(
                        3,
                        cartItem.getProductId());

                updateStatement.setString(
                        4,
                        cartItem.getSizeLabel());

                int rowsUpdated =
                        updateStatement.executeUpdate();

                if (rowsUpdated > 0) {
                    status = true;
                }

            } else {

                // INSERT NEW PRODUCT
                String insertQuery =
                    "INSERT INTO cart_items "
                    + "(cart_id, product_id, size_label, quantity, unit_price) "
                    + "VALUES (?, ?, ?, ?, ?)";

                PreparedStatement insertStatement =
                        connection.prepareStatement(insertQuery);

                insertStatement.setInt(
                        1,
                        cartItem.getCartId());

                insertStatement.setInt(
                        2,
                        cartItem.getProductId());

                insertStatement.setString(
                        3,
                        cartItem.getSizeLabel());

                insertStatement.setInt(
                        4,
                        cartItem.getQuantity());

                insertStatement.setDouble(
                        5,
                        cartItem.getUnitPrice());

                int rowsInserted =
                        insertStatement.executeUpdate();

                if (rowsInserted > 0) {
                    status = true;
                }
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return status;
    }

    @Override
    public List<CartItem> getCartItemsByUser(int cartId) {

        List<CartItem> cartItems =
                new ArrayList<>();

        try {

            System.out.println(
                    "Fetching cart items for Cart ID: "
                    + cartId);

            String query =
                    "SELECT * FROM cart_items WHERE cart_id = ?";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setInt(1, cartId);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            while (resultSet.next()) {

                System.out.println(
                        "Cart Item Found");

                CartItem cartItem =
                        new CartItem();

                cartItem.setCartItemId(
                        resultSet.getInt("cart_item_id"));

                cartItem.setCartId(
                        resultSet.getInt("cart_id"));

                cartItem.setProductId(
                        resultSet.getInt("product_id"));

                cartItem.setSizeLabel(
                        resultSet.getString("size_label"));

                cartItem.setQuantity(
                        resultSet.getInt("quantity"));

                cartItem.setUnitPrice(
                        resultSet.getDouble("unit_price"));

                cartItems.add(cartItem);
            }

            System.out.println(
                    "Total Cart Items Loaded: "
                    + cartItems.size());

        } catch (Exception e) {

            e.printStackTrace();
        }

        return cartItems;
    }

    @Override
    public boolean updateCartItemQuantity(
            int cartItemId,
            int quantity) {

        boolean status = false;

        try {

            String query =
                "UPDATE cart_items "
                + "SET quantity = ? "
                + "WHERE cart_item_id = ?";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setInt(1, quantity);

            preparedStatement.setInt(2, cartItemId);

            int rowsUpdated =
                    preparedStatement.executeUpdate();

            if(rowsUpdated > 0) {
                status = true;
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return status;
    }
    @Override
    public boolean removeCartItem(int cartItemId) {

        boolean status = false;

        try {

            String query =
                "DELETE FROM cart_items "
                + "WHERE cart_item_id = ?";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setInt(1, cartItemId);

            int rowsDeleted =
                    preparedStatement.executeUpdate();

            if (rowsDeleted > 0) {
                status = true;
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return status;
    }

    @Override
    public boolean clearCart(int userId) {

        boolean status = false;

        try {

            String query =
                    "DELETE ci FROM cart_items ci "
                    + "JOIN cart c ON ci.cart_id = c.cart_id "
                    + "WHERE c.user_id = ?";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setInt(1, userId);

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
    public double getCartTotal(int cartId) {

        double total = 0;

        try {

            String query =
                "SELECT SUM(quantity * unit_price) AS total "
                + "FROM cart_items "
                + "WHERE cart_id = ?";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setInt(1, cartId);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            if (resultSet.next()) {

                total =
                    resultSet.getDouble("total");
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return total;
    }
    @Override
    public int getCartIdByUserId(int userId) {

        int cartId = 0;

        try {

            System.out.println(
                    "Fetching cart for user ID: "
                    + userId);

            String query =
                    "SELECT cart_id FROM cart WHERE user_id = ?";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setInt(1, userId);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            if (resultSet.next()) {

                cartId =
                        resultSet.getInt("cart_id");

                System.out.println(
                        "Cart ID Found: "
                        + cartId);

            } else {

                System.out.println(
                        "NO CART FOUND");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cartId;
    }
    
    @Override
    public boolean createCart(int userId) {

        boolean status = false;

        try {

            String query =
                    "INSERT INTO cart(user_id) VALUES(?)";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setInt(1, userId);

            int rowsInserted =
                    preparedStatement.executeUpdate();

            if (rowsInserted > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}