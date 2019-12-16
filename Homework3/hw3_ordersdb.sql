drop table if exists CUSTOMER;
drop table if exists PERSONALINFO;
drop table if exists BILLINGINFO;
drop table if exists ORDER;
drop table if exists CART;
drop table if exists SHIPPER;
drop table if exists SUPPLIER;
drop table if exists PRODUCT;
drop table if exists ADMIN;
drop table if exists Category;
drop table if exists OrderDetails;




create table CUSTOMER(
CustomerID char(6),
ContactName varchar(20),
FirstName varchar(10),
LastNamevarchar(10),
PRIMARY KEY (CustomerID)
);

create table PERSONALINFO(
PersonalID char(6),
CusID char(6),
Phone char(10),
Email varchar(20),
City varchar(15),
PRIMARY KEY(PersonalID, CusID),
FOREIGN KEY (CusID) REFERENCES Customer(CustomerID)
);

create table BILLINGINFO(
BillingID varchar(6),
BillDate Date,
CUST_REP char(3),
CreditCardID varchar(16),
BillingAddress varchar (30),
CreditCardExpDate Date,
Pin char(4),
BCusID varchar(6),
PRIMARY KEY (BillingID),
FOREIGN KEY (BCusID) REFERENCES Customer(CustomerID)
);

create table ORDER(
OrderID char(10),
CustID varchar(6),
OrderDate Date,
RequiredDate Date,
ShippedDate Date,
ShID varchar(4),
Freight varchar(10),
ShippedVia varchar(10),
TimeStamp Date,
PRIMARY KEY (OrderID,CustID),
FOREIGN KEY (ShID) REFERENCES Shipper(ShippderID)
);

create table CARTS(
CartId varchar(8),
TotalPrice decimal(10,2),
NoOfProducts int,
CstmrID varchar(6),
PRIMARY KEY (CartId),
);

create table SHIPPER(
ShipperID varchar(4),
Phone char(10),
Co.Name varchar(10),
PRIMARY KEY (ShipperID)
);

create table SUPPLIER(
SupplierID varchar(4),
ContactFname varchar(10),
ContactLname varchar(10),
ContactTitle varchar(10),
SCompanyName varchar(10),
PRIMARY KEY (SupplierID)
);

create table PRODUCT(
ProductID varchar(8),
AdID varchar(6),
CatID varchar(4),
ProductNo varchar(7),
ProdDesc varchar(10),
QtyPerUnit int,
UnitPrice decimal(10,2),
UnitWeight decimal(10,2),
StockCount int,
UnitsOnOrder int,
Discnt int,
Reorderlvl int,
Color varchar(10),
SupplrID varchar(4),
PRIMARY KEY ProductID,
FOREIGN KEY (SupplrID) REFERENCES Supplier(SupplierID),
FOREIGN KEY (AdID) REFERENCES Admin(AdminID),
FOREIGN KEY (CatID) REFERENCES Category(CategoryID)
);

create table ADMIN(
AdminID varchar(6),
AdFname varchar(10),
AdLname varchar(10),
AdPword varchar(13),
PRIMARY KEY (AdminID)
);

create table CATEGORY(
CategoryID varchar(4),
Catname varchar(10),
CatDesc varchar(10),
PRIMARY KEY (CategoryID)
);


create table ORDERDETAILS(
OrdrID varchar(10),
PrdctID varchar(8),
Discount int,
OrderNo int,
Quantity int,
UniPrice decimal(10,2),
PRIMARY KEY (OrderID)
);



INSERT INTO CUSTOMER VALUES('012101', 'JBmiller', 'Brian', 'Miller');
INSERT INTO CUSTOMER VALUES('012102', 'JFisher', 'Jeff', 'Fisher');
INSERT INTO CUSTOMER VALUES('012103', 'TWater', 'Tim', 'Waters');
INSERT INTO CUSTOMER VALUES('012105', 'Spudinksi','Sally', 'Pudinski');
INSERT INTO CUSTOMER VALUES('012106', 'FLewis.', 'Fred', 'Lewis');

INSERT INTO PERSONALINFO VALUES ('122333','012101','4124049095','bmil@gmail.com','PittsBurgh');
INSERT INTO PERSONALINFO VALUES ('122334','012102','7133321990','jfish3@gmail.com','Houston');
INSERT INTO PERSONALINFO VALUES ('122335','012103','7707768899','wat334@yahoo.com','Atlanta');
INSERT INTO PERSONALINFO VALUES ('122336','012104','8182136643','coangels@mail.com','Los Angeles');
INSERT INTO PERSONALINFO VALUES ('122337','012105','5053438771','nola883@yahoo.com','New Orleans','186042');

INSERT INTO BILLINGINFO VALUES ('400001','2019-01-11','6478123699632144','1120 Wilkins Street','2020-12-12','1233','012101');
INSERT INTO BILLINGINFO VALUES ('400002','2019-02-18','7078998712245631','4432 Char Avenue','2021-01-22','4456','012102');
INSERT INTO BILLINGINFO VALUES ('400003','2019-08-30','1220366484896569','6643 Dirt Road','2022-11-22','4677','012103');
INSERT INTO BILLINGINFO VALUES ('400004','2019-04-01','1998566548713223','5567 McCleary Street','2023-10-11','9123','012105');
INSERT INTO BILLINGINFO VALUES ('400005','2019-06-23','7144569881214477','2232 Brown Street','2022-03-30','1860','012106');

INSERT INTO ORDERS VALUES ('3333112961','012101','2019-01-05','2019-01-29','2019-01-08','2A44','intermodal','FedEx','2019-01-05 13:23:11');
INSERT INTO ORDERS VALUES ('3333112963','012102','2019-02-10','2019-02-24','2019-14-02','4100','ltl','UPS','2019-02-10 12:23:05');
INSERT INTO ORDERS VALUES ('3333112968','012103','2019-08-25','2019-04-08','2019-03-26','2A45','tl','XPO','2019-08-25 14:23:34');
INSERT INTO ORDERS VALUES ('3333112979','012105','2019-03-18','2019-06-31','2019-06-17','4101','tl','YRC','2019-03-18 11:34:55');
INSERT INTO ORDERS VALUES ('3333112976','012106','2019-06-15','2019-06-31','2019-06-17','0101','tl','ABF','2019-06-15 17:22:15');

INSERT INTO CART VALUES ('92478421','823.99',1,'012103');
INSERT INTO CART VALUES ('22147659','1299.99',3,'012105');
INSERT INTO CART VALUES ('78998745','563.44',1,'012101');
INSERT INTO CART VALUES ('10230478','684.45',1,'012106');
INSERT INTO CART VALUES ('03218786','735.77',1,'012102');

INSERT INTO SHIPPER VALUES ('0101','5557894421','ABF');
INSERT INTO SHIPPER VALUES ('4100','1117614899','UPS');
INSERT INTO SHIPPER VALUES ('2A45','2227889933','XPO');
INSERT INTO SHIPPER VALUES ('4101','3337889944','YRC');
INSERT INTO SHIPPER VALUES ('2A44','4445889762','FedEx');

INSERT INTO SUPPLIER VALUES ('B123','Chris','Wilkins','CW','LG');
INSERT INTO SUPPLIER VALUES ('B124','Michael','Haskins','Mike','Samsung');
INSERT INTO SUPPLIER VALUES ('B125','Vladimir','Korslov','Vlad','Titan Fitness');
INSERT INTO SUPPLIER VALUES ('B126','Jason','Johnson','Jay','Sony');
INSERT INTO SUPPLIER VALUES ('B127','Richard','Benson','Ben','Marcy Diamond');


INSERT INTO PRODUCTS VALUES ('QSA','XK48A','Reducer','177',37);
INSERT INTO PRODUCTS VALUES ('REI','2A44G','Hinge Pin','350',14);
INSERT INTO PRODUCTS VALUES ('REI','2A44L','Left Hinge','4500',12);
INSERT INTO PRODUCTS VALUES ('REI','2A44R','Right Hinge','4500',12);
INSERT INTO PRODUCTS VALUES ('REI','2A45C','Ratchet Link','79',210);

INSERT INTO ADMIN VALUES ('101101','Dan','Roberts','Akdsjw1');
INSERT INTO ADMIN VALUES ('102102','Sue','Smith','ODiwkd2');
INSERT INTO ADMIN VALUES ('103103','Paul','Cruz','Qofjs11');
INSERT INTO ADMIN VALUES ('104104','Bob','Smith','Wdfd403');
INSERT INTO ADMIN VALUES ('105105','Bill','Adams','Pfdiif2');

INSERT INTO CATEGORY VALUES ('Z101','Phone','Galaxy Note 10');
INSERT INTO CATEGORY VALUES ('Z102','TV','Sony WSKDJJ12');
INSERT INTO CATEGORY VALUES ('Z103','Fitness','Titan Leg Press');
INSERT INTO CATEGORY VALUES ('Z104','Kitchen Appliance','LG Freezer');
INSERT INTO CATEGORY VALUES ('Z105','Washer Dryer','LG Combo Cleaner');

INSERT INTO ORDERDETAILS VALUES ('101','Dan Roberts',45,'12','Sales Rep', '104', '1996-10-20','300000','305673');
INSERT INTO ORDERDETAILS VALUES ('102','Sue Smith',48,'21','Sales Rep','108','1996-12-10', '350000','474050');
INSERT INTO ORDERDETAILS VALUES ('103','Paul Cruz',29,'12','Sales Rep','104','1997-03-01', '275000','286775');
INSERT INTO ORDERDETAILS VALUES ('104','Bob Smith',33,'12','Sales Mrg','106','1997-05-19', '200000','142594');
INSERT INTO ORDERDETAILS VALUES ('105','Bill Adams',37,'13','Sales Rep','104','1996-02-12', '350000','367911');
