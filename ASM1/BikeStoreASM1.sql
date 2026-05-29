--Bai 1--Hiển thị first_name, last_name, state của tất cả các khách hàng ở NewYork và sắp xếp theo thứ tự tăng dần của first_name.
SELECT 
first_name + ' ' + last_name AS HOVATEN, 
state as ThanhPho
FROM sales.customers
WHERE state = 'NY'
ORDER BY first_name ASC;

--Bai2 Đếm tổng số các khách hàng theo từng thành phố thuộc bang NY, hiển thị ra những thành phố có số lượng khách hàng lớn hơn hoặc bằng 10 và sắp xếp theo thứ tự giảm dần của city. 
SELECT 
    city,
    COUNT(*) AS so_luong_khach_hang
FROM sales.customers
WHERE state = 'NY'
GROUP BY city
HAVING COUNT(*) >= 10
ORDER BY city DESC;

-- Bai 3 Đếm số lượng các đơn đặt hàng theo từng năm. 
SELECT 
    YEAR(order_date) AS nam,
    COUNT(*) AS so_luong_don_hang
FROM sales.orders
GROUP BY YEAR(order_date)
ORDER BY nam ASC;


-- Bài 4 Tìm các khách hàng có tên bắt đầu bằng chữ “W” hoặc kết thúc bằng chữ “a”. 
SELECT first_name, last_name

FROM sales.customers
WHERE   first_name like 'W%'
    OR  first_name like '%a'
    OR  last_name like 'W%'
    OR  last_name LIKE  '%a'

-- Bài 5 Tìm các sản phẩm có năm sản xuất 2018 và có giá lớn hơn 1000. 
SELECT 
product_name, model_year, list_price

FROM production.products
WHERE model_year = 2018
AND   list_price > 1000 

--Bai 6 Tìm các đơn đặt hàng có ngày đặt hàng từ tháng 2 năm 2016 đến tháng 2 năm 2017. Hãy cho biết tháng nào có số lượng đơn đặt hàng cao nhất. 
SELECT 
    YEAR(order_date) AS [Nam],
    MONTH(order_date) AS [Thang],
    COUNT(*) AS [SoLuongDonHang]
FROM sales.orders
WHERE order_date >= '2016-02-01'
  AND order_date <= '2017-02-28'
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY [SoLuongDonHang] DESC;