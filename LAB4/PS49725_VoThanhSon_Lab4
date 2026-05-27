---Bai 1
SELECT 
    category_id,
    MAX(list_price) AS gia_lon_nhat,
    MIN(list_price) AS gia_nho_nhat
FROM production.products
GROUP BY category_id
HAVING MAX(list_price) > 4000 AND MIN(list_price) < 500;

--Bai2
SELECT 
    category_id,
    AVG(list_price) AS gia_trung_binh
FROM production.products
GROUP BY category_id
HAVING AVG(list_price) BETWEEN 500 AND 1000;

--Bai3 
SELECT 
    order_id,
    SUM(quantity * list_price * (1 - discount)) AS net_value
FROM sales.order_items
GROUP BY order_id
HAVING SUM(quantity * list_price * (1 - discount)) BETWEEN 19000 AND 25000;