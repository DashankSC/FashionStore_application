package com.fashionstore.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.fashionstore.dao.UserDAO;
import com.fashionstore.model.User;
import com.fashionstore.utility.DBConnection;

public class UserDAOImpl implements UserDAO {

    private Connection connection;

    public UserDAOImpl() {

        connection = DBConnection.getConnection();
    }
    @Override
    public int getUserCount() {

        int count = 0;

        try {

            String query =
                    "SELECT COUNT(*) FROM users";

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
    public boolean updateProfile(User user) {

        boolean status = false;

        try {

            String query =
                    "UPDATE users SET "
                    + "full_name=?, "
                    + "phone=?, "
                    + "gender=?, "
                    + "address=? "
                    + "WHERE user_id=?";

            PreparedStatement ps =
                    connection.prepareStatement(query);

            ps.setString(1, user.getFullName());
            ps.setString(2, user.getPhone());
            ps.setString(3, user.getGender());
            ps.setString(4, user.getAddress());
            ps.setInt(5, user.getUserId());

            int rows = ps.executeUpdate();

            if(rows > 0) {
                status = true;
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return status;
    }
    @Override
    public List<User> getAllUsers() {

        List<User> users =
                new ArrayList<>();

        try {

            String query =
                    "SELECT * FROM users ORDER BY user_id DESC";

            PreparedStatement ps =
                    connection.prepareStatement(query);

            ResultSet rs =
                    ps.executeQuery();

            while(rs.next()) {

                User user =
                        new User();

                user.setUserId(
                        rs.getInt("user_id"));

                user.setFullName(
                        rs.getString("full_name"));

                user.setEmail(
                        rs.getString("email"));

                user.setPhone(
                        rs.getString("phone"));

                user.setGender(
                        rs.getString("gender"));

                user.setAddress(
                        rs.getString("address"));

                users.add(user);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return users;
    }
    @Override
    public boolean registerUser(User user) {

        boolean status = false;

        try {

            String query =
                    "INSERT INTO users(full_name, email, phone, password, gender, address) "
                    + "VALUES(?, ?, ?, ?, ?, ?)";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setString(1, user.getFullName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPhone());
            preparedStatement.setString(4, user.getPassword());
            preparedStatement.setString(5, user.getGender());
            preparedStatement.setString(6, user.getAddress());

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
    public User loginUser(String email, String password) {

        User user = null;

        try {

            String query =
                    "SELECT * FROM users WHERE email = ? AND password = ?";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            if (resultSet.next()) {

                user = new User();

                user.setUserId(resultSet.getInt("user_id"));
                user.setFullName(resultSet.getString("full_name"));
                user.setEmail(resultSet.getString("email"));
                user.setPhone(resultSet.getString("phone"));
                user.setPassword(resultSet.getString("password"));
                user.setGender(resultSet.getString("gender"));
                user.setAddress(resultSet.getString("address"));
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return user;
    }

    @Override
    public User getUserById(int userId) {

        User user = null;

        try {

            String query =
                    "SELECT * FROM users WHERE user_id = ?";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setInt(1, userId);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            if (resultSet.next()) {

                user = new User();

                user.setUserId(resultSet.getInt("user_id"));
                user.setFullName(resultSet.getString("full_name"));
                user.setEmail(resultSet.getString("email"));
                user.setPhone(resultSet.getString("phone"));
                user.setPassword(resultSet.getString("password"));
                user.setGender(resultSet.getString("gender"));
                user.setAddress(resultSet.getString("address"));
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return user;
    }

    @Override
    public boolean updateUser(User user) {

        boolean status = false;

        try {

            String query =
                    "UPDATE users SET full_name = ?, email = ?, phone = ?, "
                    + "password = ?, gender = ?, address = ? "
                    + "WHERE user_id = ?";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setString(1, user.getFullName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPhone());
            preparedStatement.setString(4, user.getPassword());
            preparedStatement.setString(5, user.getGender());
            preparedStatement.setString(6, user.getAddress());
            preparedStatement.setInt(7, user.getUserId());

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
    public boolean deleteUser(int userId) {

        boolean status = false;

        try {

            String query =
                    "DELETE FROM users WHERE user_id = ?";

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
    public boolean isEmailExists(String email) {

        boolean status = false;

        try {

            String query =
                    "SELECT * FROM users WHERE email = ?";

            PreparedStatement preparedStatement =
                    connection.prepareStatement(query);

            preparedStatement.setString(1, email);

            ResultSet resultSet =
                    preparedStatement.executeQuery();

            if (resultSet.next()) {

                status = true;
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return status;
    }
}