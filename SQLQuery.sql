/*----------------INSERT CART TABLE---------*/
GO 12
CREATE PROCEDURE procCartInsert
@orderid INT, @bookid INT, @quantity INT, @unitprice DECIMAL(8,2)
AS
INSERT INTO bss_Cart_Item (car_order_id , car_book_id , car_quantity , car_price )
VALUES (@orderid, @bookid, @quantity, @unitprice);
GO



/*------get book details from cart using bookid and useremail-------*/
GO
CREATE PROCEDURE procCartByBookIdAndOrderIdSelect
@orderid INT, @bookid INT
AS
SELECT 
car_book_id  as [Book Id],
boo_title  as [Book Title],
boo_special_price  as [Book Special Price],
boo_special_price_Status  as [Special Price Status],
car_quantity  as [Quantity],
car_price  as [Unit Price],
car_final_amount AS [Total Amount],

car_order_id  as [Order Id]
FROM bss_Cart_Item 
JOIN bss_Book  
ON bss_Book .boo_book_id  = bss_Cart_Item .car_book_id 
WHERE bss_Cart_Item .car__isdeleted  = 0 AND bss_Cart_Item .car_order_id  = @orderid AND bss_Book .boo_isdeleted  = 0 AND car_book_id =@bookid;
GO



/*---------------LIST-----------*/
GO
alter PROCEDURE procOrderByUserEmailSelect
@useremail VARCHAR(50)
AS
SELECT 
ord_order_id  as [Order Id],
ord_order_date  as [Order Date],
ord_amount  as [Bill Amount]
FROM bss_Order
WHERE ord_customer_id  = @useremail  AND bss_isdeleted  = 0;
GO



/*---------Get all books of a category------*/
GO
CREATE PROCEDURE procBookByCategoryIdSelect
@id INT
AS
SELECT
boo_book_id  as [Book Id],
boo_title  as [Book Title],
boo_auther  as [Book Author],
boo_category_id  as [Category Id],
bss_Category.cat_category_name  as [Category Name],
boo_price  as [Book Price],
boo_special_price_Status  as [Book Special Price Status],
boo_special_price  as [Book Special Price],
boo_description  as [Book Description]
FROM bss_Book 
JOIN bss_Category 
ON bss_Book.boo_category_id  = bss_Category.cat_category_id 
WHERE bss_Category .cat_category_id  = @id AND bss_Book .boo_isdeleted  = 0;
GO


--User Login
create proc prcuserlogincount1 @name varchar(30),@password varchar(30)
		as
		select count(*) from bss_Customer where cus_user_name  = @name and cus_password  = @password;

		 exec prcuserlogincount1 'admin','admin@123'

--Existing user checking
GO
CREATE PROCEDURE procCustomerByEmailPasswordOutput
@email VARCHAR(30)
AS
SELECT TOP 1 cus_password
FROM bss_Customer  
WHERE cus_email = @email
GO


/*-------CUSTOMER ------*/

/*----INSERT------*/
ALTER TABLE bss_Customer 
ADD cus_phone_number char(15) ;

GO
ALTER PROCEDURE procCustomerInsert
@name VARCHAR(30), @address VARCHAR(50), @phone char, @email VARCHAR(30),
@state VARCHAR(30), @zip CHAR, @city VARCHAR(30),@username varchar(30), @password VARCHAR(30)
AS
INSERT INTO bss_Customer  
(
cus_name, cus_address, 
cus_phone_number  , 
cus_email,
cus_state, 
cus_zip, 
cus_city,
cus_user_name,
cus_password
)
VALUES (@name, @address, @phone, @email, @state,@zip,@city,@username,@password);
GO



--Special Details of Books
GO
ALTER PROCEDURE procBookSpecialsSelect
AS
SELECT
boo_book_id  as [Book Id],
boo_title  as [Book Title],
boo_auther  as [Book Author],
boo_category_id  as [Category Id],
bss_Category .cat_category_name  as [Category Name],
boo_price  as [Book Price],
boo_special_price_Status  as [Book Special Price Status],
boo_special_price  as [Book Special Price],
boo_description  as [Book Description]
FROM bss_Book 
JOIN bss_Category 
ON bss_Category .cat_category_id  = bss_Book .boo_category_id 
WHERE boo_isdeleted  = 0 ;--AND boo_special_price_Status  = 1;
GO

exec procBookSpecialsSelect


/*-------------------UPDATE------------*/

GO
CREATE PROCEDURE procBookUpdate
@id INT,
@title VARCHAR(30),
@author VARCHAR(30),
@categoryid INT,
@price DECIMAL(10,2),
@specialpricestatus BINARY,
@specialprice DECIMAL(10,2),
@description VARCHAR(30)

AS
UPDATE bss_Book 
SET boo_title  = @title,
boo_auther  = @author,
boo_category_id  = @categoryid,
boo_price  = @price,
boo_special_price_Status  = @specialpricestatus,
boo_special_price  = @specialprice,
boo_description  = @description
WHERE boo_book_id  = @id;
GO


----
ALTER TABLE bss_Book 
ADD boo_special_price_Status bit;

--update book details
GO
ALTER PROCEDURE procBookByIdDetailsSelect
@id INT
AS
SELECT
boo_book_id  as [Book Id],
boo_title  as [Book Title],
boo_auther  as [Book Author],
boo_price  as [Book Price],
boo_category_id  as [Category Id],
bss_Category.cat_category_name  as [Category Name],
boo_special_price  as [Book Special Price],
boo_special_price_Status  as [Special Price Status],
boo_description  as [Book Description]
FROM bss_Book 
JOIN bss_Category 
ON bss_Category.cat_category_id  = bss_Book .boo_category_id 
WHERE boo_isdeleted  = 0 AND boo_book_id  = @id;
GO



/*-------------DELETE--------*/
GO
CREATE PROCEDURE procBookDelete
@id INT
AS
UPDATE bss_Book 
SET 
boo_isdeleted  = 1
WHERE 
boo_book_id  = @id;
GO


/*----------LIST--------*/

GO
CREATE PROCEDURE procBookSelect
AS
SELECT
boo_book_id  as [Book Id],
boo_title  as [Book Title],
boo_auther  as [Book Author],
boo_category_id  as [Category Id],
bss_Category.cat_category_name  as [Category Name],
boo_price  as [Book Price],
boo_special_price_Status  as [Book Special Price Status],
boo_special_price  as [Book Special Price],
boo_description  as [Book Description]
FROM bss_Book 
JOIN bss_Category 
ON bss_Category.cat_category_id  = bss_Book .boo_category_id 
WHERE boo_isdeleted  = 0;
GO


select *
from bss_Admin_Login

--book insert
/*-------BOOK INSERT-------*/


CREATE PROCEDURE procBookInsert
@title VARCHAR(30),
@author VARCHAR(30),
@categoryid INT,
@price DECIMAL(10,2),
@specialpricestatus binary,
@specialprice DECIMAL(10,2),
@description VARCHAR(30)
AS
INSERT INTO bss_Book 
(
boo_title ,
boo_auther ,
boo_category_id ,
boo_price ,
boo_special_price_Status ,
boo_special_price ,
boo_description 
)
VALUES
(
@title,
@author,
@categoryid,
@price,
@specialpricestatus,
@specialprice,
@description
);
GO

create table bss_Book(boo_book_id int  not null identity(1,1) primary key,boo_title varchar(30),
boo_auther varchar(30),boo_category_id int foreign key references bss_Category(cat_category_id),boo_price decimal,
boo_special_price decimal,boo_special_price_Status binary,boo_description varchar(30),boo_isdeleted int default 0);




--0 Admin Login

	alter proc prcadminlogincount @name varchar(30),@password varchar(30),@ecount int output
		as
		select @ecount= count(*) from bss_Admin_Login where adm_user_name = @name and adm_password = @password;

		declare @ecount int
		exec prcadminlogincount1 'admin','admin@123', @ecount output
		print @ecount

		alter proc prcadminlogincount1 @name varchar(30),@password varchar(30)
		as
		select count(*) from bss_Admin_Login where adm_user_name = @name and adm_password = @password;
		 
		 exec prcadminlogincount1 'admin','admin@123'
--1 List
	create proc prccategoryselect 
		as
		select cat_category_id ,cat_category_name from bss_Category where cat_isdeleted=0
		
	exec prccategoryselect;

--2 Update
	create proc prccategoryupdate @name varchar(30),@id int
		as
		UPDATE bss_Category SET cat_category_name=@name where cat_category_id=@id

--3 Insert
		create proc prccategoryinsert @name varchar(30)
			as
			insert into bss_Category(cat_category_name) values(@name)

--4 Delete	
		create proc prccategorydelete @id int
				as
				Update bss_Category SET cat_isdeleted = 1 where cat_category_id=@id


select cat_category_id ,cat_category_name,cat_isdeleted from bss_Category
set identity_insert cat_category_id off;
insert into bss_Category(cat_category_name) values('212121ALAbbbb')

--1
create table bss_Category(cat_category_id int identity(1,1) not null primary key,cat_category_name varchar(30),cat_isdeleted int default 0);

select cat_category_id as Catagory_ID,cat_category_name as Catagory_Name
from bss_Category;

ALTER TABLE bss_Category
alter column cat_isdelete bit default  ;

--2
create table bss_Book(boo_book_id int  not null identity(1,1) primary key,boo_title varchar(30),
boo_auther varchar(30),boo_category_id int foreign key references bss_Category(cat_category_id),boo_price decimal,
boo_special_price decimal,boo_special_price_Status binary,boo_description varchar(30),boo_isdeleted int default 0);


select boo_book_id as Book_ID ,boo_title as Title,
boo_auther as Author,boo_category_id as Category_ID,boo_price as Price ,
boo_special_price as Special_Price,boo_special_price_Status as Special_Price_Status,boo_description as Description
from bss_Book



--3
create table bss_Customer(cus_customer_id int  not null identity(1,1) primary key,cus_name varchar(30),cus_address varchar(50),
cus_phone_number char,cus_email varchar(30),cus_state varchar(30),cus_zip char,
cus_city varchar(30),cus_user_name varchar(30),cus_password varchar(30),cus_isdeleted  int default 0);

select cus_customer_id as Customer_ID ,cus_name as Name ,cus_address as Address ,
cus_phone_number as Phone_Number,cus_email as Email,cus_state as State,cus_zip as Zip,
cus_city as City,cus_user_name as User_Name,cus_password as Password,cus_isdeleted 
from bss_Customer



--4
create table bss_Order(ord_order_id int  not null identity(1,1) primary key,ord_order_date dateTime,ord_customer_id int foreign key references bss_Customer(cus_customer_id),
ord_amount decimal,bss_isdeleted int default 0);


select  ord_order_id as Order_ID,ord_order_date as Order_Date,ord_customer_id as Customer_ID ,
ord_amount as Amount
from bss_Order

--5
create table bss_Order_Details(ord_order_id int  not null identity(1,1) primary key,ord_book_id int foreign key references bss_Book(boo_book_id),ord_quantity int, 
ord_unit_price decimal,ord_total_price decimal,ord_isdeleted int default 0);

select ord_order_id as Order_ID ,ord_book_id as Book_ID ,ord_quantity as Quantity, 
ord_unit_price as Unit_Price,ord_total_price AS Total_Price
from bss_Order_Details

--6
create table bss_Cart_Item(car_cart_id int  not null identity(1,1) primary key,car_order_id int foreign key references bss_Order(ord_order_id),
car_book_id int foreign key references bss_Book(boo_book_id),car_quantity int,car_price decimal,car_final_amount decimal,car__isdeleted int default 0)

select car_cart_id as Cart_ID,car_order_id as Order_ID ,
car_book_id as Book_ID,car_quantity as Quantity,car_price as Price,car_final_amount as Final_Amount
from bss_Cart_Item

--7
create table bss_Payment(pay_payment_id int  not null identity(1,1) primary key,pay_cusomer_id int foreign key references bss_Customer(cus_customer_id),
pay_credit_card_number char,pay_card_type varchar(30),pay_month char,pay_year char,pay_isdeleted int default 0);

select pay_payment_id as Paymentr_ID,pay_cusomer_id AS Customer_ID,
pay_credit_card_number as Credit_Card_Number ,pay_card_type as Card_Typre,pay_month as Month,pay_year as Year
from bss_Payment

--8
create table bss_Admin_Login(adm_admin_id int  not null identity(1,1) primary key,adm_user_name varchar(30),adm_password varchar(30),adm_isdeleted int default 0);

select adm_admin_id as Admin_ID,adm_user_name as User_Name ,adm_password as Password,adm_isdeleted 
from bss_Admin_Login
--******
--1
select * from bss_Category

--2
select * from bss_Book

--3
select * from bss_Customer

--4
select * from bss_Order

--5
select * from bss_Order_Details

--6
select * from bss_Cart_Item

--7
select * from bss_Payment

--8
select * from bss_Admin_Login
