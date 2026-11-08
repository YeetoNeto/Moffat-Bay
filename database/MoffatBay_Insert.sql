
-- Moffat Bay Lodge
-- Sample Database Records

USE moffat_bay;

-- Users
INSERT INTO Users (account_id, username, password)
VALUES
(1, 'johnsmith', 'sample_hash_001'),
(2, 'janedoe', 'sample_hash_002'),
(3, 'mikejohnson', 'sample_hash_003');

-- Account Information
INSERT INTO Account_Information
(account_id, date_of_birth, email, address_line_2,
 address_line_1, city, state, zip_code, country,
 first_name, last_name)
VALUES
(1, '1990-05-15', 'john@example.com', NULL,
 '123 Main St', 'Omaha', 'Nebraska', '68102',
 'USA', 'John', 'Smith'),

(2, '1988-08-22', 'jane@example.com', NULL,
 '456 Oak Ave', 'Lincoln', 'Nebraska', '68508',
 'USA', 'Jane', 'Doe'),

(3, '1995-03-10', 'mike@example.com', 'Apt 2',
 '789 Pine Rd', 'Denver', 'Colorado', '80202',
 'USA', 'Mike', 'Johnson');

-- Room Types
INSERT INTO Room_Types
(room_type_id, room_type_name, description,
 nightly_rate, max_guests)
VALUES
(1, 'Single', 'Room with one bed', 100.00, 2),
(2, 'Double', 'Room with two beds', 150.00, 4),
(3, 'Suite', 'Large suite with living area', 250.00, 6);

-- Reservations
INSERT INTO Reservations
(reservation_id, account_id, room_type_id,
 check_in_date, check_out_date, number_of_guests,
 reservation_status, total_price)
VALUES
(1, 1, 1, '2027-06-10', '2027-06-12',
 2, 'Confirmed', 200.00),

(2, 2, 2, '2027-07-15', '2027-07-18',
 4, 'Confirmed', 450.00),

(3, 3, 3, '2027-08-01', '2027-08-05',
 5, 'Pending', 1000.00);
