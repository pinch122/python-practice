CREATE DATABASE flipkart;
USE flipkart;

CREATE TABLE products (
    pid INT(3) PRIMARY KEY,
    pname VARCHAR(50) NOT NULL,
    price INT(10) NOT NULL,
    stock INT(5),
    location VARCHAR(30) CHECK(location IN ('Mumbai', 'Delhi'))
);

CREATE TABLE customer (
    cid INT(3) PRIMARY KEY,
    cname VARCHAR(30) NOT NULL,
    age INT(3),
    addr VARCHAR(50)
);

CREATE TABLE orders (
    oid INT(3) PRIMARY KEY,
    cid INT(3),
    pid INT(3),
    amount INT(10) NOT NULL,
    FOREIGN KEY (cid) REFERENCES customer(cid),
    FOREIGN KEY (pid) REFERENCES products(pid)
);

CREATE TABLE payment (
    pay_id INT(3) PRIMARY KEY,
    oid INT(3),
    amount INT(10) NOT NULL,
    mode VARCHAR(30) CHECK (mode IN ('upi', 'credit', 'debit')),
    status VARCHAR(30) CHECK (status IN ('pending', 'cancelled', 'completed')),
    FOREIGN KEY (oid) REFERENCES orders(oid)
);

DROP TABLE products;
DROP DATABASE flipkart;

ALTER TABLE customer ADD phone VARCHAR(10);
ALTER TABLE customer DROP COLUMN phone;
ALTER TABLE orders RENAME COLUMN amt TO amount;
ALTER TABLE products MODIFY COLUMN price VARCHAR(10);
ALTER TABLE products MODIFY COLUMN location VARCHAR(30) CHECK(location IN ('Mumbai', 'Delhi', 'chennai'));

TRUNCATE TABLE products;

ALTER TABLE customer MODIFY COLUMN age INT(2) NOT NULL;
ALTER TABLE customer MODIFY COLUMN phone VARCHAR(10) UNIQUE;
ALTER TABLE payment MODIFY COLUMN status VARCHAR(30) CHECK( status IN ('pending', 'cancelled', 'completed'));
ALTER TABLE products MODIFY COLUMN location VARCHAR(30) DEFAULT 'Mumbai' CHECK(location IN ('Mumbai', 'Delhi', 'chennai'));

INSERT INTO products VALUES (1, 'HP Laptop', 50000, 15, 'Mumbai');
INSERT INTO products VALUES (2, 'Realme Mobile', 20000, 30, 'Delhi');
INSERT INTO products VALUES (3, 'Boat earpods', 3000, 50, 'Delhi');
INSERT INTO products VALUES (4, 'Levono Laptop', 40000, 15, 'Mumbai');
INSERT INTO products VALUES (5, 'Charger', 1000, 0, 'Mumbai');
INSERT INTO products VALUES (6, 'Mac Book', 78000, 6, 'Delhi');
INSERT INTO products VALUES (7, 'JBL speaker', 6000, 2, 'Delhi');

INSERT INTO customer (cid, cname, age, addr) VALUES
(101, 'Ravi', 30, 'Address 1'),
(102, 'Rahul', 25, 'Address 2'),
(103, 'Simran', 32, 'Address 3'),
(104, 'Purvesh', 28, 'Address 4'),
(105, 'Sanjana', 22, 'Address 5');

INSERT INTO orders VALUES (10001, 102, 3, 2700);
INSERT INTO orders VALUES (10002, 104, 2, 18000);
INSERT INTO orders VALUES (10003, 105, 5, 900);
INSERT INTO orders VALUES (10004, 101, 1, 46000);

INSERT INTO payment VALUES (1, 10001, 2700, 'upi', 'completed');
INSERT INTO payment VALUES (2, 10002, 18000, 'credit', 'completed');
INSERT INTO payment VALUES (3, 10003, 900, 'debit', 'in process');

UPDATE products SET location = 'Chennai' WHERE pname = 'Mac Book';
DELETE FROM customer WHERE cname = 'Ravi';

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    position VARCHAR(50),
    salary INT
);

INSERT INTO employees (id, name, position, salary) VALUES (1, 'John Doe', 'Software Engineer', 75000);
UPDATE employees SET salary = 80000 WHERE id = 1;
DELETE FROM employees WHERE id = 1;

SELECT * FROM products WHERE price > 100;

ALTER TABLE products ADD last_updated DATETIME;
UPDATE products SET price = 1100.00, last_updated = NOW() WHERE pid = 1;
DELETE FROM products WHERE stock < 10;
