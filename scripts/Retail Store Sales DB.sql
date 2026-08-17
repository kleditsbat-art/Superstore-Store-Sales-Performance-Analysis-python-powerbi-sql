CREATE DATABASE retailsalesdb;

USE retailsalesdb;

CREATE TABLE Retail_Sales (
    Order_ID VARCHAR(20),
    Order_Date DATE,
    Ship_Date DATE,
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    State VARCHAR(100),
    City VARCHAR(100),
    Region VARCHAR(50),
    Product_ID VARCHAR(20),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(200),
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Discount DECIMAL(5,2),
    Sales DECIMAL(12,2),
    Unit_Cost DECIMAL(10,2),
    Profit DECIMAL(12,2),
    Profit_Margin_Percent DECIMAL(6,2),
    Ship_Mode VARCHAR(50),
    Payment_Mode VARCHAR(50),
    Order_Priority VARCHAR(30),
    Salesperson VARCHAR(100),
    Year INT,
    Month VARCHAR(20),
    Week INT,
    Return_Status VARCHAR(20),
    Rating INT
);


LOAD DATA LOCAL INFILE "C:\Users\karti\Downloads\Retail_Sales_Dataset.csv"
INTO TABLE retail_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from retail_sales;

SELECT SUM(Sales) FROM retail_sales; #----TOTAL SALES
    
SELECT COUNT(Order_ID) FROM retail_sales;  #-----TOTAL ORDERS

SELECT SUM(Profit) FROM retail_sales;  #-----TOTAL PROFIT

SELECT avg(Profit_Margin_Percent) FROM retail_sales;  #-----AVERAGE PROFIT MARGIN

SELECT avg(Unit_Cost) FROM retail_sales;  #-----AVERAGE UNIT COST

SELECT avg(Discount) from retail_sales;  #------AVERAGE DISCOUNT

SELECT 
    YEAR(Order_Date) AS Year,
    SUM(Sales) AS Total_Sales
FROM retail_sales
GROUP BY YEAR(Order_Date)
ORDER BY Year;

SELECT 
    Category AS CATAGORY,
    SUM(Sales) AS Total_Sales
FROM retail_sales
GROUP BY Category;

SELECT 
    City AS CITY,
    SUM(Sales) AS Total_Sales
FROM retail_sales
GROUP BY CITY
order by Total_Sales DESC;

SELECT 
    Customer_Name AS CUSTOMER,
    SUM(Sales) AS Total_Sales
FROM retail_sales
GROUP BY Customer_Name
order by Total_Sales DESC;

SELECT 
    Product_Name AS PRODUCT,
    SUM(Profit) AS Total_Profit
FROM retail_sales
GROUP BY Product_Name
order by Total_Profit DESC;

SELECT 
    Region AS Region,
    SUM(Sales) AS Total_Sales
FROM retail_sales
GROUP BY Region
order by Total_Sales DESC;
