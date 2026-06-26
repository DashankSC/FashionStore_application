package com.fashionstore.dao;

import java.util.List;

import com.fashionstore.model.User;

public interface UserDAO {

    boolean registerUser(User user);

    User loginUser(String email, String password);

    User getUserById(int userId);

    boolean updateUser(User user);

    boolean deleteUser(int userId);

    boolean isEmailExists(String email);
    
    List<User> getAllUsers();
    
    int getUserCount();
    
    boolean updateProfile(User user);
}