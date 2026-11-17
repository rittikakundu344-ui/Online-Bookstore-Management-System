# 📚 Online Bookstore Management System

A MySQL-based database project designed to manage an online bookstore's books, categories, customers, orders and inventory.

This project provides a centralized way to organize bookstore information and manage daily operations.

## 🎯 Problem Statement

Managing book catalogues, customer records, orders and inventory manually can lead to errors and difficulties in tracking available stock.

This project provides a centralized database solution to maintain bookstore records, update stock and manage orders more reliably.

## 🚀 Project Objectives

- Manage book and category information.
- Maintain customer records.
- Record customer orders containing multiple books.
- Update stock after successful orders.
- Prevent orders when sufficient stock is unavailable.
- Maintain stock and price change history.
- Generate useful sales and inventory reports.
- Support data import/export and database backup.

## 🛠️ Technologies Used

- **Database:** MySQL 8.0
- **Database Management Tool:** MySQL Workbench
- **Storage Engine:** InnoDB
- **Data Import/Export:** CSV
- **Backup and Restore:** mysqldump

## 🗄️ Database Structure

Database name: `bookstore_db`

The project contains seven tables:

| Table | Purpose |
|---|---|
| `categories` | Stores book categories. |
| `books` | Stores book details, prices and available stock. |
| `customers` | Stores customer information. |
| `orders` | Stores customer order details. |
| `order_items` | Stores the books and quantities included in each order. |
| `stock_log` | Maintains stock change history. |
| `price_audit` | Maintains book price change history. |

## 🔗 Entity Relationship Diagram

The database uses connected tables to organize bookstore information.

Main relationships:

- Categories → Books
- Customers → Orders
- Orders → Order Items
- Books → Order Items
- Books → Stock Log
- Books → Price Audit

The `order_items` table connects books with customer orders.

## ⚙️ Key Features

- **Book Catalogue Management:** Store and manage book titles, authors, categories, prices and available quantities.
- **Category Management:** Organize books by category.
- **Customer Management:** Maintain customer details.
- **Order Management:** Record customer orders containing one or more books.
- **Stock Management:** Check available quantities and update stock after orders.
- **Stock History:** Keep records of stock additions and deductions.
- **Price History:** Maintain records of book price changes.
- **Sales Reports:** Review sales, customer purchases and category-wise sales.
- **Low-Stock Tracking:** Identify books that need restocking.
- **Data Import and Export:** Import book records from CSV files and export the catalogue.
- **Backup and Restore:** Create database backups and restore data when required.

## 📥 Installation and Setup

### Requirements

- MySQL Server 8.0
- MySQL Workbench

### Step 1: Clone the repository

```bash
git clone YOUR_GITHUB_REPOSITORY_URL
```

### Step 2: Open the project

Open MySQL Workbench and connect to your MySQL server.

### Step 3: Run the SQL script

Open the project SQL file in MySQL Workbench and execute the script in the required order.

### Step 4: Select the database

```sql
USE bookstore_db;
```

### Step 5: Verify the tables

```sql
SHOW TABLES;
```

### Step 6: Check book records

```sql
SELECT * FROM books;
```

## 📊 Project Results

- Created 7 related database tables.
- Added 12 initial book records.
- Imported 3 additional books using CSV.
- Maintained 15 books in the final catalogue.
- Implemented stock checking and automatic stock updates.
- Maintained stock and price change records.
- Prepared sales and inventory reports.
- Tested database backup and restore.

## 🔮 Future Scope

- Develop a web-based user interface.
- Integrate Python Flask with MySQL.
- Add customer registration and login.
- Implement a shopping cart and online payments.
- Add order tracking and an admin dashboard.

## 🎓 Learning Outcomes

Through this project, I gained practical experience in:

- Relational database design.
- Organizing data across related tables.
- Managing book, customer and order records.
- Writing SQL queries to retrieve and analyze information.
- Maintaining accurate inventory records.
- Importing, exporting and backing up database data.

## 👩‍💻 Author

**Rittika Kundu**

MCA Graduate | MySQL Database Project

---

⭐ If you find this project useful, feel free to explore the repository.
