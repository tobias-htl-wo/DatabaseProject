CREATE PROCEDURE [dbo].[SalesByCustomer]
	@firstname varchar(50),
	@lastname varchar(50)
AS
begin
	SELECT [s].[CustomerID],CONCAT([c].[Firstname],' ',[c].[Lastname]) as 'Customername', [l].[Name] as 'Location', [s].[Date], [s].[TacoID] as 'Taco id',[t].[Name] as 'Name',[m].[MeatID],[m].[Meat], CONCAT([m].[Price],' + ',[t].[Price],' = ',[m].[Price]+[t].[Price]) as 'Meat price + Taco price = total price'
	from dbo.Sales as s 
	left join dbo.Customer as c on s.CustomerID = c.CustomerID
	left join dbo.Tacos as t on s.TacoID = t.TacoID
	left join dbo.Location as l on s.LocationID = l.LocationID
	left join dbo.Meat as m on s.MeatID = m.MeatID
	where c.Firstname = @firstname and c.Lastname = @lastname
	--testechange
end
