drop table AnonymousReview;
drop table RegisteredReview;
drop table Review;
drop table CategoryEntry;
drop table Category;
drop table OrderProduct;
drop table Inventory;
drop table Product;
drop table PickupOrder;
drop table PhysicalLocation;
drop table DeliveryOrder;
drop table Orders;
drop table AccountAddress;
drop table Address;
drop table AccountPermission;
drop table Account;

create table Account
(	
	AccountID int primary key,
	FirstName varchar(50),
	LastName varchar(50),
	Email varchar(250) not null,
	Phone varchar(20),
	Password varchar(40),
	DateCreated datetime,
	constraint uc_Email unique (Email)
);
--create table AccountPermission
--(
--	AccountPermissionID int primary key,
--	AccountID int not null,
--	Name varchar(50) not null,
--	foreign key (AccountID) references Account(AccountID)
--);
create table Address
(
	AddressID int primary key,
	Line1 varchar(100) not null,
	Line2 varchar(100),
	City varchar(50) not null,
	StateOrProvince varchar(2) not null,
	ZipCode varchar(20) not null,
	County varchar(2) not null
);
create table AccountAddress
(
	AccountAddressID int primary key,
	AddressID int not null,
	AccountID int not null,
	AddressType varchar(20) not null,
	foreign key (AddressID) references Address(AddressID),
	foreign key (AccountID) references Account(AccountID),
	constraint chk_AddressType check (addresstype in ('Mailing', 'Billing'))
);
create table Orders
(
	OrderID int primary key,
	AccountID int not null,
	CartID uniqueidentifier default newid() not null,
	OrderTotal decimal,
	DateCreated datetime not null,
	DatePlaced datetime
);

--create table DeliveryOrder
--(
--	DeliveryOrderID int primary key,
--	OrderID int not null,
--	AccountAddressID int not null,
--	foreign key (OrderID) references Orders(OrderID),
--	foreign key (AccountAddressID) references AccountAddress(AccountAddressID)
--);
--create table PhysicalLocation
--(
--	PhysicalLocationID int primary key,
--	Name varchar(50) not null,
--	LocationType varchar(20) not null,
--	constraint chk_LocationType check (locationtype in ('Store', 'Warehouse'))
--);
--create table PickupOrder
--(
--	PickupOrderID int primary key,
--	OrderID int not null,
--	PhysicalLocationID int not null,
--	foreign key (OrderID) references Orders(OrderID),
--	foreign key (PhysicalLocationID) references PhysicalLocation(PhysicalLocationID)
--);
create table Product
(
	ProductID int primary key,
	Name varchar(50) not null,
	Description text,
	Price decimal not null,
	DateCreated datetime not null default getdate()
);
--create table Inventory
--(
--	InventoryID int primary key,
--	PhysicalLocationID int not null,
--	ProductID int not null,
--	Count int not null,
--	foreign key (PhysicalLocationID) references PhysicalLocation(PhysicalLocationID),
--	foreign key (ProductID) references Product(ProductID)
--);
create table OrderProduct
(
	OrderProductID int primary key,
	ProductID int not null,
	OrderID int not null,
	Quantity int not null,
	foreign key (ProductID) references Product(ProductID),
	foreign key (OrderID) references Orders(OrderID)
);
create table Category
(
	CategoryID int primary key,
	Name varchar(50) not null
);
create table CategoryEntry
(
	CategoryEntryID int primary key,
	CategoryID int not null,
	ProductID int not null,
	foreign key (CategoryID) references Category(CategoryID),
	foreign key (ProductID) references Product(ProductID)
);
--create table Review
--(
--	ReviewID int primary key,
--	Title varchar(50) not null,
--	Description text
--);
--create table RegisteredReview
--(
--	RegisteredReviewID int primary key,
--	ReviewID int not null,
--	AccountID int not null,
--	foreign key (ReviewID) references Review(ReviewID),
--	foreign key (AccountID) references Account(AccountID)
--);
--create table AnonymousReview
--(
--	AnonymousReviewID int primary key,
--	ReviewID int not null,
--	AccountID int not null,
--	FirstName varchar(50) not null,
--	LastName varchar(50) not null,
--	Email varchar(250) not null,
--	foreign key (ReviewID) references Review(ReviewID)
--);