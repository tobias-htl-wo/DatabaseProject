CREATE TABLE [dbo].[Meat] (
    [MeatID]          INT          IDENTITY (1, 1) NOT NULL,
    [Quantity(gramm)] VARCHAR (50) NULL,
    [Meat]            VARCHAR (50) NULL,
    [Price]           SMALLMONEY   NULL,
    PRIMARY KEY CLUSTERED ([MeatID] ASC)
);

