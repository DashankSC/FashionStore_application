package com.fashionstore.dao;

import java.util.List;

import com.fashionstore.model.CartItem;

public interface CartDAO {

    boolean addToCart(CartItem cartItem);

    List<CartItem> getCartItemsByUser(int userId);

    boolean updateCartItemQuantity(int cartItemId, int quantity);

    boolean removeCartItem(int cartItemId);

    boolean clearCart(int userId);

    double getCartTotal(int userId);
    
    int getCartIdByUserId(int userId);
    
    boolean createCart(int userId);
  
}