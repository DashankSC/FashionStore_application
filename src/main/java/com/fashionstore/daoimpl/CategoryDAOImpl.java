package com.fashionstore.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.fashionstore.dao.CategoryDAO;
import com.fashionstore.model.Category;
import com.fashionstore.utility.DBConnection;

public class CategoryDAOImpl implements CategoryDAO {

    private Connection connection;

    public CategoryDAOImpl() {

        connection = DBConnection.getConnection();
    }

    @Override
    public boolean addCategory(Category category) {

        boolean status = false;

        try {

            String query =
                    "INSERT INTO categories(category_name, description, is_active) "
                    + "VALUES(?, ?, ?)";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setString(1, category.getCategoryName());
            preparedStatement.setString(2, category.getDescription());
            preparedStatement.setBoolean(3, category.isActive());

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
    public List<Category> getAllCategories() {

        List<Category> categoryList =
                new ArrayList<>();

        try {

            String query =
                    "SELECT * FROM categories";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            while (resultSet.next()) {

                Category category =
                        new Category();

                category.setCategoryId(
                        resultSet.getInt("category_id"));

                category.setCategoryName(
                        resultSet.getString("category_name"));

                category.setDescription(
                        resultSet.getString("description"));

                category.setActive(
                        resultSet.getBoolean("is_active"));

                categoryList.add(category);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return categoryList;
    }

    @Override
    public Category getCategoryById(int categoryId) {

        Category category = null;

        try {

            String query =
                    "SELECT * FROM categories WHERE category_id = ?";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setInt(1, categoryId);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            if (resultSet.next()) {

                category = new Category();

                category.setCategoryId(
                        resultSet.getInt("category_id"));

                category.setCategoryName(
                        resultSet.getString("category_name"));

                category.setDescription(
                        resultSet.getString("description"));

                category.setActive(
                        resultSet.getBoolean("is_active"));
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return category;
    }

    @Override
    public boolean updateCategory(Category category) {

        boolean status = false;

        try {

            String query =
                    "UPDATE categories SET category_name = ?, "
                    + "description = ?, is_active = ? "
                    + "WHERE category_id = ?";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setString(1,
                    category.getCategoryName());

            preparedStatement.setString(2,
                    category.getDescription());

            preparedStatement.setBoolean(3,
                    category.isActive());

            preparedStatement.setInt(4,
                    category.getCategoryId());

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
    public boolean deleteCategory(int categoryId) {

        boolean status = false;

        try {

            String query =
                    "DELETE FROM categories WHERE category_id = ?";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setInt(1, categoryId);

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