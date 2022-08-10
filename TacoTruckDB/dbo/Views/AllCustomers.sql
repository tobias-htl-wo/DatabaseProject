CREATE VIEW [dbo].[AllCustomers]
	AS SELECT CustomerID, GoldMember, Balance
	FROM [Customer]
