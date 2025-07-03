# DATASET Structure
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(100),
    signup_date DATE
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Customers (customer_id, name, email, city, signup_date) VALUES
(1, 'Alice Smith', 'alice@example.com', 'New York', '2024-01-10'),
(2, 'Bob Johnson', 'bob@example.com', 'Los Angeles', '2024-02-15'),
(3, 'Carol White', 'carol@example.com', 'Chicago', '2024-03-01'),
(4, 'David Lee', 'david@example.com', 'Houston', '2024-01-25');

INSERT INTO Products (product_id, product_name, category, price) VALUES
(1, 'Wireless Mouse', 'Electronics', 25.99),
(2, 'Bluetooth Speaker', 'Electronics', 49.99),
(3, 'Notebook', 'Stationery', 2.50),
(4, 'Pen Pack', 'Stationery', 5.00),
(5, 'Water Bottle', 'Accessories', 15.00);

INSERT INTO Orders (order_id, customer_id, order_date, total_amount) VALUES
(101, 1, '2024-02-01', 75.98),
(102, 2, '2024-02-05', 20.00),
(103, 3, '2024-03-10', 54.99),
(104, 1, '2024-04-15', 7.50),
(105, 4, '2024-04-20', 30.00);

INSERT INTO OrderDetails (order_detail_id, order_id, product_id, quantity) VALUES
(1, 101, 1, 2),
(2, 102, 4, 4),
(3, 103, 2, 1),
(4, 104, 3, 3),
(5, 105, 5, 2);

