-- Create a table for users
CREATE TABLE users(
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL
);

-- Create a table for bank accounts
CREATE TABLE bank_accounts(
IBAN INT PRIMARY KEY,
bank_name VARCHAR(255) NOT NULL,
saving INT CHECK (saving>=0),
user_id INT,
FOREIGN KEY(user_id) REFERENCES users(id)
);

-- Create a table for payment methods
CREATE TABLE payment_methods(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
company_name VARCHAR(255) NOT NULL,
user_id INT,
IBAN INT,
FOREIGN KEY(user_id) REFERENCES users(id),
FOREIGN KEY(IBAN) REFERENCES bank_accounts(IBAN)
);

-- Create a table for shops
CREATE TABLE shops (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
type_of_shop VARCHAR(255) NOT NULL
);

-- Create a table for products and services bought buy users
CREATE TABLE products_and_services (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
type_of_product_or_service VARCHAR(255) NOT NULL,
price INT NOT NULL
);

-- Create a table for inventory for shops
CREATE TABLE inventory (
shop_id INT,
product_or_service_id INT,
FOREIGN KEY(shop_id) REFERENCES shops(id),
FOREIGN KEY(product_or_service_id) REFERENCES products_and_services(id)
);

-- Create a table for payments which users made
CREATE TABLE payments (
id INT AUTO_INCREMENT PRIMARY KEY,
date_of_payment DATE DEFAULT (CURRENT_DATE),
user_id INT,
payment_method_id INT,
FOREIGN KEY(user_id) REFERENCES users(id),
FOREIGN KEY(payment_method_id) REFERENCES payment_methods(id)
);

-- Create a table for purchase
CREATE TABLE purchase (
payment_id INT,
product_or_service_id INT,
FOREIGN KEY(payment_id) REFERENCES payments(id),
FOREIGN KEY(product_or_service_id) REFERENCES products_and_services(id)
);

-- Create a view to to know which user bought which products or services
CREATE VIEW users_products_and_services AS
SELECT users.first_name, users.last_name, products_and_services.name as 'product or service name' FROM users
JOIN payments ON users.id = payments.user_id
JOIN purchase ON payments.id = purchase.payment_id
JOIN products_and_services ON products_and_services.id = purchase.product_or_service_id;

-- Create indexes to access all products and services sold in any particular shops
CREATE INDEX shops_name_index ON shops(name);
CREATE INDEX inventory_index ON inventory (shop_id);
CREATE INDEX product_or_service_name_index ON products_and_services (name);