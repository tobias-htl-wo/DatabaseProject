CREATE TABLE [dbo].[Location] (
    [LocationID] INT           IDENTITY (1, 1) NOT NULL,
    [longitude]  VARCHAR (50)  NULL,
    [latitude]   VARCHAR (50)  NULL,
    [Name]       VARCHAR (50)  NULL,
    [Country]    NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([LocationID] ASC)
);

