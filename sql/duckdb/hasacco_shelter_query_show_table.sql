-- sql/duckdb/hasacco_shelter_query_show_table.sql
-- ============================================================
-- PURPOSE
-- ============================================================
-- Display the contents of the shelters and adoption tables.
--
-- This query answers:
-- "What are the contents of the shelters and adoption tables?"
--
-- WHY:
-- - To view the data stored in these tables.
-- - To verify the data is correctly inserted and structured.
-- - This is a basic query that helps us understand the raw data before we start analyzing it.

SELECT *
FROM shelters;

SELECT *
FROM adoption;
