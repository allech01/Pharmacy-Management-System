# [cite_start]Pharmacy System Database 

## Project Overview

[cite_start]This project presents the design and implementation of a database system for a Pharmacy. [cite_start]The database aims to efficiently manage various aspects of a pharmacy, including inventory, medication details, medical devices, staff (pharmacists), patient information, transactions, prescriptions, and sales. It facilitates the storage and retrieval of critical data, supporting the daily operations of a pharmacy.

## Database Schema Overview

[cite_start]The database is designed with several interconnected tables to ensure data integrity and efficient management. The primary entities involved are:

* [cite_start]**Inventory**: Manages stock information.
* [cite_start]**Medication**: Stores details about different medicines.
* [cite_start]**Medical_Devices**: Contains information on medical equipment.
* **Pharmacists**: Records details about pharmacy staff.
* [cite_start]**Transaction**: Tracks payment methods and transaction status.
* [cite_start]**Patient**: Stores patient demographic and contact information.
* **Prescription**: Records prescription details, including physician and dosage.
* [cite_start]**SaleReceipt**: Manages sales information and links to transactions, pharmacists, and prescriptions.
* [cite_start]**Inventory_Store**: Connects inventory items with specific medication and devices.
* [cite_start]**Receipt**: Details items included in a receipt.
* [cite_start]**Precripe_Medication**: A linking table for prescriptions and medications.
