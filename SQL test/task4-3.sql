CREATE DEFINER=`chris`@`%` PROCEDURE `ordercustomer`(IN customerid INT, productname VARCHAR(50), quantitya INT)
BEGIN
	INSERT INTO orders (customer_id, order_date) VALUES (customerid,CURDATE());
    SET @last_order_id = LAST_INSERT_ID();
    INSERT INTO orderitems (order_id, product_id, quantity, subtotal) SELECT
	@last_order_id, p.product_id, quantitya, p.price * quantitya FROM products p WHERE p.product_name = productname;
    SET @last_orderitem_id = LAST_INSERT_ID();
    SELECT * FROM orderitems WHERE ordersitems_id = @last_orderitem_id;
    
END