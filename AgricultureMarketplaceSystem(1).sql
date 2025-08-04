-- Create the database
create database AgricultureMarkeplace;
-- use database
use AgricultureMarkeplace;
-- create table farmer
CREATE TABLE Farmer (
    farmer_id INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Address varchar(20),
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(100) NOT NULL
);
-- create product table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    farmer_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    quantity INT,
    description varchar(20),
    FOREIGN KEY(farmer_id) REFERENCES Farmer(farmer_id) on delete cascade
);
-- Create Customer table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address TEXT,
    password VARCHAR(255)
);
-- create orders table
CREATE TABLE orders(
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount int,
    status VARCHAR(50),
    FOREIGN KEY(customer_id) REFERENCES Customer(customer_id) on delete cascade
);
-- create order_iterm table
CREATE TABLE Order_Item (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) on delete set null,
    FOREIGN KEY (product_id) REFERENCES Product(product_id) on delete set null
);
-- create payment table
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) on delete set null
);
-- create review table
CREATE TABLE Review (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    review_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) on delete set null,
    FOREIGN KEY (product_id) REFERENCES Product(product_id) on delete set null
);
select * from farmer;
select * from customer;
select * from order_item;
select * from orders;
select * from payment;
select * from product;
select * from review;
-- insert the values in the farmer table
INSERT INTO Farmer VALUES
(1, 'Ravi Kumar', '9876543210', 'Trichy', 'ravi1@example.com', 'pass123'),
(2, 'Suresh R', '9812345678', 'Salem', 'suresh2@example.com', 'pass456'),
(3, 'Meena P', '9898989898', 'Madurai', 'meena3@example.com', 'pass789'),
(4, 'Karthik M', '9123456789', 'Coimbatore', 'karthik4@example.com', 'pass000'),
(5, 'Lakshmi G', '9000001111', 'Tanjore', 'lakshmi5@example.com', 'pass321'),
(6, 'Hari B', '8999999999', 'Namakkal', 'hari6@example.com', 'pass111'),
(7, 'Deepa R', '8888888888', 'Dindigul', 'deepa7@example.com', 'pass222'),
(8, 'Ganesh P', '8777777777', 'Kanchipuram', 'ganesh8@example.com', 'pass333'),
(9, 'Vani R', '8666666666', 'Erode', 'vani9@example.com', 'pass444'),
(10, 'Vikram D', '8555555555', 'Cuddalore', 'vikram10@example.com', 'pass555'),
(11, 'Arun J', '8444444444', 'Theni', 'arun11@example.com', 'pass666'),
(12, 'Jaya S', '8333333333', 'Vellore', 'jaya12@example.com', 'pass777'),
(13, 'Ramya M', '8222222222', 'Krishnagiri', 'ramya13@example.com', 'pass888'),
(14, 'Naveen P', '8111111111', 'Tirupur', 'naveen14@example.com', 'pass999'),
(15, 'Bala G', '8000000000', 'Tiruvannamalai', 'bala15@example.com', 'pass101'),
(16, 'Sangeetha L', '7999999999', 'Thiruvarur', 'sangeetha16@example.com', 'pass102'),
(17, 'Dinesh K', '7888888888', 'Villupuram', 'dinesh17@example.com', 'pass103'),
(18, 'Lavanya T', '7777777777', 'Sivagangai', 'lavanya18@example.com', 'pass104'),
(19, 'Arvind N', '7666666666', 'Karur', 'arvind19@example.com', 'pass105'),
(20, 'Vidhya C', '7555555555', 'Dharmapuri', 'vidhya20@example.com', 'pass106'),
(21, 'Ramesh V', '7444444444', 'Perambalur', 'ramesh21@example.com', 'pass107'),
(22, 'Kavi A', '7333333333', 'Nilgiris', 'kavi22@example.com', 'pass108'),
(23, 'Vishnu P', '7222222222', 'Nagapattinam', 'vishnu23@example.com', 'pass109'),
(24, 'Swathi N', '7111111111', 'Kanyakumari', 'swathi24@example.com', 'pass110'),
(25, 'Prakash D', '7000000000', 'Pudukottai', 'prakash25@example.com', 'pass111'),
(26, 'Keerthi M', '6999999999', 'Ariyalur', 'keerthi26@example.com', 'pass112'),
(27, 'Yogesh K', '6888888888', 'Chengalpattu', 'yogesh27@example.com', 'pass113'),
(28, 'Bhavani R', '6777777777', 'Ramanathapuram', 'bhavani28@example.com', 'pass114'),
(29, 'Sundar V', '6666666666', 'Virudhunagar', 'sundar29@example.com', 'pass115'),
(30, 'Anu S', '6555555555', 'Tiruchirappalli', 'anu30@example.com', 'pass116');
select * from farmer;
-- insert the values in the product table
INSERT INTO Product VALUES
(1, 1, 'Tomato', 'Vegetable', 25.50, 100, 'Fresh tomato'),
(2, 2, 'Brinjal', 'Vegetable', 30.00, 80, 'Purple brinjal'),
(3, 3, 'Mango', 'Fruit', 60.00, 200, 'Sweet mango'),
(4, 4, 'Carrot', 'Vegetable', 40.00, 70, 'Organic carrot'),
(5, 5, 'Paddy', 'Grain', 22.00, 500, 'Long grain'),
(6, 6, 'Groundnut', 'Seed', 55.00, 150, 'Raw groundnut'),
(7, 7, 'Onion', 'Vegetable', 20.00, 300, 'Red onion'),
(8, 8, 'Banana', 'Fruit', 15.00, 180, 'Ripe banana'),
(9, 9, 'Wheat', 'Grain', 35.00, 400, 'Premium wheat'),
(10, 10, 'Coconut', 'Fruit', 18.00, 250, 'Tender coconut'),
(11, 11, 'Chilli', 'Spice', 70.00, 90, 'Dry chilli'),
(12, 12, 'Turmeric', 'Spice', 90.00, 60, 'Organic turmeric'),
(13, 13, 'Sugarcane', 'Crop', 12.00, 500, 'Juicy cane'),
(14, 14, 'Maize', 'Grain', 28.00, 300, 'Yellow maize'),
(15, 15, 'Beetroot', 'Vegetable', 32.00, 120, 'Fresh beet'),
(16, 16, 'Orange', 'Fruit', 45.00, 150, 'Sweet orange'),
(17, 17, 'Peas', 'Vegetable', 26.00, 140, 'Green peas'),
(18, 18, 'Rice', 'Grain', 38.00, 350, 'Polished rice'),
(19, 19, 'Bajra', 'Grain', 33.00, 240, 'Pearl millet'),
(20, 20, 'Mustard', 'Seed', 50.00, 100, 'Mustard seed'),
(21, 21, 'Tapioca', 'Root', 22.00, 190, 'Local tapioca'),
(22, 22, 'Jackfruit', 'Fruit', 60.00, 50, 'Sweet jackfruit'),
(23, 23, 'Lemon', 'Fruit', 10.00, 300, 'Juicy lemon'),
(24, 24, 'Radish', 'Vegetable', 18.00, 150, 'White radish'),
(25, 25, 'Pumpkin', 'Vegetable', 27.00, 170, 'Organic pumpkin'),
(26, 26, 'Guava', 'Fruit', 35.00, 130, 'Pink guava'),
(27, 27, 'Spinach', 'Leafy', 12.00, 220, 'Green spinach'),
(28, 28, 'Coriander', 'Leafy', 14.00, 180, 'Fresh coriander'),
(29, 29, 'Tamarind', 'Spice', 48.00, 90, 'Dry tamarind'),
(30, 30, 'Ginger', 'Spice', 60.00, 85, 'Fresh ginger');
select * from product;
-- insert values in the customer table
INSERT INTO Customer (customer_id, name, email, phone, address, password) VALUES
(1, 'Anita Joseph', 'anita1@example.com', '9000100010', 'Chennai, TN', 'custpass01'),
(2, 'Vikram Seth', 'vikram2@example.com', '9000100020', 'Madurai, TN', 'custpass02'),
(3, 'Divya Raj', 'divya3@example.com', '9000100030', 'Erode, TN', 'custpass03'),
(4, 'Rahul Kumar', 'rahul4@example.com', '9000100040', 'Tirunelveli, TN', 'custpass04'),
(5, 'Priya Menon', 'priya5@example.com', '9000100050', 'Theni, TN', 'custpass05'),
(6, 'Ganesh Iyer', 'ganesh6@example.com', '9000100060', 'Salem, TN', 'custpass06'),
(7, 'Meena Lakshmi', 'meena7@example.com', '9000100070', 'Tanjore, TN', 'custpass07'),
(8, 'Sathish Kumar', 'sathish8@example.com', '9000100080', 'Trichy, TN', 'custpass08'),
(9, 'Lavanya R', 'lavanya9@example.com', '9000100090', 'Karur, TN', 'custpass09'),
(10, 'Dinesh Mohan', 'dinesh10@example.com', '9000100100', 'Coimbatore, TN', 'custpass10'),
(11, 'Jaya S', 'jaya11@example.com', '9000100110', 'Kanchipuram, TN', 'custpass11'),
(12, 'Bala G', 'bala12@example.com', '9000100120', 'Vellore, TN', 'custpass12'),
(13, 'Sowmya D', 'sowmya13@example.com', '9000100130', 'Nagapattinam, TN', 'custpass13'),
(14, 'Harish N', 'harish14@example.com', '9000100140', 'Cuddalore, TN', 'custpass14'),
(15, 'Sneha Priya', 'sneha15@example.com', '9000100150', 'Tiruvannamalai, TN', 'custpass15'),
(16, 'Vishal K', 'vishal16@example.com', '9000100160', 'Perambalur, TN', 'custpass16'),
(17, 'Revathi L', 'revathi17@example.com', '9000100170', 'Ariyalur, TN', 'custpass17'),
(18, 'Naveen A', 'naveen18@example.com', '9000100180', 'Nilgiris, TN', 'custpass18'),
(19, 'Bhavani T', 'bhavani19@example.com', '9000100190', 'Dindigul, TN', 'custpass19'),
(20, 'Kumar G', 'kumar20@example.com', '9000100200', 'Tirupur, TN', 'custpass20'),
(21, 'Keerthi C', 'keerthi21@example.com', '9000100210', 'Krishnagiri, TN', 'custpass21'),
(22, 'Ramya B', 'ramya22@example.com', '9000100220', 'Tiruvarur, TN', 'custpass22'),
(23, 'Sundar S', 'sundar23@example.com', '9000100230', 'Sivagangai, TN', 'custpass23'),
(24, 'Aravind N', 'aravind24@example.com', '9000100240', 'Virudhunagar, TN', 'custpass24'),
(25, 'Kavi R', 'kavi25@example.com', '9000100250', 'Ramanathapuram, TN', 'custpass25'),
(26, 'Anu K', 'anu26@example.com', '9000100260', 'Chengalpattu, TN', 'custpass26'),
(27, 'Manoj V', 'manoj27@example.com', '9000100270', 'Villupuram, TN', 'custpass27'),
(28, 'Geetha S', 'geetha28@example.com', '9000100280', 'Dharmapuri, TN', 'custpass28'),
(29, 'Ravi T', 'ravi29@example.com', '9000100290', 'Namakkal, TN', 'custpass29'),
(30, 'Lakshmi M', 'lakshmi30@example.com', '9000100300', 'Pudukottai, TN', 'custpass30');
select * from customer;
-- insert the values in the orders table
INSERT INTO orders (order_id, customer_id, order_date, total_amount, status) VALUES
(1, 1, '2024-05-01', 1200, 'Delivered'),
(2, 2, '2024-05-02', 1500, 'Pending'),
(3, 3, '2024-05-03', 950, 'Shipped'),
(4, 4, '2024-05-04', 780, 'Cancelled'),
(5, 5, '2024-05-05', 2100, 'Delivered'),
(6, 6, '2024-05-06', 3050, 'Processing'),
(7, 7, '2024-05-07', 1400, 'Delivered'),
(8, 8, '2024-05-08', 1950, 'Shipped'),
(9, 9, '2024-05-09', 880, 'Pending'),
(10, 10, '2024-05-10', 450, 'Delivered'),
(11, 11, '2024-05-11', 1350, 'Processing'),
(12, 12, '2024-05-12', 1670, 'Cancelled'),
(13, 13, '2024-05-13', 2200, 'Delivered'),
(14, 14, '2024-05-14', 1100, 'Pending'),
(15, 15, '2024-05-15', 980, 'Shipped'),
(16, 16, '2024-05-16', 1540, 'Delivered'),
(17, 17, '2024-05-17', 1320, 'Delivered'),
(18, 18, '2024-05-18', 1650, 'Processing'),
(19, 19, '2024-05-19', 1480, 'Pending'),
(20, 20, '2024-05-20', 2390, 'Shipped'),
(21, 21, '2024-05-21', 1890, 'Delivered'),
(22, 22, '2024-05-22', 1750, 'Cancelled'),
(23, 23, '2024-05-23', 920, 'Shipped'),
(24, 24, '2024-05-24', 1080, 'Processing'),
(25, 25, '2024-05-25', 990, 'Delivered'),
(26, 26, '2024-05-26', 1140, 'Pending'),
(27, 27, '2024-05-27', 1355, 'Delivered'),
(28, 28, '2024-05-28', 1000, 'Delivered'),
(29, 29, '2024-05-29', 2450, 'Shipped'),
(30, 30, '2024-05-30', 1590, 'Processing');
select * from orders;
-- inert te vlues in the order_iterm table
INSERT INTO Order_Item (order_item_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1, 5, 3, 400.00),
(2, 2, 12, 1, 1500.00),
(3, 3, 8, 2, 475.00),
(4, 4, 20, 4, 195.00),
(5, 5, 2, 6, 350.00),
(6, 6, 17, 5, 610.00),
(7, 7, 9, 2, 700.00),
(8, 8, 14, 3, 650.00),
(9, 9, 11, 1, 880.00),
(10, 10, 4, 2, 225.00),
(11, 11, 7, 3, 450.00),
(12, 12, 19, 2, 835.00),
(13, 13, 1, 5, 440.00),
(14, 14, 10, 2, 550.00),
(15, 15, 13, 1, 980.00),
(16, 16, 21, 4, 385.00),
(17, 17, 16, 3, 440.00),
(18, 18, 6, 2, 825.00),
(19, 19, 15, 1, 1480.00),
(20, 20, 3, 6, 398.00),
(21, 21, 25, 3, 630.00),
(22, 22, 18, 2, 875.00),
(23, 23, 22, 1, 920.00),
(24, 24, 23, 4, 270.00),
(25, 25, 26, 3, 330.00),
(26, 26, 28, 2, 570.00),
(27, 27, 30, 1, 1355.00),
(28, 28, 27, 2, 500.00),
(29, 29, 24, 5, 490.00),
(30, 30, 29, 3, 530.00);
select * from order_item;
-- insert the values in the payment table
INSERT INTO Payment (payment_id, order_id, payment_date, payment_method, payment_status) VALUES
(1, 1, '2024-05-01', 'Credit Card', 'Completed'),
(2, 2, '2024-05-02', 'Debit Card', 'Pending'),
(3, 3, '2024-05-03', 'Net Banking', 'Completed'),
(4, 4, '2024-05-04', 'UPI', 'Failed'),
(5, 5, '2024-05-05', 'Cash on Delivery', 'Completed'),
(6, 6, '2024-05-06', 'Credit Card', 'Processing'),
(7, 7, '2024-05-07', 'UPI', 'Completed'),
(8, 8, '2024-05-08', 'Net Banking', 'Completed'),
(9, 9, '2024-05-09', 'Debit Card', 'Pending'),
(10, 10, '2024-05-10', 'Credit Card', 'Completed'),
(11, 11, '2024-05-11', 'UPI', 'Processing'),
(12, 12, '2024-05-12', 'Cash on Delivery', 'Failed'),
(13, 13, '2024-05-13', 'Credit Card', 'Completed'),
(14, 14, '2024-05-14', 'Net Banking', 'Pending'),
(15, 15, '2024-05-15', 'UPI', 'Completed'),
(16, 16, '2024-05-16', 'Credit Card', 'Completed'),
(17, 17, '2024-05-17', 'Debit Card', 'Completed'),
(18, 18, '2024-05-18', 'UPI', 'Processing'),
(19, 19, '2024-05-19', 'Net Banking', 'Pending'),
(20, 20, '2024-05-20', 'Cash on Delivery', 'Completed'),
(21, 21, '2024-05-21', 'Credit Card', 'Completed'),
(22, 22, '2024-05-22', 'Debit Card', 'Failed'),
(23, 23, '2024-05-23', 'UPI', 'Completed'),
(24, 24, '2024-05-24', 'Net Banking', 'Processing'),
(25, 25, '2024-05-25', 'Credit Card', 'Completed'),
(26, 26, '2024-05-26', 'UPI', 'Pending'),
(27, 27, '2024-05-27', 'Debit Card', 'Completed'),
(28, 28, '2024-05-28', 'Cash on Delivery', 'Completed'),
(29, 29, '2024-05-29', 'Net Banking', 'Completed'),
(30, 30, '2024-05-30', 'UPI', 'Processing');
select * from payment;
-- insert the values in the review table
INSERT INTO Review (review_id, customer_id, product_id, rating, comment, review_date) VALUES
(1, 1, 5, 5, 'Excellent product, very fresh!', '2024-05-01'),
(2, 2, 12, 4, 'Good quality but a bit expensive.', '2024-05-02'),
(3, 3, 8, 3, 'Average, could be better.', '2024-05-03'),
(4, 4, 20, 1, 'Not as expected, very poor quality.', '2024-05-04'),
(5, 5, 2, 5, 'Great service and product quality!', '2024-05-05'),
(6, 6, 17, 2, 'Product quality was below average.', '2024-05-06'),
(7, 7, 9, 4, 'Good, but delivery was delayed.', '2024-05-07'),
(8, 8, 14, 5, 'Loved it, definitely worth the price!', '2024-05-08'),
(9, 9, 11, 3, 'Not bad, but I expected more.', '2024-05-09'),
(10, 10, 4, 4, 'Nice product, met my expectations.', '2024-05-10'),
(11, 11, 7, 5, 'Highly recommended, very fresh and tasty.', '2024-05-11'),
(12, 12, 19, 3, 'Average quality, but okay for the price.', '2024-05-12'),
(13, 13, 1, 5, 'Fantastic! Would buy again!', '2024-05-13'),
(14, 14, 10, 4, 'Good quality, but packaging can improve.', '2024-05-14'),
(15, 15, 13, 5, 'Very satisfied with the product quality!', '2024-05-15'),
(16, 16, 21, 2, 'Not as fresh as expected.', '2024-05-16'),
(17, 17, 16, 4, 'Good quality and fast delivery.', '2024-05-17'),
(18, 18, 6, 3, 'Okay, but I had higher expectations.', '2024-05-18'),
(19, 19, 15, 5, 'Perfect product, very happy with the purchase.', '2024-05-19'),
(20, 20, 3, 4, 'Very nice, but could use better packaging.', '2024-05-20'),
(21, 21, 25, 5, 'Fresh and tasty, would buy again.', '2024-05-21'),
(22, 22, 18, 2, 'Not up to the mark, very disappointed.', '2024-05-22'),
(23, 23, 22, 4, 'Good, but it took longer to arrive.', '2024-05-23'),
(24, 24, 23, 3, 'Decent product, but not great value for money.', '2024-05-24'),
(25, 25, 26, 5, 'Absolutely amazing, worth every penny.', '2024-05-25'),
(26, 26, 28, 4, 'Good product, but delivery took too long.', '2024-05-26'),
(27, 27, 30, 3, 'Not as expected, but still okay for the price.', '2024-05-27'),
(28, 28, 27, 4, 'Good quality, I am satisfied.', '2024-05-28'),
(29, 29, 24, 5, 'Excellent, would definitely recommend!', '2024-05-29'),
(30, 30, 29, 2, 'Poor quality, not worth the price.', '2024-05-30');
select * from review;
-- 1)create a view to display a summary of farmer sales:
-- This view will show each farmer’s total revenue and the number of products they have sold, sorted by revenue.
CREATE VIEW FarmerSalesSummary AS
SELECT f.farmer_id, f.Name AS FarmerName, SUM(oi.quantity * oi.unit_price) AS TotalRevenue, COUNT(DISTINCT oi.product_id) AS ProductsSold
FROM Farmer f
JOIN Product p ON f.farmer_id = p.farmer_id
JOIN Order_Item oi ON p.product_id = oi.product_id
GROUP BY f.farmer_id;
select * from FarmerSalesSummary;
-- 2)Create a view for customer order history:
-- This view will display the customer’s name, email, order ID, order date, and total amount for each order.
CREATE VIEW CustomerOrderHistory AS
SELECT c.customer_id, c.name AS CustomerName, c.email, o.order_id, o.order_date, o.total_amount
FROM Customer c
JOIN Orders o ON c.customer_id = o.customer_id;
select * from CustomerOrderHistory;


-- 1)Add Farmer Procedure
DELIMITER //
CREATE PROCEDURE AddFarmer(
	IN Farmerid int,
    IN farmer_name VARCHAR(100),
    IN farmer_phone VARCHAR(15),
    IN farmer_address VARCHAR(255),
    IN farmer_email VARCHAR(100),
    In farmer_password int)
BEGIN
    INSERT INTO Farmer VALUES(Farmerid,farmer_name, farmer_phone, farmer_address,farmer_email,farmer_password);
END//
DELIMITER ;
CALL AddFarmer(31,'John DoAddFarmere', '1234567890', '123 Main St','johndoe@example.com',43257654);
 
 
 -- 2)Update Order Status
 DELIMITER //
CREATE PROCEDURE UpdateOrderStatus(
    IN id INT,
    IN new_status VARCHAR(50)
)
BEGIN
    UPDATE Orders
    SET status = new_status
    WHERE order_id = id;
END//
DELIMITER ;
CALL UpdateOrderStatus(1, 'Shipped');
select * from orders;

-- 3)Add New Product
DELIMITER //
CREATE PROCEDURE AddProduct (
    IN p_id INT,
    IN farmerid INT,
    IN p_name VARCHAR(100),
    IN p_category VARCHAR(50),
    IN p_price DECIMAL(10, 2),
    IN p_quantity INT,
    IN p_description VARCHAR(20)
)
BEGIN
    INSERT INTO Product (product_id, farmer_id, product_name, category, price, quantity, description)
    VALUES (p_id, farmerid, p_name, p_category, p_price, p_quantity, p_description);
END //
DELIMITER ;
CALL AddProduct(35, 1, 'Cucumber', 'Vegetable', 20.00, 150, 'Fresh cucumbers');
select * from product;


-- 4)Update Quantity or Price of an Order Item.This stored procedure allows updating the quantity or unit price of an existing order item.
DELIMITER //
CREATE PROCEDURE UpdateOrderItem(
IN orderItemID INT, 
IN newQuantity INT, 
IN newUnitPrice DECIMAL(10, 2))
BEGIN
    UPDATE Order_Item
    SET quantity = newQuantity, unit_price = newUnitPrice
    WHERE order_item_id = orderItemID;
END //
DELIMITER ;
CALL UpdateOrderItem(1, 10, 120.00);
select * from order_item;

-- 5)Procedure to Remove an Item from an Order.This stored procedure removes an order item from an order.
DELIMITER //
CREATE PROCEDURE RemoveOrderItem(IN orderItemID INT)
BEGIN
    DELETE FROM Order_Item
    WHERE order_item_id = orderItemID;
END //
DELIMITER ;
CALL RemoveOrderItem(2);
select * from order_item;


-- 6)Stored Procedure to Add a New Customer.This stored procedure adds a new customer to the Customer table.
DELIMITER //

CREATE PROCEDURE AddCustomer(
    IN customerName VARCHAR(100),
    IN customerEmail VARCHAR(100),
    IN customerPhone VARCHAR(15),
    IN customerAddress TEXT,
    IN customerPassword VARCHAR(255)
)
BEGIN
    INSERT INTO Customer (name, email, phone, address, password)
    VALUES (customerName, customerEmail, customerPhone, customerAddress, customerPassword);
END //

DELIMITER ;
CALL AddCustomer('John Doe', 'john@example.com', '1234567890', '123 Main St', 'password123');
select * from customer;


-- 7)Stored Procedure to Check if an Email Already Exists.This stored procedure checks if a customer already exists with the provided email address.
DELIMITER //
CREATE PROCEDURE CheckCustomerEmailExistence(IN customerEmail VARCHAR(100))
BEGIN
    SELECT COUNT(*) AS email_exists
    FROM Customer
    WHERE email = customerEmail;
END //

DELIMITER ;
CALL CheckCustomerEmailExistence('john@example.com');


-- 8)Retrieve Reviews for a Product.This stored procedure retrieves all reviews for a specific product.
DELIMITER //

CREATE PROCEDURE GetReviewsByProduct(IN productID INT)
BEGIN
    SELECT review_id, customer_id, rating, comment, review_date
    FROM Review
    WHERE product_id = productID;
END //

DELIMITER ;
CALL GetReviewsByProduct(10);

-- 9)Stored Procedure to Add a Review.This stored procedure adds a new review for a product from a customer.
DELIMITER //

CREATE PROCEDURE AddReview(
    IN customerID INT,
    IN productID INT,
    IN rating INT,
    IN comment TEXT,
    IN reviewDate DATE
)
BEGIN
    INSERT INTO Review (customer_id, product_id, rating, comment, review_date)
    VALUES (customerID, productID, rating, comment, reviewDate);
END //

DELIMITER ;
CALL AddReview(1, 10, 5, 'Excellent product!', '2025-05-04');
select * from review;


-- 10)Get Order Item Details by Order Item ID.This stored procedure retrieves the details of an order item by its ID.
DELIMITER //

CREATE PROCEDURE GetOrderItemDetails(IN orderItemID INT)
BEGIN
    SELECT oi.order_item_id, oi.order_id, oi.product_id, oi.quantity, oi.unit_price,
           p.product_name
    FROM Order_Item oi
    JOIN Product p ON oi.product_id = p.product_id
    WHERE oi.order_item_id = orderItemID;
END //

DELIMITER ;
CALL GetOrderItemDetails(1);























 


























