package com.fashionstore.model;

public class Product {

    private int productId;
    private int categoryId;
    private String productName;
    private String description;
    private double discountPercent;
    private String imageUrl;
    private boolean isActive;
    private double price;
    public Product() {

    }
    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    public Product(
            int productId,
            int categoryId,
            String productName,
            String description,
            double discountPercent,
            String imageUrl,
            boolean isActive,
            double price
    ) {

        this.productId = productId;
        this.categoryId = categoryId;
        this.productName = productName;
        this.description = description;
        this.discountPercent = discountPercent;
        this.imageUrl = imageUrl;
        this.isActive = isActive;
        this.price=price;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getDiscountPercent() {
        return discountPercent;
    }

    public void setDiscountPercent(double discountPercent) {
        this.discountPercent = discountPercent;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

    @Override
    public String toString() {

        return "Product [productId=" + productId
                + ", categoryId=" + categoryId
                + ", productName=" + productName
                + ", description=" + description
                + ", discountPercent=" + discountPercent
                + ", imageUrl=" + imageUrl
                + ", isActive=" + isActive 
                + ", price="+ price+ "]";
    }
}