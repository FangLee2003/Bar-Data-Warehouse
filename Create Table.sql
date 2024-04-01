CREATE TABLE [DIM_Vendor] (
    [vendor_key] varchar(50) PRIMARY KEY,
    [vendor_name] nvarchar(255),
    [vendor_number] float,
)
CREATE TABLE [DIM_Store] (
    [store_key] varchar(50) PRIMARY KEY,
    [store_number] float,
    [store_name] nvarchar(255),
    [store_location] nvarchar(255),
)
CREATE TABLE [DIM_Category] (
    [category_key] varchar(50) PRIMARY KEY,
    [category] float,
    [category_name] nvarchar(255),
    [pack] float,
)
CREATE TABLE [DIM_Item] (
    [item_key] varchar(50) PRIMARY KEY,
    [item_number] float,
    [item_description] nvarchar(255),
    [bottle_volume_ml] float,
    [state_bottle_cost] float,
    [state_bottle_retail] float,
)
CREATE TABLE [DIM_Invoice] (
    [invoice_key] varchar(50) PRIMARY KEY,
    [invoice_and_item_number] nvarchar(255),
    [sale_dollars] float,
    [bottles_sold] float,
    [volume_sold_liters] float,
    [volume_sold_gallons] float,
)
CREATE TABLE [DIM_Location] (
    [location_key] varchar(50) PRIMARY KEY,
    [city] nvarchar(255),
    [county] nvarchar(255),
    [address] nvarchar(255),
    [zip_code] float,
    [county_number] float,
)
CREATE TABLE [DIM_Time] (
    [time_key] varchar(50) PRIMARY KEY,
    [date] datetime, -- Derived Column.date
    [month] int,
    [quarter] int,
    [year] int,
)
CREATE TABLE [FACT_Sales] (
    [vendor_key] varchar(50),
    [time_key] varchar(50),
    [item_key] varchar(50),
    [category_key] varchar(50),
    [cost] numeric(29,0),
    [revenue] numeric(18,0),
    [profit] numeric(30,0),
    [store_key] varchar(50),
    [invoice_key] varchar(50),
    [location_key] varchar(50),
 CONSTRAINT FK_Vendor FOREIGN KEY (vendor_key) REFERENCES DIM_Vendor(vendor_key),
 CONSTRAINT FK_Time FOREIGN KEY (time_key) REFERENCES DIM_Time(time_key),
 CONSTRAINT FK_Item FOREIGN KEY (item_key) REFERENCES DIM_Item(item_key),
 CONSTRAINT FK_Category FOREIGN KEY (category_key) REFERENCES DIM_Category(category_key),
 CONSTRAINT FK_Store FOREIGN KEY (store_key) REFERENCES DIM_Store(store_key),
 CONSTRAINT FK_Invoice FOREIGN KEY (invoice_key) REFERENCES DIM_Invoice(invoice_key),
 CONSTRAINT FK_Location FOREIGN KEY (location_key) REFERENCES DIM_Location(location_key),
)
CREATE TABLE [FACT_Amount] (
    [invoice_key] varchar(50),
    [time_key] varchar(50),
    [store_key] varchar(50),
    [total_volume_sold_in_gallons] numeric(18,0),
    [total_volume_sold_in_liters] numeric(18,0),
    [total_bottles_sold] bigint
 CONSTRAINT FK_Invoice_2 FOREIGN KEY (invoice_key) REFERENCES DIM_Invoice(invoice_key),
 CONSTRAINT FK_Time_2 FOREIGN KEY (time_key) REFERENCES DIM_Time(time_key),
 CONSTRAINT FK_Store_2 FOREIGN KEY (store_key) REFERENCES DIM_Store(store_key),
)