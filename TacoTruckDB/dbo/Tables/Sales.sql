CREATE TABLE [dbo].[Sales] (
    [SalesID]    INT      NOT NULL,
    [TacoID]     INT      NULL,
    [CustomerID] INT      NULL,
    [LocationID] INT      NULL,
    [Date]       DATETIME NULL,
    [MeatID]     INT      NULL,
    PRIMARY KEY CLUSTERED ([SalesID] ASC),
    CONSTRAINT [FK_Sales_Customer] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customer] ([CustomerID]),
    CONSTRAINT [FK_Sales_Location] FOREIGN KEY ([LocationID]) REFERENCES [dbo].[Location] ([LocationID]),
    CONSTRAINT [FK_Sales_Meat] FOREIGN KEY ([MeatID]) REFERENCES [dbo].[Meat] ([MeatID]),
    CONSTRAINT [FK_Sales_Taco] FOREIGN KEY ([TacoID]) REFERENCES [dbo].[Tacos] ([TacoID])
);

