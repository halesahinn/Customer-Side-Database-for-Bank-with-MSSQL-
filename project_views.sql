

CREATE VIEW TOP15_CUSTOMER_BRANCH AS
SELECT cust_id,bran_id,c_name,branch_name
FROM BANK b, CUSTOMER c,BRANCH br
WHERE c.customer_id<15
AND b.cust_id=c.customer_id 
AND b.bran_id=br.branch_id 


CREATE VIEW CUSTOMER_BRANCH AS
SELECT c_name,c_last_name,branch_name FROM CUSTOMER c, BRANCH b,BANK
WHERE BANK.cust_id=c.customer_id
AND BANK.bran_id=b.branch_id
AND bran_id IN(
SELECT branch_id FROM BRANCH 
WHERE branch_name<>'National Bank')

CREATE VIEW BANK_INFO  AS
 SELECT card_number,c_id,c_name 
 FROM BANK_CARD bc LEFT JOIN CUSTOMER c
 ON bc.c_id=c.customer_id
 WHERE c.city='New York'

 CREATE VIEW CARD_INFO AS
SELECT c_name,city
FROM CUSTOMER WHERE customer_id IN (
SELECT c_id FROM BANK_CARD
WHERE card_number IN(
SELECT card_number FROM DEBIT_CARD) 
) 

CREATE VIEW DEBIT AS
SELECT dc.card_number,dc.card_type,withdraw_limit,c_id
FROM DEBIT_CARD dc LEFT JOIN BANK_CARD bc
ON dc.card_number=bc.card_number
WHERE withdraw_limit >1000


CREATE VIEW TRANSACT AS
SELECT c_name,cust_id,transaction_type,amount
FROM CUSTOMER c INNER JOIN TRANSACTIONS t
ON c.customer_id=t.cust_id



