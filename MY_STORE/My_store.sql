
use my_store;
create table department( department_id int primary key auto_increment, 
department_name varchar(200) Not null);
insert into department(department_name)
values ("Clothing"), 
("Makeup"), 
("Skincare");


select * from department;

#Table 2

create table products( product_id int primary key auto_increment, 
product_name varchar(200), 
price Decimal(10,2) NOT NULL, 
stock_quantity int not null, 
department_id int, 
foreign key(department_id) references department(department_id));
INSERT INTO products (product_name, price, stock_quantity, department_id)
VALUES 
("Linen Shirt", 800, 50, 1), 
("Formal Pants", 1000, 25, 1), 
("Basic Vest", 700, 30, 1), 
("Blazer", 2000, 15, 1), 
("Basic cord set", 1000, 100, 1), 
("Eye Shadow", 800, 50, 2), 
("Lip Liner", 500, 80, 2), 
("Blush", 900, 20, 2), 
("Lip tint", 1000, 30, 2), 
("Face Wash", 1000, 50, 3), 
("Moisturizer", 1000, 30, 3), 
("Sun Block", 1500, 100, 3);

select * from products;

#Table 3
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    position VARCHAR(50),
    salary DECIMAL(10,2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);
INSERT INTO Employees (first_name, last_name, position, salary, department_id)
VALUES
('Deepika', 'Chand', 'Owner', 0, NULL),           -- Owner doesn’t belong to a single department
('Employee1', 'Shrestha', 'Manager', 2000, 1),    -- Clothing department
('Employee2', 'Koirala', 'Sales', 1500, 1),       -- Clothing
('Employee3', 'Rana', 'Manager', 2000, 2),        -- Makeup
('Employee4', 'Thapa', 'Sales', 1500, 2),         -- Makeup
('Employee5', 'Gurung', 'Warehouse', 1800, 3);    -- Skincare

select * from Employees;

#Table 4
Create table Customers ( Customer_id int primary key auto_increment, 
first_name varchar(50) not null, 
last_name varchar(50) not null, 
email varchar(50) unique, 
phone varchar(50), 
address varchar(200));
insert into Customers (first_name, last_name, email, phone, address)
values ("Roshani", "Chand", "roshani@gmail.com", "9988", "Dhangadhi"), 
("Niketa", "Chand", "niketa@gmail.com", "4455", "Attariya"), 
("Priya", "Chand", "priya@gmail.com", "7788", "Mohanpur"), 
("Kajol", "Chand", "kajol@gmail.com", "3344", "Lalitput"), 
("Dipika", "Chand", "dipika@gmail.com", "2233", "Patan"), 
("Dikshya", "Pandeya", "dikshya@gmail,com", "9900", "Matidevi"), 
("Menuka", "Deuba", "menuka@gmail.com", "5566", "baneshwor"), 
("Anjal", "Chand", "anjal@gmail.com", "6677", "nainadevi");

select * from Customers;

#Table 5 
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(1, '2025-08-01', 800),
(2, '2025-08-01', 1000),
(3, '2025-08-02', 700),
(4, '2025-08-02', 2000),
(5, '2025-08-03', 1000),
(1, '2025-08-03', 800),
(2, '2025-08-04', 500),
(3, '2025-08-04', 900),
(4, '2025-08-05', 1000),
(5, '2025-08-05', 1500),
(1, '2025-08-06', 800),
(2, '2025-08-06', 1000),
(3, '2025-08-07', 700),
(4, '2025-08-07', 2000),
(5, '2025-08-08', 1000),
(1, '2025-08-08', 800),
(2, '2025-08-09', 500),
(3, '2025-08-09', 900),
(4, '2025-08-10', 1000),
(5, '2025-08-10', 1500),
(1, '2025-08-11', 800),
(2, '2025-08-11', 1000),
(3, '2025-08-12', 700),
(4, '2025-08-12', 2000),
(5, '2025-08-13', 1000),
(1, '2025-08-13', 800),
(2, '2025-08-14', 500),
(3, '2025-08-14', 900),
(4, '2025-08-15', 1000),
(5, '2025-08-15', 1500),
(1, '2025-08-16', 800),
(2, '2025-08-16', 1000),
(3, '2025-08-17', 700),
(4, '2025-08-17', 2000),
(5, '2025-08-18', 1000),
(1, '2025-08-18', 800),
(2, '2025-08-19', 500),
(3, '2025-08-19', 900),
(4, '2025-08-20', 1000),
(5, '2025-08-20', 1500),
(1, '2025-08-21', 800),
(2, '2025-08-21', 1000),
(3, '2025-08-22', 700),
(4, '2025-08-22', 2000),
(5, '2025-08-23', 1000),
(1, '2025-08-23', 800),
(2, '2025-08-24', 500),
(3, '2025-08-24', 900),
(4, '2025-08-25', 1000),
(5, '2025-08-25', 1500);

select * from Orders;

#Table 7
CREATE TABLE Order_Details (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
INSERT INTO Order_Details (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 800),
(2, 5, 1, 1000),
(3, 3, 1, 700),
(4, 2, 1, 2000),
(5, 6, 1, 1000),
(6, 1, 1, 800),
(7, 7, 1, 500),
(8, 8, 1, 900),
(9, 9, 1, 1000),
(10, 12, 1, 1500),
(11, 2, 1, 2000),
(12, 4, 1, 1000),
(13, 3, 1, 700),
(14, 1, 1, 800),
(15, 5, 1, 1000),
(16, 6, 1, 1000),
(17, 7, 1, 500),
(18, 8, 1, 900),
(19, 9, 1, 1000),
(20, 12, 1, 1500),
(21, 1, 1, 800),
(22, 5, 1, 1000),
(23, 3, 1, 700),
(24, 2, 1, 2000),
(25, 6, 1, 1000),
(26, 1, 1, 800),
(27, 7, 1, 500),
(28, 8, 1, 900),
(29, 9, 1, 1000),
(30, 12, 1, 1500),
(31, 2, 1, 2000),
(32, 4, 1, 1000),
(33, 3, 1, 700),
(34, 1, 1, 800),
(35, 5, 1, 1000),
(36, 6, 1, 1000),
(37, 7, 1, 500),
(38, 8, 1, 900),
(39, 9, 1, 1000),
(40, 12, 1, 1500),
(41, 1, 1, 800),
(42, 5, 1, 1000),
(43, 3, 1, 700),
(44, 2, 1, 2000),
(45, 6, 1, 1000),
(46, 1, 1, 800),
(47, 7, 1, 500),
(48, 8, 1, 900),
(49, 9, 1, 1000),
(50, 12, 1, 1500);

select * from Order_Details;
