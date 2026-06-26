CREATE DATABASE fashion_store;


CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    address TEXT NOT NULL
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255),
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    category_id INT NOT NULL,
    product_name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    discount_percent DECIMAL(5,2) DEFAULT 0.00,
    image_url VARCHAR(255) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,

    CONSTRAINT fk_products_category
    FOREIGN KEY (category_id)
    REFERENCES categories(category_id)
);

CREATE TABLE product_sizes (
    product_size_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    size_label VARCHAR(10) NOT NULL,
    stock_quantity INT NOT NULL,
    sku_code VARCHAR(100) NOT NULL UNIQUE,
    is_available BOOLEAN DEFAULT TRUE,

    CONSTRAINT fk_product_sizes_product
    FOREIGN KEY (product_id)
    REFERENCES products(product_id),

    CONSTRAINT uk_product_size
    UNIQUE (product_id, size_label)
);

CREATE TABLE cart (
    cart_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_cart_user
    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
);

CREATE TABLE cart_items (
    cart_item_id INT PRIMARY KEY AUTO_INCREMENT,
    cart_id INT NOT NULL,
    product_id INT NOT NULL,
    size_label VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_cart_items_cart
    FOREIGN KEY (cart_id)
    REFERENCES cart(cart_id),

    CONSTRAINT fk_cart_items_product
    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    order_status VARCHAR(50) NOT NULL,
    delivery_address TEXT NOT NULL,

    CONSTRAINT fk_orders_user
    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    product_name VARCHAR(150) NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    size_label VARCHAR(10) NOT NULL,

    CONSTRAINT fk_order_items_order
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),

    CONSTRAINT fk_order_items_product
    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);

-- =========================================
-- CATEGORIES
-- =========================================

INSERT INTO categories(category_name, description, is_active)
VALUES
('Men', 'Mens fashion collection', true),
('Women', 'Womens fashion collection', true),
('Kids', 'Kids fashion collection', true),
('Footwear', 'Shoes and sandals collection', true),
('Accessories', 'Fashion accessories collection', true),
('Winter Wear', 'Winter fashion collection', true),
('Sports Wear', 'Sports and gym wear collection', true),
('Ethnic Wear', 'Traditional clothing collection', true);

-- =========================================
-- PRODUCTS
-- =========================================
ALTER TABLE products
ADD price DECIMAL(10,2) NOT NULL DEFAULT 0.00;
UPDATE products
SET price = 1999
WHERE product_id = 1;

UPDATE products
SET price = 2499
WHERE product_id = 2;

UPDATE products
SET price = 1499
WHERE product_id = 3;
UPDATE products
SET price = 3000
WHERE product_id = 4;

UPDATE products
SET price = 2299
WHERE product_id = 5;

UPDATE products
SET price = 1099
WHERE product_id = 6;
UPDATE products
SET price = 999
WHERE product_id = 7;

UPDATE products
SET price = 999
WHERE product_id = 8;
UPDATE products
SET price = 9999
WHERE product_id > 8;


INSERT INTO products
(category_id, product_name, description, discount_percent, image_url, is_active)
VALUES

(1, 'Mens Black T-Shirt', 'Premium cotton black t-shirt', 10, 'images/mens_black_tshirt.jpg', true),
(1, 'Mens Blue Jeans', 'Slim fit blue jeans', 15, 'images/mens_blue_jeans.jpg', true),
(1, 'Mens White Shirt', 'Formal white shirt', 8, 'images/mens_white_shirt.jpg', true),
(1, 'Mens Cargo Pants', 'Comfortable cargo pants', 12, 'images/mens_cargo.jpg', true),

(2, 'Womens Floral Dress', 'Beautiful floral summer dress', 20, 'images/womens_floral_dress.jpg', true),
(2, 'Women Hoodie', 'Warm oversized hoodie', 12, 'images/women_hoodie.jpg', true),
(2, 'Women Crop Top', 'Stylish crop top', 18, 'images/crop_top.jpg', true),
(2, 'Women Skinny Jeans', 'Blue skinny jeans', 14, 'images/women_jeans.jpg', true),

(3, 'Kids Cartoon T-Shirt', 'Soft cotton cartoon t-shirt', 5, 'images/kids_tshirt.jpg', true),
(3, 'Kids Shorts', 'Comfortable kids shorts', 10, 'images/kids_shorts.jpg', true),
(3, 'Kids Jacket', 'Warm winter jacket', 16, 'images/kids_jacket.jpg', true),

(4, 'Running Shoes', 'Lightweight running shoes', 18, 'images/running_shoes.jpg', true),
(4, 'Casual Sneakers', 'Everyday casual sneakers', 10, 'images/casual_sneakers.jpg', true),
(4, 'Leather Boots', 'Premium leather boots', 22, 'images/leather_boots.jpg', true),

(5, 'Leather Wallet', 'Premium leather wallet', 8, 'images/wallet.jpg', true),
(5, 'Stylish Sunglasses', 'UV protected sunglasses', 14, 'images/sunglasses.jpg', true),
(5, 'Analog Watch', 'Luxury analog watch', 25, 'images/watch.jpg', true),
(5, 'Cap', 'Stylish sports cap', 7, 'images/cap.jpg', true),

(6, 'Winter Jacket', 'Heavy winter jacket', 20, 'images/winter_jacket.jpg', true),
(6, 'Sweatshirt', 'Warm sweatshirt', 13, 'images/sweatshirt.jpg', true),

(7, 'Gym T-Shirt', 'Dry fit gym t-shirt', 11, 'images/gym_tshirt.jpg', true),
(7, 'Track Pants', 'Sports track pants', 9, 'images/trackpants.jpg', true),

(8, 'Kurta', 'Traditional mens kurta', 17, 'images/kurta.jpg', true),
(8, 'Saree', 'Traditional silk saree', 21, 'images/saree.jpg', true);


-- =========================================
-- PRODUCT SIZES
-- =========================================

INSERT INTO product_sizes
(product_id, size_label, stock_quantity, sku_code, is_available)
VALUES

(1, 'S', 20, 'MBTS001', true),
(1, 'M', 25, 'MBTM001', true),
(1, 'L', 15, 'MBTL001', true),

(2, '30', 10, 'MBJ30', true),
(2, '32', 12, 'MBJ32', true),
(2, '34', 8, 'MBJ34', true),

(3, 'M', 15, 'MWSM001', true),
(3, 'L', 20, 'MWSL001', true),

(4, '32', 11, 'MCP32', true),
(4, '34', 10, 'MCP34', true),

(5, 'S', 10, 'WFDS001', true),
(5, 'M', 12, 'WFDM001', true),
(5, 'L', 7, 'WFDL001', true),

(6, 'M', 18, 'WHM001', true),
(6, 'L', 20, 'WHL001', true),

(7, 'S', 17, 'WCTS001', true),
(7, 'M', 16, 'WCTM001', true),

(8, '28', 10, 'WSJ28', true),
(8, '30', 9, 'WSJ30', true),

(9, 'XS', 14, 'KTXS001', true),
(9, 'S', 10, 'KTS001', true),

(10, 'S', 12, 'KS001', true),
(10, 'M', 14, 'KM001', true),

(11, 'M', 8, 'KJM001', true),

(12, '7', 9, 'RS7', true),
(12, '8', 11, 'RS8', true),
(12, '9', 6, 'RS9', true),

(13, '8', 13, 'CS8', true),
(13, '9', 10, 'CS9', true),

(14, '8', 7, 'LB8', true),
(14, '9', 5, 'LB9', true),

(15, 'FREE', 25, 'LW001', true),
(16, 'FREE', 30, 'SG001', true),
(17, 'FREE', 15, 'AW001', true),
(18, 'FREE', 40, 'CAP001', true),

(19, 'M', 10, 'WJM001', true),
(19, 'L', 8, 'WJL001', true),

(20, 'M', 20, 'SWM001', true),

(21, 'M', 25, 'GTM001', true),
(21, 'L', 22, 'GTL001', true),

(22, 'M', 19, 'TPM001', true),

(23, 'M', 14, 'KURM001', true),
(23, 'L', 12, 'KURL001', true),

(24, 'FREE', 10, 'SAR001', true);

-- =========================================
-- USERS
-- =========================================

INSERT INTO users
(full_name, email, phone, password, gender, address)
VALUES

('Rahul Sharma', 'rahul@gmail.com', '9876543210', 'rahul123', 'Male', 'Bangalore'),
('Priya Verma', 'priya@gmail.com', '9876501234', 'priya123', 'Female', 'Mysore'),
('Arjun Reddy', 'arjun@gmail.com', '9988776655', 'arjun123', 'Male', 'Hyderabad'),
('Sneha Kapoor', 'sneha@gmail.com', '9123456780', 'sneha123', 'Female', 'Delhi'),
('Karan Mehta', 'karan@gmail.com', '9012345678', 'karan123', 'Male', 'Mumbai'),
('Admin User', 'admin@gmail.com', '9999999999', 'admin123', 'Male', 'Bangalore');

-- =========================================
-- CARTS
-- =========================================
INSERT INTO cart
(cart_id, user_id, created_at, updated_at)
VALUES

(1, 1, NOW(), NOW()),
(2, 2, NOW(), NOW()),
(3, 3, NOW(), NOW()),
(4, 4, NOW(), NOW());
-- =========================================
-- CART ITEMS
-- =========================================

INSERT INTO cart_items
(cart_id, product_id, size_label, quantity, unit_price, added_at)
VALUES

(1, 1, 'M', 2, 799.00, NOW()),
(1, 12, '8', 1, 2499.00, NOW()),
(1, 15, 'FREE', 1, 999.00, NOW()),

(2, 5, 'S', 1, 1599.00, NOW()),
(2, 16, 'FREE', 1, 1299.00, NOW()),

(3, 21, 'L', 2, 699.00, NOW()),
(3, 22, 'M', 1, 999.00, NOW()),

(4, 23, 'M', 1, 1899.00, NOW()),
(4, 24, 'FREE', 1, 3499.00, NOW());

-- =========================================
-- ORDERS
-- =========================================
INSERT INTO cart(user_id)
VALUES(YOUR_LOGGED_IN_USER_ID);
INSERT INTO orders
(user_id, order_date, total_amount,
payment_method, order_status, delivery_address)
VALUES

(1, NOW(), 5097.00, 'UPI', 'Placed', 'Bangalore'),
(2, NOW(), 2898.00, 'Cash On Delivery', 'Shipped', 'Mysore'),
(3, NOW(), 2397.00, 'Credit Card', 'Delivered', 'Hyderabad'),
(4, NOW(), 5398.00, 'UPI', 'Processing', 'Delhi');

-- =========================================
-- ORDER ITEMS
-- =========================================

INSERT INTO order_items
(order_id, product_id, product_name,
quantity, unit_price, subtotal, size_label)
VALUES

(1, 1, 'Mens Black T-Shirt', 2, 799.00, 1598.00, 'M'),
(1, 12, 'Running Shoes', 1, 2499.00, 2499.00, '8'),
(1, 15, 'Leather Wallet', 1, 999.00, 999.00, 'FREE'),

(2, 5, 'Womens Floral Dress', 1, 1599.00, 1599.00, 'S'),
(2, 16, 'Stylish Sunglasses', 1, 1299.00, 1299.00, 'FREE'),

(3, 21, 'Gym T-Shirt', 2, 699.00, 1398.00, 'L'),
(3, 22, 'Track Pants', 1, 999.00, 999.00, 'M'),

(4, 23, 'Kurta', 1, 1899.00, 1899.00, 'M'),
(4, 24, 'Saree', 1, 3499.00, 3499.00, 'FREE');
use fashion_store;
UPDATE products SET image_url='mens_black_tshirt.jpg' WHERE product_name='Mens Black T-Shirt';

UPDATE products SET image_url='mens_blue_jeans.jpg' WHERE product_name='Mens Blue Jeans';

UPDATE products SET image_url='mens_white_shirt.jpg' WHERE product_name='Mens White Shirt';

UPDATE products SET image_url='mens_cargo.jpg' WHERE product_name='Mens Cargo Pants';

UPDATE products SET image_url='womens_floral_dress.jpg' WHERE product_name='Womens Floral Dress';

UPDATE products SET image_url='women_hoodie.jpg' WHERE product_name='Women Hoodie';

UPDATE products SET image_url='crop_top.jpg' WHERE product_name='Women Crop Top';

UPDATE products SET image_url='women_jeans.jpg' WHERE product_name='Women Skinny Jeans';

UPDATE products SET image_url='kids_tshirt.jpg' WHERE product_name='Kids Cartoon T-Shirt';

UPDATE products SET image_url='kids_shorts.jpg' WHERE product_name='Kids Shorts';

UPDATE products SET image_url='kids_jacket.jpg' WHERE product_name='Kids Jacket';

UPDATE products SET image_url='running_shoes.jpg' WHERE product_name='Running Shoes';

UPDATE products SET image_url='casual_sneakers.jpg' WHERE product_name='Casual Sneakers';

UPDATE products SET image_url='leather_boots.jpg' WHERE product_name='Leather Boots';

UPDATE products SET image_url='wallet.jpg' WHERE product_name='Leather Wallet';

UPDATE products SET image_url='sunglasses.jpg' WHERE product_name='Stylish Sunglasses';

UPDATE products SET image_url='watch.jpg' WHERE product_name='Analog Watch';

UPDATE products SET image_url='cap.jpg' WHERE product_name='Cap';

UPDATE products SET image_url='winter_jacket.jpg' WHERE product_name='Winter Jacket';

UPDATE products SET image_url='sweatshirt.jpg' WHERE product_name='Sweatshirt';

UPDATE products SET image_url='gym_tshirt.jpg' WHERE product_name='Gym T-Shirt';

UPDATE products SET image_url='trackpants.jpg' WHERE product_name='Track Pants';

UPDATE products SET image_url='kurta.jpg' WHERE product_name='Kurta';

UPDATE products SET image_url='saree.jpg' WHERE product_name='Saree';
select product_name,image_url from products;
desc products;
SELECT * FROM order_items;
select* from categories;
USE fashion_store;
select * from products;
DELETE FROM cart_items
WHERE cart_item_id > 0;
Set SQL_SAFE_UPDATES=0;
UPDATE users
SET password = 'ad@2004'
WHERE email = 'admin@gmail.com';