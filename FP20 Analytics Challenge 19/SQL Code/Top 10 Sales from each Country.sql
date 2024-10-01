WITH SalesByCustomer AS (
    SELECT 
        `Customer ID`,
        EXTRACT(YEAR FROM `Order Date`) AS `Year`,
        `Country`,
        SUM(`Sales`) AS `Total_Sales`
    FROM `beauty-e-commerce-analysis.beautyecommerce.Beauty E-Commerce Table`
    GROUP BY `Customer ID`, `Year`, `Country`
),
RankedCustomers AS (
    SELECT 
        `Customer ID`,
        `Year`,
        `Country`,
        `Total_Sales`,
        RANK() OVER (PARTITION BY `Year`, `Country` ORDER BY `Total_Sales` DESC) AS `Rank`
    FROM SalesByCustomer
)
SELECT *
FROM RankedCustomers
WHERE `Rank` <= 10
ORDER BY `Year`, `Country`, `Rank`;
