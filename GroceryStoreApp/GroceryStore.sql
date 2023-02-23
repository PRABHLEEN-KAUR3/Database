-- ************** GROCERY STORE APP DATABASE SYSTEM *****************

------------------- Table CUSTOMERS ------------------------
-- #1
CREATE TABLE customers_MS2 (
cust_UserId int NOT NULL PRIMARY KEY,
cust_CardNumber int NOT NULL,
cust_Name varchar(50) NOT NULL,
cust_LastName varchar(50) NOT NULL,
cust_FirstName varchar(50) NOT NULL,
cust_Phone  varchar(50) NOT NULL,
cust_address varchar(50) NOT NULL,
cust_city  varchar(50) NOT NULL,
cust_postalCode varchar(50) DEFAULT NULL,
cust_state varchar(50) DEFAULT NULL,
cust_country varchar(50) NOT NULL
);

INSERT ALL
 INTO customers_MS2 VALUES (100, 234567, 'Rohan Das', 'Das', 'Rohan', 987654321, 'dundas street', 'Toronto', 66777, 'Ontario', 'Canada')
 INTO customers_MS2 VALUES (101, 134527, 'Diksha Sharma', 'Sharma', 'Diksha', 874358785, '249 Kingsleigh Court', 'Milton', 'L9T1X6', 'Ontario', 'Canada')
 INTO customers_MS2 VALUES (102, 456789, 'Yuzi Singh', 'Chahal', 'Yuzvendra', 757876856, 'Dojima', 'Kita-ku',  5300003, 'Osaka', 'Japan')
 INTO customers_MS2 VALUES (103, 234567, 'Virat Kohli', 'Das', 'Rohan', 789654345, '8489 Strong St.', 'Las Vegas', 83030, 'NV', 'USA')
 INTO customers_MS2 VALUES (104, 428742, 'Salman Khan', 'Khan', 'Abdul',597574565, 'Alessandro Volta 16', 'Milan', NULL, NULL, 'Itlay')
 INTO customers_MS2 VALUES (105, 456789, 'Nicholas Jerry Jonas', 'Jonas', 'Nick', 987456376, 'Railway street', 'Vaughan', 98874, 'Ontario', 'Canada')
 INTO customers_MS2 VALUES (106, 234567, 'Amrinder Singh', 'Gill', 'Amrinder', 123478967, 'Cambrett drive', 'Vancouver', NULL, 'British Columbia', 'Canada')
 INTO customers_MS2 VALUES (107, 134527, 'Mahesh Babu', 'Babu', 'Ghattamaneni', 698675559, 'boulevard Charonne', 'Paris', 75012, NULL, 'France')
 INTO customers_MS2 VALUES (108, 345678, 'Komal Pandey', 'Kumari', 'Komal', 234567898, 'Airport Ave', 'NYC', 10022, 'NY', 'USA')
 INTO customers_MS2 VALUES (109, 456789, 'Anirudh Sharma', 'Sharma', 'Ani', 876534567, '31 Duncan St.', 'Brisbane', 4101, 'Queensland', 'Australia')
SELECT * FROM dual;


------------------------- Table ORDERS --------------------------------
-- #2
CREATE TABLE orders_MS2 (
ord_orderNumber int NOT NULL PRIMARY KEY,
cust_UserId int NOT NULL,
ord_orderDate DATE NOT NULL,
ord_requiredDate DATE NOT NULL,
ord_shippedDate DATE DEFAULT NULL,
ord_orderStatus  varchar(15) NOT NULL,
CONSTRAINT orders_fk FOREIGN KEY (cust_UserId) REFERENCES customers_MS2 (cust_UserId)
);

INSERT ALL
 INTO orders_MS2 VALUES (789, 102, '2021-07-12', '2021-07-25', '2021-07-18','Shipped')
 INTO orders_MS2 VALUES (437, 101, '2021-04-23', '2021-04-25', '2021-04-18','Shipped')
 INTO orders_MS2 VALUES (346, 109, '2021-06-04', '2021-06-10', '2021-06-07','Shipped')
 INTO orders_MS2 VALUES (878, 107, '2021-02-19', '2021-02-24', '2021-02-22','Resolved')
 INTO orders_MS2 VALUES (890, 103, '2021-08-09', '2021-08-25', '2021-08-18','Shipped')
 INTO orders_MS2 VALUES (122, 106, '2021-12-11', '2021-12-16', '2021-12-14','Cancelled')
 INTO orders_MS2 VALUES (567, 105, '2021-03-28', '2021-04-25', '2021-04-18','Shipped')
 INTO orders_MS2 VALUES (343, 107, '2021-04-14', '2021-04-19', '2021-04-17','Shipped')
 INTO orders_MS2 VALUES (345, 103, '2021-11-30', '2021-12-05', NULL,'Cancelled')
 INTO orders_MS2 VALUES (987, 102, '2021-10-18', '2021-10-23', NULL,'Cancelled')
SELECT * FROM dual;

------------------------- Table ORDERDETAILS  ------------------------------------
-- #3
CREATE TABLE orderDetails_MS2 (
ord_orderNumber int NOT NULL,
ordDls_productCode varchar(15) NOT NULL,
ordDls_quantityOrdered int NOT NULL,
ordDls_priceEachItem decimal(10,2) NOT NULL,
ordDls_orderLineNumber int NOT NULL,
CONSTRAINT orderDetails_fk FOREIGN KEY (ord_orderNumber) REFERENCES orders_MS2 (ord_orderNumber)
);

INSERT ALL
 INTO orderDetails_MS2 VALUES (890, 'SV_12', 56, 67.90, 11)
 INTO orderDetails_MS2 VALUES (987, 'RX_89', 23, 71.21, 3)
 INTO orderDetails_MS2 VALUES (345, 'SV_24', 12, 89.34, 7)
 INTO orderDetails_MS2 VALUES (789, 'BH_12', 62, 112.56, 17)
 INTO orderDetails_MS2 VALUES (890, 'SV_13', 32, 43.79, 11)
 INTO orderDetails_MS2 VALUES (987, 'RX_45', 15, 31.89, 2)
 INTO orderDetails_MS2 VALUES (122, 'AF_67', 11, 78.20, 14)
 INTO orderDetails_MS2 VALUES (345, 'SV_12', 31, 67.36, 9)
 INTO orderDetails_MS2 VALUES (122, 'AF_67', 19, 56.45, 19)
 INTO orderDetails_MS2 VALUES (987, 'RX_45', 34, 119.7, 5)
SELECT * FROM dual;

--------------------------------------------------------------------------------------------

----------------------- Table PRODUCTLINE ---------------------------------------
-- #4
CREATE TABLE productLine_MS2 (
pLine_productLine varchar(50) NOT NULL PRIMARY KEY,
pLine_textDescription varchar(2000) DEFAULT NULL,
pLine_htmlDescription varchar(2000),
pLine_image varchar(200)
);

INSERT ALL
 INTO productLine_MS2 VALUES ('Herbs and Spices', 'ingredients that make your food that extra bit delicious', null, null)
 INTO productLine_MS2 VALUES ('Snacks', 'aromatic flavorings from seeds, fruits, bark, rhizomes, and other plant parts', null, null)
 INTO productLine_MS2 VALUES ('Frozen', 'keep for a lot longer, quite convenient and save time when cooking if you�ve bought some chopped varieties', null, null)
 INTO productLine_MS2 VALUES ('Non-Veg', 'majority in human diet', null, null)
 INTO productLine_MS2 VALUES ('Beverages', 'Meal replacement shakes, along with a balanced diet and exercises helps in weight-loss', null, null)
 INTO productLine_MS2 VALUES ('Pulses', 'essential protein into your system', null, null)
 INTO productLine_MS2 VALUES ('Fruits and Vegetables', 'great source of vitamins and fiber that will help you be healthy and maintain an effective immune system', null, null)
 INTO productLine_MS2 VALUES ('Grains And Breads', 'great meal essential that will fill you up and bulk out your meal', null, null)
 INTO productLine_MS2 VALUES ('Dairy and Eggs', ' breakfast essential,versatile little things add a great standard in your health', null, null)
 INTO productLine_MS2 VALUES ('Tinned and Dry Nuts', 'great for filling and healthy snacks', null, null)
SELECT * FROM dual;
 
--------------------- Table PRODUCTS ----------------------------------
-- #5
CREATE TABLE products_MS2 (
ordDls_productCode varchar(15) NOT NULL PRIMARY KEY,
pLine_productLine varchar(50) NOT NULL,
prod_productName varchar(70) NOT NULL,
prod_quantityInStock int NOT NULL,
prod_productScale varchar(10) NOT NULL,
prod_productDescription varchar(1000) NOT NULL,
prod_buyPrice decimal(10,2) NOT NULL,
prod_MSRP decimal(10,2) NOT NULL,
CONSTRAINT products_fk FOREIGN KEY (pLine_productLine) REFERENCES productLine_MS2 (pLine_productLine)
);

 

INSERT ALL
 INTO products_MS2 VALUES ('SV_12', 'Grains And Breads', 'All-purpose Flour', 900, '1:19', 'core ingredient for a cake, use it as a sauce thickener, or coat meat and other ingredients to give them a crispy finish when frying', 77.27, 145.89)
 INTO products_MS2 VALUES ('SV_24', 'Grains And Breads', 'Rice', 1000, '1:19', ' another great meal essential that will fill you up and bulk out your meal', 59.27, 99.89)
 INTO products_MS2 VALUES ('RX_72', 'Dairy and Eggs', 'Eggs', 4535, '1:19', 'ingredient for cake, pancake, bread and you may have it in breakfast or lunch', 18.90, 37.67)
 INTO products_MS2 VALUES ('RX_89', 'Dairy and Eggs', 'Cheese', 7865, '1:19', 'sandwich filler or for an ingredient in cheesy side-dishes or main courses', 10.29, 23.43)
 INTO products_MS2 VALUES ('SV_13', 'Herbs and Spices', 'Pepper', 900, '1:21', 'staple for adding flavor to your food', 21.78, 45.89)
 INTO products_MS2 VALUES ('BH_12', 'Beverages', 'Grapefruit juice', 355, '1:21', 'rich in vitamin C and ranges from sweet-tart to very sour.', 65.90, 89.99)
 INTO products_MS2 VALUES ('SV_67', 'Fruits and Vegetables', 'Cauliflower', 6776, '1:17', 'best to mix as many different colors as possible, as each color of vegetable usually contains different essential vitamins.', 20.27, 115.89)
 INTO products_MS2 VALUES ('UT_12', 'Frozen', 'Buffalo Chicken Frozen Melt', 324, '1:13', 'frozen loses little to no nutrients compared to fresh produce', 87.99, 117.49)
 INTO products_MS2 VALUES ('AF_67', 'Tinned and Dry Nuts', 'Soup', 900, '1:21', 'Tinned soup tends to contain nutrients', 19.27, 32.45)
 INTO products_MS2 VALUES ('RX_45', 'Dairy and Eggs', 'Yogurt', 2435, '1:19', ' mix with fruit or honey for a quick tasty dessert', 23.27, 45.89)
SELECT * FROM dual;

ALTER TABLE orderDetails_MS2
ADD CONSTRAINT ordDetails_fk FOREIGN KEY (ordDls_productCode) REFERENCES products_MS2 (ordDls_productCode);

--------------------------------------------------------------------------------------------

--------------------  Table BILLS ---------------------
-- #6
CREATE TABLE Bills_MS2(
BillNumber varchar(50) NOT NULL PRIMARY KEY,
cust_UserId int NOT NULL,
ord_orderNumber int NOT NULL, 
BillStatus varchar(15) NOT NULL,
BillDate DATE NOT NULL,
CONSTRAINT bills_fk FOREIGN KEY (cust_UserId) REFERENCES customers_MS2 (cust_UserId),
CONSTRAINT bill_fk FOREIGN KEY (ord_orderNumber) REFERENCES orders_MS2 (ord_orderNumber)
);

INSERT ALL
 INTO Bills_MS2 VALUES ('MA765515', 100, 890, 'Paid', '2021-07-09')
 INTO Bills_MS2 VALUES ('OM314933', 104, 437, 'Paid', '2021-06-19')
 INTO Bills_MS2 VALUES ('HR86578', 107, 343, 'Pending', '2021-03-29')
 INTO Bills_MS2 VALUES ('CL442705', 108, 345, 'Paid', '2021-07-27')
 INTO Bills_MS2 VALUES ('ED39322', 100, 122, 'Paid', '2021-01-06')
 INTO Bills_MS2 VALUES ('NU627706', 103, 890, 'OverDue', '2021-11-24')
 INTO Bills_MS2 VALUES ('AU364101', 107, 437, 'Returned', '2021-10-10')
 INTO Bills_MS2 VALUES ('DM826140', 100, 346, 'Paid', '2021-07-17')
 INTO Bills_MS2 VALUES ('MA724562', 108, 987, 'Cancelled', '2021-12-09')
 INTO Bills_MS2 VALUES ('RX53415', 109, 789, 'Paid', '2021-06-21')
SELECT * FROM dual;


-------------------------- Table PAYMENTS -----------------------------------
-- #7
CREATE TABLE payments_MS2 (
cust_CardNumber int NOT NULL PRIMARY KEY,
BillNumber varchar(50) NOT NULL,
paymentDate DATE NOT NULL,
Amount decimal(10,2) NOT NULL,
TotalTax decimal(10,2) NOT NULL,
CONSTRAINT payments_MS2 FOREIGN KEY (BillNumber) REFERENCES Bills_MS2 (BillNumber)
);

INSERT ALL
 INTO payments_MS2 VALUES (234567, 'MA765515', '2021-04-23', 43.56, 12.20) 
 INTO payments_MS2 VALUES (123456, 'HR86578', '2021-07-29', 78.90, 10.89) 
 INTO payments_MS2 VALUES (456789, 'MA724562', '2021-09-30', 112.67, 17.01) 
 INTO payments_MS2 VALUES (646742, 'MA765515', '2021-02-19', 67.34, 13.89) 
 INTO payments_MS2 VALUES (428742, 'AU364101', '2021-05-12', 128.56, 23.99) 
 INTO payments_MS2 VALUES (219383, 'DM826140', '2021-11-06', 90.87, 5.09) 
 INTO payments_MS2 VALUES (134527, 'HR86578', '2021-10-31', 34.41, 12.10) 
 INTO payments_MS2 VALUES (978388, 'AU364101', '2021-05-12', 23.04, 10.13) 
 INTO payments_MS2 VALUES (988665, 'MA765515', '2021-09-21', 89.70, 9.90) 
 INTO payments_MS2 VALUES (345678, 'DM826140', '2021-12-27', 57.14, 7.67) 
SELECT * FROM dual;

-- #1 
ALTER TABLE customers_MS2
ADD CONSTRAINT customers_fk FOREIGN KEY (cust_CardNumber) REFERENCES payments_MS2 (cust_CardNumber);
 
 



















