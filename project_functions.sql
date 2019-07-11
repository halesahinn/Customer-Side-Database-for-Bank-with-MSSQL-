
CREATE OR ALTER FUNCTION BranchCity
(@city VARCHAR(15))
returns INT
AS    
BEGIN  
    DECLARE @c_id int;  
	SELECT @c_id = CASE @city
         WHEN 'Central City' THEN 1
	     WHEN 'Chicago' THEN 2
		 WHEN 'Columbia' THEN 3
		 WHEN 'Krypton' THEN 4
		 WHEN 'Minnesota' THEN 5
		 WHEN 'Moscow' THEN 6
		 WHEN 'Mumbai' THEN 7
		 WHEN 'National City' THEN 8
		 WHEN 'New Islands' THEN 9
		 WHEN 'New Jersey' THEN 10
		 WHEN 'New Orleans' THEN 11
         WHEN 'New York' THEN 12
		 WHEN 'Ohio' THEN 13
         WHEN 'Oklahoma' THEN 14 
         WHEN 'Paris' THEN 15
		 WHEN 'San Francisco' THEN 16
		 WHEN 'Star City' THEN 17
		 WHEN 'Texas' THEN 18
         END;
RETURN (@c_id);
END;
GO


