CREATE DEFINER=`chris`@`%` PROCEDURE `revenue_customer`(in customfirst VARCHAR(50), customlast VARCHAR(50) )
BEGIN
	SELECT SUM(orderitems.subtotal) AS "revenue generated customer"FROM orderitems 
    INNER JOIN orders on orderitems.order_id = orders.order_id 
    INNER JOIN customers on orders.customer_id = customers.customer_id 
    where customers.first_name = customfirst and customers.last_name = customlast;
END