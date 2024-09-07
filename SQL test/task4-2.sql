CREATE DEFINER=`chris`@`%` PROCEDURE `searchbyname`(in nameprod VARCHAR(50))
BEGIN
	SELECT product_name AS "name", price, stock_quantity AS "stock" FROM products 
    WHERE product_name LIKE CONCAT("%",nameprod,"%");
END