-- sql/duckdb/hasacco_shelter_query_animals_by_shelter.sql
-- ============================================================
-- PURPOSE
-- ============================================================
-- Break overall shelter population down by animal type.
--
-- This query answers:
-- "How many animals of each type are in each shelter?"
--
-- WHY:
-- - Overall totals hide important differences.
-- - Grouping lets us compare parts of the system.
-- - This often reveals where action is needed:
--   * Which animal type makes up the largest portion of each shelter's population?
--   * Which shelter has the most diverse animal population?
--
-- IMPORTANT:
-- This query uses GROUP BY but does NOT join tables yet.
-- We are still working only with the dependent/child table (sale).

SELECT
  shelter_id,
  animal_type,
  COUNT(*) AS type_count
FROM adoption
GROUP BY shelter_id, animal_type
ORDER BY shelter_id;
