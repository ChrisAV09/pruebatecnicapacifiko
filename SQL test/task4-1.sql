CREATE DEFINER=`chris`@`%` PROCEDURE `listproducts`()
BEGIN
	SELECT product_name AS "name product", stock_quantity AS "stok" FROM products;
END