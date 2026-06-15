-- sql/sqlite/hasacco_candy_query_profit_by_product.sql
-- ============================================================
-- PURPOSE
-- ============================================================
-- Break overall profit performance down by product.
--
-- This query answers:
-- "How much profit do we make by product?"
-- "What are the most profitable products?"
--
-- WHY:
-- - Overall totals hide important differences.
-- - Grouping lets us compare parts of the system.
-- - This often reveals where action is needed:
--   * Which products underperform and could be considered for discontinuation?
--   * Where should we focus our production time and resources to maximize profit?
--   * Which products are most profitable and could be considered for expansion?
--   * Which products should unit price or unit cost adjustments be considered to improve profitability?
--

SELECT
  t.Division,
  p.Product_ID,
  p.Product_Name,
  CAST(ROUND(p.Unit_Price * SUM(s.Units), 2) AS DECIMAL(18, 2)) AS total_revenue,
  CAST(ROUND(p.Unit_Cost * SUM(s.Units), 2) AS DECIMAL(18, 2)) AS total_cost,
  CAST(ROUND((p.Unit_Price - p.Unit_Cost) * SUM(s.Units), 2) AS DECIMAL(18, 2)) AS manufacturer_profit
FROM candy_sales AS s
JOIN candy_products AS p
  ON s.Product_ID = p.Product_ID
JOIN candy_targets AS t
  ON s.Division = t.Division
GROUP BY t.Division, p.Product_ID, p.Product_Name, p.Unit_Price, p.Unit_Cost
ORDER BY manufacturer_profit DESC;
