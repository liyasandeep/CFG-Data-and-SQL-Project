CREATE DATABASE helmet_store;

USE helmet_store;

-- TABLE CREATION PART

-- 1) Brand -->	brand_id (PK), name 

CREATE TABLE Brand(
		brand_id INTEGER NOT NULL,
		brand_name VARCHAR(25) NOT NULL,
		CONSTRAINT PK_Brand PRIMARY KEY (brand_id)
		);
					

-- 2) Models --> model_id (PK), name, brand_id (FK referencing Brands)

CREATE TABLE Model(
	model_id INTEGER NOT NULL,
	model_name VARCHAR(25) NOT NULL,
	brand_id INTEGER NOT NULL,
	description VARCHAR(500) NOT NULL,
	CONSTRAINT PK_Model PRIMARY KEY (model_id),
	CONSTRAINT FK_ModelBrand FOREIGN KEY (brand_id) REFERENCES Brand(brand_id) ON DELETE CASCADE
	); 
                    
-- 3) Size --> sizeId  (PK), Name

CREATE TABLE Size(
	size_id INTEGER NOT NULL,
	size_name VARCHAR(25) NOT NULL,
	CONSTRAINT PK_Size PRIMARY KEY (size_id)
	);
                    
-- 4) Colour --> colour_id (pk), name

CREATE TABLE Colour(
	colour_id INTEGER NOT NULL,
	colour_name VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Colour PRIMARY KEY (colour_id)
	);
                    
-- 5) Helmet Type --> type_id (pk), name

CREATE TABLE HelmetType(
	type_id INTEGER NOT NULL,
	type_name VARCHAR(50) NOT NULL,
	CONSTRAINT PK_HelmetType PRIMARY KEY (type_id)
	);
	
    -- 6) Helmets --> helmet_id (PK), model_id (FK referencing Models),  price, size_id (FK referencing Size), colour_id (FK referencing Colour), 
--                StockQuantity,created_at,modified_at  (images_path, categoryId  (FK referencing Categories)),  

CREATE TABLE Helmets(
	helmet_id INTEGER NOT NULL,
	model_id INTEGER NOT NULL  ,
	price DECIMAl(6,2) NOT NULL,
	stockQuantity INTEGER NOT NULL,
	size_id INTEGER NOT NULL,
    colour_id INTEGER NOT NULL,
	type_id  INTEGER NOT NULL,
	created_at datetime DEFAULT current_timestamp(),
	modified_at datetime DEFAULT NULL ON UPDATE current_timestamp(),
	CONSTRAINT PK_Helmets PRIMARY KEY (helmet_id),
	CONSTRAINT FK_HelmetModel FOREIGN KEY (model_id) REFERENCES Model(model_id) ON DELETE CASCADE,
	CONSTRAINT FK_HelmetSize  FOREIGN KEY (size_id) REFERENCES Size(size_id) ON DELETE CASCADE,
	CONSTRAINT FK_HelmetColour  FOREIGN KEY (colour_id) REFERENCES Colour(colour_id) ON DELETE CASCADE, 
	CONSTRAINT FK_HelmetType  FOREIGN KEY (type_id) REFERENCES HelmetType(type_id) ON DELETE CASCADE
	); 
		
-- 7) Customers --> customer_id (PK),firstName, lastName, email, password, PhNo,createdAt, modifiedat   

CREATE TABLE Customers(
	customer_id INTEGER NOT NULL ,
	firstName VARCHAR(50) NOT NULL,
	lastName VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	password VARCHAR(50) NOT NULL,
	phNo VARCHAR(50) NOT NULL,
	created_at datetime DEFAULT current_timestamp(),
	modified_at datetime DEFAULT NULL ON UPDATE current_timestamp(),
	CONSTRAINT PK_Customers PRIMARY KEY (customer_id)
	); 
                    
-- 8) Address --> address_id,customer_id, house_no, street, city, post_code,country

CREATE TABLE Address(
	address_id INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	house_no VARCHAR(25) NOT NULL,
	street VARCHAR(20) NOT NULL,
	city VARCHAR(20) NOT NULL,
	post_code VARCHAR(10) NOT NULL,
	country VARCHAR(20) NOT NULL,
	CONSTRAINT PK_Addresss PRIMARY KEY (address_id),
	CONSTRAINT FK_Address_customerId FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
	); 
                    
/* 9 ) Orders (1 to M with order details) 		
		order_id(PK),customer-id  (FK referencing Customers),orderDate, totalAmount,orderStatus(pending,shipped, delivered)  */
        
CREATE TABLE Orders(
	order_id INTEGER NOT NULL ,
	customer_id INTEGER NOT NULL,
	orderDate DATE NOT NULL,
	totalAmount DECIMAl(10,2) NOT NULL,
	orderStatus VARCHAR(50) NOT NULL,
	created_at datetime DEFAULT current_timestamp(),
	CONSTRAINT PK_Orders PRIMARY KEY (order_id),
	CONSTRAINT FK_OrderCustomer FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE 
	); 

/* 10) OrderDetails --> orderDetails_id (PK), order_Id  (FK referencing Orders), helmet_id (FK referencing Helmets),
		quantity_ordered, Subtotal(calculated field),	size,color	*/

CREATE TABLE OrderDetails(
	orderDetail_id INTEGER NOT NULL,
	order_id INTEGER NOT NULL,
	helmet_id INTEGER NOT NULL,
	quantity_ordered INTEGER NOT NULL,
	subtotal DECIMAl(10,2) NOT NULL,
	size VARCHAR(25) NOT NULL, 
	color VARCHAR(100) NOT NULL,
	CONSTRAINT PK_OrderDetails PRIMARY KEY (orderDetail_id),
	CONSTRAINT FK_OrderDetail_orderId FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
	CONSTRAINT FK_OrderDetail_HelmetId FOREIGN KEY (helmet_id) REFERENCES Helmets(helmet_id) ON DELETE CASCADE
	); 

/* 11) ShippingInfo -->	shipment_id  (PK),order_id  (FK referencing Orders),shipping_date, shippingStatus,courier_company,Tracking_number */

CREATE TABLE ShippingInfo(
	shipment_id INTEGER NOT NULL,
	order_id INTEGER NOT NULL,
	shipping_date DATE NOT NULL,
	courier_company VARCHAR(50) NOT NULL,
	tracking_no VARCHAR(50) NOT NULL,
	shippingStatus VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Shipments PRIMARY KEY (shipment_id),
	CONSTRAINT FK_Shipments_orderId FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE
	); 

-- Reviews --> review_id(PK), helmet_id (FK referencing helmets), customer_id(FK referencing customers),rating,comment,date

CREATE TABLE Reviews(
	review_id INTEGER NOT NULL,
	helmet_id INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	rating INTEGER NOT NULL,
	comment VARCHAR(500),
	date DATETIME DEFAULT current_timestamp(),
	CONSTRAINT PK_Reviews PRIMARY KEY (review_id),
	CONSTRAINT FK_Reviews_helmetId  FOREIGN KEY (helmet_id) REFERENCES Helmets(helmet_id) ON DELETE CASCADE,
	CONSTRAINT FK_Review_CustomerId FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE 
	); 

-- INSERTING VALUES TO TABLES PART

-- Inserting values to Brand table

INSERT INTO Brand (
brand_id, brand_name) 
VALUES 
(1,'LS2'),
(2,'Shoei'),
(3,'Arai'),
(4,'AGV'),
(5,'Bell'),
(6,'HJC'),
(7,'Scorpion'),
(8,'Shark'),
(9,'Nolan'),
(10,'Icon');
                                
SELECT * FROM Brand;

-- Inserting values to Model table

INSERT INTO Model(
model_id ,model_name, brand_id,description)
VALUES
(1,'Shoei RF-1200', 2,'The Shoei RF-1200 Helmet was designed to be an industry leader in comfort, performance and protection.'),
(2,'AGV Pista GP RR',4,'Pista GP RR is an exact replica of the AGV helmet used in races by world champions.'),
(3,'HJC RPHA 11',6,'The HJC RPHA-11 is the flagship of the HJC range, a full face motorcycle helmet that provides extreme performance for high speed riding!'),
(4,'Bell Qualifier  DLX',5,'Lightweight Polycarbonate/ABS Shell Construction '),
(5,'Scorpion EXO-R420',7,'he EXO-R420 redefines what you can expect in a sub-$200 full face helmet with state-of-the-art materials, performance features'),
(6,'Shark Spartan',8,"The Spartan GT, Shark's latest fibre composite full-face helmet"),
(7,'Nolan N87',9,' latest and most exclusive version of Nolan’s top-of-the-range road full face helmet.'),
(8,'LS2 Valiant',1,'a Full face and a Open Face helmet.'),
(9,'Icon Airflite',10,'an urban streetfighter helmet with MIPS system, drop-down sun visor, and superlative ventilation.'),
(10,'AGV K6-S',4,'Suitable for every type of riding and all road surfaces'),
(11,'AGV K3',4,' K3 is AGV’s full-face road helmet that takes all the characteristics of a versatile, safe helmet'),
(12,'Arai Concept-XE',3,'The Concept-XE has a clean, minimalist shape with handsome contours in place to hide clever, multi-stage air channels'),
(13,'Bell Race Star - Flex DLX',5,'The Race Star DLX version now comes supplied with a PROTINT Panovison Visor'),
(14,'Bell Moto-9S Flex',5,'Designed with the racer in mind and the podium in sight, the Moto-9S Flex provides race-ready protection.'),
(15,'HJC RPHA-12',6,' Premium Integrated Matrix / P.I.M. EVO: Reinforcement materials including Carbon-Aramid hybrid and natural fibre'),
(16,'Nolan X-552 U.C',9,'This high-carbon content helmet is designed for thrilling off-road journeys. Get ready for unrivaled performance and protection on your next adventure.'),
(17,'Nolan N100-6',9,'The N100-6 sets new standards for a high-end polycarbonate flip-up helmet, developing the popular technical features of the predecessor N100-5'),
(18,'Shoei NXR2',2,'Lightweight Compact DesignLightest SHOEI ECE22/06 standard certified product.'),
(19,'Shark Skwal i3',8,'The world’s first helmet with integrated brake lights!'),
(20,'LS2 Advant X',1,'Convertible helmet to enjoy all seasons of the year thanks to its 180º rotating chin guard. Perfect for any type of riding and for all weather conditions.'),
(21,'LS2 Advant X Carbon',1,'The LS2 FF901 Advant X Carbon - Future is the most advanced convertible helmet on the market.  Made of 100% Carbon fiber.');

SELECT * FROM Model;


-- Inserting values to Size table

INSERT INTO Size(
size_id ,size_name)
VALUES
(1,'XS'),
(2,'S'),
(3,'M'),
(4,'L'),
(5,'XL'),
(6,'2XL'),
(7,'3XL');

SELECT * FROM Size;

-- Inserting values to Colour table

INSERT INTO Colour(
colour_id, colour_name) 
VALUES
(1,'Gloss White'),
(2,'Nardo Grey'),
(3, 'Midnight Black'),
(4, 'Ruby Red'),
(5, 'Ocean Blue');

SELECT * FROM Colour;

-- Inserting values to HelmetType table

INSERT INTO HelmetType(
type_id ,type_name) 
VALUES 
(1, 'Open Face'),
(2, 'Full Face'),
(3, 'Modular'),
(4, 'Half Face'),
(5, 'Off-Road');

SELECT * FROM HelmetType;

-- Inserting values to Helmets table

INSERT INTO Helmets(
helmet_id ,model_id,price,stockQuantity,size_id,colour_id,type_id,created_at) 
VALUES 
(1, 1, 300.00, 2, 3, 1, 1,'2022-12-12 12:06:01'),
(2, 2, 305.00, 3, 4, 2, 2,'2022-12-13 10:00:09'),
(3, 3, 280.00, 5, 2, 3, 1, '2022-12-14 15:30:45'),
(4, 1, 320.00, 1, 4, 4, 2, '2022-12-15 09:45:22'),
(5, 2, 299.99, 3, 3, 1, 3, '2022-12-16 14:20:18'),
(6, 3, 315.00, 4, 2, 2, 1, '2022-12-17 11:10:36'),
(7, 1, 289.50, 2, 1, 4, 2, '2022-12-18 08:05:49'),
(8, 2, 299.00, 3, 3, 2, 3, '2022-12-19 16:40:15'),
(9, 3, 310.50, 4, 4, 3, 1, '2022-12-20 13:25:08');

SELECT * FROM Helmets;


-- Inserting values to Customers table

INSERT INTO Customers(
customer_id,firstName,lastName,email,password,phNo,created_at) 
VALUES 
(1, 'Liya', 'Thomas', 'liya@gmail.com', '1234', '11112222333', '2023-01-10 13:06:12'),
(2, 'John', 'Doe', 'john.doe@example.com', 'password123', '44445555666', '2023-01-11 08:45:30'),
(3, 'Emma', 'Smith', 'emma.smith@example.com', 'securepass', '77778888999', '2023-01-12 15:20:42'),
(4, 'Alex', 'Johnson', 'alex.johnson@example.com', 'pass123', '10111222333', '2023-01-13 12:10:18'),
(5, 'Sophia', 'Brown', 'sophia.brown@example.com', 'userpass', '12121234567', '2023-01-14 09:05:25'),
(6, 'Daniel', 'Williams', 'daniel.williams@example.com', 'danielpass', '13141516171', '2023-01-15 16:30:55'),
(7, 'John', 'Smith', 'john@gmail.com', '12340', '33332222333', '2022-12-11 13:06:12');

SELECT * FROM Customers;


-- Inserting values to address table

INSERT INTO Address(
address_id,customer_id,house_no,street ,city,post_code ,country ) 
VALUES
(1, 1, 7,'Buckingam Rise', 'Rugby', 'CV21 1AA', 'United Kingdom'),
(2, 2, 15, 'Maple Lane', 'Manchester', 'M14 5AA', 'United Kingdom'),
(3, 3, 23, 'Oak Street', 'London', 'SW1A 1AA', 'United Kingdom'),
(4, 4, 10, 'Chestnut Avenue', 'Birmingham', 'B1 1AA', 'United Kingdom'),
(5, 5, 5, 'Pine Road', 'Edinburgh', 'EH1 1AA', 'United Kingdom'),
(6, 6, 12, 'Willow Crescent', 'Glasgow', 'G1 1AA', 'United Kingdom'),
(7, 7, 9,'Anderson Avenue', 'Rugby', 'CV22 1AA', 'United Kingdom');

SELECT * FROM Address;

-- Inserting values to Orders table

INSERT INTO Orders(
order_id,customer_id,orderDate,totalAmount ,orderStatus,created_at) 
VALUES 
(1, 1, '2023-08-11', 605.00, 'Delivered','2023-08-11 12:07:20'),
(2, 1, '2023-10-11', 300.00, 'Paid','2023-10-11 12:07:20'),
(3, 2, '2023-08-15', 305.00, 'Shipped', '2023-08-15 09:30:45'),
(4, 3, '2023-09-05', 560.00, 'Pending', '2023-09-05 14:20:18'), 
(5, 4, '2023-09-20', 889.49, 'Delivered', '2023-09-20 11:10:36'), 
(6, 5, '2023-10-02', 299.00, 'Paid', '2023-10-02 08:05:49'),
(7, 7, '2022-12-20', 310.50, 'Delivered','2022-12-20 15:07:20'),
(8, 7, '2022-12-15', 625.00, 'Delivered','2022-12-15 11:09:20'),
(9, 6, '2023-12-15', 300.00, 'Paid','2023-12-15 11:09:20'),
(10, 7, '2023-12-15', 305.00, 'Paid','2023-12-15 12:09:20');    



SELECT * FROM Orders;


-- Inserting values to OrdersDetails table

INSERT INTO OrderDetails(
orderDetail_id,order_id,helmet_id,quantity_ordered,subtotal,size,color) 
VALUES 
(1, 1, 1, 1, 300.00, 'M', 'Gloss White'),
(2, 1, 2, 1, 305.00, 'L', 'Nardo Grey'),
(3, 2, 1, 1, 300.00, 'M', 'Gloss White'), 
(4, 3, 2, 1, 305.00,'L', 'Nardo Grey'), 
(5, 4, 3, 2, 560.00,'S', 'Midnight Black'), 
(6, 5, 1, 1, 300.00,'M', 'Gloss White'),										
(7, 5, 5, 1, 299.99,'M', 'Gloss White'), 
(8, 5, 7, 1, 289.50,'XS', 'Ruby Red'),
(9, 6, 8, 1, 299.99,'M','Nardo Grey'),
(10, 7, 9, 1, 310.50, 'L', 'Midnight Black'),
(11, 8, 2, 1, 305.00, 'L', 'Nardo Grey'),
(12, 8, 4, 1, 320.00, 'L', 'Ruby Red'),
(13, 9, 1, 1, 300.00, 'M', 'Gloss White'), 
(14, 10, 2, 1, 305.00,'L', 'Nardo Grey'); 
	
									
              
SELECT * FROM OrderDetails;

-- Inserting values to ShippingInfo table

INSERT INTO ShippingInfo(
shipment_id,order_id,shipping_date,courier_company,tracking_no,shippingStatus) 
VALUES 
(1, 1, '2023-08-15', 'DPD', '123456789', 'Delivered'),
(2, 2, '2023-10-11', 'DPD', '198765487', 'Pending'),
(3, 3, '2023-08-20', 'UPS', '987654321', 'Shipped'),
(4, 4, '2023-09-08', 'FedEx', '567890123', 'Delivered'),
(5, 5, '2023-10-05', 'DHL', '345678901', 'In Transit'),
(6, 6, '2023-10-18', 'Royal Mail', '234567890', 'Pending');


SELECT * FROM ShippingInfo;

-- DROP TABLE ShippingInfo;


-- Inserting values to Reviews table

INSERT INTO  Reviews(
review_id,helmet_id,customer_id,rating,comment,date)
VALUES 
(1, 1, 1, 4, 'So Comfortable', '2023-09-12 11:07:00'),
(2, 2, 2, 4, 'Stylish design, comfortable fit. The only downside is it\'s a bit heavy.', '2023-02-05'),
(3, 1, 4, 5, 'Excellent quality! Fast shipping and fantastic customer service.', '2023-02-15'), 
(4, 3, 3, 3, 'Decent helmet, but the sizing is a bit off. Had to exchange for a larger one.', '2023-03-01'), 
(5, 1, 4, 4, 'So comfortable! Great for long rides without any discomfort.', '2023-09-12 11:07:00'), 
(6, 2, 2, 5, 'Amazing helmet, and the customer service was top-notch!', '2023-09-20 15:30:00'); 

            
SELECT * FROM Reviews;


-- DROP DATABASE helmet_store;