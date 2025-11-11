-- What are the top 5 most sold BMW models globally?
SELECT 
    Model,
    SUM(Sales_Volume) AS Total_Sales
FROM "BMW sales data (2010-2024) (1)"
GROUP BY Model
ORDER BY Total_Sales DESC
LIMIT 5;

--What are the bottom 5 least sold BMW models globally?
SELECT 
    Model,
    SUM(Sales_Volume) AS Total_Sales
FROM "BMW sales data (2010-2024) (1)"
GROUP BY Model
ORDER BY Total_Sales DESC
LIMIT 5;

-- What is the total sales by year?
SELECT 
    Year,
    SUM(Sales_Volume) AS Total_Sales
FROM "BMW sales data (2010-2024) (1)"
GROUP BY Year
ORDER BY Year;

-- What is the most popular colors for BMW models?
SELECT 
    Color,
    SUM(Sales_Volume) AS Total_Sales,
    COUNT(*) AS Number_of_Records,
    ROUND(SUM(Sales_Volume) * 100.0 / (SELECT SUM(Sales_Volume) FROM "BMW sales data (2010-2024) (1)"), 2) AS Sales_Percentage
FROM "BMW sales data (2010-2024) (1)"
GROUP BY Color
ORDER BY Total_Sales DESC;

-- What is the distribution of sales across different fuel types?
SELECT 
    Fuel_Type,
    SUM(Sales_Volume) AS Total_Sales,
    COUNT(*) AS Number_of_Records,
    ROUND(SUM(Sales_Volume) * 100.0 / (SELECT SUM(Sales_Volume) FROM "BMW sales data (2010-2024) (1)"), 2) AS Sales_Percentage
FROM "BMW sales data (2010-2024) (1)"
GROUP BY Fuel_Type
ORDER BY Total_Sales DESC;

-- Do consumers prefer a manual or automatic transmission?
SELECT 
    Transmission,
    SUM(Sales_Volume) AS Total_Sales,
    COUNT(*) AS Number_of_Records,
    ROUND(SUM(Sales_Volume) * 100.0 / (SELECT SUM(Sales_Volume) FROM "BMW sales data (2010-2024) (1)"), 2) AS Sales_Percentage
FROM "BMW sales data (2010-2024) (1)"
GROUP BY Transmission
ORDER BY Total_Sales DESC;

-- Is there a correlation with sales and engine size?
SELECT 
    CASE 
        WHEN Engine_Size_L < 2.0 THEN 'Small (<2.0L)'
        WHEN Engine_Size_L BETWEEN 2.0 AND 3.0 THEN 'Medium (2.0-3.0L)'
        WHEN Engine_Size_L BETWEEN 3.0 AND 4.0 THEN 'Large (3.0-4.0L)'
        ELSE 'Very Large (>4.0L)'
    END AS Engine_Category,
    SUM(Sales_Volume) AS Total_Sales,
    AVG(Price_USD) AS Avg_Price
FROM "BMW sales data (2010-2024) (1)"
GROUP BY Engine_Category
ORDER BY Total_Sales DESC;