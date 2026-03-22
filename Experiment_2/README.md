# Experiment 2

## Student Information
- Name: Aayush Raj  
- UID: 25MCI10066  
- Branch: MCA (AI & ML)  
- Section: 25 MAM-1 A  
- Semester: 2nd Semester  
- Subject: Technical Training  
- Date of Performance: 12/01/2026  

---

## AIM
To implement and analyze SQL SELECT queries using filtering, sorting, grouping, and aggregation concepts in PostgreSQL for efficient data retrieval and analytical reporting.

---

## S/W Requirement: Oracle Database Express Edition and pgAdmin

---

## OBJECTIVES
- To retrieve specific data using filtering conditions
- To sort query results using single and multiple attributes
- To perform aggregation using grouping techniques
- To apply conditions on aggregated data
- To understand real-world analytical queries commonly asked in placement interviews

## Practical / Experiment Steps
## 🔹 Step 1: Database and Table Preparation

---
Query:

## Table Creation:
```sql
CREATE TABLE CustomerOrders (
    OrderID SERIAL PRIMARY KEY,
    CustomerName VARCHAR(50),
    Product VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2),
    OrderDate DATE
);
```
## Insertion Of Records:
```sql
INSERT INTO CustomerOrders
(CustomerName, Product, Quantity, Price, OrderDate)
VALUES
('Aarav', 'Laptop', 1, 65000, '2025-01-10'),
('Neha', 'Mobile', 2, 40000, '2025-01-12'),
('Rohit', 'Laptop', 1, 70000, '2025-01-15'),
('Priya', 'Tablet', 3, 45000, '2025-01-18'),
('Karan', 'Mobile', 1, 20000, '2025-01-20'),
('Simran', 'Laptop', 2, 130000, '2025-01-22'),
('Aman', 'Tablet', 2, 30000, '2025-01-25'),
('Riya', 'Mobile', 3, 60000, '2025-01-26'),
('Vikas', 'Laptop', 1, 68000, '2025-01-28'),
('Pooja', 'Tablet', 1, 15000, '2025-01-30');
```
## Output:

<img width="1090" height="436" alt="544333566-0dfa316a-f071-48fd-8f8b-4995dbca3870" src="https://github.com/user-attachments/assets/22a500a8-7001-400d-809b-0da2690af5b3" />

## 🔹 Step 2: Filtering Data Using Conditions

```sql
SELECT *
FROM CustomerOrders
WHERE Price > 50000;
Query (With CASE Statement):

SELECT *
FROM CustomerOrders
WHERE
    CASE
        WHEN Price > 50000 THEN 1
        ELSE 0
    END = 1;
```
## Output:

<img width="1090" height="264" alt="544333696-eed0270b-72ff-4714-bcdf-c62d57f835e7" src="https://github.com/user-attachments/assets/12fd9a7a-53fd-458c-a088-ee147555a12e" />

## 🔹 Step 3: Sorting Query Results

```sql
SELECT *
FROM CustomerOrders
ORDER BY Price ASC;
```
## Output:

<img width="849" height="354" alt="544333804-d42aa4e8-f18b-4795-9480-1677a2e7e142" src="https://github.com/user-attachments/assets/3d71b6f4-59cd-43c3-a092-8a6d3020c4a8" />

Sort Orders by Price (Descending):

```sql
SELECT *
FROM CustomerOrders
ORDER BY Price DESC;
```
## Output:

<img width="906" height="374" alt="544333875-f9e49abb-0665-4f01-a331-12936a6f2ddc" src="https://github.com/user-attachments/assets/47d28de8-6eff-4a4d-829d-4eb5d1bae80b" />

Sort Using Multiple Columns:

```sql
SELECT *
FROM CustomerOrders
ORDER BY Product ASC, Price DESC;
```
## Output:

<img width="767" height="324" alt="544334004-0b2d91ae-19bd-406f-80d5-12e4f26ad7fb" src="https://github.com/user-attachments/assets/bf24acfb-e5b0-4f2f-b8c9-af583df5308b" />

## 🔹 Step 4: Grouping Data for Aggregation

```sql
SELECT
    Product,
    SUM(Price) AS TotalSales
FROM CustomerOrders
GROUP BY Product;
```
## Output:

<img width="448" height="180" alt="544334100-81681176-b8cc-4dd4-93f3-863f2230529b" src="https://github.com/user-attachments/assets/a1783529-be23-43ca-a1a2-6b5119f953b7" />

Average Price of Each Product:

```sql
SELECT
    Product,
    AVG(Price) AS AveragePrice
FROM CustomerOrders
GROUP BY Product;
```
## Output:

<img width="443" height="200" alt="544334194-11ada861-199b-4fe1-be3a-9c6ed58fba3d" src="https://github.com/user-attachments/assets/cd55189a-1d30-4e65-9415-96a5eccf3fa6" />

## 🔹 Step 5: Applying Conditions on Aggregated Data
```sql
SELECT
    Product,
    SUM(Price) AS TotalSales
FROM CustomerOrders
GROUP BY Product
HAVING SUM(Price) > 100000;
```
## Output:

<img width="444" height="152" alt="544334257-abc1e9fd-7be0-489d-96de-2c18d3c9906c" src="https://github.com/user-attachments/assets/4eb72efa-a052-4f5d-8977-4411e16cc514" />

Row-Level Filtering (Using WHERE):

```sql
SELECT
    Product,
    SUM(Price) AS TotalSales
FROM CustomerOrders
WHERE Price > 50000
GROUP BY Product;
```

## Output:

<img width="448" height="147" alt="544334347-ad04252a-763c-4894-bf9e-203f4ffe2862" src="https://github.com/user-attachments/assets/4da800b1-3987-448b-83b3-b5d69ae23cad" />

## 🔹 Step 6: Conceptual Understanding of Filtering vs Aggregation Conditions

```sql
SELECT Product, SUM(Price)
FROM CustomerOrders
WHERE SUM(Price) > 100000
GROUP BY Product;
Correct Usage:

SELECT Product, SUM(Price) AS TotalSales
FROM CustomerOrders
GROUP BY Product
HAVING SUM(Price) > 100000;
```
## Output:

<img width="444" height="152" alt="544334430-1f6c48e2-ac53-4a4c-8e20-d5b93dcdf41a" src="https://github.com/user-attachments/assets/2a87d753-4323-4db9-a2fc-6bf17917cf7a" />

## 📚 Learning Outcomes
- Understand how to create relational database tables using appropriate data types and constraints
- Learn to retrieve required data from a table using row-level filtering with the WHERE clause
- Gain the ability to apply column-level (group-level) filtering using the HAVING clause
- Develop practical knowledge of using CASE statements for conditional logic in SQL queries
- Understand the use of aggregate functions such as SUM(), AVG(), and COUNT() for analytical reporting
- Clearly differentiate between row-level filtering and group-level filtering, and apply them correctly in real-world SQL scenarios
