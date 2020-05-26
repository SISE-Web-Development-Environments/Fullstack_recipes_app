CREATE TABLE [dbo].[users](
	[user_id] [UNIQUEIDENTIFIER] PRIMARY KEY NOT NULL default NEWID(),
	[username] [varchar](30) NOT NULL UNIQUE,
	[firstname] [varchar](30) NOT NULL,
	[lastname] [varchar](30) NOT NULL,
	[country] [varchar](30) NOT NULL,
	[password] [varchar](300) NOT NULL,
	[email] [varchar](30) NOT NULL,
	[profileurl] [varchar](1000) NOT NULL
)

