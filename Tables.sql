-- create student table
create table students (
    studentid int primary key,
    firstname varchar(50),
    lastname varchar(50),
    city varchar(30),
    dateofbirth date,
    gender varchar(10),
    email varchar(100),
    phone varchar(15)
);

-- create course table
create table course (
    courseid int primary key,
    coursetitle varchar(100),
    credits int
);

-- create instructor table
create table instructor (
    instructorid int primary key,
    firstname varchar(50),
    lastname varchar(50),
    email varchar(100)
);


-- create enrollment table
create table enrollment (
    enrollmentid int primary key,
    enrollmentdate date,
    studentid int,
    courseid int,
    instructorid int,
    foreign key (studentid) references student(studentid),
    foreign key (courseid) references course(courseid),
    foreign key (instructorid) references instructor(instructorid)
);

-- create score table
create table score (
    scoreid int primary key,
    courseid int,
    studentid int,
    dateofexam date,
    creditobtained decimal(5,2),
    foreign key (courseid) references course(courseid),
    foreign key (studentid) references student(studentid)
);

-- create feedback table
create table feedback (
    feedbackid int primary key,
    studentid int,
    date date,
    instructorname varchar(100),
    feedback text,
    foreign key (studentid) references student(studentid)
);

-- create customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(30),
    city VARCHAR(30),
    join_date date,
    phone_number VARCHAR(100) 
);

-- create orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2), 
    quantity float,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2),
    supplier_id INT,
    stock_quantity FLOAT,
    product_category VARCHAR(30)
);

-- create OrderItems table
CREATE TABLE orderitems (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price_per_unit decimal(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


