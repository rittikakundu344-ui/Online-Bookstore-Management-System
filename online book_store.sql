DROP DATABASE IF EXISTS bookstore_db;
CREATE DATABASE bookstore_db;
USE bookstore_db;

CREATE TABLE categories (
category_id INT AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE books (
book_id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(100) NOT NULL,
author VARCHAR(80) NOT NULL,
category_id INT NOT NULL,
price DECIMAL(8,2) NOT NULL CHECK (price > 0),
stock INT NOT NULL DEFAULT 0 CHECK (stock >= 0),
published_year INT,
FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE customers (
customer_id INT AUTO_INCREMENT PRIMARY KEY,
full_name VARCHAR(80) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
city VARCHAR(50) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
order_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT NOT NULL,
order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
status ENUM('PLACED','SHIPPED','CANCELLED') NOT NULL DEFAULT 'PLACED',
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
item_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT NOT NULL,
book_id INT NOT NULL,
quantity INT NOT NULL CHECK (quantity > 0),
unit_price DECIMAL(8,2) NOT NULL DEFAULT 0.00, -- filled by a trigger
FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
FOREIGN KEY (book_id) REFERENCES books(book_id)
);

CREATE TABLE stock_log (
log_id INT AUTO_INCREMENT PRIMARY KEY,
book_id INT NOT NULL,
change_qty INT NOT NULL,
reason VARCHAR(60),
logged_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE price_audit (
audit_id INT AUTO_INCREMENT PRIMARY KEY,
book_id INT NOT NULL,
old_price DECIMAL(8,2) NOT NULL,
new_price DECIMAL(8,2) NOT NULL,
changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
SHOW TABLES;

CREATE INDEX idx_books_title ON books(title);
CREATE INDEX idx_orders_date ON orders(order_date);
CREATE INDEX idx_customers_city ON customers(city);
-- (SHOW INDEX FROM orders; also works but prints many columns)
SELECT index_name, column_name
FROM information_schema.statistics
WHERE table_schema = 'bookstore_db' AND table_name = 'orders';

INSERT INTO categories (category_name) VALUES
('Programming'), ('Databases'), ('Fiction'), ('Biography'),
('Self-Help'), ('Data Science'), ('History');

INSERT INTO books (title, author, category_id, price, stock, published_year) VALUES
('Python Crash Course', 'Eric Matthes', 1, 599.00, 40, 2023),
('Learning SQL', 'Alan Beaulieu', 2, 550.00, 30, 2020),
('Wings of Fire', 'A. P. J. Abdul Kalam', 4, 250.00, 50, 1999),
('The Alchemist', 'Paulo Coelho', 3, 299.00, 45, 1988),
('Pather Panchali', 'Bibhutibhushan Bandyopadhyay', 3, 220.00, 25, 1929),
('Clean Code', 'Robert C. Martin', 1, 650.00, 20, 2008),
('Atomic Habits', 'James Clear', 5, 399.00, 60, 2018),
('Data Science from Scratch', 'Joel Grus', 6, 720.00, 15, 2019),
('Feluda Samagra', 'Satyajit Ray', 3, 350.00, 35, 1992),
('Ikigai', 'Hector Garcia', 5, 280.00, 40, 2016),
('SQL Cookbook', 'Anthony Molinaro', 2, 680.00, 18, 2005),
('The Discovery of India', 'Jawaharlal Nehru', 7, 450.00, 22, 1946);

INSERT INTO customers (full_name, email, city) VALUES
('Ananya Sen', 'ananya.sen@example.com', 'Kolkata'),
('Rahul Das', 'rahul.das@example.com', 'Howrah'),
('Priya Ghosh', 'priya.ghosh@example.com', 'Kolkata'),
('Arjun Mitra', 'arjun.mitra@example.com', 'Durgapur'),
('Sneha Roy', 'sneha.roy@example.com', 'Kolkata'),
('Imran Sheikh', 'imran.sheikh@example.com', 'Siliguri'),
('Debjani Paul', 'debjani.paul@example.com', 'Howrah'),
('Rohit Banerjee', 'rohit.banerjee@example.com', 'Kolkata');

DROP DATABASE IF EXISTS bookstore_db;
CREATE DATABASE bookstore_db;
USE bookstore_db;

CREATE TABLE categories (
category_id INT AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE books (
book_id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(100) NOT NULL,
author VARCHAR(80) NOT NULL,
category_id INT NOT NULL,
price DECIMAL(8,2) NOT NULL CHECK (price > 0),
stock INT NOT NULL DEFAULT 0 CHECK (stock >= 0),
published_year INT,
FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE customers (
customer_id INT AUTO_INCREMENT PRIMARY KEY,
full_name VARCHAR(80) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
city VARCHAR(50) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
order_id INT AUTO_INCREMENT PRIMARY KEY,
customer_id INT NOT NULL,
order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
status ENUM('PLACED','SHIPPED','CANCELLED') NOT NULL DEFAULT 'PLACED',
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
item_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT NOT NULL,
book_id INT NOT NULL,
quantity INT NOT NULL CHECK (quantity > 0),
unit_price DECIMAL(8,2) NOT NULL DEFAULT 0.00, -- filled by a trigger
FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
FOREIGN KEY (book_id) REFERENCES books(book_id)
);

CREATE TABLE stock_log (
log_id INT AUTO_INCREMENT PRIMARY KEY,
book_id INT NOT NULL,
change_qty INT NOT NULL,
reason VARCHAR(60),
logged_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE price_audit (
audit_id INT AUTO_INCREMENT PRIMARY KEY,
book_id INT NOT NULL,
old_price DECIMAL(8,2) NOT NULL,
new_price DECIMAL(8,2) NOT NULL,
changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
SHOW TABLES;

CREATE INDEX idx_books_title ON books(title);
CREATE INDEX idx_orders_date ON orders(order_date);
CREATE INDEX idx_customers_city ON customers(city);
-- (SHOW INDEX FROM orders; also works but prints many columns)
SELECT index_name, column_name
FROM information_schema.statistics
WHERE table_schema = 'bookstore_db' AND table_name = 'orders';

INSERT INTO categories (category_name) VALUES
('Programming'), ('Databases'), ('Fiction'), ('Biography'),
('Self-Help'), ('Data Science'), ('History');

INSERT INTO books (title, author, category_id, price, stock, published_year) VALUES
('Python Crash Course', 'Eric Matthes', 1, 599.00, 40, 2023),
('Learning SQL', 'Alan Beaulieu', 2, 550.00, 30, 2020),
('Wings of Fire', 'A. P. J. Abdul Kalam', 4, 250.00, 50, 1999),
('The Alchemist', 'Paulo Coelho', 3, 299.00, 45, 1988),
('Pather Panchali', 'Bibhutibhushan Bandyopadhyay', 3, 220.00, 25, 1929),
('Clean Code', 'Robert C. Martin', 1, 650.00, 20, 2008),
('Atomic Habits', 'James Clear', 5, 399.00, 60, 2018),
('Data Science from Scratch', 'Joel Grus', 6, 720.00, 15, 2019),
('Feluda Samagra', 'Satyajit Ray', 3, 350.00, 35, 1992),
('Ikigai', 'Hector Garcia', 5, 280.00, 40, 2016),
('SQL Cookbook', 'Anthony Molinaro', 2, 680.00, 18, 2005),
('The Discovery of India', 'Jawaharlal Nehru', 7, 450.00, 22, 1946);

INSERT INTO customers (full_name, email, city) VALUES
('Ananya Sen', 'ananya.sen@example.com', 'Kolkata'),
('Rahul Das', 'rahul.das@example.com', 'Howrah'),
('Priya Ghosh', 'priya.ghosh@example.com', 'Kolkata'),
('Arjun Mitra', 'arjun.mitra@example.com', 'Durgapur'),
('Sneha Roy', 'sneha.roy@example.com', 'Kolkata'),
('Imran Sheikh', 'imran.sheikh@example.com', 'Siliguri'),
('Debjani Paul', 'debjani.paul@example.com', 'Howrah'),
('Rohit Banerjee', 'rohit.banerjee@example.com', 'Kolkata');

SELECT COUNT(*) AS total_books FROM books;
SELECT COUNT(*) AS total_customers FROM customers;

DELIMITER $$
-- Rule 1: before an item is saved, check stock and copy the current book price
CREATE TRIGGER trg_items_before_insert
BEFORE INSERT ON order_items
FOR EACH ROW
BEGIN
DECLARE v_price DECIMAL(8,2);
DECLARE v_stock INT;
SELECT price, stock INTO v_price, v_stock
FROM books WHERE book_id = NEW.book_id;
IF v_stock < NEW.quantity THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Insufficient stock for this book';
END IF;
SET NEW.unit_price = v_price;
END$$

-- Rule 2: after an item is saved, reduce stock and write a stock log row
CREATE TRIGGER trg_items_after_insert
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
UPDATE books SET stock = stock - NEW.quantity
WHERE book_id = NEW.book_id;
INSERT INTO stock_log (book_id, change_qty, reason)
VALUES (NEW.book_id, -NEW.quantity, CONCAT('Order #', NEW.order_id));
END$$

-- Rule 3: whenever a book price changes, keep an audit record
CREATE TRIGGER trg_books_after_update
AFTER UPDATE ON books
FOR EACH ROW
BEGIN
IF OLD.price <> NEW.price THEN
INSERT INTO price_audit (book_id, old_price, new_price)
VALUES (OLD.book_id, OLD.price, NEW.price);
END IF;
END$$
DELIMITER ;

-- (SHOW TRIGGERS; also works but prints very wide rows)
SELECT trigger_name, event_manipulation AS event, event_object_table AS on_table, action_timing AS timing
FROM information_schema.triggers
WHERE trigger_schema = 'bookstore_db'
ORDER BY trigger_name;

INSERT INTO orders (customer_id, order_date) VALUES
(1, '2026-08-05 10:30:00'),
(2, '2026-08-18 14:15:00'),
(3, '2026-09-02 09:45:00'),
(1, '2026-09-14 16:20:00'),
(4, '2026-09-21 11:05:00'),
(5, '2026-10-03 13:40:00'),
(6, '2026-10-12 18:10:00'),
(2, '2026-10-25 12:00:00'),
(7, '2026-11-02 15:30:00'),
(3, '2026-11-08 17:45:00');
-- unit_price is NOT supplied: the BEFORE INSERT trigger fills it
INSERT INTO order_items (order_id, book_id, quantity) VALUES
(1, 1, 1), (1, 2, 1),
(2, 7, 2),
(3, 3, 1), (3, 4, 1), (3, 10, 1),
(4, 6, 1),
(5, 8, 1), (5, 11, 1),
(6, 5, 2), (6, 9, 1),
(7, 7, 1), (7, 12, 1),
(8, 1, 2),
(9, 2, 1), (9, 4, 2),
(10, 7, 3);
SELECT * FROM order_items;
SELECT book_id, title, stock FROM books ORDER BY book_id;

-- all books in a price range
SELECT title, author, price
FROM books
WHERE price BETWEEN 300 AND 600;
-- books whose title contains the word SQL
SELECT book_id, title FROM books WHERE title LIKE '%SQL%';
-- distinct cities of customers
SELECT DISTINCT city FROM customers;
-- books with their category names (INNER JOIN)
SELECT b.title, c.category_name, b.price
FROM books b
JOIN categories c ON c.category_id = b.category_id
WHERE c.category_name IN ('Programming', 'Databases');
-- who placed which order (JOIN)
SELECT o.order_id, cu.full_name, o.order_date, o.status
FROM orders o
JOIN customers cu ON cu.customer_id =o.customer_id
WHERE o.order_date >= '2026-10-01';


-- 5 most expensive books
SELECT title, price FROM books ORDER BY price DESC LIMIT 5;
-- books sorted by category then by title
SELECT c.category_name, b.title
FROM books b
JOIN categories c ON c.category_id = b.category_id
ORDER BY c.category_name ASC, b.title ASC;

-- customers per city
SELECT city, COUNT(*) AS customers
FROM customers
GROUP BY city
ORDER BY customers DESC, city;
-- number of titles and average price per category
SELECT c.category_name, COUNT(*) AS titles, ROUND(AVG(b.price), 2) AS avg_price
FROM books b
JOIN categories c ON c.category_id = b.category_id
GROUP BY c.category_name
ORDER BY titles DESC, c.category_name;
-- monthly revenue
SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
SUM(oi.quantity * oi.unit_price) AS revenue
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY sales_month
ORDER BY sales_month;
-- customers who spent more than 1000 (HAVING filters groups)
SELECT cu.full_name, SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers cu
JOIN orders o ON o.customer_id = cu.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY cu.customer_id, cu.full_name
HAVING total_spent > 1000
ORDER BY total_spent DESC;
-- best selling books (top 5 by units sold)
SELECT b.title, SUM(oi.quantity) AS units_sold
FROM order_items oi
JOIN books b ON b.book_id = oi.book_id
GROUP BY b.book_id, b.title
ORDER BY units_sold DESC, b.title
LIMIT 5;
-- customers who never ordered (LEFT JOIN + IS NULL)
SELECT cu.customer_id, cu.full_name
FROM customers cu
LEFT JOIN orders o ON o.customer_id = cu.customer_id
WHERE o.order_id IS NULL;
 SET SQL_SAFE_UPDATES=0;
 
-- mark the first seven orders as shipped
UPDATE orders SET status = 'SHIPPED' WHERE order_id BETWEEN 1 AND 7;
-- 10 percent price hike for Programming books (trigger writes price_audit)
UPDATE books
SET price = ROUND(price * 1.10, 2)
WHERE category_id = (SELECT category_id FROM categories
WHERE category_name = 'Programming');
-- restock books that are running low
UPDATE books SET stock = stock + 25 WHERE stock < 20;
SELECT status, COUNT(*) AS orders FROM orders GROUP BY status;
SELECT * FROM price_audit;
SELECT book_id, title, price, stock FROM books WHERE book_id IN (1, 6, 8, 11);

-- add a temporary book and delete it again (key column in WHERE = safe mode friendly)
INSERT INTO books (title, author, category_id, price, stock, published_year)
VALUES ('Demo Book (to delete)', 'Test Author', 1, 100.00, 5, 2026);
DELETE FROM books WHERE book_id = LAST_INSERT_ID();
SELECT COUNT(*) AS books_after_delete FROM books;
-- the database protects related data: this DELETE fails (foreign key)
DELETE FROM categories WHERE category_id = 1;



SELECT * FROM categories;
SELECT book_id, title, category_id
FROM books
WHERE category_id = 1;

CREATE VIEW v_order_summary AS
SELECT o.order_id,
cu.full_name,
cu.city,
o.order_date,
o.status,
SUM(oi.quantity) AS total_items,
SUM(oi.quantity * oi.unit_price) AS order_total
FROM orders o
JOIN customers cu ON cu.customer_id = o.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY o.order_id, cu.full_name, cu.city, o.order_date, o.status;

CREATE VIEW v_category_sales AS
SELECT c.category_name,
SUM(oi.quantity) AS units_sold,
SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN books b ON b.book_id = oi.book_id
JOIN categories c ON c.category_id = b.category_id
GROUP BY c.category_name;

CREATE VIEW v_low_stock AS
SELECT book_id, title, stock FROM books WHERE stock < 25;
SELECT * FROM v_order_summary ORDER BY order_id;
SELECT * FROM v_category_sales ORDER BY revenue DESC;
SELECT * FROM v_low_stock ORDER BY stock;


-- A) successful order, one item removed with a savepoint
START TRANSACTION;
INSERT INTO orders (customer_id) VALUES (8);
SET @new_order = LAST_INSERT_ID();
INSERT INTO order_items (order_id, book_id, quantity) VALUES (@new_order, 2, 1);
SAVEPOINT after_first_item;
INSERT INTO order_items (order_id, book_id, quantity) VALUES (@new_order, 6, 1);
ROLLBACK TO SAVEPOINT after_first_item;
COMMIT;
SELECT oi.order_id, b.title, oi.quantity, oi.unit_price
FROM order_items oi
JOIN books b ON b.book_id = oi.book_id
WHERE oi.order_id = @new_order;
-- B) failed order: the trigger blocks 999 copies, ROLLBACK undoes everything
START TRANSACTION;
INSERT INTO orders (customer_id) VALUES (8);
INSERT INTO order_items (order_id, book_id, quantity)
VALUES (LAST_INSERT_ID(), 8, 999);
ROLLBACK;
SELECT COUNT(*) AS orders_of_customer_8 FROM orders WHERE customer_id = 8;
SELECT book_id, title, stock FROM books WHERE book_id IN (2, 6, 8);

SELECT * FROM stock_log ORDER BY log_id DESC LIMIT 6;
SELECT COUNT(*) AS stock_log_rows FROM stock_log;

SELECT 'book_id', 'title', 'author', 'price', 'stock'
UNION ALL
SELECT book_id, title, author, price, stock
FROM books
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/books_export.csv'
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n';


LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/new_books.csv'
INTO TABLE books
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(title, author, category_id, price, stock, published_year);

SELECT COUNT(*) AS total_books FROM books;

SELECT book_id, title, price, stock
FROM books
ORDER BY book_id;
