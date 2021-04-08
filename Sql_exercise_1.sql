-- 1.1 Select the names of all the products in the store.
 SELECT NAME FROM PRODUCTS;
 
-- 1.2 Select the names and the prices of all the products in the store.
SELECT NAME, PRICE FROM PRODUCTS;

-- 1.3 Select the name of the products with a price less than or equal to $200.
SELECT NAME FROM PRODUCTS WHERE PRICE <= 200;

-- 1.4 Select all the products with a price between $60 and $120.
SELECT * FROM PRODUCTS WHERE PRICE BETWEEN 60 AND 200;
SELECT * FROM PRODUCTS WHERE PRICE >= 60 AND PRICE <= 200;

-- 1.5 Select the name and price in cents (i.e., the price must be multiplied by 100).
SELECT NAME,PRICE*100 FROM PRODUCTS; 
SELECT NAME, CONCAT(PRICE*100,' CENTS') FROM PRODUCTS;  

-- 1.6 Compute the average price of all the products.
SELECT AVG(PRICE) FROM PRODUCTS;
SELECT SUM(PRICE)/COUNT(PRICE) FROM PRODUCTS;

-- 1.7 Compute the average price of all products with manufacturer code equal to 2.
SELECT AVG(PRICE) FROM PRODUCTS WHERE MANUFACTURER = 2;

-- 1.8 Compute the number of products with a price larger than or equal to $180.
SELECT COUNT(*) FROM PRODUCTS WHERE PRICE >= 180;

-- 1.9 Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
SELECT NAME, PRICE FROM PRODUCTS WHERE PRICE >= 180 ORDER BY  PRICE DESC, NAME ASC; 

-- 1.10 Select all the data from the products, including all the data for each product's manufacturer.
SELECT A.* ,B.NAME FROM PRODUCTS A, MANUFACTURERS B WHERE A.MANUFACTURER = B.CODE;
SELECT A.* , B.NAME FROM PRODUCTS A JOIN MANUFACTURERS B ON (A.MANUFACTURER = B.CODE);

-- 1.11 Select the product name, price, and manufacturer name of all the products.
SELECT A.NAME,A.PRICE,B.NAME FROM PRODUCTS A JOIN MANUFACTURERS B ON (A.MANUFACTURER = B.CODE);

SELECT PRODUCTS.NAME, PRICE, MANUFACTURERS.Name
   FROM PRODUCTS INNER JOIN MANUFACTURERS
   ON PRODUCTS.MANUFACTURER = MANUFACTURERS.Code;
   
-- 1.12 Select the average price of each manufacturer's products, showing only the manufacturer's code.
SELECT AVG(PRICE),MANUFACTURER FROM PRODUCTS GROUP BY MANUFACTURER;

-- 1.13 Select the average price of each manufacturer's products, showing the manufacturer's name.
SELECT AVG(A.PRICE) ,B.NAME FROM PRODUCTS A JOIN MANUFACTURERS B ON (A.MANUFACTURER = B.CODE) GROUP BY B.NAME;

-- 1.14 Select the names of manufacturer whose products have an average price larger than or equal to $150.
SELECT AVG(A.PRICE), B.NAME FROM MANUFACTURERS B JOIN PRODUCTS A ON B.CODE = A.MANUFACTURER GROUP BY B.NAME HAVING AVG(A.PRICE)>=150; 
SELECT AVG(PRICE), MANUFACTURERS.NAME FROM PRODUCTS ,MANUFACTURERS WHERE PRODUCTS.MANUFACTURER = MANUFACTURERS.CODE GROUP BY MANUFACTURERS.NAME HAVING AVG(PRICE)>= 150;

-- 1.15 Select the name and price of the cheapest product.
SELECT NAME , PRICE FROM PRODUCTS WHERE PRICE =(SELECT MIN(PRICE) FROM PRODUCTS);
SELECT NAME , PRICE FROM PRODUCTS ORDER BY 2 ASC LIMIT 1;
--  SELECT TOP 1 NAME , PRICE FROM PRODUCTS  ORDER BY 2 ASC;   QUERY USED IN SQL SERVER 

-- 1.16 Select the name of each manufacturer along with the name and price of its most expensive product.
SELECT B.NAME, A.NAME,A.PRICE FROM PRODUCTS A JOIN MANUFACTURERS B ON (A.MANUFACTURER = B.CODE) GROUP BY B.NAME HAVING MAX(A.PRICE);

-- 1.17 Add a new product: Loudspeakers, $70, manufacturer 2.
INSERT INTO PRODUCTS VALUES(11, 'Loudspeakers',70,2);

-- 1.18 Update the name of product 8 to "Laser Printer".
UPDATE PRODUCTS SET NAME = 'Laser Printer' WHERE CODE = 8;

-- 1.19 Apply a 10% discount to all products.
UPDATE PRODUCTS SET PRICE = PRICE * 0.9;

-- 1.20 Apply a 10% discount to all products with a price larger than or equal to $120.
update products
set price = price * 0.9
where price >= 120; 