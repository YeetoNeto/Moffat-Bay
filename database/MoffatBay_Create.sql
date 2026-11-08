
-- Moffat Bay Lodge
-- Database Development Assignment
-- Creates the database and tables

CREATE DATABASE IF NOT EXISTS moffat_bay;

USE moffat_bay;

-- Users table
CREATE TABLE Users (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(32),
    password VARCHAR(255)
);

-- Account Information table
CREATE TABLE Account_Information (
    account_id INT PRIMARY KEY,
    date_of_birth DATE,
    email VARCHAR(254),
    address_line_2 VARCHAR(255),
    address_line_1 VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    zip_code VARCHAR(15),
    country VARCHAR(100),
    first_name VARCHAR(50),
    last_name VARCHAR(100),
    FOREIGN KEY (account_id)
        REFERENCES Users(account_id)
);

-- Room Types table
CREATE TABLE Room_Types (
    room_type_id INT PRIMARY KEY AUTO_INCREMENT,
    room_type_name VARCHAR(50),
    description VARCHAR(255),
    nightly_rate DECIMAL(10,2),
    max_guests INT
);

-- Reservations table
CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT,
    room_type_id INT,
    check_in_date DATE,
    check_out_date DATE,
    number_of_guests INT,
    reservation_status VARCHAR(20),
    total_price DECIMAL(10,2),
    FOREIGN KEY (account_id)
        REFERENCES Users(account_id),
    FOREIGN KEY (room_type_id)
        REFERENCES Room_Types(room_type_id)
);
