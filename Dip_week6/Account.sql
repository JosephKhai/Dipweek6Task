CREATE TABLE [dbo].[Account]
(
	[AcctNo] INT NOT NULL PRIMARY KEY, 
    [Fname] NVARCHAR(50) NOT NULL, 
    [Lname] NVARCHAR(50) NOT NULL, 
    [CreditLimit] MONEY NOT NULL, 
    [Balance] MONEY NOT NULL, 

    CONSTRAINT [AK_Account_Column] UNIQUE ([Fname], [Lname]), 
    CONSTRAINT [CK_Account_Column] CHECK ([CreditLimit] < 0), 
    CONSTRAINT [CK_Account_Column_1] CHECK ([Balance] > [CreditLimit])
)
