

SELECT * FROM orders

--List unique genders
SELECT DISTINCT(gender) FROM orders

--Delete null gender records
DELETE FROM orders WHERE gender IS NULL

--List order count by agegroup
SELECT agegroup, COUNT(*) AS ordercount FROM orders GROUP BY agegroup

--List order status wise count
SELECT status, COUNT(*) AS ordercount FROM orders GROUP BY status

--Top 5 state 
SELECT TOP 5 ship_state ,SUM (amount) AS TOTALORDER FROM orders  GROUP BY ship_state ORDER BY TOTALORDER DESC

-- ORDER BY GENDER
SELECT agegroup, count(orderid)as Totalorders, sum(amount) TotalAmount from orders  group by agegroup

--ORDER BY CHANNEL
SELECT channel , COUNT(channel) AS Totalorders  FROM orders group by channel order by Totalorders DESC

-- TOTAL-ORDER BY AGEGROUP 
SELECT agegroup, COUNT(orderid) AS TotalOrders FROM orders GROUP BY agegroup

-- TOTAL-ORDER BY MONTHS
SELECT monthname , COUNT(orderid) AS total FROM orders GROUP BY monthname

ALTER TABLE orders ADD TAMOUNT INT
INSERT INTO orders (TAMOUNT) VALUES (2703)



--select DISTINCT(channel) FROM orders


--Give in Percentage
SELECT *, (total * 100.0/ alltotal) AS percentage FROM (
SELECT monthname , COUNT(orderid) AS total, 
(SELECT COUNT(*) FROM orders) AS alltotal 
FROM orders GROUP BY monthname) AS SRC