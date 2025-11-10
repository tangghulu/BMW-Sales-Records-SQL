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

# Questions 
## 1. What are the top 5 and bottom 5 BMW models sold globally?
What are the top 5 most sold BMW models globally?

```sql
SELECT 
    Model,
    SUM(Sales_Volume) AS Total_Sales
FROM "BMW sales data (2010-2024) (1)"
GROUP BY Model
ORDER BY Total_Sales DESC
LIMIT 5;
```
<img width="180" height="230" alt="image" src="https://github.com/user-attachments/assets/385bfa0a-54bc-44b3-be49-6cf2188c85c5" />


What are the bottom 5 least sold BMW models globally?

```sql
SELECT 
    Model,
    SUM(Sales_Volume) AS Total_Sales
FROM "BMW sales data (2010-2024) (1)"
GROUP BY Model
ORDER BY Total_Sales DESC
LIMIT 5;
```
<img width="170" height="220" alt="image" src="https://github.com/user-attachments/assets/c32dc779-4f12-426f-a3a3-2fc08e137e8f" />

### 💡 Analysis: Top 5 and Bottom 5 BMW Models Sold Globally 

The analysis highlights clear distinctions in BMW’s global sales performance:  
- **Top 5 Models:** The **7 Series**, **i8**, **X1**, **3 Series**, and **i3** lead global sales, reflecting BMW’s strong presence across **luxury sedans, compact SUVs, and electric vehicles**. The popularity of the **i3** and **i8** also shows growing consumer interest in **hybrid and EV technology**.  
- **Bottom 5 Models:** The **M3**, **X6**, **X5**, **X3**, and **M5** represent BMW’s **performance-oriented and premium models**, which sell in lower volumes due to **higher price points** and **niche target markets**.  
- Overall, BMW’s lineup demonstrates a strategic balance, mass-market models sustain high global demand, while limited-edition and M-series vehicles reinforce the brand’s performance and luxury identity.

## 2. Yearly growth
```sql
SELECT 
    Year,
    SUM(Sales_Volume) AS Total_Sales
FROM "BMW sales data (2010-2024) (1)"
GROUP BY Year
ORDER BY Year;
```
<img width="142" height="443" alt="image" src="https://github.com/user-attachments/assets/35d14fce-1f96-4a89-9f09-ae48849c9800" />

### 💡 Analysis: Yearly Growth  

The data shows that BMW’s total global sales remained relatively stable from **2010 to 2024**, with modest fluctuations across the years.  
Peaks in **2015, 2019, and 2023** indicate strong performance periods, likely linked to new model launches or global market recovery phases.  
Slight dips in **2017, 2020, and 2022** suggest external factors such as economic shifts or production slowdowns.  
Overall, BMW maintains a steady long-term growth trend, demonstrating consistent consumer demand and resilient market presence.

## 3. What are the consumer preferences for BMW models?
What is the most popular colors for BMW models?
```sql
SELECT 
    Color,
    SUM(Sales_Volume) AS Total_Sales,
    COUNT(*) AS Number_of_Records,
    ROUND(SUM(Sales_Volume) * 100.0 / (SELECT SUM(Sales_Volume) FROM "BMW sales data (2010-2024) (1)"), 2) AS Sales_Percentage
FROM "BMW sales data (2010-2024) (1)"
GROUP BY Color
ORDER BY Total_Sales DESC;
```
<img width="380" height="200" alt="image" src="https://github.com/user-attachments/assets/f1d68640-13d5-4844-8a71-f523df77a843" />

What is the distribution of sales across different fuel types?
```sql
SELECT 
    Fuel_Type,
    SUM(Sales_Volume) AS Total_Sales,
    COUNT(*) AS Number_of_Records,
    ROUND(SUM(Sales_Volume) * 100.0 / (SELECT SUM(Sales_Volume) FROM "BMW sales data (2010-2024) (1)"), 2) AS Sales_Percentage
FROM "BMW sales data (2010-2024) (1)"
GROUP BY Fuel_Type
ORDER BY Total_Sales DESC;
```
<img width="400" height="200" alt="image" src="https://github.com/user-attachments/assets/70e3c72c-0fa0-489a-9d21-fff7824a9dc4" />

Do consumers prefer a manual or automatic transmission?
```sql
SELECT 
    Transmission,
    SUM(Sales_Volume) AS Total_Sales,
    COUNT(*) AS Number_of_Records,
    ROUND(SUM(Sales_Volume) * 100.0 / (SELECT SUM(Sales_Volume) FROM "BMW sales data (2010-2024) (1)"), 2) AS Sales_Percentage
FROM "BMW sales data (2010-2024) (1)"
GROUP BY Transmission
ORDER BY Total_Sales DESC;
```
<img width="450" height="151" alt="image" src="https://github.com/user-attachments/assets/1d169e46-d5b3-42c6-936b-4ac4137aa18d" />

Is there a correlation with sales and engine size?
```sql
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
```
<img width="450" height="180" alt="image" src="https://github.com/user-attachments/assets/c90fff50-374d-4f17-9292-a6f11351d30e" />

### 💡 Analysis: Consumer Preferences for BMW Models  

The data reveals several key trends in consumer preferences:  
- **Color:** Red, Silver, and White are the top color choices, each capturing around **16–17%** of total sales. This indicates a balanced preference between **bold, classic, and neutral tones**, with BMW customers valuing both sportiness and elegance.  
- **Fuel Type:** **Hybrid vehicles lead (25%)**, followed closely by **petrol and electric models (~24%)**, showing BMW’s successful diversification toward sustainable powertrains while maintaining traditional options.  
- **Transmission:** The split between **manual (50.27%)** and **automatic (49.73%)** is nearly even, suggesting a global market still divided between driving enthusiasts and comfort-focused consumers.  
- **Engine Size:** Models with **medium to large engines (2.0–4.0L)** account for the highest total sales, indicating buyers’ continued preference for **performance-oriented vehicles** despite rising EV trends.

Overall, BMW’s customer base demonstrates a balanced mix of performance, sustainability, and style preferences, aligning with the brand’s positioning as both a luxury and driver-focused automaker.
