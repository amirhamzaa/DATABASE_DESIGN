-- 1. Subscription Plan Table
CREATE TABLE SubscriptionPlan (
    plan_id INT PRIMARY KEY AUTO_INCREMENT,
    plan_name VARCHAR(50) UNIQUE NOT NULL,
    monthly_fee DECIMAL(10,2),
    product_listing_limit INT,
    commission_percentage DECIMAL(5,2),
    features TEXT
);

-- 2. Vendor Table
CREATE TABLE Vendor (
    vendor_id INT PRIMARY KEY AUTO_INCREMENT,
    business_name VARCHAR(100) NOT NULL,
    owner_name VARCHAR(100),
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    business_address TEXT,
    vat_number VARCHAR(50),
    join_date DATE,
    account_status VARCHAR(20) CHECK (account_status IN ('Active','Suspended')),
    plan_id INT,
    FOREIGN KEY (plan_id) REFERENCES SubscriptionPlan(plan_id)
);

-- 3. Product Table
CREATE TABLE Product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    vendor_id INT,
    product_name VARCHAR(100),
    brand VARCHAR(100),
    base_price DECIMAL(10,2),
    description TEXT,
    status VARCHAR(20) CHECK (status IN ('Active','Inactive')),
    FOREIGN KEY (vendor_id) REFERENCES Vendor(vendor_id)
);

-- 4. Product Variation
CREATE TABLE ProductVariation (
    variation_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    size VARCHAR(50),
    color VARCHAR(50),
    additional_price DECIMAL(10,2),
    sku VARCHAR(100) UNIQUE NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- 5. ProductCategory (M:N)
CREATE TABLE ProductCategory (
    product_id INT,
    category_id INT,
    PRIMARY KEY (product_id, category_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

-- 6. WarehouseStock Table
CREATE TABLE WarehouseStock (
    warehouse_id INT,
    variation_id INT,
    quantity INT,
    PRIMARY KEY (warehouse_id, variation_id),
    FOREIGN KEY (warehouse_id) REFERENCES Warehouse(warehouse_id),
    FOREIGN KEY (variation_id) REFERENCES ProductVariation(variation_id)
);