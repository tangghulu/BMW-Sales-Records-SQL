# Analyzing BMW Sales from 2010-2024 using SQL, Tableau, Excel
This project explores **BMW’s global sales performance** over 15 years, uncovering key insights into top-selling models, regional trends, growth rates, and fuel-type distribution.  
By combining **SQL queries**, **Excel analysis**, and **Tableau visualizations**, this analysis provides a clear, data-driven view of BMW’s evolving market strategy and consumer demand.

---

## 🧠 Project Objective  
To analyze BMW’s historical sales data (2010–2024) to answer key business questions such as:  
- Which BMW models sold the most globally?  
- Which year had the highest overall sales?  
- How do sales vary across regions?  
- What are the year-over-year growth trends?  
- How is sales distribution changing by fuel type (e.g., petrol, diesel, hybrid, electric)?  

---

## 🛠️ Tools Used  
- **SQL** – for data querying and trend analysis  
- **Excel** – for data cleaning and preprocessing  
- **Tableau** – for visualization and storytelling  

---



What are the top 10 most sold BMW models globally?

```sql
SELECT Model,
Year,
Region,
Price_USD,
Sales_Volume
FROM "BMW sales data (2010-2024) (1)"
ORDER BY Sales_Volume DESC
LIMIT 10;
```
<img width="400" height="317" alt="image" src="https://github.com/user-attachments/assets/d93822db-1ab8-4ef2-908f-8a18b2721215" />

Which year had the highest overall BMW sales?
```sql
SELECT Year, SUM(Sales_Volume) AS Total_Sales
FROM "BMW sales data (2010-2024) (1)"
GROUP BY Year;
```
<img width="135" height="805" alt="image" src="https://github.com/user-attachments/assets/7b0c48fa-dd2a-4149-a4c3-3626807732d9" />

What is the most popular BMW model in each region?
```sql
SELECT Model, Region, Sales_Volume
FROM "BMW sales data (2010-2024) (1)"
GROUP BY Region
ORDER BY Sales_Volume DESC;
```
<img width="299" height="228" alt="image" src="https://github.com/user-attachments/assets/aae4c380-0d74-465e-8764-e7aa39531c51" />

What is the year-over-year growth rate?
```sql
SELECT Year,
       SUM(Sales_Volume) AS Total_Sales,
       LAG(SUM(Sales_Volume)) OVER (ORDER BY Year) AS Previous_Year_Sales,
       ROUND(((SUM(Sales_Volume) - LAG(SUM(Sales_Volume)) OVER (ORDER BY Year)) * 100.0 / 
              LAG(SUM(Sales_Volume)) OVER (ORDER BY Year)), 2) AS Growth_Rate_Percent
FROM "BMW sales data (2010-2024) (1)"
GROUP BY Year
ORDER BY Year;
```
<img width="444" height="466" alt="image" src="https://github.com/user-attachments/assets/7bc4e723-c248-42b1-b9c7-46b6a4343fce" />

What is the distribution of sales across different fuel types?
```sql
SELECT 
    Fuel_Type,
    COUNT(*) AS Number_of_Records,
    SUM(Sales_Volume) AS Total_Sales,
    ROUND(SUM(Sales_Volume) * 100.0 / (SELECT SUM(Sales_Volume) FROM "BMW sales data (2010-2024) (1)"), 2) AS Sales_Percentage
FROM "BMW sales data (2010-2024) (1)"
GROUP BY Fuel_Type
ORDER BY Total_Sales DESC;
```
<img width="441" height="288" alt="image" src="https://github.com/user-attachments/assets/1568fbdb-73fa-43c2-84f8-0ddb42953d52" />
