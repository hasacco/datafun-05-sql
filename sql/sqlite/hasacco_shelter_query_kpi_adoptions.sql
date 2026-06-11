-- sql/sqlite/hasacco_shelter_query_kpi_adoptions.sql
-- ============================================================
-- PURPOSE
-- ============================================================
-- Calculate a Key Performance Indicator (KPI) for the shelter domain using SQLite.
--
-- KPI DRIVES THE WORK:
-- In analytics, we do not start with "write a query."
-- We start with a KPI that supports an actionable decision.
--
-- ACTIONABLE OUTCOME (EXAMPLE):
-- We want to identify which shelters are successfully adopting out animals and which are not.
-- This information can help us:
-- - move animals to shelters with higher adoption rates,
-- - allocate resources to shelters that need support,
-- - and ultimately increase the number of animals adopted.
--
-- In this example, our KPI is the number of animals adopted per shelter.
--
-- ANALYST RESPONSIBILITY:
-- Analysts are responsible for determining HOW to get the information
-- that informs the KPI and supports action.
-- That means:
-- - identifying the needed tables,
-- - joining them correctly,
-- - selecting the right measures,
-- - aggregating at the correct level (shelter),
-- - and presenting results in a way that supports decision-making.
--
-- ASSUMPTION:
-- We always run all commands from the project root directory.
--
-- EXPECTED PROJECT PATHS (relative to repo root):
--   SQL:  sql/sqlite/hasacco_shelter_query_kpi_adoptions.sql
--   DB:   artifacts/sqlite/shelterdb.sqlite
--
--
-- ============================================================
-- TOPIC DOMAINS + 1:M RELATIONSHIPS
-- ============================================================
-- OUR DOMAIN: RETAIL
-- Two tables in a 1-to-many relationship (1:M):
-- - store (1): independent/parent table
-- - sale  (M): dependent/child table
--
-- HOW THIS RELATES TO OUR KPI:
-- - The shelter table tells us "which shelter" (shelter_id, shelter_name, city).
-- - The adoption table contains the measurable activity (adoption_date, animal_id).
-- - To compute adoption rate by shelter, we must:
--   1) connect each adoption to its shelter (JOIN on shelter_id),
--   2) aggregate adoption counts at the shelter level (GROUP BY shelter).
--   3) divide by shelter capacity to get adoption rate.
--
--
-- ============================================================
-- KPI DEFINITION
-- ============================================================
-- KPI NAME: Adoption Rate by Shelter
--
-- KPI QUESTION:
-- "What is the adoption rate for each shelter?"
--
-- MEASURE:
-- - adoption rate = (COUNT(outcome == "Adoption") * 1.0) / NULLIF(shelter capacity, 0)
--
-- GRAIN (LEVEL OF DETAIL):
-- - one row per shelter
--
-- OUTPUT (WHAT DECISION-MAKERS NEED):
-- - shelter identifier and name
-- - adoption rate
--
--
-- ============================================================
-- EXECUTION: GET THE INFORMATION THAT INFORMS THE KPI
-- ============================================================
-- Strategy:
-- - JOIN shelters (1) to adoption (M)
-- - GROUP BY shelter
-- - COUNT adoptions to compute adoption rate
-- - ORDER results so we can quickly see top shelters
--
SELECT
  s.shelter_id,
  s.shelter_name,
  s.city,
  s.capacity,
  (COUNT(CASE WHEN a.outcome = 'Adoption' THEN 1 END)  * 1.0 / NULLIF(s.capacity, 0)) AS adoption_rate
FROM shelters AS s
JOIN adoption AS a
  ON a.shelter_id = s.shelter_id
GROUP BY
  s.shelter_id,
  s.shelter_name,
  s.city,
  s.capacity
ORDER BY adoption_rate DESC;
