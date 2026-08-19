CREATE TABLE blinkit_data (
    "Item Fat Content" TEXT,
    "Item Identifier" TEXT,
    "Item Type" TEXT,
    "Outlet Establishment Year" INT,
    "Outlet Identifier" TEXT,
    "Outlet Location Type" TEXT,
    "Outlet Size" TEXT,
    "Outlet Type" TEXT,
    "Item Visibility" NUMERIC,
    "Item Weight" NUMERIC,
    "Total Sales" NUMERIC,
    "Rating" Real
);

select * from blinkit_data

-- Total Number of Rows
SELECT COUNT(*) AS total_rows
FROM blinkit_data;


-- Total Sales
SELECT SUM("Total Sales") AS total_sales
FROM blinkit_data;


-- Average Sales
SELECT AVG("Total Sales") AS average_sales
FROM blinkit_data;


-- Highest Sales
SELECT MAX("Total Sales") AS highest_sales
FROM blinkit_data;


-- Lowest Sales
SELECT MIN("Total Sales") AS lowest_sales
FROM blinkit_data;


SELECT
    COUNT(*) AS total_rows,
    SUM("Total Sales") AS total_sales,
    AVG("Total Sales") AS average_sales,
    MAX("Total Sales") AS highest_sales,
    MIN("Total Sales") AS lowest_sales
FROM blinkit_data;

-- Total Sales by Item Type
select
"Item Type" , sum("Total Sales") as Total_sales
from blinkit_data
group by "Item Type";

-- Total Sales by Item Type Top selling items
select
"Item Type" , sum("Total Sales") as Total_sales
from blinkit_data
group by "Item Type"
order by Total_sales desc;

-- Top 5 Selling Item Types
SELECT
"Item Type",
SUM("Total Sales") AS total_sales
FROM blinkit_data
GROUP BY "Item Type"
ORDER BY total_sales DESC
LIMIT 5;

-- Total Sales by Item Type for Supermarket outlets
SELECT
    "Item Type",
    SUM("Total Sales") AS total_sales
FROM blinkit_data
WHERE "Outlet Type" = 'Supermarket Type1'
GROUP BY "Item Type"
ORDER BY total_sales DESC;

-- Item Types with Total Sales > 100000
SELECT
    "Item Type",
    SUM("Total Sales") AS total_sales
FROM blinkit_data
GROUP BY "Item Type"
HAVING SUM("Total Sales") > 100000
ORDER BY total_sales DESC;

-- Unique Item Types
SELECT DISTINCT "Item Type"
FROM blinkit_data;

-- Unique combinations of Outlet Type and Outlet Size
SELECT DISTINCT
    "Outlet Type",
    "Outlet Size"
FROM blinkit_data;

-- Count of outlets by Outlet Type
SELECT
    "Outlet Type",
    COUNT(*) AS outlet_count
FROM blinkit_data
GROUP BY "Outlet Type"
ORDER BY outlet_count DESC;

-- Count of unique outlets
SELECT
    COUNT(DISTINCT "Outlet Identifier") AS unique_outlets
FROM blinkit_data;

-- Count of outlets by Location Type
SELECT
    "Outlet Location Type",
    COUNT(*) AS outlet_count
FROM blinkit_data
GROUP BY "Outlet Location Type"
ORDER BY outlet_count DESC;

-- Item types with sales > 100000 in Supermarket Type1
SELECT
    "Item Type",
    SUM("Total Sales") AS total_sales
FROM blinkit_data
WHERE "Outlet Type" = 'Supermarket Type1'
GROUP BY "Item Type"
HAVING SUM("Total Sales") > 100000
ORDER BY total_sales DESC;


-- Categorize items by sales
SELECT
    "Item Identifier",
    "Item Type",
    "Total Sales",
    CASE
        WHEN "Total Sales" >= 200 THEN 'High Sales'
        WHEN "Total Sales" >= 100 THEN 'Medium Sales'
        ELSE 'Low Sales'
    END AS sales_category
FROM blinkit_data;

-- Count items by sales category
SELECT
    CASE
        WHEN "Total Sales" >= 200 THEN 'High Sales'
        WHEN "Total Sales" >= 100 THEN 'Medium Sales'
        ELSE 'Low Sales'
    END AS sales_category,
    COUNT(*) AS item_count
FROM blinkit_data
GROUP BY sales_category
ORDER BY item_count DESC;


-- Check for NULL values
SELECT
    COUNT(*) AS total_rows,
    COUNT("Item Identifier") AS item_identifier_present,
    COUNT("Item Weight") AS item_weight_present,
    COUNT("Rating") AS rating_present
FROM blinkit_data;

-- Items with missing Item Weight
SELECT
    "Item Identifier",
    "Item Type",
    "Item Weight",
    "Outlet Type"
FROM blinkit_data
WHERE "Item Weight" IS NULL;

-- Items with sales above average
SELECT
    "Item Identifier",
    "Item Type",
    "Total Sales"
FROM blinkit_data
WHERE "Total Sales" > (
    SELECT AVG("Total Sales")
    FROM blinkit_data
)
ORDER BY "Total Sales" DESC;


-- Average sales by Outlet Type
SELECT
    "Outlet Type",
    AVG("Total Sales") AS average_sales
FROM blinkit_data
GROUP BY "Outlet Type"
ORDER BY average_sales DESC;

-- Total Sales by Outlet Location Type
SELECT
    "Outlet Location Type",
    SUM("Total Sales") AS total_sales
FROM blinkit_data
GROUP BY "Outlet Location Type"
ORDER BY total_sales DESC;

-- Highest selling item
SELECT
    "Item Identifier",
    "Item Type",
    "Total Sales"
FROM blinkit_data
ORDER BY "Total Sales" DESC
LIMIT 1;

-- Total Sales by Item Fat Content
SELECT
    "Item Fat Content",
    SUM("Total Sales") AS total_sales
FROM blinkit_data
GROUP BY "Item Fat Content"
ORDER BY total_sales DESC;

-- Total Sales by Outlet Size
SELECT
    "Outlet Size",
    SUM("Total Sales") AS total_sales
FROM blinkit_data
GROUP BY "Outlet Size"
ORDER BY total_sales DESC;

-- Total Sales by Item Type for Medium Outlets
SELECT
    "Item Type",
    SUM("Total Sales") AS total_sales
FROM blinkit_data
WHERE "Outlet Size" = 'Medium'
GROUP BY "Item Type"
ORDER BY total_sales DESC;