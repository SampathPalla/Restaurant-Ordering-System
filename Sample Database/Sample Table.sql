CREATE TABLE [dbo].[Sample Table]
(
	[Id] INT NOT NULL PRIMARY KEY,
	[Name] NVARCHAR(100) NOT NULL, 
    [Price] FLOAT NOT NULL DEFAULT 0.0, 
    [Image] NVARCHAR(1000) NULL, 
    [Ingredients] NVARCHAR(1000) NULL, 
    [upVotes] INT NULL, 
    [downVotes] INT NULL
)
