CREATE TABLE [dbo].[Customer] (
    [CustomerID] INT             IDENTITY (1, 1) NOT NULL,
    [Firstname]  VARCHAR (50)    NULL,
    [Lastname]   VARCHAR (50)    NULL,
    [GoldMember] BIT             NULL,
    [Balance]    DECIMAL (12, 2) NULL,
    PRIMARY KEY CLUSTERED ([CustomerID] ASC)
);

