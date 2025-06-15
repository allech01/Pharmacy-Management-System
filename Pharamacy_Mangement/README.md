# Pharmacy System Database 

## Project Overview

This project presents the design and implementation of a database system for a Pharmacy. The database aims to efficiently manage various aspects of a pharmacy, including inventory, medication details, medical devices, staff (pharmacists), patient information, transactions, prescriptions, and sales. It facilitates the storage and retrieval of critical data, supporting the daily operations of a pharmacy.

## Database Schema Overview

The database is designed with several interconnected tables to ensure data integrity and efficient management. The primary entities involved are:

* **Inventory**: Manages stock information.
* **Medication**: Stores details about different medicines.
* **Medical_Devices**: Contains information on medical equipment.
* **Pharmacists**: Records details about pharmacy staff.
* **Transaction**: Tracks payment methods and transaction status.
* **Patient**: Stores patient demographic and contact information.
* **Prescription**: Records prescription details, including physician and dosage.
* **SaleReceipt**: Manages sales information and links to transactions, pharmacists, and prescriptions.
* **Inventory_Store**: Connects inventory items with specific medication and devices.
* **Receipt**: Details items included in a receipt.
* **Precripe_Medication**: A linking table for prescriptions and medications.
