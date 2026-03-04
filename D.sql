-- 15 Vendors with plan info
SELECT v.business_name, sp.plan_name, sp.commission_percentage
FROM Vendor v
JOIN SubscriptionPlan sp ON v.plan_id = sp.plan_id;

-- 16 Products with total stock
SELECT p.product_name, SUM(ws.quantity) AS total_stock
FROM Product p
JOIN ProductVariation pv ON p.product_id = pv.product_id
JOIN WarehouseStock ws ON pv.variation_id = ws.variation_id
GROUP BY p.product_name;

-- 17 Orders in last 30 days
SELECT *
FROM Orders
WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

-- 18 Top 5 Best Selling Variations
SELECT variation_id, SUM(quantity) AS total_sold
FROM OrderItem
GROUP BY variation_id
ORDER BY total_sold DESC
LIMIT 5;

-- 19 Customers who requested returns
SELECT DISTINCT c.full_name
FROM Customer c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Return r ON o.order_id = r.order_id;

-- 20 Delivered but not Paid
SELECT o.order_id
FROM Orders o
JOIN Payment p ON o.order_id = p.order_id
WHERE o.order_status='Delivered'
AND p.payment_status!='Paid';