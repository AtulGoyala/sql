Show databases;
use banking_management_system;
Create database Banking_Management_System;
-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Address VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(50)
);

-- Create the AccountTypes table
CREATE TABLE AccountTypes (
    AccountTypeID INT PRIMARY KEY AUTO_INCREMENT,
    AccountTypeName VARCHAR(50) NOT NULL
);

-- Create the Branch table
CREATE TABLE Branch (
    BranchID INT PRIMARY KEY AUTO_INCREMENT,
    BranchName VARCHAR(50) NOT NULL,
    BranchAddress VARCHAR(100),
    BranchCity VARCHAR(50),
    BranchState VARCHAR(50),
    BranchZipCode VARCHAR(10),
    BranchPhoneNumber VARCHAR(15)
);

-- Create the Accounts table
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY AUTO_INCREMENT,
    AccountNumber VARCHAR(20) UNIQUE NOT NULL,
    CustomerID INT,
    AccountTypeID INT,
    BranchID INT,
    Balance DECIMAL(15, 2) NOT NULL DEFAULT 0,
    DateOpened DATE NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (AccountTypeID) REFERENCES AccountTypes(AccountTypeID),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

-- Create the Transactions table
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    AccountID INT,
    TransactionType VARCHAR(20) NOT NULL,
    TransactionAmount DECIMAL(15, 2) NOT NULL,
    TransactionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

-- Insert initial data into AccountTypes table
INSERT INTO AccountTypes (AccountTypeName) VALUES
('Savings'),
('Checking'),
('Business'),
('Loan');

-- Insert initial data into Branch table
INSERT INTO Branch (BranchName, BranchAddress, BranchCity, BranchState, BranchZipCode, BranchPhoneNumber) VALUES
('Main Branch', '123 Main St', 'Anytown', 'Anystate', '12345', '555-1234'),
('West Branch', '456 West St', 'Westtown', 'Weststate', '67890', '555-5678');

-- Example queries

-- Create a new customer
INSERT INTO Customers (FirstName, LastName, Address, City, State, ZipCode, PhoneNumber, Email) VALUES
('John', 'Doe', '789 Elm St', 'Anytown', 'Anystate', '12345', '555-7890', 'johndoe@example.com');

-- Create a new account for the customer
INSERT INTO Accounts (AccountNumber, CustomerID, AccountTypeID, BranchID, Balance, DateOpened) VALUES
('1234567890', 1, 1, 1, 1000.00, '2024-06-19');

-- Record a transaction for the account
INSERT INTO Transactions (AccountID, TransactionType, TransactionAmount) VALUES
(1, 'Deposit', 500.00);

-- Retrieve all customers
SELECT * FROM Customers;

-- Retrieve all accounts for a specific customer
SELECT * FROM Accounts WHERE CustomerID = 1;

-- Retrieve all transactions for a specific account
SELECT * FROM Transactions WHERE AccountID = 1;
