-- In pgAdmin: create a new database called 'olist'
-- Then create each table and import its CSV:
-- For each table: create the table then import data from csv, then run the queries after that to clean/modify
-- data so that it works

CREATE TABLE category_translation (
    product_category_name VARCHAR(100) PRIMARY KEY,
    product_category_name_english VARCHAR(100)
);

CREATE TABLE products (
    product_id CHAR(32) PRIMARY KEY,
    product_category_name VARCHAR(100),
    product_name_lenght SMALLINT,
    product_description_lenght SMALLINT,
    product_photos_qty SMALLINT,
    product_weight_g INTEGER,
    product_length_cm NUMERIC(6,2),
    product_height_cm NUMERIC(6,2),
    product_width_cm NUMERIC(6,2),
);

-- Find category that don't exist in category_translation table
SELECT 
DISTINCT products.product_category_name,
category_translation.product_category_name
FROM products
LEFT JOIN category_translation
ON products.product_category_name = category_translation.product_category_name
WHERE products.product_category_name IS NOT NULL AND 
	category_translation.product_category_name IS NULL;

-- Insert found category with English translation
INSERT INTO category_translation (product_category_name, product_category_name_english)
VALUES ('pc_gamer', 'pc_gamer'),
	('portateis_cozinha_e_preparadores_de_alimentos', 'Kitchen gadgets and food preparation tools');

-- Create FOREIGN KEY for translation and product table
ALTER TABLE products
ADD CONSTRAINT category_translation_fk
FOREIGN KEY (product_category_name)
REFERENCES category_translation(product_category_name);

CREATE TABLE sellers (
    seller_id CHAR(32) PRIMARY KEY,
    seller_zip_code_prefix INTEGER,
    seller_city VARCHAR(100),
    seller_state CHAR(2)
);

CREATE TABLE customers (
    customer_id CHAR(32) PRIMARY KEY,
    customer_unique_id CHAR(32),
    customer_zip_code_prefix INTEGER,
    customer_city VARCHAR(100),
    customer_state CHAR(2)
);

CREATE TABLE geolocation (
    geolocation_zip_code_prefix INTEGER,
    geolocation_lat NUMERIC(10,8),
    geolocation_lng NUMERIC(11,8),
    geolocation_city VARCHAR(100),
    geolocation_state CHAR(2)
);

CREATE TABLE orders (
    order_id CHAR(32) PRIMARY KEY,
    customer_id CHAR(32),

    order_status VARCHAR(20),

    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP,

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

CREATE TABLE order_items (

    order_id CHAR(32),
    order_item_id SMALLINT,

    product_id CHAR(32),
    seller_id CHAR(32),

    shipping_limit_date TIMESTAMP,

    price NUMERIC(10,2),
    freight_value NUMERIC(10,2),

    PRIMARY KEY (order_id, order_item_id),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    -- FOREIGN KEY (product_id)
    --     REFERENCES products(product_id),

    FOREIGN KEY (seller_id)
        REFERENCES sellers(seller_id)
);

-- Delete Order Items with product_id that don't exist in Product table
DELETE FROM order_items
WHERE (order_id, product_id) IN (
	SELECT
		order_items.order_id,
		order_items.product_id
	FROM order_items
	LEFT JOIN products 
	ON order_items.product_id = products.product_id
	WHERE order_items.product_id IS NOT NULL
	AND products.product_id IS NULL
);

-- Add FOREIGN KEY to Product table
ALTER TABLE order_items
ADD CONSTRAINT product_fk
FOREIGN KEY (product_id)
REFERENCES products(product_id);

CREATE TABLE order_payments (

    order_id CHAR(32),
    payment_sequential SMALLINT,

    payment_type VARCHAR(30),
    payment_installments SMALLINT,
    payment_value NUMERIC(10,2),

    PRIMARY KEY(order_id, payment_sequential),

    FOREIGN KEY(order_id)
        REFERENCES orders(order_id)
);

CREATE TABLE order_reviews (

    review_id CHAR(32) PRIMARY KEY,

    order_id CHAR(32),

    review_score SMALLINT,

    review_comment_title TEXT,
    review_comment_message TEXT,

    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP,

    FOREIGN KEY(order_id)
        REFERENCES orders(order_id)
);


