create database technical;
use technical;

/*TASK 1*/

CREATE TABLE customers (
  customer_id int AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50),
  phone int
);
CREATE TABLE products (
  product_id int AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(50) ,
  price DECIMAL(20,2),
  stock_quantity INT
);
CREATE TABLE orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  FOREIGN KEY (customer_id) references customers(customer_id)
);
CREATE TABLE orderitems (
  ordersitems_id int AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  subtotal DECIMAL(20,2),
  FOREIGN KEY (order_id) references orders(order_id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) references products(product_id)
);


/*TASK 2*/
/*NO1*/ INSERT INTO products (product_name, price, stock_quantity) VALUES ("Laptop", 1000.00, 50);
/*NO2*/ UPDATE products set stock_quantity = 75 where product_id = 3;
/*NO3*/ DELETE FROM orders where order_id = 10;
/*NO4*/ SELECT customers.first_name, customers.last_name FROM customers INNER JOIN orders on customers.customer_id = orders.customer_id
where orders.order_id = 5;
/*NO5*/ SELECT SUM(subtotal) AS total FROM orderitems;

/*TASK 3*/
call revenue_customer("Henrry","Garrison");

/*TASK 4*/
-- 1 
call listproducts();
-- 2
call searchbyname("monitor");
-- 3
call ordercustomer(3,"Smartphone",1);


/*EXTRAS*/

INSERT INTO products (product_name, price, stock_quantity) VALUES ("Smartphone", 750.00, 100);
INSERT INTO products (product_name, price, stock_quantity) VALUES ("Tablet", 400.00, 150);
INSERT INTO products (product_name, price, stock_quantity) VALUES ("Monitor", 300.00, 80);
INSERT INTO products (product_name, price, stock_quantity) VALUES ("Headphones", 120.00, 200);

INSERT INTO customers (first_name, last_name, email, phone) VALUES ("Henrry", "Garrison", "Hgarr@example.com", 45879663);
INSERT INTO customers (first_name, last_name, email, phone) VALUES ("Anna", "Smith", "anna.smith@example.com", 12345678);
INSERT INTO customers (first_name, last_name, email, phone) VALUES ("John", "Doe", "john.doe@example.com", 87654321);
INSERT INTO customers (first_name, last_name, email, phone) VALUES ("Maria", "Gomez", "maria.gomez@example.com", 98765432);
INSERT INTO customers (first_name, last_name, email, phone) VALUES ("Michael", "Johnson", "m.johnson@example.com", 11223344);

INSERT INTO orders (customer_id, order_date) VALUES (2, "2024-05-12");
INSERT INTO orders (customer_id, order_date) VALUES (1, "2024-05-13");
INSERT INTO orders (customer_id, order_date) VALUES (3, "2024-05-14");
INSERT INTO orders (customer_id, order_date) VALUES (4, "2024-05-15");
INSERT INTO orders (customer_id, order_date) VALUES (2, "2024-05-16");
INSERT INTO orders (customer_id, order_date) VALUES (5, "2024-05-17");
INSERT INTO orders (customer_id, order_date) VALUES (1, "2024-05-18");
INSERT INTO orders (customer_id, order_date) VALUES (3, "2024-05-19");
INSERT INTO orders (customer_id, order_date) VALUES (4, "2024-05-20");
INSERT INTO orders (customer_id, order_date) VALUES (2, "2024-05-21");

INSERT INTO orderitems (order_id, product_id, quantity, subtotal) SELECT 1, 2, 3, price * 3 FROM products WHERE product_id = 2;
INSERT INTO orderitems (order_id, product_id, quantity, subtotal) SELECT 2, 1, 5, price * 5 FROM products WHERE product_id = 1;
INSERT INTO orderitems (order_id, product_id, quantity, subtotal) SELECT 3, 3, 2, price * 2 FROM products WHERE product_id = 3;
INSERT INTO orderitems (order_id, product_id, quantity, subtotal) SELECT 4, 4, 4, price * 4 FROM products WHERE product_id = 4;
INSERT INTO orderitems (order_id, product_id, quantity, subtotal) SELECT 5, 5, 1, price * 1 FROM products WHERE product_id = 5;
INSERT INTO orderitems (order_id, product_id, quantity, subtotal) SELECT 10, 3, 2, price * 2 FROM products WHERE product_id = 3;



