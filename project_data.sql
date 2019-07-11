

--Data for Customer Table
exec InsertNewCustomer 'Chandler','Bing','Manhattan','New York',1245784587
exec InsertNewCustomer 'Monica','Geller','Manhattan','New York',1239874565
exec InsertNewCustomer 'Rachel','Green','Manhattan','New York',5468793652
exec InsertNewCustomer 'Ross','Geller','Jack','Oklahoma',8796854257
exec InsertNewCustomer 'Joey','Tribbiani','Sandy','New York',6547457578
exec InsertNewCustomer 'Phoebe','Buffay','Central Park','New Jersey',6666555547
exec InsertNewCustomer 'Sheldon','Cooper','Downtown','Texas',4578797858
exec InsertNewCustomer 'Amy Farah','Fowler','Madelon','San Francisco',6632014578
exec InsertNewCustomer 'Leonard','Hoftstader','Black','New Islands',3457816556
exec InsertNewCustomer 'Penny','Beauty','Comenart','Paris',5124768574
exec InsertNewCustomer 'Howard','Wolowitz','Habdesd','Chicago',5478665585
exec InsertNewCustomer 'Bernadette','Rostenkowski','Cab','Moscow',6352147458
exec InsertNewCustomer 'Rajesh','Koothrapali','Delhi','Mumbai',5465025007
exec InsertNewCustomer 'Thedeore','Mosby','Shaker','Ohio',5141020478
exec InsertNewCustomer 'Lily','Aldrin','Heights','New York',3030104050
exec InsertNewCustomer 'Marshall','Erickson','St.Cloud','Minnesota',6257841365
exec InsertNewCustomer 'Barney','Stinson','Brooklyn','New York',3040576985
exec InsertNewCustomer 'Robin','Scherbatsky','Vancouver','Columbia',6287014630
exec InsertNewCustomer 'Tracy','Mosby','Manhattan','New York',6632010147
exec InsertNewCustomer 'Barry','Allen','Benert','Central City',5410257850
exec InsertNewCustomer 'Iris','West','Benert','Central City',6664602510
exec InsertNewCustomer 'Caitlin','Snow','Erlesay','Central City',3025784102
exec InsertNewCustomer 'Cisco','Ramon','Machito','Central City',5639755487
exec InsertNewCustomer 'Harrison','Wells','Brooklyn','New York',3657415748
exec InsertNewCustomer 'Oliver','Queen','Baccef','Star City',4547963025
exec InsertNewCustomer 'Felicity','Smoak','Heights','Ohio',6601201230
exec InsertNewCustomer 'Kara','Zor El','Daxam','Krypton',0124506980
exec InsertNewCustomer 'Kara','Danvers','Upstate','National City',2014587540
exec InsertNewCustomer 'Ras','Al Ghul','Center','Star City',0102025056
exec InsertNewCustomer 'Sara','Lance','Shippy','Star City',4152796630
exec InsertNewCustomer 'Laurel','Lance','Kanstre','National City',5413065028
exec InsertNewCustomer 'Alex','Danvers','Vasxer','Mumbai',201985674
exec InsertNewCustomer 'Mick','Rory','Lordpick','Texas',0578965214
exec InsertNewCustomer 'Sara','Ramon','Alight','New Orleans',5136547845


--Data for Bank Account

exec InsertBankAccount 1,'Deposit'
exec InsertBankAccount 2,'Deposit'
exec InsertBankAccount 3,'Checking'
exec InsertBankAccount 4,'Deposit'
exec InsertBankAccount 5,'Checking'
exec InsertBankAccount 6,'Deposit'
exec InsertBankAccount 7,'Deposit'
exec InsertBankAccount 8,'Checking'
exec InsertBankAccount 9,'Deposit'
exec InsertBankAccount 10,'Deposit'
exec InsertBankAccount 11,'Checking'
exec InsertBankAccount 12,'Checking'
exec InsertBankAccount 13,'Checking'
exec InsertBankAccount 14,'Checking'
exec InsertBankAccount 15,'Deposit'
exec InsertBankAccount 16,'Deposit'
exec InsertBankAccount 17,'Checking'
exec InsertBankAccount 18,'Deposit'
exec InsertBankAccount 19,'Deposit'
exec InsertBankAccount 20,'Deposit'
exec InsertBankAccount 21,'Deposit'
exec InsertBankAccount 22,'Checking'
exec InsertBankAccount 23,'Checking'
exec InsertBankAccount 24,'Checking'
exec InsertBankAccount 25,'Checking'
exec InsertBankAccount 26,'Deposit'
exec InsertBankAccount 27,'Deposit'
exec InsertBankAccount 28,'Deposit'
exec InsertBankAccount 29,'Checking'
exec InsertBankAccount 30,'Deposit'
exec InsertBankAccount 31,'Checking'
exec InsertBankAccount 32,'Deposit'
exec InsertBankAccount 33,'Deposit'
exec InsertBankAccount 34,'Checking'



--BRANCH DATA
exec InsertBranch 'Manhattan Bank','New York'
exec InsertBranch 'Jeck Jack Bank','Oklahoma'
exec InsertBranch 'Central Bank','New Jersey'
exec InsertBranch 'Texas Bank','Texas'
exec InsertBranch 'Red Bank','San Francisco'
exec InsertBranch 'Island Bank', 'New Islands'
exec InsertBranch 'Modern Bank','Paris'
exec InsertBranch 'Business Bank','Chicago'
exec InsertBranch 'FarCold Bank','Moscow'
exec InsertBranch 'Sweet Bank','Mumbai'
exec InsertBranch 'Ohio City Bank','Ohio'
exec InsertBranch 'Trust Bank','Minnesota'
exec InsertBranch 'Secure Bank','Columbia'
exec InsertBranch 'Working Bank','Central City'
exec InsertBranch 'Star Bank','Star City'
exec InsertBranch 'Alien Bank','Krypton'
exec InsertBranch 'National Bank','National City'
exec InsertBranch 'Orleans Bank','New Orleans'
TRUNCATE TABLE BRANCH
SELECT * FROM BRANCH ORDER BY branch_id ASC


--BANK INFORMATION 
exec InsertBank 1,17
exec InsertBank 2,13
exec InsertBank 3,11
exec InsertBank 4,1
exec InsertBank 5,7
exec InsertBank 6,3
exec InsertBank 7,2
exec InsertBank 8,3
exec InsertBank 9,1
exec InsertBank 10,12
exec InsertBank 11,15
exec InsertBank 12,17
exec InsertBank 13,9
exec InsertBank 14,8
exec InsertBank 15,7
exec InsertBank 16,6
exec InsertBank 17,5
exec InsertBank 18,4
exec InsertBank 19,3
exec InsertBank 20,2
exec InsertBank 21,1
exec InsertBank 22,18
exec InsertBank 23,17
exec InsertBank 24,16
exec InsertBank 25,16
exec InsertBank 26,15
exec InsertBank 27,14
exec InsertBank 28,13
exec InsertBank 29,12
exec InsertBank 30,11
exec InsertBank 31,10
exec InsertBank 32,9
exec InsertBank 33,8
exec InsertBank 34,7


 --BANK CARD DATAS
 exec InsertBankCard 'DEBIT_CARD',1
 exec InsertBankCard 'CREDIT_CARD',2
 exec InsertBankCard 'DEBIT_CARD',3
 exec InsertBankCard 'DEBIT_CARD',4
 exec InsertBankCard 'CREDIT_CARD',5
 exec InsertBankCard 'CREDIT_CARD',6
 exec InsertBankCard 'CREDIT_CARD',7
 exec InsertBankCard 'DEBIT_CARD',8
 exec InsertBankCard 'CREDIT_CARD',9
 exec InsertBankCard 'DEBIT_CARD',10
 exec InsertBankCard 'CREDIT_CARD',20
 exec InsertBankCard 'DEBIT_CARD',19
 exec InsertBankCard 'DEBIT_CARD',18
 exec InsertBankCard 'DEBIT_CARD',17
 exec InsertBankCard 'CREDIT_CARD',16
 exec InsertBankCard 'DEBIT_CARD',15
 exec InsertBankCard 'CREDIT_CARD',14
 exec InsertBankCard 'DEBIT_CARD',13
 exec InsertBankCard 'DEBIT_CARD',12
 exec InsertBankCard 'DEBIT_CARD',11
 exec InsertBankCard 'DEBIT_CARD',21
 exec InsertBankCard 'DEBIT_CARD',22
 exec InsertBankCard 'CREDIT_CARD',23
 exec InsertBankCard 'CREDIT_CARD',24
 exec InsertBankCard 'CREDIT_CARD',25
 exec InsertBankCard 'CREDIT_CARD',34
 exec InsertBankCard 'CREDIT_CARD',33
 exec InsertBankCard 'DEBIT_CARD',32
 exec InsertBankCard 'CREDIT_CARD',31
 exec InsertBankCard 'CREDIT_CARD',30
 exec InsertBankCard 'DEBIT_CARD',29
 exec InsertBankCard 'DEBIT_CARD',28
 exec InsertBankCard 'DEBIT_CARD',27
 exec InsertBankCard 'CREDIT_CARD',26



 --DEBIT CARD DATA
exec InsertDebitCard 1,1000
exec InsertDebitCard 3,500
exec InsertDebitCard 4,750
exec InsertDebitCard 8,1250
exec InsertDebitCard 10,150
exec InsertDebitCard 19,1850
exec InsertDebitCard 18,3500
exec InsertDebitCard 17,2000
exec InsertDebitCard 15,10000
exec InsertDebitCard 13,150000
exec InsertDebitCard 12,1540
exec InsertDebitCard 11,1450
exec InsertDebitCard 21,2500
exec InsertDebitCard 22,1000
exec InsertDebitCard 32,3200
exec InsertDebitCard 29,3480
exec InsertDebitCard 28,7800
exec InsertDebitCard 27,2500


--CREDIT CARD DATA
exec InsertCreditCard 2,10000,0
exec InsertCreditCard 5,20000,0
exec InsertCreditCard 6,30000,0
exec InsertCreditCard 7,10000,0
exec InsertCreditCard 9,25000,0
exec InsertCreditCard 20,34000,10000
exec InsertCreditCard 16,45000,100
exec InsertCreditCard 14,50000,1500
exec InsertCreditCard 23,20000,1000
exec InsertCreditCard 24,100000,2000
exec InsertCreditCard 25,150000,0
exec InsertCreditCard 34,10000,0
exec InsertCreditCard 33,15000,0
exec InsertCreditCard 31,12000,500
exec InsertCreditCard 30,20000,1500
exec InsertCreditCard 26,50000,25000


exec InsertTransaction 'Add',300,7
exec InsertTransaction 'Take',900,13
exec InsertTransaction 'Add',1500,15
exec InsertTransaction 'Take',300,25
exec InsertTransaction 'Add',200,2
exec InsertTransaction 'Take',500,22
exec InsertTransaction 'Add',1000,14
exec InsertTransaction 'Take',2000,6
exec InsertTransaction 'Add',300,1
exec InsertTransaction 'Take',700,3
exec InsertTransaction 'Add',600,31
exec InsertTransaction 'Take',200,34
exec InsertTransaction 'Add',1200,26
exec InsertTransaction 'Take',3500,23
exec InsertTransaction 'Add',1000,2
exec InsertTransaction 'Take',3000,10
exec InsertTransaction 'Add',2200,20

