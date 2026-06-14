CREATE DATABASE IF NOT EXISTS human_aid_camps;
USE human_aid_camps;

CREATE TABLE Camp (
    camp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(150),
    population INT
);

CREATE TABLE Family (
    family_id INT AUTO_INCREMENT PRIMARY KEY,
    head_name VARCHAR(100) NOT NULL,
    number_of_members INT,
    notes TEXT
);

CREATE TABLE Beneficiary (
    beneficiary_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL,
    date_of_birth DATE,
    phone VARCHAR(20),
    address VARCHAR(200),
    camp_id INT,
    family_id INT,
    FOREIGN KEY (camp_id) REFERENCES Camp(camp_id),
    FOREIGN KEY (family_id) REFERENCES Family(family_id) );
    
    
CREATE TABLE Aid_Type (
    aid_type_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT
);


CREATE TABLE Aid_Provider (
    provider_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50),  
    contact_info TEXT
);

CREATE TABLE Campaign (
    campaign_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    description TEXT
);


CREATE TABLE Donation (
    donation_id INT AUTO_INCREMENT PRIMARY KEY,
    provider_id INT,
    campaign_id INT,
    amount DECIMAL(10,2),
    donation_date DATE,
    FOREIGN KEY (provider_id) REFERENCES Aid_Provider(provider_id),
    FOREIGN KEY (campaign_id) REFERENCES Campaign(campaign_id)
);

CREATE TABLE Inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    aid_type_id INT,
    quantity INT DEFAULT 0,
    last_updated DATE,
    notes TEXT,
    FOREIGN KEY (aid_type_id) REFERENCES Aid_Type(aid_type_id)
);



CREATE TABLE Staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100)
);


CREATE TABLE Distribution_Location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    notes TEXT
);


CREATE TABLE Aid_Distribution (
    distribution_id INT AUTO_INCREMENT PRIMARY KEY,
    beneficiary_id INT,
    aid_type_id INT,
    provider_id INT,
    staff_id INT,
    location_id INT,
    campaign_id INT,
    distribution_date DATE,
    quantity INT,
    FOREIGN KEY (beneficiary_id) REFERENCES Beneficiary(beneficiary_id),
    FOREIGN KEY (aid_type_id) REFERENCES Aid_Type(aid_type_id),
    FOREIGN KEY (provider_id) REFERENCES Aid_Provider(provider_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
    FOREIGN KEY (location_id) REFERENCES Distribution_Location(location_id),
    FOREIGN KEY (campaign_id) REFERENCES Campaign(campaign_id)
);

CREATE TABLE Feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    beneficiary_id INT,
    feedback_text TEXT,
    submission_date DATE,
    handled_by INT, 
    FOREIGN KEY (beneficiary_id) REFERENCES Beneficiary(beneficiary_id),
    FOREIGN KEY (handled_by) REFERENCES Staff(staff_id)
    
);



INSERT INTO Camp (camp_id, name, location, population) VALUES
 (1, 'Jalazone', 'Ramallah', 15000),
 (2, 'Al-Amari', 'Al-Bireh', 12000),
 (3, 'Balata', 'Nablus', 25000),
(4, 'Deheisheh', 'Bethlehem', 13000),
(5, 'Aida', 'Bethlehem', 10000);

INSERT INTO Family (family_id, head_name, number_of_members, notes) VALUES 
(1, 'Ahmad Saleh', 6, 'Needs urgent aid'),
(2, 'Ali Ibrahim', 4, 'Sick son'),
(3, 'Yousef Nasser', 7, 'Elderly in home'),
(4, 'abed Saeed', 5, 'No medical insurance'),
(5, 'Omar Khalil', 3, 'Student family');

INSERT INTO Beneficiary (beneficiary_id, full_name, gender, date_of_birth, phone, address, camp_id, family_id) VALUES 
(1, 'Hani Ahmad', 'Male', '1980-05-10', '0591234567', 'Sector A', 1, 1),
(2, 'Rania Ali', 'Female', '1990-08-15', '0591234568', 'Sector B', 2, 2),
(3, 'Sami Yousef', 'Male', '2000-12-01', '0591234569', 'Sector C', 3, 3),
(4, 'Layla abed', 'Female', '1985-03-25', '0591234570', 'Sector D', 4, 4),
(5, 'Khalid Omar', 'Male', '1975-11-20', '0591234571', 'Sector E', 5, 5);

INSERT INTO Aid_Type (aid_type_id, name, description) VALUES 
(1, 'Food', 'Basic food supplies'),
(2, 'Medicine', 'Essential medicines'),
(3, 'Cash', 'Cash support'),
(4, 'Clothes', 'Winter clothing'),
(5, 'School Supplies', 'Back-to-school materials');

INSERT INTO Aid_Provider (provider_id, name, type, contact_info) VALUES 
(1, 'Red Crescent', 'Local', 'info@palestinercs.org'),
(2, 'UNRWA', 'International', 'media@unrwa.org'),
(3, 'unknown', 'Local', 'someone@gmail.com'),
(4, 'HumanRelief', 'International', 'relief@human.org'),
(5, 'Gaza Aid Fund', 'Local', 'gazaaid@gaza.ps');

INSERT INTO Campaign (campaign_id, title, start_date, end_date, description) VALUES 
(1, 'Winter Relief', '2024-12-01', '2025-02-01', 'Distribution of blankets and heaters'),
(2, 'Back to School', '2025-08-01', '2025-09-01', 'Providing school supplies'),
(3, 'Ramadan Food Drive', '2026-02-17', '2026-03-02', 'Food parcels for fasting families'),
(4, 'Medical Aid 2026', '2026-01-10', '2026-03-30', 'Medicines and checkups');

select * from Campaign ;

INSERT INTO Donation (donation_id, provider_id, campaign_id, amount, donation_date) VALUES 
(1, 1, 1, 10000, '2024-11-15'),
(2, 2, 2, 5000, '2024-08-01'),
(3, 3, 3, 8000, '2025-02-15'),
(4, 4, 4, 15000, '2025-01-05')
;

INSERT INTO Inventory (inventory_id, aid_type_id, quantity, last_updated, notes) VALUES 
(1, 1, 1000, '2025-06-01', 'Food parcels available'),
(2, 2, 300, '2025-06-05', 'First aid kits'),
(3, 3, 150, '2025-05-28', 'Cash cards in storage'),
(4, 4, 500, '2025-06-02', 'Winter clothes ready'),
(5, 5, 800, '2025-06-03', 'School bags and supplies');

INSERT INTO Staff (staff_id, name, role, phone, email) VALUES 
(1, 'Nour Khalil', 'Coordinator', '0599100200', 'nour@aid.org'),
(2, 'Tariq Zayed', 'Data Entry', '0599100300', 'tariq@aid.org'),
(3, 'Salma Odeh', 'Field Officer', '0599100400', 'salma@aid.org'),
(4, 'Omar Shweiki', 'Distribution Lead', '0599100500', 'omar@aid.org'),
(5, 'Lina Hassan', 'Complaint Handler', '0599100600', 'lina@aid.org');

INSERT INTO Distribution_Location (location_id, name, address, notes) VALUES 
(1, 'Main Center - Jalazone', 'Near school gate', 'Crowded on weekends'),
(2, 'Balata Youth Center', 'Opposite clinic', 'Limited space'),
(3, 'Al-Amari Warehouse', 'East end of camp', 'Cold storage available'),
(4, 'Deheisheh Hall', 'Next to mosque', 'Large hall, indoor'),
(5, 'Aida Distribution Point', 'Camp entrance', 'Shared with local NGO');

INSERT INTO Aid_Distribution (distribution_id, beneficiary_id, aid_type_id, provider_id, staff_id, location_id, campaign_id, distribution_date, quantity) VALUES 
(1, 1, 1, 1, 1, 1, 1, '2025-01-05', 2),
(2, 2, 2, 2, 2, 2, 2, '2024-09-01', 1),
(3, 3, 3, 3, 3, 3, 3, '2025-03-15', 1),
(4, 4, 4, 4, 4, 4, 4, '2025-01-20', 3)
;


INSERT INTO Feedback (feedback_id, beneficiary_id, feedback_text, submission_date, handled_by) VALUES 
(1, 1, 'Received spoiled food', '2025-01-10', 5),
(2, 2, 'Did not receive medicine', '2025-09-02', 5),
(3, 3, 'Distribution was late', '2025-03-16', 4),
(4, 4, 'Staff was very helpful', '2025-01-25', 1),
(5, 5, 'Need more school kits', '2025-03-01', 2);















