SELECT 
    p.product_id AS [Mã Sản Phẩm],
    p.product_name AS [Tên Sản Phẩm],
    b.brand_name AS [Thương Hiệu],
    st.store_name AS [Tên Cửa Hàng],
    s.quantity AS [Số Lượng Tồn Kho]
FROM production.products p
JOIN production.brands b ON p.brand_id = b.brand_id
JOIN production.categories c ON p.category_id = c.category_id
JOIN production.stocks s ON p.product_id = s.product_id
JOIN sales.stores st ON s.store_id = st.store_id
ORDER BY p.product_name, st.store_name;

SELECT 
    p.product_name AS [Tên Sản Phẩm],
    st.store_name AS [Tên Cửa Hàng],
    s.quantity AS [Tồn Kho]
FROM production.products p
JOIN production.stocks s ON p.product_id = s.product_id
JOIN sales.stores st ON s.store_id = st.store_id
WHERE s.quantity < 10
ORDER BY s.quantity ASC, p.product_name;



SELECT 
    p.product_name AS [Tên Sản Phẩm],
    st.store_name AS [Tên Cửa Hàng],
    s.quantity AS [Tồn Kho]
FROM production.products p,
     production.stocks s,
     sales.stores st
WHERE p.product_id = s.product_id
  AND s.store_id = st.store_id
  AND s.quantity < 10
ORDER BY s.quantity ASC, p.product_name;