-- sql/sqlite/hasacco_candy_bootstrap.sql
-- ============================================================
-- PURPOSE
-- ============================================================
-- Creates candy tables and loads data from CSV files (SQLite).
--
-- ASSUMPTION:
-- We always run all commands from the project root directory.
--
-- EXPECTED PROJECT PATHS (relative to repo root):
--   SQL:  sql/sqlite/hasacco_candy_bootstrap.sql
--   CSV:  data/raw/candy/Candy_Products.csv
--   CSV:  data/raw/candy/Candy_Sales.csv
--   CSV:  data/raw/candy/Candy_Targets.csv
--   DB:   artifacts/sqlite/candy.sqlite
--
--
-- ============================================================
-- TOPIC DOMAINS + 1:M RELATIONSHIPS
-- ============================================================
-- OUR DOMAINS:
-- Each domain (e.g. candy) has three tables.
-- They are related in a 1-to-many relationship (1:M).
--
-- GENERAL:
-- In a 1-to-many relationship:
-- - The one table (1) is the independent/parent table. (candy_targets)
--   It does not depend on any other table.
-- - The many table (M) is the dependent/child table. (candy_products, candy_sales)
--   It depends on the independent/parent table.
-- - They are related by a foreign key in the dependent/child table
--   that references the primary key in the independent/parent table.
--
-- OUR DOMAIN: CANDY
-- In candy, targets are set for different products.
-- Therefore, we have three tables: targets (1) and products/sales (M).
-- - The targets table is the independent/parent table (1).
-- - The products and sales tables are the dependent/child tables (M).
-- - The foreign key in the products and sales tables references the primary key in the targets table.
--
-- REQ: Tables must be created in order to satisfy foreign key constraints.
-- REQ: Data must be loaded in order to satisfy foreign key constraints.
--
--
-- ============================================================
-- EXECUTION: ATOMIC BOOTSTRAP (ALL OR NOTHING)
-- ============================================================
-- Use a transaction to ensure atomicity.
-- Atomicity: either all operations succeed,
-- or none do and the database remains unchanged.
-- Start with BEGIN TRANSACTION; and end with COMMIT; if all succeed.
-- If any operation fails, the database will ROLLBACK to undo all changes.
-- This ensures the database is never left in a partial or inconsistent state.
BEGIN TRANSACTION;
--
--
-- ============================================================
-- STEP 1: CREATE TABLES (PARENT FIRST, THEN CHILD)
-- ============================================================
-- The independent table must be created first.
-- In candy, targets are set independently of products and sales.
-- Therefore, create the targets table before the products and sales tables.
--
-- Create the `candy_targets` table using SQLite SQL syntax and data types.
-- In our table, all the fields are required (NOT NULL).
-- This means that every record must have a value for these fields.
-- The primary key is Division, which uniquely identifies each target.
CREATE TABLE IF NOT EXISTS candy_targets (
  -- Every table must have a primary key that uniquely identifies each record.
  Division TEXT PRIMARY KEY,
  Target_sales INTEGER NOT NULL
);
-- Create the `candy_products` table using SQLite SQL syntax and data types.
CREATE TABLE IF NOT EXISTS candy_products (
  -- Every table must have a primary key that uniquely identifies each record.
  Product_ID TEXT PRIMARY KEY,
  -- Foreign key that references the primary key in the candy_targets table. It cannot be NULL.
  Division TEXT NOT NULL,
  -- All remaining fields are also required (NOT NULL).
  Product_Name TEXT NOT NULL,
  Factory TEXT NOT NULL,
  Unit_Price REAL NOT NULL,
  Unit_Cost REAL NOT NULL
);
-- Create the `candy_sales` table using SQLite SQL syntax and data types.
CREATE TABLE IF NOT EXISTS candy_sales (
  -- Every table must have a primary key that uniquely identifies each record.
  Row_ID INTEGER PRIMARY KEY,
  -- Foreign key that references the primary key in the candy_targets table. It cannot be NULL.
  Division TEXT NOT NULL,
  -- All remaining fields are also required (NOT NULL).
  Order_ID TEXT NOT NULL,
  Order_Date DATE NOT NULL,
  Ship_Date DATE NOT NULL,
  Ship_Mode TEXT NOT NULL,
  Customer_ID INTEGER NOT NULL,
  Country TEXT NOT NULL,
  City TEXT NOT NULL,
  State_Province TEXT NOT NULL,
  Postal_Code TEXT NOT NULL,
  Region TEXT NOT NULL,
  Product_ID TEXT NOT NULL,
  Product_Name TEXT NOT NULL,
  Sales REAL NOT NULL,
  Units INTEGER NOT NULL,
  Gross_Profit REAL NOT NULL,
  Cost REAL NOT NULL
);
--
--

-- ============================================================
-- FINISH EXECUTION: ATOMIC BOOTSTRAP (ALL OR NOTHING)
-- ============================================================
-- If we reach this point, all operations succeeded.
-- Therefore, commit the transaction to make the changes permanent.
COMMIT;
--
--
-- ============================================================
-- REFERENCE: DUCKDB COPY CSV OPTIONS
-- ============================================================
-- CUSTOM: WHEN USING DUCKDB COPY COMMAND, the last line tells how to read the CSV file.
-- EXAMPLE: (WITH (HEADER TRUE, DELIMITER ',', QUOTE '"', ESCAPE '"'))
--
-- HEADER TRUE:
-- The first row in the CSV file contains column headers (not data).
--
-- DELIMITER ',':
-- Columns are separated by commas.
--
-- QUOTE '"':
-- Text fields are enclosed in double quotes.
--
-- ESCAPE '"':
-- Double quotes within text fields are escaped by doubling them.
