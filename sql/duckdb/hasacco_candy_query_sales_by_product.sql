-- sql/sqlite/hasacco_candy_query_sales_by_product.sql
-- ============================================================
-- PURPOSE
-- ============================================================
-- Break overall sales performance down by product.
--
-- This query answers:
-- "How many sales do we have by product?"
-- "What are the top-selling products?"
--
-- WHY:
-- - Overall totals hide important differences.
-- - Grouping lets us compare parts of the system.
-- - This often reveals where action is needed:
--   * Which products underperform and could be considered for discontinuation?
--   * Where should we focus our production time and resources?
--

SELECT
  t.Division,
  p.Product_ID,
  p.Product_Name,
  SUM(s.Units) AS sale_count
FROM candy_sales AS s
JOIN candy_products AS p
  ON s.Product_ID = p.Product_ID
JOIN candy_targets AS t
  ON s.Division = t.Division
GROUP BY t.Division, p.Product_ID, p.Product_Name
ORDER BY sale_count DESC;
