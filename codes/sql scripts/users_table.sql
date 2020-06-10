SELECT TOP (1000) [user_id]
      ,[username]
      ,[firstname]
      ,[lastname]
      ,[country]
      ,[password]
      ,[email]
      ,[profileurl]
  FROM [dbo].[users]

  SELECT username FROM dbo.users where user_id='9d342fc9-8871-4375-a7ee-3637d0de374b'

  SELECT user_id , username FROM dbo.users

  CREATE TABLE [dbo].[users](
	[user_id] [UNIQUEIDENTIFIER] PRIMARY KEY NOT NULL default NEWID(),
	[username] [varchar](30) NOT NULL UNIQUE,
	[password] [varchar](300) NOT NULL
)