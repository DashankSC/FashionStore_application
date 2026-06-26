package com.fashionstore.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.fashionstore.dao.ProductDAO;
import com.fashionstore.model.Product;
import com.fashionstore.utility.DBConnection;

public class ProductDAOImpl implements ProductDAO {

    private Connection connection;

    public ProductDAOImpl() {

        connection = DBConnection.getConnection();
    }

    @Override
    public boolean addProduct(Product product) {

        boolean status = false;

        try {

            String query =
                    "INSERT INTO products(category_id, product_name, description, "
                    + "discount_percent, image_url, is_active) "
                    + "VALUES(?, ?, ?, ?, ?, ?)";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setInt(1, product.getCategoryId());
            preparedStatement.setString(2, product.getProductName());
            preparedStatement.setString(3, product.getDescription());
            preparedStatement.setDouble(4, product.getDiscountPercent());
            preparedStatement.setString(5, product.getImageUrl());
            preparedStatement.setBoolean(6, product.isActive());

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
    public List<Product> getAllProducts() {

        List<Product> productList =
                new ArrayList<>();

        try {

            String query =
                    "SELECT * FROM products";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            while (resultSet.next()) {

                Product product =
                        new Product();

                product.setProductId(
                        resultSet.getInt("product_id"));

                product.setCategoryId(
                        resultSet.getInt("category_id"));

                product.setProductName(
                        resultSet.getString("product_name"));

                product.setDescription(
                        resultSet.getString("description"));

                product.setDiscountPercent(
                        resultSet.getDouble("discount_percent"));

                product.setImageUrl(
                        resultSet.getString("image_url"));

                product.setActive(
                        resultSet.getBoolean("is_active"));
                product.setPrice(
                	    resultSet.getDouble("price"));

                productList.add(product);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return productList;
    }

    @Override
    public Product getProductById(int productId) {

        Product product = null;

        try {

            String query =
                    "SELECT * FROM products WHERE product_id = ?";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setInt(1, productId);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            if (resultSet.next()) {

                product = new Product();

                product.setProductId(
                        resultSet.getInt("product_id"));

                product.setCategoryId(
                        resultSet.getInt("category_id"));

                product.setProductName(
                        resultSet.getString("product_name"));
                product.setPrice(
                	    resultSet.getDouble("price"));

                product.setDescription(
                        resultSet.getString("description"));

                product.setDiscountPercent(
                        resultSet.getDouble("discount_percent"));

                product.setImageUrl(
                        resultSet.getString("image_url"));

                product.setActive(
                        resultSet.getBoolean("is_active"));
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return product;
    }

    @Override
    public List<Product> getProductsByCategory(int categoryId) {

        List<Product> productList =
                new ArrayList<>();

        try {

            String query =
            		"SELECT * FROM products WHERE category_id = ? AND is_active = true";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setInt(1, categoryId);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            while (resultSet.next()) {

                Product product =
                        new Product();

                product.setProductId(
                        resultSet.getInt("product_id"));

                product.setCategoryId(
                        resultSet.getInt("category_id"));

                product.setProductName(
                        resultSet.getString("product_name"));

                product.setDescription(
                        resultSet.getString("description"));

                product.setPrice(
                        resultSet.getDouble("price"));

                product.setDiscountPercent(
                        resultSet.getDouble("discount_percent"));

                product.setImageUrl(
                        resultSet.getString("image_url"));

                product.setActive(
                        resultSet.getBoolean("is_active"));

                productList.add(product);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return productList;
    }

    @Override
    public List<Product> searchProducts(String keyword) {

        List<Product> productList =
                new ArrayList<>();

        try {

            String query =
                    "SELECT * FROM products "
                    + "WHERE product_name LIKE ?";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setString(1,
                    "%" + keyword + "%");

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            while (resultSet.next()) {

                Product product =
                        new Product();

                product.setProductId(
                        resultSet.getInt("product_id"));

                product.setCategoryId(
                        resultSet.getInt("category_id"));

                product.setProductName(
                        resultSet.getString("product_name"));

                product.setDescription(
                        resultSet.getString("description"));

                product.setPrice(
                        resultSet.getDouble("price"));

                product.setDiscountPercent(
                        resultSet.getDouble("discount_percent"));

                product.setImageUrl(
                        resultSet.getString("image_url"));

                product.setActive(
                        resultSet.getBoolean("is_active"));

                productList.add(product);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return productList;
    }

    @Override
    public List<Product> getActiveProducts() {

        List<Product> productList =
                new ArrayList<>();

        try {

        	String query =
        		    "SELECT * FROM products WHERE is_active = true";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            while (resultSet.next()) {

                Product product =
                        new Product();

                product.setProductId(
                        resultSet.getInt("product_id"));

                product.setCategoryId(
                        resultSet.getInt("category_id"));

                product.setProductName(
                        resultSet.getString("product_name"));

                product.setDescription(
                        resultSet.getString("description"));

                product.setPrice(
                        resultSet.getDouble("price"));

                product.setDiscountPercent(
                        resultSet.getDouble("discount_percent"));

                product.setImageUrl(
                        resultSet.getString("image_url"));

                product.setActive(
                        resultSet.getBoolean("is_active"));

                productList.add(product);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return productList;
    }

    @Override
    public int getProductCount() {

        int count = 0;

        try {

            String query =
                    "SELECT COUNT(*) FROM products";

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
    public boolean updateProductStatus(
            int productId,
            boolean isActive) {

        boolean status = false;

        try {

            String query =
                    "UPDATE products "
                    + "SET is_active=? "
                    + "WHERE product_id=?";

            PreparedStatement ps =
                    connection.prepareStatement(query);

            ps.setBoolean(1, isActive);
            ps.setInt(2, productId);

            int rows =
                    ps.executeUpdate();

            if(rows > 0) {

                status = true;
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return status;
    }
    @Override
    public boolean updateProduct(Product product) {

        boolean status = false;

        try {

            String query =
                    "UPDATE products SET "
                    + "category_id=?, "
                    + "product_name=?, "
                    + "description=?, "
                    + "price=?, "
                    + "discount_percent=?, "
                    + "image_url=?, "
                    + "is_active=? "
                    + "WHERE product_id=?";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setInt(
                    1,
                    product.getCategoryId());

            preparedStatement.setString(
                    2,
                    product.getProductName());

            preparedStatement.setString(
                    3,
                    product.getDescription());

            preparedStatement.setDouble(
                    4,
                    product.getPrice());

            preparedStatement.setDouble(
                    5,
                    product.getDiscountPercent());

            preparedStatement.setString(
                    6,
                    product.getImageUrl());

            preparedStatement.setBoolean(
                    7,
                    product.isActive());

            preparedStatement.setInt(
                    8,
                    product.getProductId());

            int rowsAffected =
                    preparedStatement.executeUpdate();

            if(rowsAffected > 0) {

                status = true;
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return status;
    }
    @Override
    public boolean deleteProduct(int productId) {

        boolean status = false;

        try {

            String query =
                    "DELETE FROM products WHERE product_id = ?";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setInt(1, productId);

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
}
