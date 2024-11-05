Create database Telecom_Team_14;
USE Telecom_Team_14;

Go

---------------------------------------- 2.1a -------------------------------------
CREATE PROC createAllTables
As
	Create table Customer_profile 
		(nationalID int , 
		first_name Varchar(50), 
		last_name Varchar(50), 
		email Varchar(50), 
		address Varchar(50), 
		date_of_birth date 
		PRIMARY KEY (nationalID) 
	);

	Create table Customer_Account (
		mobileNo char(11), 
		pass varchar(50),
		balance decimal(10,1),
		account_type Varchar(50), 
		start_date date, 
		status Varchar(50), 
		point int default 0, 
		nationalID int,
		PRIMARY KEY (mobileno),
		FOREIGN KEY (nationalID) REFERENCES Customer_Profile ON DELETE CASCADE ON UPDATE CASCADE,
		CHECK(account_type in ('Post_Paid', 'Pre_Paid', 'Pay_As_You_Go')),
		CHECK(status in ('Active', 'OnHold'))
	);

	Create Table Service_Plan (
		planID int identity(1,1), 
		SMS_offered int, 
		minutes_offered int, 
		data_offered int, 
		name Varchar(50), 
		price int, 
		description Varchar(50),
		PRIMARY KEY(planID)
	);

	Create Table Subscription (
		mobileNo char(11), 
		planID int, 
		subscription_date date,
		status Varchar(50),
		PRIMARY KEY(mobileNo, planID),
		FOREIGN KEY (mobileNo) REFERENCES Customer_Account ON DELETE CASCADE ON UPDATE CASCADE,
		FOREIGN KEY (planID) REFERENCES Service_Plan ON DELETE CASCADE ON UPDATE CASCADE,
		CHECK(status in ('Active', 'OnHold'))
	);

	Create Table Plan_Usage (
		usageID int identity(1,1), 
		start_date date, 
		end_date date, 
		data_consumption int,
		minutes_used int, 
		SMS_sent int, 
		mobileNo char(11), 
		planID int 
		PRIMARY KEY (usageID),
		FOREIGN KEY (mobileNo) REFERENCES Customer_Account ON DELETE CASCADE ON UPDATE CASCADE,
		FOREIGN KEY (planID) REFERENCES Service_Plan ON DELETE CASCADE ON UPDATE CASCADE
	);

	Create Table Payment (
		paymentID int identity(1,1), 
		amount decimal (10,1), 
		date_of_payment date, 
		payment_method Varchar(50), 
		status Varchar(50), 
		mobileNo char(11),
		PRIMARY KEY (paymentID),
		FOREIGN KEY (mobileNo) REFERENCES Customer_Account ON DELETE CASCADE ON UPDATE CASCADE,
		CHECK(payment_method in ('Cash', 'Credit')),
		CHECK(status in ('Successful', 'Pending', 'Rejected'))
	);

	--***********************************************************
	Create Table Process_Payment (
		paymentID int, 
		planID int, 
		remaining_balance DECIMAL(10,1) default 0 , --value to be calculated by triger
		extra_amount DECIMAL(10,1) default 0, --value to be calculated by triger
		PRIMARY KEY (paymentID),
		FOREIGN KEY (paymentID) REFERENCES Payment ON DELETE CASCADE ON UPDATE CASCADE,
		FOREIGN KEY (planID) REFERENCES Service_Plan ON DELETE CASCADE ON UPDATE CASCADE
	);
	GO
	CREATE TRIGGER trg_CalculatePaymentAmounts
		ON Process_Payment
		AFTER INSERT
		AS
		BEGIN
			UPDATE PP
			SET 
				PP.remaining_balance = CASE 
					WHEN P.amount < SP.price THEN SP.price - P.amount 
					ELSE 0 
				END,
				PP.extra_amount = CASE 
					WHEN P.amount > SP.price THEN P.amount - SP.price 
					ELSE 0 
				END
			FROM 
				Process_Payment PP
			JOIN 
				inserted I ON PP.paymentID = I.paymentID
			JOIN 
				Payment P ON I.paymentID = P.paymentID
			JOIN 
				Service_Plan SP ON I.planID = SP.planID;
	END;
	--***********************************************************
	GO
	Create Table Wallet (
		walletID int identity(1,1), 
		current_balance decimal(10,2), 
		currency Varchar(50), 
		last_modified_date date, 
		nationalID int
		PRIMARY KEY (walletID),
		FOREIGN KEY (nationalID) REFERENCES Customer_Profile ON DELETE CASCADE ON UPDATE CASCADE
	);

	Create Table Transfer_money (
		walletID1 int, 
		walletID2 int, 
		transfer_id int, 
		amount decimal(10,2),
		transfer_date date,
		PRIMARY KEY(walletID1,walletID2,transfer_id),
		FOREIGN KEY (walletID1) REFERENCES Wallet ON DELETE CASCADE ON UPDATE CASCADE,
		FOREIGN KEY (walletID2) REFERENCES Wallet ON DELETE CASCADE ON UPDATE CASCADE
	);

	Create Table Benefits (
		benefitID int identity(1,1), 
		description Varchar(50), 
		validity_date date, 
		status Varchar(50),
		mobileNo char(11),
		PRIMARY KEY (benefitID),
		FOREIGN KEY (mobileNo) REFERENCES Customer_Account ON DELETE CASCADE ON UPDATE CASCADE,
		CHECK(status in ('Active', 'Expired'))
	);

	Create Table Points_Group (
		pointID int identity(1,1), 
		benefitID int, 
		pointsAmount int, 
		PaymentID int,
		PRIMARY KEY(pointID,benefitID),
		FOREIGN KEY (benefitID) REFERENCES Benefits ON DELETE CASCADE ON UPDATE CASCADE,
		FOREIGN KEY (PaymentID) REFERENCES Payment ON DELETE CASCADE ON UPDATE CASCADE
	);

	Create Table Exclusive_Offer (
		offerID int identity(1,1), 
		benefitID int, 
		internet_offered int, 
		SMS_offered int,
		minutes_offered int,
		PRIMARY KEY(offerID,benefitID),
		FOREIGN KEY (benefitID) REFERENCES Benefits ON DELETE CASCADE ON UPDATE CASCADE
	);

	Create Table Cashback (
		CashbackID int identity(1,1), 
		benefitID int, 
		walletID int, 
		amount int, 
		credit_date date,
		PRIMARY KEY(CashbackID,benefitID),
		FOREIGN KEY (benefitID) REFERENCES Benefits ON DELETE CASCADE ON UPDATE CASCADE,
		FOREIGN KEY (walletID) REFERENCES Wallet ON DELETE CASCADE ON UPDATE CASCADE
		--TODO: Cashback as 10% from payment amount
	);

	Create Table Plan_Provides_Benefits (
		benefitID int, 
		planID int
		PRIMARY KEY(benefitID,planID),
		FOREIGN KEY (benefitID) REFERENCES Benefits ON DELETE CASCADE ON UPDATE CASCADE,
		FOREIGN KEY (planID) REFERENCES Service_Plan ON DELETE CASCADE ON UPDATE CASCADE,
	);

	Create Table Shop (
		shopID int identity(1,1), 
		name varchar(50), 
		category varchar(50)
		PRIMARY KEY(shopID)
	);

	Create Table Physical_Shop (
		shopID int, 
		address varchar(50), 
		working_hours varchar(50),
		PRIMARY KEY(shopID),
		FOREIGN KEY (shopID) REFERENCES Shop ON DELETE CASCADE ON UPDATE CASCADE,
	);

	Create Table E_shop (
		shopID int, 
		URL varchar(50), 
		rating int
		PRIMARY KEY(shopID),
		FOREIGN KEY (shopID) REFERENCES Shop ON DELETE CASCADE ON UPDATE CASCADE,
	);

	Create Table Voucher (
		voucherID int identity(1,1), 
		value int, 
		expiry_date date, 
		points int, 
		mobileNo char(11),
		shopID int,
		redeem_date date,
		PRIMARY KEY(voucherID),
		FOREIGN KEY (mobileNo) REFERENCES Customer_Account ON DELETE CASCADE ON UPDATE CASCADE,
		FOREIGN KEY (shopID) REFERENCES Shop ON DELETE CASCADE ON UPDATE CASCADE
	);

	Create Table Technical_Support_Ticket (
		ticketID int identity(1,1), 
		mobileNo char(11), 
		Issue_description Varchar(50),
		priority_level int, 
		status Varchar(50),
		PRIMARY KEY(ticketID),
		FOREIGN KEY (mobileNo) REFERENCES Customer_Account ON DELETE CASCADE ON UPDATE CASCADE,
		CHECK(status in ('Open', 'InProgress', 'Resolved'))
	);
------------------------------------------------------------------------------------

GO

EXEC createAllTables;

GO

---------------------------------------- 2.1c -------------------------------------
Create PROC dropAllTables
As
	DROP TABLE Customer_profile;
	DROP TABLE Customer_Account;
	DROP TABLE Service_Plan;
	DROP TABLE Subscription;
	DROP TABLE Plan_Usage;
	DROP TABLE Payment;
	DROP TABLE Process_Payment;
	DROP TABLE Wallet;
	DROP TABLE Transfer_money;
	DROP TABLE Benefits;
	DROP TABLE Points_Group;
	DROP TABLE Exclusive_Offer;
	DROP TABLE Cashback;
	DROP TABLE Plan_Provides_Benefits;
	DROP TABLE Shop;
	DROP TABLE Physical_Shop;
	DROP TABLE E_shop;
	DROP TABLE Voucher;
	DROP TABLE Technical_Support_Ticket;
------------------------------------------------------------------------------------

GO

EXEC dropAllTables;

GO

---------------------------------------- 2.1d -------------------------------------

Create PROC dropAllProceduresFunctionsViews --TODO: to be continued at end of milestone
As
	DROP PROC createAllTables;
	DROP PROC dropAllTables;

------------------------------------------------------------------------------------

GO

EXEC dropAllProceduresFunctionsViews;

GO

---------------------------------------- 2.1e -------------------------------------

Create PROC clearAllTables
As
	DELETE FROM Customer_profile;
	DELETE FROM Customer_Account;
	DELETE FROM Service_Plan;
	DELETE FROM Subscription;
	DELETE FROM Plan_Usage;
	DELETE FROM Payment;
	DELETE FROM Process_Payment;
	DELETE FROM Wallet;
	DELETE FROM Transfer_money;
	DELETE FROM Benefits;
	DELETE FROM Points_Group;
	DELETE FROM Exclusive_Offer;
	DELETE FROM Cashback;
	DELETE FROM Plan_Provides_Benefits;
	DELETE FROM Shop;
	DELETE FROM Physical_Shop;
	DELETE FROM E_shop;
	DELETE FROM Voucher;
	DELETE FROM Technical_Support_Ticket;

------------------------------------------------------------------------------------

GO

EXEC clearAllTables;

GO

---------------------------------------- 2.2 -------------------------------------

