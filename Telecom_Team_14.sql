create database Telecom_Team_14;

use  Telecom_Team_14;

go
-------------------------------------------------------------------------------------
------------------------create tables Procedure--------------------------------------------
CREATE PROCEDURE [createAllTables]

AS

create table customer_profile(
nationalID int primary key,
first_name varchar(50) not null, 
last_name varchar(50) not null,
email varchar(50),
address varchar(70) not null, 
date_of_birth date
)


create table customer_account(
mobileNo char(11) primary key,
pass varchar(50),
balance decimal(10,1),
account_type varchar(50) check(account_type = 'postpaid' or account_type = 'prepaid' or account_type = 'pay-as-you-go' ),
start_date date not null,
status varchar(50) check(status = 'active' or status = 'onhold'),
points int default 0,
nationalID int,
FOREIGN KEY (nationalID) REFERENCES customer_profile (nationalID)
)

create table Service_plan(
planID int identity primary key,
name varchar(50) not null,
price int not null,
SMS_offered int not null,
minutes_offered int not null,
data_offered int not null,
description varchar(50)
)

create table Subscription(
mobileNo Char(11),
planID int,
subscription_date date,
status varchar(50) check(status='active' or status='onhold'),
constraint pk_subscription primary key (mobileNo,planID),
FOREIGN KEY (mobileNo) REFERENCES customer_account (mobileNo),
FOREIGN KEY (planID) REFERENCES Service_plan (planID)
)

create table Plan_Usage(
usageID int identity primary key,
start_date date not null,
end_date date not null,
data_consumption int,
minutes_used int ,
SMS_sent int  , 
mobileNo Char(11) , 
planID int,
FOREIGN KEY (mobileNo) REFERENCES customer_account (mobileNo),
FOREIGN KEY (planID) REFERENCES Service_plan (planID)
)


create table Payment(
paymentID int identity primary key,
amount decimal(10,1) not null,
date_of_payment date not null,
payment_method varchar(50) check(payment_method ='cash' or payment_method ='credit'),
status varchar(50) check(status ='successful' or status='rejected' or status='pending'),
mobileNo Char(11),
FOREIGN KEY (mobileNo) REFERENCES customer_account (mobileNo)
)




create table process_payment(
paymentID int,
planID int,
FOREIGN KEY (paymentID) REFERENCES Payment (paymentID),
FOREIGN KEY (planID) REFERENCES Service_plan (planID),

remaining_amount as(dbo.function_remaining_amount(paymentID, planID)),
extra_amount as (dbo.function_extra_amount(paymentID, planID)),

constraint pk_process_payment primary key (paymentID) 
)

create table Wallet
(
walletID int identity primary key,
current_balance decimal(10,2) default 0,
currency varchar(50) default 'egp',
last_modified_date date ,
nationalID int,
mobileNo char(11),
FOREIGN KEY (nationalID) REFERENCES customer_profile (nationalID)
)

create table transfer_money(
walletID1 int, 
walletID2 int, 
transfer_id int identity,
amount decimal (10,2),
transfer_date date, 
constraint pk_transfer_money primary key (walletID1,walletID2,transfer_id),
FOREIGN KEY (walletID1) REFERENCES Wallet(walletID),
FOREIGN KEY (walletID2) REFERENCES Wallet (walletID)
)

create table Benefits (
benefitID int primary key identity, 
description varchar(50),
validity_date date, 
status varchar (50) check(status='active' or status ='expired'),
mobileNo char(11), 
FOREIGN KEY (mobileNo) REFERENCES customer_account(mobileNo)
)

create table Points_group(
pointId int identity,
benefitID int, 
pointsAmount int,
paymentId int,
FOREIGN KEY (paymentId) REFERENCES Payment(paymentID),
FOREIGN KEY (benefitID) REFERENCES Benefits(benefitID),
constraint pk_Points_group primary key (pointId,benefitId)
)

create table Exclusive_offer (
offerID int identity, 
benefitID int, 
internet_offered int ,
SMS_offered int,
minutes_offered int,
FOREIGN KEY (benefitID) REFERENCES Benefits(benefitID),
constraint pk_Exclusive_offer primary key (offerID,benefitId)

)

create table Cashback(
cashbackID int identity, 
benefitID int, 
walletID int, 
amount int,
credit_date date,FOREIGN KEY (benefitID) REFERENCES Benefits(benefitID),
FOREIGN KEY (walletid) REFERENCES Wallet(walletid),
constraint pk_Cashback primary key (cashbackID,benefitId)
)

create table plan_provides_benefits(
benefitid int, 
planID int, 
FOREIGN KEY (benefitID) REFERENCES Benefits(benefitID),
FOREIGN KEY (planID) REFERENCES service_plan(planID),
constraint pk_plan_provides_benefits primary key (planID,benefitId)
)

create table shop (
shopID int identity primary key,
name varchar(50),
Category varchar(50)
)
create table Physical_shop (
shopID int primary key, 
address varchar(50),
working_hours varchar(50),
FOREIGN KEY (shopID) REFERENCES shop(shopID),
)

create table E_shop (
shopID int primary key , 
URL varchar(50) not null,
rating int,
FOREIGN KEY (shopID) REFERENCES shop(shopID),
)

create table Voucher (
voucherID int identity primary key,
value int,
expiry_date date,
points int, 
mobileNo char(11),
redeem_date date,
shopid int, 
FOREIGN KEY (shopID) REFERENCES shop(shopID),
FOREIGN KEY (mobileNo) REFERENCES customer_account(mobileNo)
)



create table Technical_support_ticket (
ticketID int identity,
mobileNo char(11), 
issue_description varchar(50),
priority_level int,
status varchar(50) check (status in ('Open','In progress','Resolved'))
FOREIGN KEY (mobileNo) REFERENCES customer_account(mobileNo),
constraint pk_Technical_support_ticket primary key (ticketID,mobileNo)
)

GO

-------------------------------------------------------------------------------------
------------------------remaining function--------------------------------------------
go
CREATE FUNCTION [function_remaining_amount]
(@paymentId int, @planId int) --Define Function Inputs
RETURNS int -- Define Function Output
AS

Begin

declare @amount int

If (SELECT payment.amount FROM payment WHERE payment.paymentid=@paymentId)  < (SELECT Service_plan.price FROM Service_plan
WHERE Service_plan.planid=@planid)

Set @amount =  (SELECT Service_plan.price FROM Service_plan WHERE Service_plan.planid=@planid) - (SELECT payment.amount FROM payment
WHERE payment.paymentid=@paymentId)

Else
Set @amount = 0

Return @amount

END
go

-------------------------------------------------------------------------------------------
---------------------------------extra function--------------------------------------------
go
CREATE FUNCTION [function_extra_amount]
(@paymentId int, @planId int) --Define Function Inputs
RETURNS int -- Define Function Output
AS

Begin

declare @amount int

If (SELECT payment.amount FROM payment WHERE payment.paymentid=@paymentId)  > (SELECT Service_plan.price FROM Service_plan
WHERE Service_plan.planid=@planid)

Set @amount = (SELECT payment.amount FROM payment WHERE payment.paymentid=@paymentId) - (SELECT Service_plan.price FROM Service_plan WHERE Service_plan.planid=@planid)

Else
Set @amount = 0

Return @amount

END

go
-----------------------------------------------------------------------------------------------------------------------------
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Exec createAllTables

-----------------------------------------------------------------------------------------------------------------------------
---------------------------------------- 2.1c -------------------------------------
GO
Create PROC dropAllTables
As

	DROP TABLE Technical_Support_Ticket;
	DROP TABLE Voucher;
	DROP TABLE E_shop;
	DROP TABLE Physical_Shop;
	DROP TABLE Shop;
	DROP TABLE Plan_Provides_Benefits;
	DROP TABLE Cashback;
	DROP TABLE Exclusive_Offer;
	DROP TABLE Points_Group;
	DROP TABLE Benefits;
	DROP TABLE Transfer_money;
	DROP TABLE Wallet;
	DROP TABLE Process_Payment;
	DROP TABLE Payment;
	DROP TABLE Plan_Usage;
	DROP TABLE Subscription;
	DROP TABLE Service_Plan;
	DROP TABLE Customer_Account;
	DROP TABLE Customer_profile;

------------------------------------------------------------------------------------

GO

EXEC dropAllTables;

GO
---------------------------------------- 2.1d -------------------------------------

Create PROC dropAllProceduresFunctionsViews 
As
    DROP VIEW IF EXISTS allCustomerAccounts;
    DROP VIEW IF EXISTS allServicePlans;
    DROP VIEW IF EXISTS allBenefits;
    DROP VIEW IF EXISTS AccountPayments;
    DROP VIEW IF EXISTS allShops;
    DROP VIEW IF EXISTS allResolvedTickets;
    DROP VIEW IF EXISTS CustomerWallet;
    DROP VIEW IF EXISTS E_shopVouchers;
    DROP VIEW IF EXISTS PhysicalStoreVouchers;
    DROP VIEW IF EXISTS Num_of_cashback;

    DROP FUNCTION IF EXISTS Account_Plan_date;
    DROP FUNCTION IF EXISTS Account_Usage_Plan;
    DROP FUNCTION IF EXISTS Account_SMS_Offers;
    DROP FUNCTION IF EXISTS Wallet_Cashback_Amount;
    DROP FUNCTION IF EXISTS Wallet_Transfer_Amount;
    DROP FUNCTION IF EXISTS Wallet_MobileNo;
    DROP FUNCTION IF EXISTS AccountLoginValidation;
    DROP FUNCTION IF EXISTS Consumption;
    DROP FUNCTION IF EXISTS Remaining_plan_amount;
    DROP FUNCTION IF EXISTS Extra_plan_amount;
    DROP FUNCTION IF EXISTS Subscribed_plans_5_Months;

    DROP PROCEDURE IF EXISTS createAllTables;
    DROP PROCEDURE IF EXISTS dropAllTables;
    DROP PROCEDURE IF EXISTS clearAllTables;
    DROP PROCEDURE IF EXISTS Account_Plan;
    DROP PROCEDURE IF EXISTS Benefits_Account;
    DROP PROCEDURE IF EXISTS Account_Payment_Points;
    DROP PROCEDURE IF EXISTS Total_Points_Account;
    DROP PROCEDURE IF EXISTS Unsubscribed_Plans;
    DROP PROCEDURE IF EXISTS Usage_Plan_CurrentMonth;
    DROP PROCEDURE IF EXISTS Cashback_Wallet_Customer;
    DROP PROCEDURE IF EXISTS Ticket_Account_Customer;
    DROP PROCEDURE IF EXISTS Account_Highest_Voucher;
    DROP PROCEDURE IF EXISTS Top_Successful_Payments;
    DROP PROCEDURE IF EXISTS Initiate_plan_payment;
    DROP PROCEDURE IF EXISTS Payment_wallet_cashback;
    DROP PROCEDURE IF EXISTS Initiate_balance_payment;
    DROP PROCEDURE IF EXISTS Redeem_voucher_points;


------------------------------------------------------------------------------------

GO

EXEC dropAllProceduresFunctionsViews;

GO

----------------------------------------
---------------------------------------- 2.1e -------------------------------------

CREATE PROC clearAllTables
AS
    DELETE FROM Technical_Support_Ticket;
    DELETE FROM Voucher;
    DELETE FROM E_shop;
    DELETE FROM Physical_Shop;
    DELETE FROM Shop;
    DELETE FROM Plan_Provides_Benefits;
    DELETE FROM Cashback;
    DELETE FROM Exclusive_Offer;
    DELETE FROM Points_Group;
    DELETE FROM Benefits;
    DELETE FROM Transfer_money;
    DELETE FROM Wallet;
    DELETE FROM Process_Payment;
    DELETE FROM Payment;
    DELETE FROM Plan_Usage;
    DELETE FROM Subscription;
    DELETE FROM Service_Plan;
    DELETE FROM Customer_Account;
    DELETE FROM Customer_profile;


------------------------------------------------------------------------------------

GO

EXEC clearAllTables;

GO


--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-----------------------------------Views------------------------------------------------------------------------------------------
-----------------------------------Basic Data Retrieval------------------------------------------------------------------------------------------


-----------------------------------allCustomerAccounts------------------------------------------------------------------------------------------
-------------------Fetch details for all customer profiles along with their active accounts---------------------
GO
CREATE VIEW [allCustomerAccounts] AS
SELECT p.*,a.mobileNo,a.account_type,a.status,a.start_date,a.balance,a.points from customer_profile p
inner join customer_account a 
on p.nationalID = a.nationalID
where a.status = 'active'

GO
-----------------------------------------------------------------------------------------------------------------------------
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-----------------------------------allServicePlans------------------------------------------------------------------------------------------
-------------------Fetch details for all offered Service Plans---------------------

GO
CREATE VIEW [allServicePlans] AS
select * from Service_plan
GO

-----------------------------------------------------------------------------------------------------------------------------
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-----------------------------------allBenefits------------------------------------------------------------------------------------------
-------------------Fetch details for all active Benefits---------------------
GO
CREATE VIEW [allBenefits] AS
select * from Benefits
where status = 'active'
GO


-----------------------------------------------------------------------------------------------------------------------------
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-----------------------------------AccountPayments------------------------------------------------------------------------------------------
-----------Fetch details for all payments along with their corresponding Accounts---------------------

GO
CREATE VIEW [AccountPayments] AS
select * from Payment p

GO

-----------------------------------------------------------------------------------------------------------------------------
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-----------------------------------allShops------------------------------------------------------------------------------------------
-----------Fetch details for all shops.---------------------
GO
CREATE VIEW [allShops] AS
select * from shop 
GO

-----------------------------------------------------------------------------------------------------------------------------
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-----------------------------------allResolvedTickets------------------------------------------------------------------------------------------
-----------Fetch details for all resolved tickets---------------------
GO
CREATE VIEW [allResolvedTickets] AS
select * from Technical_support_ticket
where status = 'Resolved'
GO

-----------------------------------------------------------------------------------------------------------------------------
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-----------------------------------CustomerWallet------------------------------------------------------------------------------------------
-----------Fetch details of all wallets along with their customer names---------------------
GO
CREATE VIEW [CustomerWallet] AS
select w.*,p.first_name,p.last_name from Wallet w
inner join customer_profile p
on w.nationalID = p.nationalID

GO

-----------------------------------------------------------------------------------------------------------------------------
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-----------------------------------E_shopVouchers------------------------------------------------------------------------------------------
-----------Fetch the list of all E-shops along with their redeemed vouchers’s ids and values---------------------
GO
CREATE VIEW [E_shopVouchers] AS
select e.*, v.voucherID,v.value from E_shop e
inner join Voucher v
on e.shopID = v.shopid

GO
-----------------------------------------------------------------------------------------------------------------------------
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-----------------------------------PhysicalStoreVouchers------------------------------------------------------------------------------------------
-----------Fetch the list of all physical stores along with their redeemed vouchers’s ids and values.---------------------
GO
CREATE VIEW [PhysicalStoreVouchers] AS
select p.*, v.voucherID,v.value from Physical_shop p
inner join Voucher v
on p.shopID = v.shopid

GO
-----------------------------------------------------------------------------------------------------------------------------
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-----------------------------------Num_of_cashback------------------------------------------------------------------------------------------
-----------Fetch number of cashback transactions per each wallet---------------------
GO
CREATE VIEW [Num_of_cashback] AS
select walletID,count(*)as 'count of transactions' from Cashback
group by walletID

GO


-----------------------------------------------------------------------------------------------------------------------------
-------------------------------------------Account_Plan Procedure------------------------------------------------------------
-- List all accounts along with the service plans they are subscribed to ----------------------------------------------------
go
create Procedure [Account_Plan]
AS
Select customer_account.*, Service_plan.* from customer_account inner join Subscription
on customer_account.mobileNo = Subscription.mobileNo inner join Service_plan on Subscription.planID = Service_plan.planID
GO

-----------------------------------------------------------------------------------------------------------------------------
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


------------------------------------Account_Plan_date Table Valued Function---------------------------------------------------------
-----Retrieve the list of accounts subscribed to the input plan on a certain date--------------------------------
go
CREATE FUNCTION [Account_Plan_date]
(@sub_date date, @plan_id int) --Define Function Inputs
RETURNS Table -- Define Function Output
AS
Return (Select customer_account.mobileNo, Service_plan.planID, Service_plan.name from customer_account inner join Subscription
on customer_account.mobileNo = Subscription.mobileNo inner join Service_plan on Subscription.planID = Service_plan.planID
WHERE Subscription.subscription_date = @sub_date AND Service_plan.planID = @plan_id)
go
--//////////////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------------------------------------

-----------------------------Account_Usage_Plan table valued function-------------------------------------------------------
--Retrieve the total usage of the input account on each subscribed plan from a given input date.
go
create FUNCTION [Account_Usage_Plan]
(@mobile_num char(11), @start_date date) --Define Function Inputs
RETURNS Table -- Define Function Output
AS
Return (Select Plan_Usage.planID, sum(Plan_Usage.data_consumption) as 'total data' ,sum(Plan_Usage.minutes_used) as 'total mins',sum(Plan_Usage.SMS_sent) as 'total SMS'
from Plan_Usage
where  Plan_Usage.mobileNo = @mobile_num and Plan_Usage.start_date >= @start_date
group by Plan_Usage.planID)
go
--//////////////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------------------------------------

---------------------------------Benefits_Account  -------------------------------------------------------------------------
---------Delete all benefits offered to the input account for a certain plan-------------------
go
CREATE PROCEDURE [Benefits_Account]
@mobile_num char(11), @plan_id int

AS
update Benefits
set mobileNo = null
from  Benefits B inner join plan_provides_benefits pb
on B.benefitID = pb.benefitid 
where B.mobileNo = @mobile_num and pb.planID = @plan_id
go
/*
delete B from Benefits B inner join plan_provides_benefits pb
on B.benefitID = pb.benefitid 
where B.mobileNo = 01234567890 and pb.planID = 1
*/

---must also delete any of the subclasses that have this benefit_id if using delete 
--delete from benefit or update mobile number to Null !!!!!!!



--//////////////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------------------------------------
---------------------------------Account_SMS_Offers  -------------------------------------------------------------------------
---------Retrieve the list of gained offers of type ‘SMS’ for the input account-------------------
go
CREATE FUNCTION [Account_SMS_Offers]
(@mobile_num char(11)) --Define Function Inputs
RETURNS Table -- Define Function Output
AS
Return(Select o.* from Exclusive_offer o inner join Benefits b 
on o.benefitID = b.benefitID 
where b.mobileNo = @mobile_num and o.SMS_offered >0 )
go 

--//////////////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------------------------------------
---------------------------------Account_Payment  -------------------------------------------------------------------------
---------Get the number of accepted  payment transactions initiated by the input account during the last year--------------------
go
CREATE PROCEDURE [Account_Payment_Points]
@mobile_num char(11)

AS
select count(p.paymentID), sum(pb.pointsAmount) from Payment P
inner join Points_group pb 
on p.paymentID = pb.paymentId
where P.mobileNo = @mobile_num and (year(current_timestamp) - year(p.date_of_payment)=1 ) 
and P.status = 'successful'
go

--//////////////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------------------------------------
---------------------------------Wallet_Cashback_Amount-------------------------------------------------------------------------
---------Retrieve the amount of cashback returned on the input wallet--------------------

go
CREATE FUNCTION [Wallet_Cashback_Amount]
(@walletID int, @planID int) --Define Function Inputs
RETURNS int -- Define Function Output
AS
Begin
declare @amount int

set @amount = (Select sum(c.amount) from Cashback c 
inner join plan_provides_benefits pb 
on c.benefitID = pb.benefitid
where c.walletID = @walletID and pb.planID = @planID)

return @amount
END
go


--//////////////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------------------------------------
---------------------------------Wallet_Transfer_Amount-------------------------------------------------------------------------
---------Retrieve the average of the sent transaction amounts from the input wallet within a certain duration.--------------------
go
CREATE FUNCTION [Wallet_Transfer_Amount]
(@walletID int, @start_date date, @end_date date) --Define Function Inputs
RETURNS int -- Define Function Output
AS
Begin
declare @avg int

set @avg = (Select avg(t.amount) from transfer_money t
where t.walletID1 = @walletID and t.transfer_date between @start_date and @end_date)

return @avg
END
go

--//////////////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------------------------------------
---------------------------------Wallet_MobileNo-------------------------------------------------------------------------
-----------------------------Take mobileNo as an input, return true if this number is linked to a wallet, otherwise return false.
go
CREATE FUNCTION [Wallet_MobileNo]
(@mobile_num char(11)) --Define Function Inputs
RETURNS bit -- Define Function Output
AS
Begin
declare @output bit
IF exists((Select w.walletID from Wallet w
where w.mobileNo = @mobile_num ))
set @output = 1
else 
set @output = 0

return @output
END
go

--//////////////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------------------------------------
----------------------------------------Total_Points_Account-----------------------
------------------------- Update the total number of points that the input account should have--------------------------

go
CREATE PROCEDURE [Total_Points_Account]  --NOTE: NOT ALIGNED WITH MILESTONE _ NO OUTPUT
@mobile_num char(11)  

AS
declare @sum int
select @sum =  sum(pg.pointsAmount) from Points_group pg
inner join Payment p
on pg.paymentId = p.paymentID
where p.mobileNo = @mobile_num

update customer_account  
set points = @sum
where mobileNo = @mobile_num

delete from Points_group
where pointId in  (select pg.pointId from Points_group pg
inner join Payment p on pg.paymentId = p.paymentID
where p.mobileNo = @mobile_num)
go

--//////////////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------------------------------------
-------------------------2.4.As a customer I should be able to------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------AccountLoginValidation-----------------------
-------------------------login using my mobileNo and password--------------------------
go
CREATE FUNCTION [AccountLoginValidation]
(@mobile_num char(11), @pass varchar(50)) --Define Function Inputs
RETURNS bit -- Define Function Output
AS
Begin
declare @output bit
IF exists((Select a.mobileNo from customer_account a
where a.mobileNo = @mobile_num and a.pass = @pass ))
set @output = 1
else 
set @output = 0

return @output
END
go

--//////////////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------------------------------------
----------------------------------------Consumption-----------------------
-------------------------Retrieve the total SMS, Mins and Internet consumption for an input plan within a certain duration--------------------------

go
CREATE FUNCTION [Consumption]
(@Plan_name varchar(50), @start_date date, @end_date date) --Define Function Inputs
RETURNS Table -- Define Function Output
AS
Return(Select p.data_consumption,p.minutes_used,p.SMS_sent from Plan_Usage p 
inner join Service_plan s on s.planID = p.planID
where s.name = @Plan_name and p.start_date >= @start_date and p.end_date <= @end_date)
go 
--//////////////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------------------------------------
----------------------------------------Unsubscribed_Plans-----------------------
-------------------------Retrieve all offered plans that the input customer is not subscribed to--------------------------
go
CREATE PROCEDURE [Unsubscribed_Plans]
@mobile_num char(11)

AS
select  sp.* from  Service_plan sp 
where sp.planID not in (
select s.planID  from Subscription s
where s.mobileNo = @mobile_num)
go

--//////////////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------------------------------------
----------------------------------------Usage_Plan_CurrentMonth-----------------------
-------------------------Retrieve the usage of all active plans for the input account in the current month--------------------------

go
CREATE FUNCTION [Usage_Plan_CurrentMonth]
(@mobile_num char(11)) --Define Function Inputs
RETURNS Table -- Define Function Output
AS
Return(select p.data_consumption, p.minutes_used, p.SMS_sent from Plan_Usage p
inner join Subscription s 
on p.planID = s.planID and p.mobileNo = s.mobileNo
where p.mobileNo = @mobile_num and s.status = 'active' 
and month(p.start_date)= month(current_timestamp) or month(p.end_date)= month(current_timestamp) and year(p.start_date)= year(current_timestamp) or year(p.end_date)= year(current_timestamp))
go 

--//////////////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------------------------------------
----------------------------------------Cashback_Wallet_Customer-----------------------
------------------------- Retrieve all cashback transactions related to the wallet of the input customer--------------------------

go
CREATE FUNCTION [Cashback_Wallet_Customer]
(@NID int) --Define Function Inputs
RETURNS Table -- Define Function Output
AS
Return(select c.* from Cashback c 
inner join Wallet w 
on c.walletID = w.walletID 
where w.nationalID = @NID)
go 




--//////////////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------------------------------------
----------------------------------------Ticket_Account_Customer-----------------------
------------------------- Retrieve the number of technical support tickets that are NOT ‘Resolved’ for each account of the input customer--------------------------

go
CREATE PROCEDURE [Ticket_Account_Customer]
@NID int 

AS
select count(t.ticketID) from Technical_support_ticket t
inner join customer_account a 
on t.mobileNo = a.mobileNo
where t.status <> 'resolved' and a.nationalID = @NID
go


--//////////////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------------------------------------
----------------------------------------Account_Highest_Voucher-----------------------
------------------------- Return the voucher with the highest value for the input account.--------------------------

go
CREATE PROCEDURE [Account_Highest_Voucher]
@mobile_num char(11)  

AS
declare @max int
select @max =  max(v.value) from Voucher v 
where v.mobileNo = @mobile_num 

select v.voucherID from voucher v
where v.mobileNo = @mobile_num and v.value = @max

go


--//////////////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------------------------------------
----------------------------------------Remaining_plan_amount-----------------------
------------------------- Get the remaining amount for a certain plan based on the payment initiated by the input account--------------------------
go
CREATE FUNCTION [Remaining_plan_amount]
(@mobile_num char(11), @plan_name varchar(50)) --Define Function Inputs
RETURNS int -- Define Function Output
AS
Begin
declare @output int, @plan_id int, @payment_id int
Select @plan_id = s.planID, @payment_id= p.paymentID from Service_plan s inner join process_payment pp
on s.planID = pp.planID inner join payment p 
on pp.paymentID = p.paymentID
where s.name = @plan_name and p.mobileNo = @mobile_num and p.status='successful'

set @output = dbo.function_remaining_amount(@payment_id,@plan_id)
return @output
END
go

--//////////////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------------------------------------
----------------------------------------Extra_plan_amount-----------------------
-------------------------Get the extra amount from a payment initiated by the input account for a certain plan--------------------------
go
CREATE FUNCTION [Extra_plan_amount]
(@mobile_num char(11), @plan_name varchar(50)) --Define Function Inputs
RETURNS int -- Define Function Output
AS
Begin
declare @output int, @plan_id int, @payment_id int
Select @plan_id = s.planID, @payment_id= p.paymentID from Service_plan s inner join process_payment pp
on s.planID = pp.planID inner join payment p 
on pp.paymentID = p.paymentID
where s.name = @plan_name and p.mobileNo = @mobile_num and p.status='successful'

set @output = dbo.function_extra_amount(@payment_id,@plan_id)
return @output
END
go

--//////////////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------------------------------------
----------------------------------------Top_Successful_Payments-----------------------
-------------------------Retrieve the top 10 successful payments with highest value for the input account--------------------------
go
CREATE PROCEDURE [Top_Successful_Payments]
@mobile_num char(11)  

AS
select top 10 p.* from Payment p 
where p.mobileNo = @mobile_num
and p.status = 'successful'
order by p.amount desc
go

--//////////////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------------------------------------
----------------------------------------Subscribed_plans_5_Months-----------------------
-------------------------Retrieve all service plans the input account subscribed to in the past 5 months--------------------------

go
CREATE FUNCTION [Subscribed_plans_5_Months]
(@MobileNo char(11)) --Define Function Inputs
RETURNS Table -- Define Function Output
AS
Return(Select sp.* from Service_plan sp 
inner join Subscription s 
on sp.planID = s.planID
where s.mobileNo = @MobileNo and 
s.subscription_date >= DATEADD(month,-5,CURRENT_TIMESTAMP))
go 

--//////////////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------------------------------------
----------------------------------------Initiate_plan_payment-----------------------
-------------------------Initiate an accepted payment for the input account for plan renewal and update the status of the subscription accordingly.--------------------------

go
CREATE PROCEDURE [Initiate_plan_payment]
@mobile_num char(11), @amount decimal(10,1), @payment_method varchar(50),
@plan_id int 

AS
declare @payment_id int
Insert into Payment (amount,date_of_payment,payment_method,status,mobileNo)
values(@amount,CURRENT_TIMESTAMP,@payment_method,'successful',@mobile_num)
SELECT @payment_id = p.paymentID from Payment p    
where p.mobileNo = @mobile_num and p.amount = @amount and p.date_of_payment = CAST(CURRENT_TIMESTAMP AS DATE)
and p.payment_method = @payment_method and p.status = 'successful'
Insert into process_payment(paymentID, planID) values(@payment_id, @plan_id)
if(select remaining_amount from process_payment where planID = @plan_id and paymentID = @payment_id) = 0 
update Subscription
set status = 'active'
where planID = @plan_id and mobileNo = @mobile_num
else
update Subscription
set status = 'onhold'
where planID = @plan_id and mobileNo = @mobile_num

go

--//////////////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------------------------------------
----------------------------------------Payment_wallet_cashback-----------------------
-------------------------Calculate the amount of cashback that will be returned on the wallet of the customer of the input account from a certain payment--------------------------

go
CREATE PROCEDURE [Payment_wallet_cashback]
@mobile_num char(11), @payment_id int, @benefit_id int 

AS
declare @amount int, @cash_amount int, @wallet_id int 
select @amount = p.amount  from Payment p
where p.paymentID = @payment_id and p.status = 'successful'
set @cash_amount = 0.1 * @amount
select @wallet_id = w.walletID from Wallet w
inner join customer_account a on
w.nationalID = a.nationalID 
where a.mobileNo = @mobile_num

Insert into Cashback(benefitID,walletID,amount,credit_date)
values(@benefit_id,@wallet_id,@cash_amount,current_timestamp)

update Wallet
set current_balance = current_balance + @cash_amount,
last_modified_date = current_timestamp
where walletID = @wallet_id

go


--//////////////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------------------------------------
----------------------------------------Initiate_balance_payment-----------------------
-------------------------Initiate an accepted payment for the input account for balance recharge--------------------------
go
CREATE PROCEDURE [Initiate_balance_payment]
@mobile_num char(11), @amount decimal(10,1), @payment_method varchar(50)

as
Insert into Payment (amount,date_of_payment,payment_method,status,mobileNo)
values(@amount,CURRENT_TIMESTAMP,@payment_method,'successful',@mobile_num)

update customer_account
set balance = balance + @amount
where mobileNo = @mobile_num

go

--//////////////////////////////////////////////////////////////////////////////////////////////////////
------------------------------------------------------------------------------------------------------------
----------------------------------------Redeem_voucher_points-----------------------
------------------------- Redeem a voucher for the input account and update the total points of the account accordingly--------------------------
go
CREATE PROCEDURE [Redeem_voucher_points]
@mobile_num char(11), @voucher_id int 

AS
If (Select v.points from Voucher v 
where v.voucherID = @voucher_id and v.expiry_date >CURRENT_TIMESTAMP ) <= (Select a.points from customer_account a 
where a.mobileNo = @mobile_num) 
begin 
declare @voucher_points int 
select @voucher_points = points from Voucher
where voucherID = @voucher_id
update Voucher
set mobileNo = @mobile_num , redeem_date = current_timestamp 
where voucherID = @voucher_id 

update customer_account
set points = points - @voucher_points
where mobileNo = @mobile_num
end 
else 
print 'no enough points to redeem voucher'

go 
--///////////////////////////////////////////////////////////////////////////////////////////////////
----------------------------------- Executions ------------------------------------------------------
----------------------------------- Views ------------------------------------------------------
----------------------------------- allCustomerAccounts ------------------------------------------------------

Select * from allCustomerAccounts
----------------------------------- allServicePlans ------------------------------------------------------

Select * from allServicePlans
----------------------------------- allBenefits ------------------------------------------------------

Select * from allBenefits
----------------------------------- AccountPayments ------------------------------------------------------

Select * from AccountPayments
-----------------------------------allShops------------------------------------------------------

Select * from allShops
-----------------------------------allResolvedTickets------------------------------------------------------

Select * from allResolvedTickets
-----------------------------------CustomerWallet------------------------------------------------------

Select * from CustomerWallet
-----------------------------------E_shopVouchers------------------------------------------------------

Select * from E_shopVouchers
-----------------------------------PhysicalStoreVouchers------------------------------------------------------

Select * from PhysicalStoreVouchers
-----------------------------------Num_of_cashback------------------------------------------------------

Select * from Num_of_cashback

--------------------Admin Executions--------------------------------------------
-----------------------Account_Plan Procedure----------------------------------
Exec Account_Plan

-----------------Account_Plan_date Table Valued Function--------------
select * from dbo.Account_Plan_date ('2023-01-01',1)

-----------------Account_Usage_Plan function execution-------------------------------------------
select * from Plan_Usage

select * from dbo.Account_Usage_Plan ('01234567895', '2023-05-01')

-------------------Benefits_Account procedure execution---------------------------------------------------------------------------------

Exec Benefits_Account @mobile_num ='01234567891', @plan_id = 1 
-------------------Account_SMS_Offers function execution---------------------------------------------------------------------------------

select * from dbo.Account_SMS_Offers ('01234567891')

-----------------------Account_Payment_Points Procedure execution----------------------------------
Exec Account_Payment_Points @mobile_num ='01234567891'

-------------------[Wallet_Cashback_Amount] function execution---------------------------------------------------------------------------------

declare @result int
set @result = dbo.Wallet_Cashback_Amount(3,3)
print @result

-------------------[Wallet_Transfer_Amount] function execution---------------------------------------------------------------------------------

declare @result int
set @result = dbo.Wallet_Transfer_Amount(1,'','')
print @result

-------------------[Wallet_MobileNo] function execution---------------------------------------------------------------------------------

declare @result bit
set @result = dbo.Wallet_MobileNo('01234567890')
print @result

-----------------------Total_Points_Account Procedure execution----------------------------------
Exec Total_Points_Account @mobile_num ='01234567890'



----------------------------Customer Executions------------------------------------
-------------------[AccountLoginValidation] function execution---------------------------------------------------------------------------------

declare @result bit
set @result = dbo.AccountLoginValidation('01234567414','password1')
print @result

-------------------Consumption function execution---------------------------------------------------------------------------------

select * from dbo.Consumption (1, '2023-01-01','2023-01-31')

-----------------------Unsubscribed_Plans Procedure execution----------------------------------

Exec Unsubscribed_Plans @mobile_num = '01234567890'

-------------------Usage_Plan_CurrentMonth function execution---------------------------------------------------------------------------------

select * from dbo.Usage_Plan_CurrentMonth ('01234567890')

-------------------Cashback_Wallet_Customer function execution---------------------------------------------------------------------------------

select * from dbo.Cashback_Wallet_Customer (3)

-----------------------Ticket_Account_Customer Procedure execution----------------------------------

Exec Ticket_Account_Customer @NID = 1

-----------------------Account_Highest_Voucher Procedure execution----------------------------------

Exec Account_Highest_Voucher @mobile_num = '01234567890'

-------------------Remaining_plan_amount function execution---------------------------------------------------------------------------------

declare @result bit
set @result = dbo.Remaining_plan_amount('Basic Plan','01234567890')
print @result

-------------------Extra_plan_amount function execution---------------------------------------------------------------------------------

declare @result bit
set @result = dbo.Extra_plan_amount('Basic Plan','01234567890')
print @result

-----------------------Top_Successful_Payments Procedure execution----------------------------------

Exec Top_Successful_Payments @mobile_num = '01234567890'

-------------------Subscribed_plans_5_Months function execution---------------------------------------------------------------------------------

select * from dbo.Subscribed_plans_5_Months ('01234567890')

-----------------------Initiate_plan_payment Procedure execution----------------------------------

Exec Initiate_plan_payment @mobile_num = '01234567890', @amount =100, @payment_method = 'cash',
@plan_id = 3
-----------------------Payment_wallet_cashback Procedure execution----------------------------------

Exec Payment_wallet_cashback @mobile_num = '01234567892',@payment_id = 8, @benefit_id = 3

-----------------------Initiate_balance_payment Procedure execution----------------------------------

Exec Initiate_balance_payment @mobile_num = '01234567890', @amount =100, @payment_method = 'cash'

-----------------------Redeem_voucher_points Procedure execution----------------------------------

Exec Redeem_voucher_points @mobile_num = '01234567890', @voucher_id = 3 


-------------------------------------------------------------------------------
----------------------------------------------------------------------------------
Select * From customer_profile;
Select * From customer_account;
Select * From Cashback;
Select * from Service_plan;

EXEC clearAllTables;
EXEC InsertValues;

GO
CREATE PROCEDURE InsertValues
AS
    -- Insert data into Customer_profile
INSERT INTO Customer_profile (nationalID, first_name, last_name, email, address, date_of_birth)
VALUES 
(1, 'Alice', 'Smith', 'alice.smith@example.com', '123 Main St', '1985-05-20'),
(2, 'Bob', 'Johnson', 'bob.johnson@example.com', '456 Oak Ave', '1990-07-15'),
(3, 'Charlie', 'Brown', 'charlie.brown@example.com', '789 Pine Rd', '1987-02-10'),
(4, 'Diana', 'Prince', 'diana.prince@example.com', '101 Elm St', '1995-11-03'),
(5, 'Eve', 'Davis', 'eve.davis@example.com', '202 Birch Ln', '1982-06-25'),
(6, 'Frank', 'Miller', 'frank.miller@example.com', '303 Cedar Blvd', '1988-12-15'),
(7, 'Grace', 'Hopper', 'grace.hopper@example.com', '404 Maple Ave', '1992-04-18'),
(8, 'Hank', 'Williams', 'hank.williams@example.com', '505 Spruce Way', '1989-09-30'),
(9, 'Ivy', 'Taylor', 'ivy.taylor@example.com', '606 Chestnut St', '1991-03-08'),
(10, 'Jack', 'White', 'jack.white@example.com', '707 Walnut Ave', '1986-08-22');

-- Insert data into Customer_Account
INSERT INTO Customer_Account (mobileNo, pass, balance, account_type, start_date, status, points, nationalID)
VALUES 
('01234567890', 'password123', 50.0, 'postpaid', '2023-01-01', 'active', 100, 1),
('01234567891', 'password234', 25.5, 'prepaid', '2023-02-15', 'onhold', 50, 2),
('01234567892', 'password345', 75.0, 'pay-as-you-go', '2022-11-10', 'active', 200, 3),
('01234567893', 'password456', 40.0, 'postpaid', '2023-03-22', 'active', 150, 4),
('01234567894', 'password567', 15.0, 'prepaid', '2023-05-01', 'onhold', 30, 5),
('01234567895', 'password678', 100.0, 'prepaid', '2023-06-12', 'active', 120, 6),
('01234567896', 'password789', 60.0, 'pay-as-you-go', '2022-09-18', 'active', 90, 7),
('01234567897', 'password890', 80.0, 'prepaid', '2023-08-05', 'onhold', 60, 8),
('01234567898', 'password901', 20.0, 'postpaid', '2023-09-20', 'active', 75, 9),
('01234567899', 'password012', 95.0, 'pay-as-you-go', '2022-10-30', 'active', 110, 10);

-- Insert data into Service_Plan
INSERT INTO Service_Plan (SMS_offered, minutes_offered, data_offered, name, price, description)
VALUES 
(100, 500, 5, 'Plan A', 20, 'Basic Plan'),
(200, 1000, 10, 'Plan B', 40, 'Standard Plan'),
(300, 1500, 20, 'Plan C', 60, 'Premium Plan'),
(50, 250, 2, 'Plan D', 10, 'Economy Plan'),
(150, 750, 8, 'Plan E', 30, 'Intermediate Plan'),
(250, 1250, 15, 'Plan F', 50, 'Advanced Plan'),
(100, 500, 5, 'Plan G', 25, 'Budget Plan'),
(200, 1000, 12, 'Plan H', 35, 'Affordable Plan'),
(400, 2000, 25, 'Plan I', 80, 'High Usage Plan'),
(50, 250, 1, 'Plan J', 5, 'Minimal Plan');

-- Insert data into Subscription
INSERT INTO Subscription (mobileNo, planID, subscription_date, status)
VALUES 
('01234567890', 1, '2023-01-10', 'active'),
('01234567891', 2, '2023-02-20', 'onhold'),
('01234567892', 3, '2022-12-05', 'active'),
('01234567893', 4, '2023-03-15', 'active'),
('01234567894', 5, '2023-05-10', 'onhold'),
('01234567895', 6, '2023-06-20', 'active'),
('01234567896', 7, '2022-10-01', 'active'),
('01234567897', 8, '2023-08-12', 'onhold'),
('01234567898', 9, '2023-09-25', 'active'),
('01234567899', 2, '2022-11-30', 'active');

-- Insert data into Payment
INSERT INTO Payment (amount, date_of_payment, payment_method, status, mobileNo)
VALUES 
(20.0, '2023-01-15', 'cash', 'successful', '01234567890'),
(40.0, '2023-02-25', 'credit', 'pending', '01234567891'),
(60.0, '2022-12-10', 'cash', 'successful', '01234567892'),
(10.0, '2023-03-18', 'credit', 'rejected', '01234567893'),
(30.0, '2023-05-15', 'cash', 'successful', '01234567894'),
(50.0, '2023-06-25', 'credit', 'pending', '01234567895'),
(25.0, '2022-10-05', 'cash', 'successful', '01234567896'),
(35.0, '2023-08-20', 'credit', 'rejected', '01234567897'),
(80.0, '2023-09-30', 'cash', 'successful', '01234567898'),
(5.0, '2022-11-15', 'credit', 'successful', '01234567899');

-- Continue for other tables such as Wallet, Plan_Usage, Benefits, and others...
-- Insert data into Plan_Usage
INSERT INTO Plan_Usage (start_date, end_date, data_consumption, minutes_used, SMS_sent, mobileNo, planID)
VALUES 
('2023-01-01', '2023-01-31', 3, 300, 50, '01234567890', 1),
('2023-02-01', '2023-02-28', 5, 500, 100, '01234567891', 2),
('2022-12-01', '2022-12-31', 10, 800, 150, '01234567892', 3),
('2023-03-01', '2023-03-31', 2, 200, 30, '01234567893', 4),
('2023-05-01', '2023-05-31', 4, 600, 75, '01234567894', 5),
('2023-06-01', '2023-06-30', 6, 1000, 120, '01234567895', 6),
('2022-10-01', '2022-10-31', 7, 1200, 180, '01234567896', 7),
('2023-08-01', '2023-08-31', 3, 400, 50, '01234567897', 8),
('2023-09-01', '2023-09-30', 9, 1500, 200, '01234567898', 9),
('2022-11-01', '2022-11-30', 1, 100, 20, '01234567899', 10);
--01234567890

-- Insert data into Wallet
INSERT INTO Wallet (current_balance, currency, last_modified_date, nationalID, mobileNo)
VALUES 
(100.00, 'USD', '2023-01-15', 1, '01234567890'),
(50.00, 'USD', '2023-02-25', 2, '01234567891'),
(75.00, 'USD', '2022-12-10', 3, '01234567892'),
(200.00, 'USD', '2023-03-18', 4, '01234567893'),
(30.00, 'USD', '2023-05-15', 5, '01234567894'),
(120.00, 'USD', '2023-06-25', 6, '01234567895'),
(90.00, 'USD', '2022-10-05', 7, '01234567896'),
(60.00, 'USD', '2023-08-20', 8, '01234567897'),
(150.00, 'USD', '2023-09-30', 9, '01234567898'),
(110.00, 'USD', '2022-11-15', 10, '01234567899');

-- Insert data into Benefits
INSERT INTO Benefits (description, validity_date, status, mobileNo)
VALUES 
('Free 5GB Data', '2023-12-31', 'active', '01234567890'),
('100 Free Minutes', '2023-06-30', 'expired', '01234567891'),
('50 Free SMS', '2024-03-31', 'active', '01234567892'),
('Premium Support', '2023-05-31', 'expired', '01234567893'),
('Extra 2GB Data', '2023-12-31', 'active', '01234567894'),
('50% Discount on Renewal', '2024-01-31', 'active', '01234567895'),
('10% Cashback', '2023-11-30', 'expired', '01234567896'),
('Free Weekend Data', '2024-02-28', 'active', '01234567897'),
('Unlimited Night Calls', '2024-06-30', 'active', '01234567898'),
('Priority Customer Service', '2023-08-31', 'expired', '01234567899');

-- Insert data into Points_Group
INSERT INTO Points_Group (benefitID, pointsAmount, PaymentID)
VALUES 
(1, 50, 1),
(2, 20, 2),
(3, 30, 3),
(4, 40, 4),
(5, 25, 5),
(6, 15, 6),
(7, 10, 7),
(8, 35, 8),
(9, 45, 9),
(10, 50, 10);

-- Insert data into Exclusive_Offer
INSERT INTO Exclusive_Offer (benefitID, internet_offered, SMS_offered, minutes_offered)
VALUES 
(1, 5, 0, 0),
(2, 0, 50, 0),
(3, 0, 0, 100),
(4, 10, 0, 0),
(5, 0, 25, 0),
(6, 0, 0, 50),
(7, 20, 0, 0),
(8, 0, 50, 100),
(9, 5, 25, 0),
(10, 10, 50, 0);

-- Insert data into Cashback
INSERT INTO Cashback (benefitID, walletID, amount, credit_date)
VALUES 
(1, 1, 5, '2023-01-20'),
(2, 2, 2, '2023-02-28'),
(3, 3, 3, '2022-12-15'),
(4, 4, 1, '2023-03-22'),
(5, 5, 1, '2023-05-20'),
(6, 6, 5, '2023-06-30'),
(7, 7, 10, '2022-10-10'),
(8, 8, 5, '2023-08-25'),
(9, 9, 8, '2023-09-30'),
(10, 10, 10, '2022-11-20');

-- Insert data into Shop
INSERT INTO Shop (name, category)
VALUES 
('Electronics Hub', 'Electronics'),
('Gadget World', 'Accessories'),
('Book Haven', 'Books'),
('Fashion Central', 'Clothing'),
('Tech Plaza', 'Electronics'),
('Home Essentials', 'Furniture'),
('Toy Kingdom', 'Toys'),
('Grocer Mart', 'Groceries'),
('Sports Arena', 'Sports'),
('Beauty Bliss', 'Cosmetics');

-- Insert data into Physical_Shop
INSERT INTO Physical_Shop (shopID, address, working_hours)
VALUES 
(1, '500 Market St', '9 AM - 8 PM'),
(2, '123 Tech Blvd', '10 AM - 6 PM'),
(3, '50 Book Rd', '11 AM - 9 PM'),
(4, '75 Fashion Ave', '10 AM - 7 PM'),
(5, '60 Tech Lane', '9 AM - 9 PM'),
(6, '20 Home St', '8 AM - 8 PM'),
(7, '15 Toy Rd', '10 AM - 6 PM'),
(8, '10 Grocery Ln', '7 AM - 11 PM'),
(9, '35 Sports Ave', '10 AM - 8 PM'),
(10, '40 Beauty Blvd', '9 AM - 7 PM');

-- Insert data into E_shop
INSERT INTO E_shop (shopID, URL, rating)
VALUES 
(1, 'www.electronicshub.com', 5),
(2, 'www.gadgetworld.com', 4),
(3, 'www.bookhaven.com', 5),
(4, 'www.fashioncentral.com', 3),
(5, 'www.techplaza.com', 4),
(6, 'www.homeessentials.com', 5),
(7, 'www.toykingdom.com', 4),
(8, 'www.grocermart.com', 5),
(9, 'www.sportsarena.com', 3),
(10, 'www.beautybliss.com', 4);

-- Insert data into Voucher
INSERT INTO Voucher (value, expiry_date, points, mobileNo, shopID, redeem_date)
VALUES 
(10, '2023-12-31', 20, '01234567890', 1, '2023-01-15'),
(15, '2024-01-31', 30, '01234567891', 2, '2023-02-20'),
(20, '2023-11-30', 50, '01234567892', 3, '2023-03-10'),
(5, '2024-02-28', 10, '01234567893', 4, '2023-04-05'),
(25, '2023-10-31', 60, '01234567894', 5, '2023-05-12'),
(50, '2024-03-31', 100, '01234567895', 6, '2023-06-25'),
(30, '2023-09-30', 40, '01234567896', 7, '2023-07-10'),
(10, '2023-08-31', 15, '01234567897', 8, '2023-08-05'),
(20, '2024-01-15', 30, '01234567898', 9, '2023-09-15'),
(35, '2024-02-28', 70, '01234567899', 10, '2023-10-10');

-- Insert data into Technical_Support_Ticket
INSERT INTO Technical_Support_Ticket (mobileNo, Issue_description, priority_level, status)
VALUES 
('01234567890', 'Cannot connect to the internet', 2, 'Open'),
('01234567891', 'Billing discrepancy', 3, 'In progress'),
('01234567892', 'Unable to make calls', 1,'Resolved'),
('01234567893', 'SMS not sent', 2, 'Open'),
('01234567894', 'Account locked', 3, 'In progress'),
('01234567895', 'Slow internet speed', 1, 'Resolved'),
('01234567896', 'Dropped calls', 2, 'In progress'),
('01234567897', 'App crashing', 3, 'Open'),
('01234567898', 'Payment not reflected', 2, 'Resolved'),
('01234567899', 'Unable to activate plan', 1, 'In progress');

GO

--TESTING DATA QUERIES
SELECT points FROM customer_account WHERE mobileNo = 01234567893;

UPDATE customer_account
SET points = 100
WHERE mobileNo = 01234567890;


select * from dbo.Usage_Plan_CurrentMonth ('01234567893')
SELECT * from dbo.Wallet_Cashback_Amount(2,2);