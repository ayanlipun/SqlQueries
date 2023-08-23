--CREATE SCHEMA sales;
--GO

--CREATE TABLE sales.stores (
--	store_id INT IDENTITY (1, 1) PRIMARY KEY,
--	store_name VARCHAR (255) NOT NULL,
--	phone VARCHAR (25),
--	email VARCHAR (255),
--	street VARCHAR (255),
--	city VARCHAR (255),
--	state VARCHAR (10),
--	zip_code VARCHAR (5)
--);

--CREATE TABLE sales.staffs (
--	staff_id INT IDENTITY (1, 1) PRIMARY KEY,
--	first_name VARCHAR (50) NOT NULL,
--	last_name VARCHAR (50) NOT NULL,
--	email VARCHAR (255) NOT NULL UNIQUE,
--	phone VARCHAR (25),
--	active tinyint NOT NULL,
--	store_id INT NOT NULL,
--	manager_id INT,
--	FOREIGN KEY (store_id) 
--        REFERENCES sales.stores (store_id) 
--        ON DELETE CASCADE ON UPDATE CASCADE,
--	FOREIGN KEY (manager_id) 
--        REFERENCES sales.staffs (staff_id) 
--        ON DELETE NO ACTION ON UPDATE NO ACTION
--);


--CREATE SCHEMA production;
--GO


--CREATE TABLE production.categories (
--	category_id INT IDENTITY (1, 1) PRIMARY KEY,
--	category_name VARCHAR (255) NOT NULL
--);

--CREATE TABLE production.brands (
--	brand_id INT IDENTITY (1, 1) PRIMARY KEY,
--	brand_name VARCHAR (255) NOT NULL
--);

--CREATE TABLE production.products (
--	product_id INT IDENTITY (1, 1) PRIMARY KEY,
--	product_name VARCHAR (255) NOT NULL,
--	brand_id INT NOT NULL,
--	category_id INT NOT NULL,
--	model_year SMALLINT NOT NULL,
--	list_price DECIMAL (10, 2) NOT NULL,
--	FOREIGN KEY (category_id) 
--        REFERENCES production.categories (category_id) 
--        ON DELETE CASCADE ON UPDATE CASCADE,
--	FOREIGN KEY (brand_id) 
--        REFERENCES production.brands (brand_id) 
--        ON DELETE CASCADE ON UPDATE CASCADE
--);

--CREATE TABLE sales.customers (
--	customer_id INT IDENTITY (1, 1) PRIMARY KEY,
--	first_name VARCHAR (255) NOT NULL,
--	last_name VARCHAR (255) NOT NULL,
--	phone VARCHAR (25),
--	email VARCHAR (255) NOT NULL,
--	street VARCHAR (255),
--	city VARCHAR (50),
--	state VARCHAR (25),
--	zip_code VARCHAR (5)
--);

--CREATE TABLE sales.orders (
--	order_id INT IDENTITY (1, 1) PRIMARY KEY,
--	customer_id INT,
--	order_status tinyint NOT NULL,
--	-- Order status: 1 = Pending; 2 = Processing; 3 = Rejected; 4 = Completed
--	order_date DATE NOT NULL,
--	required_date DATE NOT NULL,
--	shipped_date DATE,
--	store_id INT NOT NULL,
--	staff_id INT NOT NULL,
--	FOREIGN KEY (customer_id) 
--        REFERENCES sales.customers (customer_id) 
--        ON DELETE CASCADE ON UPDATE CASCADE,
--	FOREIGN KEY (store_id) 
--        REFERENCES sales.stores (store_id) 
--        ON DELETE CASCADE ON UPDATE CASCADE,
--	FOREIGN KEY (staff_id) 
--        REFERENCES sales.staffs (staff_id) 
--        ON DELETE NO ACTION ON UPDATE NO ACTION
--);

--CREATE TABLE sales.order_items(
--	order_id INT,
--	item_id INT,
--	product_id INT NOT NULL,
--	quantity INT NOT NULL,
--	list_price DECIMAL (10, 2) NOT NULL,
--	discount DECIMAL (4, 2) NOT NULL DEFAULT 0,
--	PRIMARY KEY (order_id, item_id),
--	FOREIGN KEY (order_id) 
--        REFERENCES sales.orders (order_id) 
--        ON DELETE CASCADE ON UPDATE CASCADE,
--	FOREIGN KEY (product_id) 
--        REFERENCES production.products (product_id) 
--        ON DELETE CASCADE ON UPDATE CASCADE
--);

--CREATE TABLE production.stocks (
--	store_id INT,
--	product_id INT,
--	quantity INT,    
--	PRIMARY KEY (store_id, product_id),
--	FOREIGN KEY (store_id) 
--        REFERENCES sales.stores (store_id) 
--        ON DELETE CASCADE ON UPDATE CASCADE,
--	FOREIGN KEY (product_id) 
--        REFERENCES production.products (product_id) 
--        ON DELETE CASCADE ON UPDATE CASCADE
--);

--RANK(), DENSE_RANK(), ROW_NUMBER() diffrence

--CREATE TABLE RankEmployees (
--  id integer,
--  first_name varchar(20),
--  last_name varchar(20),
--  position varchar(20),
--  salary varchar(20)
--)

--INSERT INTO RankEmployees VALUES 
--(1, 'Andrew', 'Brown', 'Manager', 100000),
--(2, 'Maria', 'Johnson', 'Manager', 105000),
--(3, 'John', 'Anderson', 'Senior Manager', 130000),
--(4, 'Alex', 'Purple', 'Associate', 50000),
--(5, 'George', 'Bull', 'Senior Associate', 65000),
--(6, 'Jess', 'Fridman', 'Associate', 48000),
--(7, 'Marion', 'White', 'Senior Associate', 65000),
--(8, 'Andreea', 'Berton', 'Manager', 102000),
--(9, 'Bob', 'Johanson', 'Associate', 45000),
--(10, 'Georgia', 'Hoffman', 'Senior Associate', 66000),
--(11, 'Johan', 'Peterson', 'Senior Associate', 58000);

/*Creating sample table Employee

CREATE TABLE Employee
(
[ID] INT identity(1,1),
[FirstName] Varchar(100),
[LastName] Varchar(100),
[Country] Varchar(100),
)
GO
Insert into Employee ([FirstName],[LastName],[Country] )values('Raj','Gupta','India'),
('Raj','Gupta','India'),
('Mohan','Kumar','USA'),
('James','Barry','UK'),
('James','Barry','UK'),
('James','Barry','UK')
*/


/*
Creaeting tavble for between operation test

CREATE TABLE EmpBetweeExample(
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Country VARCHAR(50),
    Age int,
    Salary int
);
-- Insert some sample data into the Customers table
INSERT INTO EmpBetweeExample (EmpID, Name,Country, Age, Salary)
VALUES (1, 'Shubham',  'India','23','30000'),
       (2, 'Aman ',  'Australia','21','45000'),
       (3, 'Naveen', 'Sri lanka','24','40000'),
       (4, 'Aditya',  'Austria','21','35000'),
       (5, 'Nishant', 'Spain','22','25000'); 

*/
 
/*
--  Created for Union test

CREATE TABLE Old_EmployeeUnion
(  
Employee_Id INT NOT NULL,   
Employee_Name Varchar (40),  
Emp_Age INT,  
Emp_Salary INT  
);

INSERT INTO Old_EmployeeUnion(Employee_Name,Emp_Age, Emp_Salary) values
(1,'Akh', 28, 25000),  
(2,'Abh', 27, 26000),  
('Sor', 26, 29000),  
('Abh', 27, 26000),  
('Rit', 26, 29000),  
('Yas', 29, 28000)  

CREATE TABLE New_EmployeeUnion
(  
Employee_Id INT NOT NULL,   
Employee_Name Varchar (400),  
Emp_Age INT,  
Emp_Salary INT  
); 

INSERT INTO New_EmployeeUnion (Employee_Id, Employee_Name, Emp_Age, Emp_Salary) VALUES (201, Jack, 28, 45000),  
(202, 'Berry', 29, 35000),  
(105, 'Ritik', 26, 29000),  
(203, 'Shyam', 27, 26000),  
(204, 'Ritika', 28, 38000),  
(106, 'Yash', 29, 28000);

*/


/* 
-- Created for merge test
    
CREATE TABLE SourceProducts(
    ProductID		INT,
    ProductName		VARCHAR(50),
    Price			DECIMAL(9,2)
)
GO
    
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(1,'Table',100)
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(2,'Desk',80)
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(3,'Chair',50)
INSERT INTO SourceProducts(ProductID,ProductName, Price) VALUES(4,'Computer',300)
GO
    
CREATE TABLE TargetProducts(
    ProductID		INT,
    ProductName		VARCHAR(50),
    Price			DECIMAL(9,2)
)
GO
    
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(1,'Table',100)
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(2,'Desk',180)
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(5,'Bed',50)
INSERT INTO TargetProducts(ProductID,ProductName, Price) VALUES(6,'Cupboard',300)
GO
    
    
SELECT * FROM SourceProducts
SELECT * FROM TargetProducts


*/