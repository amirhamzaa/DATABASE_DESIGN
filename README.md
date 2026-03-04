# DATABASE_DESIGN
Identified Entities (More than 10)
1. Vendor

vendor_id (PK)

business_name

owner_name

email (unique)

phone

business_address

vat_number

join_date

account_status

plan_id (FK)

2. SubscriptionPlan

plan_id (PK)

plan_name

monthly_fee

product_listing_limit

commission_percentage

features

3. Warehouse

warehouse_id (PK)

vendor_id (FK)

warehouse_name

location

capacity

4. Product

product_id (PK)

vendor_id (FK)

product_name

brand

base_price

description

status

5. ProductVariation

variation_id (PK)

product_id (FK)

size

color

additional_price

sku (unique)

6. Category

category_id (PK)

category_name

description

7. ProductCategory (Associative Entity)

product_id (FK)

category_id (FK)
(PK = product_id + category_id)

8. WarehouseStock (Associative Entity)

warehouse_id (FK)

variation_id (FK)

quantity
(PK = warehouse_id + variation_id)

9. Customer

customer_id (PK)

full_name

email (unique)

phone

address

registration_date

status

10. Order

order_id (PK)

customer_id (FK)

order_date

order_status

total_amount

11. OrderItem (Weak Entity)

order_item_id (PK)

order_id (FK)

variation_id (FK)

vendor_id (FK)

quantity

unit_price

subtotal

12. Payment (1:1 with Order)

payment_id (PK)

order_id (FK, UNIQUE)

payment_method

amount

payment_date

payment_status

13. Return

return_id (PK)

order_id (FK)

variation_id (FK)

reason

return_status

request_date

 Relationship Summary

Vendor → SubscriptionPlan (N:1)

Vendor → Warehouse (1:N)

Vendor → Product (1:N)

Product → ProductVariation (1:N)

Product ↔ Category (M:N via ProductCategory)

Warehouse ↔ ProductVariation (M:N via WarehouseStock)

Customer → Order (1:N)

Order → OrderItem (1:N)

Order → Payment (1:1)

OrderItem → ProductVariation (N:1)

Order → Return (1:N)

3. Weak & Associative Entities

Weak Entity:

OrderItem

Associative Entities:

ProductCategory

WarehouseStock
