-- sql/sqlite/hasacco_candy_query_sales_by_division.sql
-- ============================================================
-- PURPOSE
-- ============================================================
-- Break overall sales performance down by product division.
--
-- This query answers:
-- "How many sales do we have by division?"
-- "What is the sales deficit by division?"
--
-- WHY:
-- - Overall totals hide important differences.
-- - Grouping lets us compare parts of the system.
-- - This often reveals where action is needed:
--   * Which divisions underperform?
--   * Where should we focus our efforts to improve sales?
--

SELECT
  t.Division,
  t.Target_sales AS target_sales,
  SUM(s.Units) AS sale_count,
  t.Target_sales - SUM(s.Units) AS sales_deficit
FROM candy_sales AS s
JOIN candy_targets AS t
  ON s.Division = t.Division
GROUP BY t.Division
ORDER BY sales_deficit DESC;
