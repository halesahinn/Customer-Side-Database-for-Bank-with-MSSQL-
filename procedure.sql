--1

CREATE PROCEDURE GetStudents AS
		SELECT * FROM STUDENT;
	GO
	

exec GetStudents


	--execute procedure
exec GetStudents


--2 a sample precedure



CREATE PROCEDURE StudentsbyCityAndGender
	@City nvarchar(25),
	@Gender CHAR(1)
AS
SELECT FNAME,LNAME,city, gender FROM STUDENT AS e
WHERE e.city = @City
AND e.GENDER = @Gender;


exec StudentsbyCityAndGender 'Ankara','F';
exec StudentsbyCityAndGender @Gender='F',@City='Ankara';

SELECT FNAME,LNAME,city, gender FROM STUDENT AS e
WHERE e.city = 'Ankara'
AND e.GENDER = 'F'

--3 a sample precedure
--create a procedure that does the following operations:
-- Assume that an advisor consumes 10 hours for his/ her each student
-- This procedure should calculate the total time he/she consumed for his/her students

--Total number of students must be calculated and must be written to an output parameter
-- for an advisor whose staffid is specified by an input parameter
-- that number must be multiplied by 10 and must be assigned to an output parameter

CREATE PROC GetTotalTimeConsumption
	@staffid smallint,
	@numberOfStudents int OUTPUT,
	@timeConsumed int OUTPUT	
AS
declare 
		@timeCons int, 
		@a int, 
		@b int
select @numberOfStudents=count(*)
from STAFF st, STUDENT s
where st.staffID=s.advisorID
and st.staffID=@staffid;
set @timeCons=@numberOfStudents*10;
set @timeConsumed=@timeCons;


IF @numberOfStudents < 10 SET @a = 1
IF @numberOfStudents > 10 SET @a = 0
GO



--select all following and execute once
declare @param1 int;
declare @param2 int;

exec GetTotalTimeConsumption 1, @param1 OUTPUT, @param2 OUTPUT;

select @param1;
select @param2;

select * from student





--4 a sample precedure
--create a procedure that does the following operations:
--The age of the staff whose fname and lname is specified 
--by the input parameters
-- should change according to a third input parameter.
-- if the third input parameter is equal to 1 increase age value by 5
-- if the third input parameter is equal to 0 decrease age value by 5
-- assign the resulting value to an output parameter

CREATE PROCEDURE ChangeAge
	@fname nvarchar(25),
	@lname nvarchar(25),
	@arbiter int,
	@result int output	
AS
declare 
		@currentAge int, 
		@staffId int, 
		@b int
select @currentAge=age, @staffId=staffID
from STAFF st
where st.fName=@fname
and st.lName=@lname

IF @arbiter =1 SET @currentAge = @currentAge+5
IF @arbiter =0 SET @currentAge = @currentAge-5
set @result=@currentAge
update STAFF set age=@currentAge where staffID=@staffId

GO


---
declare @param1 int;
exec ChangeAge 'Zuhal', 'Meral',1, @param1 OUTPUT;

select @param1;

select * from staff
select * from transcript
select * from student


--5-

CREATE PROCEDURE insertTranscript
	@studentID smallint,
	@cCode varchar(8),
	@grade decimal(3,1)
AS
Insert into TRANSCRIPT(studentID, cCode, grade4)
		values(@studentID,@cCode,@grade)

GO


exec insertTranscript 52,'CSE100',3 

