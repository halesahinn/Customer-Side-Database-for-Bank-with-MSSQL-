


--1  INSERT NEW CUSTOMER
CREATE PROCEDURE InsertNewCustomer
@name VARCHAR(20),
@last_name VARCHAR(20),
@street VARCHAR(20),
@city VARCHAR(20),
@phone_number NUMERIC(10,0)

AS
INSERT INTO CUSTOMER 
VALUES(@name,@last_name,@street,@city,@phone_number)
GO


--2 INSERT NEW BANK ACCOUNT
CREATE PROCEDURE InsertBankAccount
@id INT,
@type VARCHAR(20)
AS
INSERT INTO BANK_ACCOUNT
VALUES(default,@type,@id)
GO


--3 INSERT NEW BRANCH
CREATE PROCEDURE InsertBranch
@bname VARCHAR(30),
@city VARCHAR(15)
AS
DECLARE @bid INT;
exec @bid = dbo.BranchCity  @city
INSERT INTO BRANCH
VALUES(@bid,@bname,@city)
GO

--4 INSERT BANK INFO
CREATE PROCEDURE InsertBank
@cid INT,
@bid INT
AS
INSERT INTO BANK
VALUES(@cid,@bid)
GO

--5 INSERT BANK CARD
CREATE PROCEDURE InsertBankCard
@c_type VARCHAR(20),
@cid INT
AS
INSERT INTO BANK_CARD
VALUES(@c_type,GETDATE(),@cid)
GO


--6 INSERT DEBIT BANK CARD
CREATE PROCEDURE InsertDebitCard
@cid INT,
@limit INT
AS
DECLARE @cardno NUMERIC(16,0);
SELECT @cardno=card_number FROM BANK_CARD 
WHERE @cid=BANK_CARD.c_id

INSERT INTO DEBIT_CARD
VALUES(@cardno,@limit)
GO

--7 INSERT CREDIT BANK CARD
CREATE PROCEDURE InsertCreditCard
@cid INT,
@loan INT,
@dept NUMERIC(20,5)
AS
DECLARE @cardno NUMERIC(16,0);
DECLARE @minimum_payment NUMERIC(20,5);
SELECT @cardno=card_number FROM BANK_CARD 
WHERE @cid=BANK_CARD.c_id
set @minimum_payment=(@dept*30)/100;
INSERT INTO CREDIT_CARD
VALUES(@cardno,@loan,@dept,@minimum_payment)
GO

--8 UPDATE BALANCE IN BANK ACCOUNT
CREATE PROCEDURE UpdateBankAccount
@id INT,
@type VARCHAR(15),
@amount INT
AS
DECLARE @balance INT;
SELECT @balance=balance FROM BANK_ACCOUNT
WHERE @id=BANK_ACCOUNT.cust_id
IF @type='Add'
SET @balance=@balance + @amount;
ELSE
SET @balance=@balance - @amount;
UPDATE BANK_ACCOUNT SET balance = @balance
WHERE @id=BANK_ACCOUNT.cust_id
GO


--9 INSERT TRANSACTIONS
CREATE PROCEDURE InsertTransaction
@type VARCHAR(15),
@amount INT,
@cid INT
AS
exec UpdateBankAccount @cid,@type,@amount
INSERT INTO TRANSACTIONS
VALUES(@type,@amount,@cid)
GO


