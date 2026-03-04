-- 21 Total revenue per vendor
SELECT vendor_id, SUM(subtotal) AS total_revenue
FROM OrderItem
GROUP BY vendor_id;

-- 22 Customers buying from >2 vendors
SELECT customer_id
FROM Orders o
JOIN OrderItem oi ON o.order_id = oi.order_id
GROUP BY customer_id
HAVING COUNT(DISTINCT vendor_id) > 2;

-- 23 Monthly sales summary
SELECT MONTH(order_date) AS month,
SUM(total_amount) AS monthly_sales
FROM Orders
WHERE YEAR(order_date)=YEAR(CURDATE())
GROUP BY MONTH(order_date);

-- 24 Vendors exceeding product limit
SELECT v.vendor_id, COUNT(p.product_id) AS total_products,
sp.product_listing_limit
FROM Vendor v
JOIN Product p ON v.vendor_id=p.vendor_id
JOIN SubscriptionPlan sp ON v.plan_id=sp.plan_id
GROUP BY v.vendor_id
HAVING total_products > sp.product_listing_limit;

-- 25 Rank vendors by sales (CTE)
WITH VendorSales AS (
    SELECT vendor_id, SUM(subtotal) AS total_sales
    FROM OrderItem
    GROUP BY vendor_id
)
SELECT vendor_id, total_sales,
RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
FROM VendorSales;