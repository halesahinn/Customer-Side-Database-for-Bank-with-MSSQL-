
DROP TABLE CUSTOMER;
DROP TABLE BRANCH;
DROP TABLE BANK_ACCOUNT;
DROP TABLE BANK;
DROP TABLE BANK_CARD;
DROP TABLE TRANSACTIONS;
DROP TABLE DEBIT_CARD;
DROP TABLE CREDIT_CARD;


CREATE TABLE CUSTOMER(
customer_id INT IDENTITY(1,1),
c_name VARCHAR(20),
c_last_name VARCHAR(20),
street VARCHAR(20),
city VARCHAR(20),
c_phone_number NUMERIC(10,0),
CONSTRAINT customer_pk PRIMARY KEY (customer_id)
);

CREATE TABLE BANK_ACCOUNT(
account_number NUMERIC(18,0) IDENTITY(100900001111145896,2),
balance INT DEFAULT 0,
account_type VARCHAR(20),
cust_id INT,
CONSTRAINT acc_pk PRIMARY KEY (account_number),
CONSTRAINT cust_id_fk FOREIGN KEY (cust_id) REFERENCES CUSTOMER(customer_id)
);
 

CREATE TABLE BRANCH(
branch_id INT,
branch_name VARCHAR(30) NOT NULL,
branch_city VARCHAR(15) NOT NULL,
CONSTRAINT branch_pk PRIMARY KEY (branch_id)
);

CREATE TABLE BANK(
cust_id INT,
bran_id INT,
CONSTRAINT bank_cust FOREIGN KEY (cust_id) REFERENCES CUSTOMER(customer_id),
CONSTRAINT bank_cust2 FOREIGN KEY (bran_id) REFERENCES BRANCH(branch_id)
);

CREATE TABLE BANK_CARD(
card_number NUMERIC(16,0)  IDENTITY(1111222233334444,1),
card_type VARCHAR(20)
CHECK (card_type IN ('DEBIT_CARD','CREDIT_CARD' )),
expire_date DATE NOT NULL,
c_id INT,
CONSTRAINT card_pk PRIMARY KEY (card_number),
CONSTRAINT card_fk FOREIGN KEY (c_id) REFERENCES CUSTOMER(customer_id),
UNIQUE (card_number,card_type)
);

CREATE TABLE DEBIT_CARD(
card_number NUMERIC(16,0),
card_type AS ISNULL(CAST('DEBIT_CARD' AS VARCHAR(20)), '') PERSISTED,
withdraw_limit INT,
FOREIGN KEY (card_number,card_type) REFERENCES BANK_CARD (card_number,card_type)
);

CREATE TABLE CREDIT_CARD(
card_number NUMERIC(16,0),
card_type AS ISNULL(CAST('CREDIT_CARD' AS VARCHAR(20)), '') PERSISTED,
loan_limit INT,
current_dept NUMERIC(20,5),
minimum_monthly_payment NUMERIC(20,5),
FOREIGN KEY (card_number,card_type) REFERENCES BANK_CARD (card_number,card_type)
);

CREATE TABLE TRANSACTIONS(
transaction_number NUMERIC(11,0) IDENTITY(11112465244,4),
transaction_type VARCHAR(15),
amount INT,
cust_id INT,
CONSTRAINT transaction_pk PRIMARY KEY (transaction_number),
CONSTRAINT transaction_fk FOREIGN KEY (cust_id) REFERENCES CUSTOMER(customer_id)
);

