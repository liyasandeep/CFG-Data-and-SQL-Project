
-- Queries for the Project

-- JOIN PART


-- 1) Inner Join with Model and Brand to get Helmet details with Brand names--

SELECT Helmets.helmet_id, Helmets.price, Helmets.stockQuantity, Model.model_name, Brand.brand_name
FROM Helmets
JOIN Model ON Helmets.model_id = Model.model_id
JOIN Brand ON Model.brand_id = Brand.brand_id;


-- 2) Write a Query to get the helmets details like brand name , model name, description of helmet, price, size, colour, stock available
-- by joining tables helmets, brand, model, size, colour

SELECT h.helmet_id, b.brand_name AS Brand, m.model_name AS ModelName, m.description as Description, 
	   h.price AS Price, s.size_name AS Size, c.colour_name AS Color, h.stockQuantity AS Stock_Available
	   FROM Helmets AS h LEFT JOIN Size s ON h.size_id = s.size_id
						 LEFT JOIN Model m ON h.model_id = m.model_id
                         LEFT JOIN Colour c ON h.colour_id = c.colour_id
						 LEFT JOIN Brand b ON m.brand_id = b.brand_id;
        
        
-- STORED FUNCTION PART

/*  1) Write a stored function to find the helmets which are to be restocked
		-- available stock > 2  then NO
        -- available stock > 2 then YES */

DELIMITER //
CREATE FUNCTION to_restock(stockAvailable INT)  -- passes available stock from table helmets as parameter
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE restock VARCHAR(10);
    IF stockAvailable > 2 THEN
		SET restock = 'NO';  -- if available stock > 2 set restock to 'NO' else set restock to 'YES'
	ELSE
		SET restock ='YES';
	END IF;
	RETURN restock;
END //
DELIMITER ;

-- 	DROP FUNCTION IF EXISTS to_restock;

-- write a query to find the helmets which are to be restocked

SELECT m.model_name AS ModelName, s.size_name AS Size, c.colour_name AS Color, 
	   h.stockQuantity AS Stock_Available, to_restock( h.stockQuantity) AS RestockStatus
	   FROM Helmets AS h LEFT JOIN Size s ON h.size_id = s.size_id
						 LEFT JOIN Model m ON h.model_id = m.model_id
                         LEFT JOIN Colour c ON h.colour_id = c.colour_id
						 LEFT JOIN Brand b ON m.brand_id = b.brand_id
	  WHERE to_restock( h.stockQuantity) = 'YES';
                         
-- 2) create a stored function to count orders made in the last 30 days
		-- countOrders stored function which is used in the event ( MonthlySalesCount_event ) 

DELIMITER //
CREATE FUNCTION countOrders(end_date DATE)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE count INT;
    DECLARE start_date DATE;
    SET start_date = DATE_ADD(end_date, INTERVAL -30 DAY); -- DATE_SUB(end_date, INTERVAL 150 DAY); actually -30 to be done
	SELECT COUNT(order_id) INTO count FROM Orders WHERE orderDate <= end_date AND orderDate >=  start_date;
    return count;
END //
DELIMITER ;

-- DROP FUNCTION countOrders

-- create a function to calculate total for an order made
-- DELIMITER //
-- CREATE FUNCTION CalculateOrderTotal(order_id INT)
-- RETURNS DECIMAL(10, 2)
-- DETERMINISTIC
-- BEGIN
--     DECLARE total_amount DECIMAL(10, 2);
--     SELECT SUM(subtotal)  INTO total_amount   FROM OrderDetails   WHERE order_id = order_id;
--     RETURN total_amount;
-- END;
-- DELIMITER //



-- query to extract data for analysis, including average ratings for each helmet model and total order amounts
-- SELECT 
--     hi.model_name,
--     AVG(r.rating) AS avg_rating,
--     CalculateOrderTotal(o.order_id) AS total_order_amount
-- FROM HelmetInformation hi
-- LEFT JOIN Reviews r ON hi.helmet_id = r.helmet_id
-- LEFT JOIN OrderDetails od ON hi.helmet_id = od.helmet_id
-- LEFT JOIN Orders o ON od.order_id = o.order_id
-- GROUP BY hi.model_name;


-- SUBQUERY PART

-- 1) Subquery to find the avg sales for a helmet model eg: AGV Pista GP RR

	SELECT COUNT(orderDetail_id) as NoOfOrders, 
		   SUM(od.subtotal) as Total_Sales ,
           AVG(od.subtotal) as AverageSale
	FROM OrderDetails od WHERE od.helmet_id 
    IN ( SELECT h.helmet_id FROM Helmets h WHERE h.model_id 
    IN ( SELECT model_id FROM Model WHERE model_name = 'AGV Pista GP RR')  );
                  
-- SELECT * FROM Helmets;
-- SELECT * FROM Model;
-- SELECT * FROM OrderDetails;               
                  
                  
-- GROUP BY AND HAVING PART 

-- 1) Created a query to get the monthly sales by city and with sales value more than 450

SELECT SUM(totalAmount) AS Monthly_Sales,  
	   MONTH(o.orderDate) AS MONTH, 
       YEAR(o.orderDate) AS YEAR, 
       a.city AS CITY 
FROM Orders AS o 
LEFT JOIN Address a ON o.customer_id = a.customer_id   
GROUP BY MONTH(o.orderDate), YEAR(o.orderDate), a.city              -- grouping by month then year then city
HAVING SUM(totalAmount) > 450
ORDER BY YEAR(o.orderDate), a.city ASC;                             -- order by year then by city in ascending order


-- 2) Created query to get the average rating for each helmet model and filter only those with an average rating greater than 4

SELECT h.model_id, AVG(r.rating) AS avg_rating
FROM Helmets h
JOIN Reviews r ON h.helmet_id = r.helmet_id
GROUP BY h.model_id
HAVING AVG(r.rating) > 4;

-- 3) Group Helmets by Size and show the total stock quantity for each size--

SELECT Size.size_name, SUM(Helmets.stockQuantity) AS TotalStock
FROM Helmets
JOIN Size ON Helmets.size_id = Size.size_id
GROUP BY Size.size_name;


-- 4) Show the Helmets with stock quantity greater than 3--

SELECT helmet_id, model_id, stockQuantity
FROM Helmets
HAVING stockQuantity > 3;

--  5) Show customer names who have placed an order--

SELECT firstName, lastName
FROM Customers
WHERE customer_id IN (SELECT DISTINCT customer_id FROM Orders);

-- STROED PROCEDURE PART

-- 1) Create a stored procedure to get the details of the customers from a specific city
-- name and address

DELIMITER //
CREATE PROCEDURE getCustomerInfo(IN  city VARCHAR(25))
BEGIN
	SELECT CONCAT_WS(' ',c.firstName,c.lastName) AS Name,
		   c.email AS Email,
           CONCAT_WS(', ', a.house_no, a.street, a.city, a.post_code, a.country ) as Address 
    FROM Customers c INNER JOIN Address a on c.customer_id = a.customer_id 
    WHERE a.city = city;
END //
DELIMITER ;

-- call the procedure to get all the customers information from Rugby
CALL getCustomerInfo('Rugby');

CALL getCustomerInfo('Manchester');
CALL getCustomerInfo('Glasgow');


-- 2) Created a stored function to calculate the total price for a given order
-- Create the stored procedure
DELIMITER //
CREATE PROCEDURE CalculateOrderTotal(IN orderID INT)
BEGIN
    DECLARE total DECIMAL(10,2);

    -- Calculate the total amount for the specified order ID
    SELECT SUM(subtotal) INTO total
    FROM OrderDetails
    WHERE order_id = orderID;

    -- Display the result
    SELECT CONCAT('Total amount for Order ID ', orderID, ' is $', total) AS Result;
END //
DELIMITER ;

CALL CalculateOrderTotal(1);

SELECT * FROM Orderdetails;



-- VIEW PART

-- 1) Created a view to calculate the total sales for each helmet model 

CREATE  OR REPLACE  VIEW HelmetSale AS
SELECT m.model_name as ModelName , 
	   SUM(od.subtotal) as Total_Sales 
FROM Helmets h INNER JOIN Model m on h.model_id = m.model_id
			   INNER JOIN OrderDetails od on h.helmet_id = od.helmet_id 
GROUP BY  m.model_name;
                                                                      

SELECT * FROM HelmetSale;

-- find two helmets which is making the highest sale

SELECT * FROM  HelmetSale ORDER BY Total_sales DESC LIMIT 2;

-- Find the helmets with total sales >1500
SELECT * FROM  HelmetSale WHERE Total_sales > 1500.00;

-- 2) Create a view that shows customer details and their order information --

CREATE VIEW CustomerOrderView AS
SELECT Customers.customer_id, Customers.firstName, Customers.lastName, Orders.order_id, Orders.orderDate, Orders.totalAmount
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id;

SELECT * FROM CustomerOrderView;


-- 3) Created a view that combines information from Helmets, Model, Brand, Size, Colour, and HelmetType tables

CREATE VIEW HelmetInformation AS
SELECT
    h.helmet_id ,
    m.model_name  ,
    b.brand_name ,
    h.price  ,
    h.stockQuantity ,
    s.size_name ,
    c.colour_name ,
    ht.type_name ,
    h.created_at 
FROM Helmets h
JOIN Model m ON h.model_id = m.model_id
JOIN Brand b ON m.brand_id = b.brand_id
JOIN Size s ON h.size_id = s.size_id
JOIN Colour c ON h.colour_id = c.colour_id
JOIN HelmetType ht ON h.type_id = ht.type_id;

-- show information from the view table
Select * from HelmetInformation;

Select model_name, brand_name, colour_name,type_name  from HelmetInformation WHERE type_name = 'Open Face';

-- use view to find the avg sales for a helmet model eg: AGV Pista GP RR

SELECT COUNT(orderDetail_id) as NoOfOrders,SUM(od.subtotal) as Total_Sales , AVG(od.subtotal) as AverageSale
				from OrderDetails od join HelmetInformation h on od.helmet_id = h.helmet_id  where h.model_name = 'AGV Pista GP RR';

-- DROP VIEW HelmetInformation;


-- TRIGGER PART

-- 1) Created a trigger to update the stock quantity in helmets table after a order is made and values are inserted to orderDetails table

DELIMITER //
CREATE TRIGGER after_orderDetailsInsert
AFTER INSERT ON OrderDetails
FOR EACH ROW

BEGIN
	UPDATE Helmets -- update helmets table
    -- update the stock quantity in helmets table based on the order quantity
	SET stockQuantity = stockQuantity - NEW.quantity_ordered WHERE helmet_id = NEW.helmet_id AND stockQuantity > 0; 
END //

DELIMITER ;

-- inserting values to order details table to check whether trigger fires
INSERT INTO OrderDetails(orderDetail_id,order_id,helmet_id,quantity_ordered,subtotal,size,color) values (15, 8, 4, 1, 320.00, 'L', 'Ruby Red');

-- UPDATE Helmets SET stockQuantity = 1 WHERE helmet_id = 4;
-- DELETE FROM OrderDetails WHERE orderDetail_id = 15;

SELECT * FROM  OrderDetails;
SELECT * FROM  Helmets;

-- DROP TRIGGER IF EXISTS after_orderDetailsInsert ;

-- 2) Created a trigger to check whether a product is in stock before an order is placed

DELIMITER //
CREATE TRIGGER before_orderDetailsInsert
BEFORE INSERT ON OrderDetails
FOR EACH ROW
BEGIN
	DECLARE stockAvailable INT;
    SELECT stockQuantity INTO stockAvailable FROM Helmets WHERE helmet_id = NEW.helmet_id ;
    
    IF NEW.quantity_ordered > stockAvailable THEN
    	-- error
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Sorry the ordered quantity is not in stock';
		END IF;
	
END //
DELIMITER  ;
 
-- 3) Created a Trigger to update the modified_at timestamp when a Helmet record is updated --

DELIMITER //
CREATE TRIGGER UpdateModifiedAt
BEFORE UPDATE ON Helmets
FOR EACH ROW
BEGIN
SET NEW.modified_at = NOW();

END //
DELIMITER ;


-- EVENTS PART


SET GLOBAL event_scheduler = ON;

-- SHOW EVENTS;

-- Table creation to store event results

CREATE TABLE monthlySalesCount(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
NoOfOrders INT NOT NULL );

-- DROP TABLE monthlySalesCount;

-- 1) Create an event to count the monthly orders

DELIMITER //
CREATE EVENT MonthlySalesCount_event
ON SCHEDULE EVERY 1 MINUTE -- MONTH   -- schedule the event to happen on every one month . so its month here
STARTS NOW() 
ENDS  NOW() + INTERVAL 3 MINUTE -- MONTH -- end the event after three monthsOrderDetails
DO BEGIN	
	INSERT INTO monthlySalesCount( created_at, NoOfOrders ) VALUES ( NOW(), countOrders( DATE(NOW()) ) ); -- calling a stored function countOrders
END //
DELIMITER ;
   
-- SHOW EVENTS;

SELECT * FROM monthlySalesCount ORDER BY ID DESC;


-- 2) created an event to delete info from shipment table with shipment status delivered and with shippment dates before 120 days

DELIMITER //
CREATE EVENT MonthlyShippmentTableUpdate_event
ON SCHEDULE EVERY 1 MONTH 
STARTS NOW() 
ENDS  NOW() + INTERVAL 3 MONTH 
DO BEGIN	
	DELETE FROM ShippingInfo where shippingStatus = 'Delivered' and shipping_date < DATE_ADD(date(now()), INTERVAL -120 DAY); 
END //
DELIMITER ;
    
SELECT * FROM ShippingInfo;

-- SHOW EVENTS;

-- DROP EVENT  MonthlyShippmentTableUpdate_event;
