

CREATE TRIGGER insertCUSTOMERLOG ON CUSTOMER
AFTER INSERT AS 
BEGIN
    
    INSERT INTO CUSTOMER_LOG(cid,ACTIONTYPE,ACTIONDATE)
    select i.customer_id, 'I', GETDATE()   FROM inserted i;
END

CREATE TRIGGER delete_CUSTOMER_LOG ON CUSTOMER
AFTER DELETE AS 
BEGIN
	DECLARE @hasRecords int;
	select @hasRecords=COUNT(*) from BANK_ACCOUNT
	where BANK_ACCOUNT.cust_id=(select customer_id from deleted)
      IF (@hasRecords) > 0
	BEGIN
   RAISERROR('You cannot delete corresponding customer it has records in bank account table.',16, 1)
	ROLLBACK TRANSACTION --rollback delete operation
	END
	 IF (@hasRecords) = 0
	BEGIN
   INSERT INTO CUSTOMER_LOG(cid,ACTIONTYPE,ACTIONDATE)
    select i.customer_id, 'D', GETDATE()   FROM deleted i;
	END
END;

CREATE TABLE BALANCE_LOG
(
	cid INT NOT NULL,
	ACTIONTYPE varchar(15),
	last_status int
);


CREATE TRIGGER insert_balanceLOG ON TRANSACTIONS
AFTER INSERT AS 
BEGIN
    DECLARE @balance int;
	SELECT @balance=balance FROM BANK_ACCOUNT
	WHERE BANK_ACCOUNT.cust_id=(SELECT i.cust_id FROM inserted i)

    INSERT INTO BALANCE_LOG(cid,ACTIONTYPE,last_status)
    select i.cust_id, i.transaction_type, @balance FROM inserted i;
END;

CREATE TABLE CUSTOMER_LOG
(
	cid INT NOT NULL,
	ACTIONTYPE varchar(1),
	ACTIONDATE datetime2
);
