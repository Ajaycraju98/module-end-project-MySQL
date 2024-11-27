-- Topic : Library Management System You are going to build a project based on Library Management System. 
-- It keeps track of all information about books in the library, their cost, status and total number of books available in the library. 
-- create a database named library and following TABLES in the database: 
CREATE DATABASE library;
USE library;
-- 1. Branch 2. Employee 3. Books 4. Customer 5. IssueStatus 6. ReturnStatus 
-- Attributes for the tables: 1. Branch Branch_no - Set as PRIMARY KEY, Manager_Id ,Branch_address ,Contact_no 
CREATE TABLE BRANCH (Branch_no INT PRIMARY KEY ,Manager_Id INT,Branch_address VARCHAR(50),Contact_no  VARCHAR(10));
INSERT INTO BRANCH (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES 
(1, 101, '123 street alappuzha', '1234567890'),
(2, 102, '456 kottayam', '9876543210'),
(3, 103, '789 kollam', '4567891234'),
(4, 104, '321 kozhikode', '3216549870'),
(5, 105, '654 malappuram', '7891234567'),
(6, 106, '231 madhurai, WA', '5647382910'),
(7, 107, '987 coimbatore', '6574839201'),
(8, 108, '741 delhi', '7483920165'),
(9, 109, '369 mysore', '8392016574'),
(10, 110, '852 hyderabad', '9102837465');

-- 2. Employee Emp_Id – Set as PRIMARY KEY, Emp_name ,Position ,Salary, Branch_no - Set as FOREIGN KEY and it refer Branch_no in Branch table
CREATE TABLE Employee(Emp_Id int primary key,Emp_name varchar(30) not null,Position varchar(30) not null,Salary int not null,Branch_no INT,
FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no));
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(1, 'John samuel', 'Branch Manager', 75000, 1),
(2, 'Alice Johnson', 'Assistant Manager', 60000, 1),
(3, 'Robert Brown', 'Sales Associate', 45000, 1),
(4, 'Ajay cr', 'Branch Manager', 80000, 2),
(5, 'jasim ali', 'Customer Support', 40000, 3),
(6, 'Sarath madhav', 'Branch Manager', 85000,1),
(7, 'James jacob', 'Accountant', 55000, 4),
(8, 'Arjun ashok', 'Teller', 42000,1),
(9, 'Aliana thomas', 'Clerk', 38000, 5),
(10,'Anju kurian','Sales associate',45000,1);
-- 3. Books ISBN - Set as PRIMARY KEY Book_title Category Rental_Price Status
-- Give yes if book available and no if book not available] Author Publisher
create table books (ISBN varchar(30) primary key, Book_title varchar (30),Category varchar(30) ,Rental_Price decimal(10,2),Status enum ('yes','no'),
Author varchar(30),publisher varchar(30));
INSERT INTO books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
('978-3-16-148410-0', 'The Alchemist', 'Fiction', 5.99, 'yes', 'Paulo Coelho', 'HarperCollins'),
('978-0-7432-7356-5', 'Angels & Demons', 'Thriller', 6.99, 'no', 'Dan Brown', 'Pocket Books'),
('978-1-56619-909-4', 'To Kill a Mockingbird', 'Classic', 4.99, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('978-0-06-112008-4', 'History 1984', 'Dystopian', 5.50, 'yes', 'George Orwell', 'Secker & Warburg'),
('978-1-250-08085-3', 'Becoming', 'Biography',30.00, 'no', 'Michelle Obama', 'Crown Publishing Group'),
('978-0-525-43487-2', 'Educated', 'Memoir', 7.50, 'yes', 'Tara Westover', 'Random House'),
('978-0-345-39180-3', 'The Shining', 'Horror', 6.75, 'no', 'Stephen King', 'Doubleday'),
('978-0-7434-8772-2', 'The Da Vinci Code', 'Thriller', 7.99, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-7432-7354-1', 'Inferno', 'Thriller', 26.00, 'no', 'Dan Brown', 'Doubleday'),
('978-0-375-50420-3', 'A Song of Ice and Fire', 'Fantasy', 10.00, 'yes', 'George R.R. Martin', 'Bantam Books');
-- 4. Customer Customer_Id - Set as PRIMARY KEY Customer_name Customer_address Reg_date 
create table customer(Customer_Id int PRIMARY KEY,Customer_name varchar(30),Customer_address varchar(50),Reg_date date );

-- Insert 10 rows into the Customer table 
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES 
(1, 'Andrew joseph', '23 malappuram', '2021-12-26'),
(2, 'Sophia paul', '88 coimbatore', '2023-12-01'),
(3, 'Benjamin jose', '19 Willow Ln, kottayam', '2024-01-03'),
(4, 'Olivia Scott', '45 street ,kollam', '2024-01-15'),
(5, 'Lucas Green', '72 Hillside Rd, idukki', '2024-02-25'),
(6, 'Arjun das', '9 Mountain villa,]kozhikode', '2024-03-12'),
(7, 'vishnu raj', '33 Palm St, kochi', '2024-04-08'),
(8, 'Grace antony', '67 Meadow Ln,trivandrum', '2024-05-19'),
(9, 'Henry yousuf', '51 Rose St,trissur', '2024-06-23'),
(10, 'Elizabeth kurian', '84 Valley Rd,idukki', '2024-07-30');


-- 5. IssueStatus Issue_Id - Set as PRIMARY KEY Issued_cust 
-- Set as FOREIGN KEY and it refer customer_id in CUSTOMER table Issued_book_name Issue_date Isbn_book 
-- Set as FOREIGN KEY and it should refer isbn in BOOKS table
create table issue_status( Issue_Id int PRIMARY KEY ,Issued_cust int,Issued_book_name  varchar(30), Issue_date date ,Isbn_book varchar(30),
FOREIGN KEY (Isbn_book) REFERENCES books(ISBN),FOREIGN KEY(issued_cust)REFERENCES customer(Customer_Id));
INSERT INTO issue_status (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES 
(1, 1, 'The Alchemist', '2023-06-10','978-3-16-148410-0'),
(2, 2, 'Angels & Demons', '2024-02-05', '978-0-7432-7356-5'),
(3, 3, 'To Kill a Mockingbird', '2024-02-15', '978-1-56619-909-4'),
(4, 4, '1984', '2024-03-01', '978-0-06-112008-4'),
(5, 5, 'Becoming', '2024-03-10', '978-1-250-08085-3'),
(6, 6, 'Educated', '2023-06-25', '978-0-525-43487-2'),
(7, 7, 'The Shining', '2024-04-05', '978-0-345-39180-3'),
(8, 8, 'The Da Vinci Code', '2024-04-18', '978-0-7434-8772-2'),
(9, 9, 'Inferno', '2024-05-01', '978-0-7432-7354-1'),
(10, 10, 'A Song of Ice and Fire', '2024-05-15', '978-0-375-50420-3');

-- 6. ReturnStatus Return_Id - Set as PRIMARY KEY Return_cust Return_book_name Return_date Isbn_book2 - 
-- Set as FOREIGN KEY and it should refer isbn in BOOKS table Display all the tables 
CREATE TABLE ReturnStatus (Return_Id  INT PRIMARY KEY,Return_cust  INT,Return_book_name VARCHAR(30),Return_date  DATE,Isbn_book2 VARCHAR(30),
FOREIGN KEY (Isbn_book2) REFERENCES books (ISBN),FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id));
-- Insert 10 rows into the ReturnStatus table
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES 
(1, 1, 'The Alchemist', '2024-02-10', '978-3-16-148410-0'),
(2, 2, 'Angels & Demons', '2024-03-01', '978-0-7432-7356-5'),
(3, 3, 'To Kill a Mockingbird', '2024-03-12', '978-1-56619-909-4'),
(4, 4, '1984', '2024-03-25', '978-0-06-112008-4'),
(5, 5, 'Becoming', '2024-04-05', '978-1-250-08085-3'),
(6, 6, 'Educated', '2024-04-15', '978-0-525-43487-2'),
(7, 7, 'The Shining', '2024-05-01', '978-0-345-39180-3'),
(8, 8, 'The Da Vinci Code', '2024-05-12', '978-0-7434-8772-2'),
(9, 9, 'Inferno', '2024-06-01', '978-0-7432-7354-1'),
(10, 10, 'A Song of Ice and Fire', '2024-06-20', '978-0-375-50420-3');

--  Write the queries for the following : 
# 1. Retrieve the book title, category, and rental price of all available books. 
SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'yes';

# 2. List the employee names and their respective salaries in descending order of salary. 
SELECT Emp_name, salary FROM employee ORDER BY salary DESC;

# 3. Retrieve the book titles and the corresponding customers who have issued those books. 
SELECT  b.Book_title,c.Customer_name  FROM books b
JOIN  issue_status i on b.Isbn=i.Isbn_book join customer c on i.issue_id=c.Customer_Id;

# 4. Display the total count of books in each category. 
SELECT Category, COUNT(*) AS Total_Books FROM books GROUP BY Category;

# 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
select Emp_name,Position from employee where salary>50000;

# 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
select Customer_name from customer where  Reg_date>='2022-01-01' and Customer_Id not in (select Issued_cust from issue_status);

# 7. Display the branch numbers and the total count of employees in each branch. 
SELECT Branch_no, COUNT(Emp_Id) AS Total_Employees FROM Employee GROUP BY Branch_no;

# 8. Display the names of customers who have issued books in the month of June 2023. 
select c.customer_name from customer c join issue_status i on c.customer_id=i.issued_cust
where month(issue_date)= 6 and year(issue_date)=2023;

# 9. Retrieve book_title from book table containing history. 
select Book_title from books where Book_title LIKE '%history%';
# 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees 
select Branch_no,count(Emp_Id)as total_employees from employee group by Branch_no having count(emp_id)>5;

# 11. Retrieve the names of employees who manage branches and their respective branch addresses. 
SELECT e.Emp_name, b.Branch_address
FROM Employee e
JOIN Branch b ON e.Emp_Id = b.Branch_no;

# 12. Display the names of customers who have issued books with a rental price higher than Rs. 25. 
SELECT c.Customer_name
FROM Customer c
JOIN issue_status i ON c.Customer_Id = i.Issued_cust
JOIN books b ON i.Isbn_book = b.ISBN
WHERE b.Rental_Price > 25;
