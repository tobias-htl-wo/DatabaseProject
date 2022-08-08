CREATE TABLE [dbo].[Tacos] (
    [TacoID]      INT           IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (50)  NULL,
    [Price]       SMALLMONEY    NULL,
    [Description] VARCHAR (300) NULL,
    PRIMARY KEY CLUSTERED ([TacoID] ASC)
);

