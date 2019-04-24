/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

IF '$(LoadTestData)' = 'true'

BEGIN

DELETE FROM LOG;
DELETE FROM ACCOUNT;

INSERT INTO Account (AcctNo, Fname, Lname, CreditLimit, Balance) VALUES
(0650, 'Pum Suan', 'Khai', -2, 150),
(0630, 'James', 'Smith', -2, 250),
(0320, 'Peter', 'Summer', -10, 380),
(0625, 'Joseph', 'Mang', -3, 260);

INSERT INTO dbo.[Log] (OrigAcct, LogDateTime, RecAcct, Amount) VALUES
(0650, 2015, 0650, 4500),
(0630, 2018, 0630, 2500),
(0320, 2019, 0320, 1300),
(0625, 2013, 0625, 1200);

END;