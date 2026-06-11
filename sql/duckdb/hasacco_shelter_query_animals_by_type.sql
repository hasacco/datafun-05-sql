-- sql/duckdb/hasacco_shelter_query_animals_by_type.sql
-- ============================================================
-- PURPOSE
-- ============================================================
-- Break overall total population down by animal type and calculate adoption fee stats by animal type.
--
-- This query answers:
-- "How many animals of each type are there and what is the average adoption fee by type?"
--
-- WHY:
-- - Overall totals hide important differences.
-- - Grouping lets us compare parts of the system.
-- - This often reveals where action is needed:
--   * Which animal type makes up the largest portion of the total shelter population?
--   * Which animal type has the highest average adoption fee?
--
-- IMPORTANT:
-- This query uses GROUP BY but does NOT join tables yet.
-- We are still working only with the dependent/child table (sale).

SELECT
  animal_type,
  COUNT(*) AS type_count,
  ROUND(SUM(fee), 2) AS total_fees,
  ROUND(AVG(fee), 2) AS avg_adoption_fee
FROM adoption
GROUP BY animal_type
ORDER BY total_fees DESC;
