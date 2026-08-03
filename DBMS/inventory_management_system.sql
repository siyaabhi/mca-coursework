Section B: Inventory Management System

Table 1: SUPPLIER

create table supplier(supplier_id varchar2 (20) constraint suppl_id_pk primary key ,
 supplier_name varchar2 (20) not null,
 contact_person varchar2(20),
 mobile_number number(10), 
email_id varchar2(20) constraint emailid_unq unique, 
address varchar2(20),
 city varchar2(20));

INSERT INTO supplier VALUES ('S001','ABC Traders','Rahul',9876543210,'abc@gmail.com','MG Road','Kochi');

INSERT INTO supplier VALUES ('S002','Tech Supplies','Anil',9876543211,'tech@gmail.com','Market Road','Thrissur');

INSERT INTO supplier VALUES ('S003','Global Distributors','Riya',9876543212,'global@gmail.com','Main Road','Kottayam');


Table 2: CATEGORY

create table category( category_id varchar2(20) constraint catid primary key, 
category_name varchar2(20) not null constraint catname_unq unique,
description varchar2(20));

INSERT INTO category VALUES ('C001','Electronics','Electronic Items');

INSERT INTO category VALUES ('C002','Furniture','Home Furniture');

INSERT INTO category VALUES ('C003','Stationery','Office Supplies');


Table 3: PRODUCT

CREATE TABLE product(
    product_id VARCHAR2(20) CONSTRAINT productid_pk PRIMARY KEY,
    product_name VARCHAR2(20) NOT NULL,
    category_id VARCHAR2(20),
    supplier_id VARCHAR2(20),
    unit_price NUMBER(10,2) CHECK (unit_price > 0),
    reorder_level NUMBER CHECK (reorder_level >= 0),
    quantity_available NUMBER CHECK (quantity_available >= 0),

    CONSTRAINT catid_fk
        FOREIGN KEY (category_id)
        REFERENCES category(category_id),

    CONSTRAINT suppid_fk
        FOREIGN KEY (supplier_id)
        REFERENCES supplier(supplier_id)
);

INSERT INTO product VALUES ('P001','Laptop','C001','S001',50000,5,20);

INSERT INTO product VALUES ('P002','Chair','C002','S002',2500,10,50);

INSERT INTO product VALUES ('P003','Notebook','C003','S003',50,100,500);


Table 4: PURCHASE
CREATE TABLE purchase (
    purchase_id VARCHAR2(20) CONSTRAINT purcid_pk PRIMARY KEY,
    supplier_id VARCHAR2(20)
        CONSTRAINT supid_fk
        REFERENCES supplier(supplier_id),
    purchase_date DATE DEFAULT CURRENT_DATE,

    total_amount NUMBER(10,2)
        CHECK (total_amount >= 0)
);

INSERT INTO purchase(purchase_id,supplier_id,total_amount)
VALUES ('PU001','S001',100000);

INSERT INTO purchase(purchase_id,supplier_id,total_amount)
VALUES ('PU002','S002',25000);

INSERT INTO purchase(purchase_id,supplier_id,total_amount)
VALUES ('PU003','S003',5000);


Table 5: PURCHASE_ITEM
CREATE TABLE purchase_item (
    purchase_item_id VARCHAR2(20) CONSTRAINT purc_itemid_pk PRIMARY KEY,
    purchase_id VARCHAR2(20),
    product_id VARCHAR2(20),

    quantity_purchased NUMBER CHECK(quantity_purchased > 0),
    purchase_price NUMBER CHECK(purchase_price > 0),

    CONSTRAINT purcid_fk
        FOREIGN KEY (purchase_id)
        REFERENCES purchase(purchase_id),

    CONSTRAINT proid_fk
        FOREIGN KEY (product_id)
        REFERENCES product(product_id),

    CONSTRAINT pur_pro_unq
        UNIQUE(purchase_id, product_id)
);

INSERT INTO purchase_item VALUES ('PI001','PU001','P001',2,50000);

INSERT INTO purchase_item VALUES ('PI002','PU002','P002',10,2500);

INSERT INTO purchase_item VALUES ('PI003','PU003','P003',100,50);


Table 6: CUSTOMER
create table customer( customer_id varchar2(20) constraint custid_pk primary key, 
customer_name varchar2(20) not null, 
mobile_number number, 
email_id varchar2(20) constraint email_id_unq unique, 
address varchar2(20), city varchar2(20));

INSERT INTO customer VALUES ('CU001','Arun',9876500001,'arun@gmail.com','Kaloor','Kochi');

INSERT INTO customer VALUES ('CU002','Meera',9876500002,'meera@gmail.com','East Fort','Thrissur');

INSERT INTO customer VALUES ('CU003','John',9876500003,'john@gmail.com','Collectorate','Kottayam');


Table 7: SALES
CREATE TABLE sales(
    sales_id VARCHAR2(20) CONSTRAINT salesid_pk PRIMARY KEY,

    customer_id VARCHAR2(20)
        CONSTRAINT custid_fk
        REFERENCES customer(customer_id),

    sales_date DATE DEFAULT CURRENT_DATE,

    total_amount NUMBER(10,2)
        CHECK (total_amount >= 0),

    payment_status VARCHAR2(25)
        CHECK (payment_status IN ('paid','unpaid','partial'))
);

INSERT INTO sales(sales_id,customer_id,total_amount,payment_status)
VALUES ('SA001','CU001',55000,'paid');

INSERT INTO sales(sales_id,customer_id,total_amount,payment_status)
VALUES ('SA002','CU002',5000,'partial');

INSERT INTO sales(sales_id,customer_id,total_amount,payment_status)
VALUES ('SA003','CU003',500,'unpaid');

Table 8: SALES_ITEM
CREATE TABLE sales_item(
    sales_item_id VARCHAR2(20)
        CONSTRAINT salesitemid_pk PRIMARY KEY,

    sales_id VARCHAR2(20)
        CONSTRAINT fk_sales
        REFERENCES sales(sales_id),

    product_id VARCHAR2(20)
        CONSTRAINT fk_product
        REFERENCES product(product_id),

    quantity_sold NUMBER
        CHECK (quantity_sold > 0),

    selling_price NUMBER(10,2)
        CHECK (selling_price > 0),

    CONSTRAINT sales_pro_unq
        UNIQUE (sales_id, product_id)
);

INSERT INTO sales_item VALUES ('SI001','SA001','P001',1,55000);

INSERT INTO sales_item VALUES ('SI002','SA002','P002',2,2500);

INSERT INTO sales_item VALUES ('SI003','SA003','P003',10,50);

Table 9: PAYMENT
CREATE TABLE payment(
    payment_id VARCHAR2(20)
        CONSTRAINT paymentid_pk PRIMARY KEY,

    sales_id VARCHAR2(20)
        CONSTRAINT salesid_fk
        REFERENCES sales(sales_id),

    payment_date DATE DEFAULT CURRENT_DATE,

    amount_paid NUMBER(10,2)
        CHECK (amount_paid >= 0),

    payment_mode VARCHAR2(25)
        CHECK (payment_mode IN ('cash','card','upi','bank_transfer'))
);

INSERT INTO payment(payment_id,sales_id,amount_paid,payment_mode)
VALUES ('PAY001','SA001',55000,'cash');

INSERT INTO payment(payment_id,sales_id,amount_paid,payment_mode)
VALUES ('PAY002','SA002',2500,'upi');

INSERT INTO payment(payment_id,sales_id,amount_paid,payment_mode)
VALUES ('PAY003','SA003',0,'bank_transfer');






