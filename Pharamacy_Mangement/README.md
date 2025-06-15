# PHARMACY SYSTEM DATABASE

## Project Overview

This project presents the design and implementation of a database system for a Pharmacy. The database aims to efficiently manage various aspects of a pharmacy, including inventory, medication details, medical devices, staff (pharmacists), patient information, transactions, prescriptions, and sales. It facilitates the storage and retrieval of critical data, supporting the daily operations of a pharmacy.

## Literature Work

This section is not available in the provided document for the Pharmacy System Database.

## ER Diagram and Relation Between Entities

The database schema is designed with several interconnected tables to ensure data integrity and efficient management. The primary entities are described below, along with their relationships.

### Information of Entities

In total, there are eleven entities in this database:

1.  **Inventory**: Stores information about the pharmacy's stock management. Attributes include a unique Inventory ID (primary key), Manager Name, unique Manager ID, Location, and Manager contact number.
2.  **Medication**: Contains detailed information about different medicines. Attributes include a unique Medication ID (primary key), Medicine name, Price, Manufacture, Dosage form, Storage condition, and Expiration date.
3.  **Medical_Devices**: Stores information about medical equipment available in the pharmacy. Attributes include a unique Device ID (primary key), Device Name, Price, Type, and Manufacture.
4.  **Pharmacists**: Records details about the pharmacy staff. Attributes include a unique Pharmacist ID (primary key), Pharmacist Name, Experience, Email, Qualification, Shift, and Phone number.
5.  **Transaction**: Tracks details of financial transactions. Attributes include a unique Transaction ID (primary key), Payment Method, Transaction Date, Discount applied, and transaction Status.
6.  **Patient**: Stores demographic and contact information for patients. Attributes include a unique Patient ID (primary key), Patient name, Contact number, Date of Birth (DOB), Address, and Medical insurance status.
7.  **Prescription**: Records details of prescriptions issued. Attributes include a unique Prescription ID (primary key), Physician Name, Dosage Instruction, Duration of medication, Date of prescription, and a foreign key linking to the `Patient` table.
8.  **SaleReceipt**: Manages information related to sales. Attributes include a unique Sales ID (primary key), Sales Feedback, Sold Date, Total number of items, Total Price, and foreign keys linking to `Pharmacists`, `Transaction`, and `Prescription` tables.
9.  **Inventory_Store**: This linking table connects inventory records with specific medications and medical devices, indicating their storage details. Attributes include a unique Store ID (primary key), Expiration Date, Received Date, and foreign keys linking to `Medication`, `Medical_Devices`, and `Inventory` tables.
10. **Receipt**: Details the items included in a specific sales receipt. Attributes include a unique Receipt ID (primary key), and foreign keys linking to `Medication`, `Medical_Devices`, and `SaleReceipt` tables.
11. **Precripe_Medication**: This is a junction table handling the many-to-many relationship between prescriptions and medications. Its primary key consists of foreign keys linking to `Medication` and `Prescription` tables.

### Relationship Between Entities

The relationships between the entities in the Pharmacy System Database are established through foreign keys, ensuring data integrity:

1.  **Patient and Prescription**: One-to-many relationship. A single patient can have multiple prescriptions, but each prescription is associated with only one patient.
2.  **Pharmacists and SaleReceipt**: One-to-many relationship. One pharmacist can be involved in multiple sales receipts, but each sale receipt is handled by one pharmacist.
3.  **Transaction and SaleReceipt**: One-to-many relationship. One transaction can be linked to multiple sales receipts, but each sale receipt corresponds to one transaction.
4.  **Prescription and SaleReceipt**: One-to-many relationship. One prescription can be included in multiple sales receipts, but each sales receipt links to one prescription.
5.  **Inventory and Inventory_Store**: One-to-many relationship. One inventory record can manage items across multiple stores, but each `Inventory_Store` record belongs to one inventory.
6.  **Medication and Inventory_Store**: One-to-many relationship. One medication can be present in multiple inventory store records, but each `Inventory_Store` record tracks one medication.
7.  **Medical_Devices and Inventory_Store**: One-to-many relationship. One medical device can be present in multiple inventory store records, but each `Inventory_Store` record tracks one device.
8.  **Medication and Receipt**: One-to-many relationship. One medication can appear on multiple receipts, but each receipt item refers to one medication.
9.  **Medical_Devices and Receipt**: One-to-many relationship. One medical device can appear on multiple receipts, but each receipt item refers to one device.
10. **SaleReceipt and Receipt**: One-to-many relationship. One sales receipt can contain multiple individual items (`Receipt` records), but each receipt item belongs to one sales receipt.
11. **Prescription and Medication (via Precripe_Medication)**: Many-to-many relationship. A prescription can include multiple medications, and a medication can be part of multiple prescriptions. This is resolved by the `Precripe_Medication` junction table.

## Relational Schemas

The following tables represent the relational schemas for the Pharmacy System Database:

### Inventory Table

| Attribute Name | Description | Type |
| :------------- | :---------- | :--- |
| Inventory\_ID | Unique ID for inventory | varchar(10) |
| Manager\_Name | Name of the inventory manager | char(100) |
| Manager\_ID | Unique ID of the inventory manager | varchar(14) |
| Location | Physical location of the inventory | varchar(100) |
| Manager\_contact | Contact number of the manager | varchar(15) |

### Medication Table

| Attribute Name | Description | Type |
| :------------- | :---------- | :--- |
| Medication\_ID | Unique ID for the medication | varchar(10) |
| Medicine\_name | Name of the medicine | varchar(100) |
| Price | Price of the medication | Decimal(10,2) |
| Manufacture | Manufacturer of the medication | varchar(100) |
| Dosage\_form | Form of dosage (e.g., Tablet, Capsule) | varchar(100) |
| Storage\_condition | Required storage conditions | varchar(100) |
| Exp\_date | Expiration date of the medication | Date |

### Medical_Devices Table

| Attribute Name | Description | Type |
| :------------- | :---------- | :--- |
| Device\_ID | Unique ID for the medical device | varchar(10) |
| Device\_Name | Name of the medical device | varchar(100) |
| Price | Price of the device | Decimal(10,2) |
| Type | Type of the device | varchar(100) |
| Manufacture | Manufacturer of the device | varchar(100) |

### Pharmacists Table

| Attribute Name | Description | Type |
| :------------- | :---------- | :--- |
| Pharmacist\_ID | Unique ID for the pharmacist | varchar(10) |
| Pharmacist\_Name | Name of the pharmacist | varchar(100) |
| Experience | Years of experience of the pharmacist | varchar(10) |
| Email | Email address of the pharmacist | varchar(50) |
| Qualification | Qualification of the pharmacist | varchar(100) |
| Shift | Working shift of the pharmacist | varchar(50) |
| Phone\_number | Phone number of the pharmacist | varchar(15) |

### Transaction Table

| Attribute Name | Description | Type |
| :------------- | :---------- | :--- |
| Transaction\_ID | Unique ID for the transaction | varchar(10) |
| Payment\_Method | Method of payment | varchar(15) |
| Transaction\_Date | Date of the transaction | Date |
| Discount | Discount applied to the transaction | Decimal(10,2) |
| Status | Status of the transaction | varchar(10) |

### Patient Table

| Attribute Name | Description | Type |
| :------------- | :---------- | :--- |
| Patient\_ID | Unique ID for the patient | varchar(10) |
| Patient\_name | Name of the patient | varchar(100) |
| Contact | Contact number of the patient | varchar(15) |
| DOB | Date of birth of the patient | Date |
| Address | Address of the patient | varchar(150) |
| Medical\_insurance | Medical insurance status ('Yes'/'No') | varchar(100) |

### Prescription Table

| Attribute Name | Description | Type |
| :------------- | :---------- | :--- |
| Prescription\_ID | Unique ID for the prescription | varchar(10) |
| Physician\_Name | Name of the prescribing physician | varchar(100) |
| Dosage\_Instruction | Instructions for dosage | varchar(100) |
| Duration | Duration of the prescription | varchar(100) |
| Date | Date the prescription was issued | Date |
| Patient\_ID | Foreign key referencing `Patient` table | varchar(10) |

The `Patient_ID` from the `Patient` table is used as a foreign key due to its one-to-many relationship with the `Prescription` table.

### SaleReceipt Table

| Attribute Name | Description | Type |
| :------------- | :---------- | :--- |
| Sales\_ID | Unique ID for the sales receipt | varchar(10) |
| SalesFeedback | Customer feedback for the sale | varchar(100) |
| sold\_date | Date the items were sold | Date |
| Total\_item | Total number of items sold | int |
| Total\_Price | Total price of the sale | Decimal(10,2) |
| Pharmacist\_ID | Foreign key referencing `Pharmacists` table | varchar(10) |
| Transaction\_ID | Foreign key referencing `Transaction` table | varchar(10) |
| Prescription\_ID | Foreign key referencing `Prescription` table | varchar(10) |

The `Pharmacist_ID`, `Transaction_ID`, and `Prescription_ID` are used as foreign keys due to their one-to-many relationships with the `SaleReceipt` table.

### Inventory_Store Table

| Attribute Name | Description | Type |
| :------------- | :---------- | :--- |
| Store\_ID | Unique ID for the inventory store record | varchar(10) |
| Exp\_date | Expiration date of the item in store | Date |
| Recieved\_Date | Date the item was received into inventory | Date |
| Medication\_ID | Foreign key referencing `Medication` table | varchar(10) |
| Device\_ID | Foreign key referencing `Medical_Devices` table | varchar(10) |
| Inventory\_ID | Foreign key referencing `Inventory` table | varchar(10) |

The `Medication_ID`, `Device_ID`, and `Inventory_ID` are used as foreign keys due to their one-to-many relationships with the `Inventory_Store` table.

### Receipt Table

| Attribute Name | Description | Type |
| :------------- | :---------- | :--- |
| Receipt\_ID | Unique ID for the receipt item | varchar(10) |
| Medication\_ID | Foreign key referencing `Medication` table | varchar(10) |
| Device\_ID | Foreign key referencing `Medical_Devices` table | varchar(10) |
| Sales\_ID | Foreign key referencing `SaleReceipt` table | varchar(10) |

The `Medication_ID`, `Device_ID`, and `Sales_ID` are used as foreign keys due to their one-to-many relationships with the `Receipt` table.

### Precripe_Medication Table

| Attribute Name | Description | Type |
| :------------- | :---------- | :--- |
| Medication\_ID | Foreign key referencing `Medication` table (part of composite PK) | varchar(10) |
| Prescription\_ID | Foreign key referencing `Prescription` table (part of composite PK) | varchar(10) |

This table serves as a junction table to resolve the many-to-many relationship between `Medication` and `Prescription` tables.

## Normalization

The database design for the Pharmacy System adheres to normalization principles to ensure data integrity, minimize redundancy, and improve data efficiency. The primary forms of normalization considered are:

* **First Normal Form (1NF)**: All tables ensure that each column contains atomic (single) values, entries in columns are of the same domain, columns have unique names, and the order of data does not affect its meaning or access.
* **Second Normal Form (2NF)**: All tables are in 1NF and any non-key attributes are fully functionally dependent on the entire primary key. This is particularly relevant for tables with composite primary keys.
* **Third Normal Form (3NF)**: All tables are in 2NF and eliminate transitive dependencies, meaning non-key attributes are not dependent on other non-key attributes.

The schema for the Pharmacy System Database has been designed to meet at least 3NF, breaking down larger entities into smaller, related tables and using foreign keys to maintain relationships, thus avoiding data anomalies and ensuring a robust structure. For example, the `Precripe_Medication` table is specifically created to handle a many-to-many relationship, which is a common normalization step.

## SQL Implementation

The SQL implementation includes `CREATE DATABASE`, `USE`, `CREATE TABLE`, and `INSERT` statements for all entities mentioned above. These scripts define the database structure and populate it with sample data for testing and demonstration purposes. Personal names in the sample data have been replaced with generic identifiers for privacy and generality.

## Sample SQL Queries

The following are examples of `SELECT` statements that can be used to retrieve information from the Pharmacy System Database:

```sql
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
