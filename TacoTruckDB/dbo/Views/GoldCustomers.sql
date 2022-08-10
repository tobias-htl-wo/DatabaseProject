CREATE VIEW [dbo].[AllCustomers]
	AS SELECT CustomerID, Balance, Lastname
	FROM [Customer]s
	where GoldMember = 1
