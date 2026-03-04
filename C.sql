-- 9 Insert Standard Plan
INSERT INTO SubscriptionPlan
(plan_name, monthly_fee, product_listing_limit, commission_percentage)
VALUES ('Standard',3000,200,8);

-- 10 Insert Vendor
INSERT INTO Vendor
(business_name, owner_name, email, account_status, plan_id)
VALUES ('TechZone Ltd.','Rahim Ahmed','techzone@gmail.com','Active',2);

-- 11 Insert Product
INSERT INTO Product
(vendor_id, product_name, brand, base_price, status)
VALUES (1,'Smartphone','Samsung',50000,'Active');

-- 12 Insert Variation
INSERT INTO ProductVariation
(product_id,size,color,sku)
VALUES (1,'128GB','Black','SP128B');

-- 13 Update Stock
UPDATE WarehouseStock
SET quantity = 25
WHERE warehouse_id = 1 AND variation_id = 1;

-- 14 Delete Inactive Customer
DELETE FROM Customer
WHERE status = 'Inactive';