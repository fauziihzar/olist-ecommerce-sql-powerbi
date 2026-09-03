USE olist_portfolio;

-- =========================================================
-- Import Olist Portfolio Dataset
-- =========================================================
-- Note:
-- Update the file paths below according to your local setup.
-- The dataset files are not included in this repository.
-- =========================================================


-- Customers
LOAD DATA LOCAL INFILE 'PATH_TO_DATA/olist_customers_dataset.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- Orders
LOAD DATA LOCAL INFILE 'PATH_TO_DATA/olist_orders_dataset.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- Order Items
LOAD DATA LOCAL INFILE 'PATH_TO_DATA/olist_order_items_dataset.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- Payments
LOAD DATA LOCAL INFILE 'PATH_TO_DATA/olist_order_payments_dataset.csv'
INTO TABLE payments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- Products
LOAD DATA LOCAL INFILE 'PATH_TO_DATA/olist_products_dataset.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- Reviews
LOAD DATA LOCAL INFILE 'PATH_TO_DATA/olist_order_reviews_dataset.csv'
INTO TABLE reviews
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- Sellers
LOAD DATA LOCAL INFILE 'PATH_TO_DATA/olist_sellers_dataset.csv'
INTO TABLE sellers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- Product Category Translation
LOAD DATA LOCAL INFILE 'PATH_TO_DATA/product_category_name_translation.csv'
INTO TABLE category_translation
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
