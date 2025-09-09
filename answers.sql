-- Usign the information on the table provided without creating a new database or using an old one.

-- Question 1: Write an SQL query to transform this table into 1NF
CREATE TABLE customer(
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(20) NOT NULL
);

CREATE TABLE product(
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(20) NOT NULL
);

CREATE TABLE orders(
    id INT PRIMARY KEY AUTO_INCREMENT,
    customerID INT,
    productID INT,
    FOREIGN KEY (customerID) REFERENCES customer(id),
    FOREIGN KEY (productID) REFERENCES product(id)
);


/* Question 2: Write an SQL query to transform the given table into 2NF 
    by removing partial dependencies */
CREATE TABLE customer(
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(20) NOT NULL
);

CREATE TABLE orderDetails(
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(20) NOT NULL,
    quantity INT,
    customerID INT,
    FOREIGN KEY (customerID) REFERENCES customer(id)
);

/* NOTE: I can achieve 2NF by creating table for only customer, but prodcut will still depend on 
"orderID". I think in order to totally get rid of partial dependency, both custmer and product need 
to have their own table */