--Bai1: Liet ke ten nhom san pham va san pham nao cua category nao
SELECT 
    c.CategoryName,
    p.ProductName
FROM dbo.Products p
JOIN dbo.Categories c ON p.CategoryID = c.CategoryID

--Bai2 Lay thong tin don hang va thong tin khach hang. bang order voi bang customer
SELECT 
    o.OrderID AS [Mã Đơn Hàng],
    o.OrderDate AS [Ngày Đặt Hàng],
    o.RequiredDate AS [Ngày Yêu Cầu],
    o.ShippedDate AS [Ngày Giao Hàng],
    c.CompanyName AS [Tên Công Ty],
    c.City AS [Thành Phố],
    c.Country AS [Quốc Gia],
    o.Freight AS [Phí Vận Chuyển]
FROM 
    dbo.Orders o
INNER JOIN 
    dbo.Customers c ON o.CustomerID = c.CustomerID
ORDER BY 
    o.OrderDate DESC;

3. Liệt kê tên nhân viên xử lý thông tin các đơn hàng
SELECT 
    e.FirstName + ' ' + e.LastName AS [Tên Nhân Viên],
    COUNT(o.OrderID) AS [Số Đơn Hàng Đã Xử Lý],
    MIN(o.OrderDate) AS [Đơn Hàng Sớm Nhất],
    MAX(o.OrderDate) AS [Đơn Hàng Muộn Nhất]
FROM 
    dbo.Orders o
JOIN 
    dbo.Employees e ON o.EmployeeID = e.EmployeeID
GROUP BY 
    e.EmployeeID, e.FirstName, e.LastName
ORDER BY 
    [Số Đơn Hàng Đã Xử Lý] DESC;

4. Thông tin nhân viên và người quản lý
SELECT 
    e.EmployeeID AS [Mã NV],
    e.FirstName + ' ' + e.LastName AS [Tên Nhân Viên],
    e.Title AS [Chức Vụ NV],
    e.BirthDate AS [Ngày Sinh],
    e.HireDate AS [Ngày Vào Làm],
    CONCAT(m.FirstName, ' ', m.LastName) AS [Tên Quản Lý],
    m.Title AS [Chức Vụ Quản Lý]
FROM 
    dbo.Employees e
JOIN 
    dbo.Employees m ON e.ReportsTo = m.EmployeeID
ORDER BY 
    [Tên Quản Lý], [Tên Nhân Viên];

5. Thông tin nhân viên, và đi làm năm bao nhiêu tuổi
SELECT 
    e.EmployeeID AS [Mã NV],
    e.FirstName + ' ' + e.LastName AS [Họ Và Tên],
    e.Title AS [Chức Vụ],
    e.BirthDate AS [Ngày Sinh],
    e.HireDate AS [Ngày Vào Làm],
    YEAR(e.HireDate) - YEAR(e.BirthDate) AS [Tuổi Khi Đi Làm]
FROM 
    dbo.Employees e
ORDER BY 
    [Tuổi Khi Đi Làm] DESC;

