SELECT 
    EXTRACT(YEAR FROM `Order Date`) AS order_year,
    SUM(Profit) AS AnnualProfit,
    SUM(Sales) AS AnnualSale
FROM 
    `beauty-e-commerce-analysis.beautyecommerce.Beauty E-Commerce Table`
GROUP BY 
    order_year

