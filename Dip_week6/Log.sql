CREATE TABLE [dbo].[Log]
(
	[OrigAcct] INT NOT NULL, 
    [LogDateTime] DATETIME NOT NULL, 
    [RecAcct] INT NOT NULL, 
    [Amount] MONEY NOT NULL, 

	CONSTRAINT [PK_Log] PRIMARY KEY ([OrigAcct], [LogDateTime]),
    CONSTRAINT [FK_Log_ToTable] FOREIGN KEY ([OrigAcct]) REFERENCES [Account]([AcctNo]), 
    CONSTRAINT [FK_Log_ToTable_1] FOREIGN KEY ([RecAcct]) REFERENCES [Account]([AcctNo]), 
)
