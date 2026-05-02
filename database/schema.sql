

CREATE DATABASE PharmacySystem;

USE  PharmacySystem;

create table Inventory(

Inventory_ID  varchar(10) Primary key,
Manager_Name char(100) default null,
Manager_ID  varchar(14) unique Not Null ,
Location varchar(100) default null,
Manager_contact varchar(15) default null
);

create table Medication (

Medication_ID varchar(10) Primary key,
Medicine_name varchar(100) not null,
Price Decimal(10,2) ,
Manufacture varchar(100) default null,
Dosage_form varchar(100) ,
Storage_condition varchar(100)  default 'Room Temperature',
Exp_date  Date default null
);

 create table Medical_Devices (
 Device_ID varchar(10) Primary key,
 Device_Name varchar(100)  not null,
 Price Decimal(10,2) default null,
 Type varchar(100) default null,
 Manufacture varchar(100) default null
 
 );
 
 
 create table Pharmacists (
 Pharmacist_ID  varchar(10) Primary Key,
 Pharmacist_Name varchar(100),
 Experience   varchar(10),
 Email varchar(50)  default null,
 Qualification varchar(100) default 'Graduate',
 Shift varchar(50) default null,
 Phone_number varchar(15)
 
 );
 
 create table Transaction (
 Transaction_ID varchar(10) Primary Key,
 Payment_Method varchar(15),
 Transaction_Date Date,
 Discount Decimal(10,2),
 Status varchar(10)
 
 );
 
 

 
 create table Patient (
 
 Patient_ID  varchar (10) Primary Key,
 Patient_name  varchar(100) not null,
 Contact varchar(15) default null,
 DOB  Date ,
 Address  varchar (150) default null,
 Medical_insurance varchar(100)  default 'No'
 
 );
 create table Prescription (
 Prescription_ID varchar(10) primary key,
 Physician_Name  varchar(100) default null,
 Dosage_Instruction varchar(100) default null,
 Duration varchar(100) default null,
 Date date,
 Patient_ID varchar (10) not null,
 
 foreign Key (Patient_ID)  References Patient(Patient_ID)
 on update cascade on delete cascade
 
 );
 
 
 create table SaleReceipt (
 Sales_ID varchar(10) Primary Key,
 SalesFeedback varchar(100)  default null,
 sold_date  Date,
 Total_item int default 0,
 Total_Price Decimal(10,2),
 Pharmacist_ID varchar (10) not null,
 Transaction_ID varchar(10) not null,
 Prescription_ID varchar(10) not null,
 foreign Key (Pharmacist_ID)  References Pharmacists(Pharmacist_ID)
 on update cascade on delete cascade,
 foreign Key (Transaction_ID)  References Transaction(Transaction_ID)
 on update cascade on delete cascade,
 foreign Key (Prescription_ID)  References Prescription(Prescription_ID)
 on update cascade on delete cascade

 );

create table Inventory_Store (
Store_ID  varchar(10) primary key,
Exp_date Date,
Recieved_Date  Date,
Medication_ID varchar(10) not null,
Device_ID   varchar(10) not Null,
Inventory_ID varchar(10) not null,

foreign Key (Medication_ID)  References Medication(Medication_ID)
on update cascade on delete cascade,
foreign Key (Device_ID)  References Medical_Devices(Device_ID)
on update cascade on delete cascade,
foreign Key (Inventory_ID)  References Inventory(Inventory_ID)
on update cascade on delete cascade

);

Create table Receipt (
Receipt_ID  varchar(10) Primary key,
Medication_ID varchar (10) not null,
Device_ID varchar (10) not null,
Sales_ID varchar(10) not null,

foreign Key (Medication_ID)  References Medication(Medication_ID)
on update cascade on delete cascade,
foreign Key (Device_ID)  References Medical_Devices(Device_ID)
on update cascade on delete cascade,
foreign Key (sales_ID)  References SaleReceipt(Sales_ID)
on update cascade on delete cascade

);

create table Precripe_Medication (

Medication_ID varchar (10) not null,
Prescription_ID varchar(10) not null,

foreign Key (Prescription_ID)  References Prescription(Prescription_ID)
 on update cascade on delete cascade,
foreign Key (Medication_ID)  References Medication(Medication_ID)
on update cascade on delete cascade

);


-- Insert data into Inventory table
INSERT INTO Inventory (Inventory_ID, Manager_Name, Manager_ID, Location, Manager_contact)
VALUES 
('INV003', 'Ali Khan', 'MGR001', 'Karachi', 1234567890),
('INV004', 'Sara Ahmed', 'MGR002', 'Lahore', 1234567891),
('INV005', 'Zain Khan', 'MGR003', 'Islamabad', 1234567892),
('INV006', 'Sana Riaz', 'MGR004', 'Peshawar', 1234567893),
('INV007', 'Usman Tariq', 'MGR005', 'Quetta', 1234567894);

-- Insert data into Medication table
INSERT INTO Medication (Medication_ID, Medicine_name, Price, Manufacture, Dosage_form, Storage_condition, Exp_date)
VALUES 
('MED003', 'Paracetamol', 50.00, 'Getz Pharma', 'Tablet', 'Room Temperature', '2025-12-31'),
('MED004', 'Amoxicillin', 120.00, 'Searle Company', 'Capsule', 'Refrigerated', '2024-06-30'),
('MED005', 'Ibuprofen', 70.00, 'PharmEvo', 'Tablet', 'Room Temperature', '2025-11-30'),
('MED006', 'Cetirizine', 90.00, 'Getz Pharma', 'Tablet', 'Room Temperature', '2025-10-31'),
('MED007', 'Azithromycin', 200.00, 'Pfizer', 'Capsule', 'Room Temperature', '2024-08-15');

-- Insert data into Medical_Devices table
INSERT INTO Medical_Devices (Device_ID, Device_Name, Price, Type, Manufacture)
VALUES 
('DEV003', 'Blood Pressure Monitor', 3000.00, 'Digital', 'Omron'),
('DEV004', 'Glucose Meter', 2500.00, 'Digital', 'Accu-Chek'),
('DEV005', 'Thermometer', 500.00, 'Digital', 'Braun'),
('DEV006', 'Pulse Oximeter', 1500.00, 'Digital', 'Beurer'),
('DEV007', 'Nebulizer', 4000.00, 'Electric', 'Philips');

-- Insert data into Pharmacists table
INSERT INTO Pharmacists (Pharmacist_ID, Pharmacist_Name, Experience, Email, Qualification, Shift, Phone_number)
VALUES 
('PHA003', 'Asim Raza', '5 years', 'asim.raza@example.com', 'Pharm.D', 'Morning', 3216599870),
('PHA004', 'Nida Sheikh', '3 years', 'nida.sheikh@example.com', 'Pharm.D', 'Evening', 3216549871),
('PHA005', 'Ahmed Faraz', '2 years', 'ahmed.faraz@example.com', 'Pharm.D', 'Night', 3216549872),
('PHA006', 'Sarah Ali', '4 years', 'sarah.ali@example.com', 'Pharm.D', 'Morning', 3216549873),
('PHA007', 'Usman Malik', '6 years', 'usman.malik@example.com', 'Pharm.D', 'Evening', 3216549874);

-- Insert data into Transaction table
INSERT INTO Transaction (Transaction_ID, Payment_Method, Transaction_Date, Discount, Status)
VALUES 
('TRN003', 'Cash', '2024-06-25', 5.00, 'Completed'),
('TRN004', 'Credit Card', '2024-06-26', 0.00, 'Pending'),
('TRN005', 'Debit Card', '2024-06-27', 2.00, 'Completed'),
('TRN006', 'Cash', '2024-06-28', 0.00, 'Completed'),
('TRN007', 'Online Payment', '2024-06-29', 3.00, 'Pending');


-- Insert data into Patient table
INSERT INTO Patient (Patient_ID, Patient_name, Contact, DOB, Address, Medical_insurance)
VALUES 
('PAT003', 'Hassan Ali', 9876543210, '1990-01-01', '123 Street, Karachi', 'Yes'),
('PAT004', 'Maira Khan', 9876543211, '1985-05-12', '456 Avenue, Lahore', 'No'),
('PAT005', 'Ayesha Ahmed', 9876543212, '1992-03-15', '789 Boulevard, Islamabad', 'Yes'),
('PAT006', 'Shoaib Akhtar', 9876543213, '1988-07-21', '101 Road, Peshawar', 'No'),
('PAT007', 'Naveed Abbas', 9876543214, '1995-09-10', '202 Lane, Quetta', 'Yes');

-- Insert data into Prescription table
INSERT INTO Prescription (Prescription_ID, Physician_Name, Dosage_Instruction, Duration, Date, Patient_ID)
VALUES 
('PRC003', 'Dr. Ahmed Ali', 'Take one tablet daily', '7 days', '2024-06-25', 'PAT003'),
('PRC004', 'Dr. Sarah Khan', 'Take two capsules daily', '10 days', '2024-06-26', 'PAT004'),
('PRC005', 'Dr. Ali Raza', 'Apply ointment twice daily', '5 days', '2024-06-27', 'PAT005'),
('PRC006', 'Dr. Imran Ali', 'Take one tablet twice daily', '14 days', '2024-06-28', 'PAT006'),
('PRC007', 'Dr. Nadia Sheikh', 'Inhale once daily', '30 days', '2024-06-29', 'PAT007');

-- Insert data into SaleReceipt table
INSERT INTO SaleReceipt (Sales_ID, SalesFeedback, sold_date, Total_item, Total_Price, Pharmacist_ID, Transaction_ID, Prescription_ID)
VALUES 
('SAL003', 'Good service', '2024-06-25', 2, 170.00, 'PHA003', 'TRN003', 'PRC003'),
('SAL004', 'Quick delivery', '2024-06-26', 1, 120.00, 'PHA004', 'TRN004', 'PRC004'),
('SAL005', 'Excellent care', '2024-06-27', 3, 190.00, 'PHA005', 'TRN005', 'PRC005'),
('SAL006', 'Friendly staff', '2024-06-28', 2, 210.00, 'PHA006', 'TRN006', 'PRC006'),
('SAL007', 'Fast service', '2024-06-29', 4, 250.00, 'PHA007', 'TRN007', 'PRC007');

-- Insert data into Inventory_Store table
INSERT INTO Inventory_Store (Store_ID, Exp_date, Recieved_Date, Medication_ID, Device_ID, Inventory_ID)
VALUES 
('STR003', '2025-12-31', '2024-06-01', 'MED003', 'DEV003', 'INV003'),
('STR004', '2024-06-30', '2024-06-10', 'MED004', 'DEV004', 'INV004'),
('STR005', '2025-11-30', '2024-06-15', 'MED005', 'DEV005', 'INV005'),
('STR006', '2025-10-31', '2024-06-20', 'MED006', 'DEV006', 'INV006'),
('STR007', '2024-08-15', '2024-06-25', 'MED007', 'DEV007', 'INV007');

-- Insert data into Receipt table
INSERT INTO Receipt (Receipt_ID, Medication_ID, Device_ID, Sales_ID)
VALUES 
('RCT003', 'MED003', 'DEV003', 'SAL003'),
('RCT004', 'MED004', 'DEV004', 'SAL004'),
('RCT005', 'MED005', 'DEV005', 'SAL005'),
('RCT006', 'MED006', 'DEV006', 'SAL006'),
('RCT007', 'MED007', 'DEV007', 'SAL007');

-- Insert data into Precripe_Medication table
INSERT INTO Precripe_Medication (Medication_ID, Prescription_ID)
VALUES 
('MED003', 'PRC003'),
('MED004', 'PRC004'),
('MED005', 'PRC005'),
('MED006', 'PRC006'),
('MED007', 'PRC007');

select * from Inventory;
select * from Medication;
select * from Medical_Devices;
select * from Pharmacists;
select * from Transaction;
select * from Patient;
select * from Prescription;
select * from SaleReceipt;
select * from Inventory_Store;
select * from Receipt;
select * from Precripe_Medication;