package com.fashionstore.dao;

import java.util.List;

import com.fashionstore.model.Product;

public interface ProductDAO {

    boolean addProduct(Product product);

    List<Product> getAllProducts();

    Product getProductById(int productId);

    List<Product> getProductsByCategory(int categoryId);

    List<Product> searchProducts(String keyword);

    List<Product> getActiveProducts();

    boolean updateProduct(Product product);

    boolean deleteProduct(int productId);
    
    int getProductCount();
    
    boolean updateProductStatus(int productId, boolean isActive);
}