\c prueba
DROP TABLE IF EXISTS client;
CREATE TABLE client(
    id SERIAL PRIMARY KEY,
    name VARCHAR (50),
    address VARCHAR (80)
);

DROP TABLE IF EXISTS receipt;
CREATE TABLE receipt(
    number INT PRIMARY KEY,
    created_at DATE NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES client (id),
    subtotal INT NOT NULL,
    tax INT NOT NULL,
    total INT NOT NULL
);

DROP TABLE IF EXISTS product_list;
CREATE TABLE product_list(
    receipt_number INT,
    FOREIGN KEY (receipt_number) REFERENCES receipt (number),
    price INT,
    quantity INT,
    total INT,
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES products (id)
);

DROP TABLE IF EXISTS products;
CREATE TABLE products(
    id SERIAL PRIMARY KEY,
    name VARCHAR (50) NOT NULL,
    description TEXT,
    price INT NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories (id)
);

DROP TABLE IF EXISTS categories;
CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    category_name VARCHAR(30),
    description VARCHAR(50)
);