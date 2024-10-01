WITH SalesData AS (
  SELECT 
    EXTRACT(YEAR FROM `Order Date`) AS order_year,
    SUM(Sales) AS total_sales
  FROM 
    `beauty-e-commerce-analysis.beautyecommerce.Beauty E-Commerce Table`
  WHERE
    `Segment` = "Corporate"
  GROUP BY 
    order_year
)

SELECT 
  current_year.order_year AS order_year,
  current_year.total_sales AS total_sales_current_year,
  IFNULL(previous_year.total_sales, 0) AS total_sales_previous_year
FROM 
  SalesData current_year
LEFT JOIN 
  SalesData previous_year
ON 
  current_year.order_year = previous_year.order_year + 1
ORDER BY 
  order_year;
