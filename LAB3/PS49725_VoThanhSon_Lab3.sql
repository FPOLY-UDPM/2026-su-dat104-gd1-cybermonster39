--Bai 1
SELECT first_name, last_name

FROM sales.customers
WHERE   first_name like 'W%'
    OR  first_name like '%a'
    OR  last_name like 'W%'
    OR  last_name LIKE  '%a'

--Bai 2
SELECT product_name, model_year, list_price

FROM production.products
WHERE model_year = 2018
AND   list_price > 1000 

--Bai 3 tim cac don dat hang
SELECT  order_id,
        order_date as [Thang_nam]

FROM sales.orders
WHERE order_date >= '2016-02-01'
AND     order_date <= '2017-02-28'
ORDER BY order_date 

-- Bai 3 - Phần 2: dem so luong theo thang
SELECT 
    YEAR(order_date) AS [Nam],
    MONTH(order_date) AS [Thang],
    COUNT(*) AS [SoLuongDonHang]
FROM sales.orders
WHERE order_date >= '2016-02-01'
  AND order_date <= '2017-02-28'
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY [SoLuongDonHang] DESC;