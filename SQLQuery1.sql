
CREATE PROCEDURE UpdateAccount

	@FromAccount int,
	@ToAccount INT,
	@Amount MONEY

AS
BEGIN
	BEGIN TRANSACTION;
	SAVE TRANSACTION MySavePoint;

	BEGIN TRY

		-- update the from account (account with the id = to @fromaccount) so its balance is reduced by @amount
		UPDATE dbo.Account
		SET Balance = Balance - @Amount
		WHERE (AcctNo = @FromAccount);

		-- update the to account (account with the id = to @toaccount) so its balance is increased by @amount
		UPDATE dbo.Account
		SET Balance = Balance + @Amount
		WHERE (AcctNo = @ToAccount);

		-- insert a row into the log table recording @fromaccount, @toaccount, current date time, and @amount
		INSERT INTO [dbo].[Log]
		( [OrigAcct], [LogDateTime],[RecAcct],[Amount]) VALUES
		(@FromAccount, GETDATE(), @ToAccount, @Amount);

			COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION MySavePoint;
		END
	END CATCH
END;