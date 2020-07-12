CREATE TABLE [dbo].[usersInduction](
	[user_id] [UNIQUEIDENTIFIER]  NOT NULL,
	[recipe_id] [INT]  NOT NULL,
	[saved] [BIT]  NOT NULL,
	[watched] [BIT]  NOT NULL,
	[watch_time][datetime] NOT NULL default GETDATE(),
	PRIMARY KEY (user_id,recipe_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id)
)


 INSERT INTO dbo.usersInduction VALUES ('9d342fc9-8871-4375-a7ee-3637d0de374b',111, 0,0,default)
 INSERT INTO dbo.usersInduction VALUES ('9d342fc9-8871-4375-a7ee-3637d0de374b',222, 0,0,default)
 INSERT INTO dbo.usersInduction VALUES ('80cdaf14-e344-4618-b834-a9a4b71b203a',333, 0,0,default)
 INSERT INTO dbo.usersInduction VALUES ('80cdaf14-e344-4618-b834-a9a4b71b203a',3334, 0,0,default)
 INSERT INTO dbo.usersInduction VALUES ('80cdaf14-e344-4618-b834-a9a4b71b203a',3335, 0,0,default)
 INSERT INTO dbo.usersInduction VALUES ('80cdaf14-e344-4618-b834-a9a4b71b203a',3336, 0,0,default)
 INSERT INTO dbo.usersInduction VALUES ('9d342fc9-8871-4375-a7ee-3637d0de374b',2225, 0,0,default)

UPDATE [dbo].[usersInduction]
SET saved = 1
WHERE user_id = '9d342fc9-8871-4375-a7ee-3637d0de374b' AND recipe_id=222

UPDATE [dbo].[usersInduction]
SET saved = 1 , watched=1
WHERE user_id = '80cdaf14-e344-4618-b834-a9a4b71b203a' AND recipe_id=333

 SELECT * FROM dbo.usersInduction where user_id='80cdaf14-e344-4618-b834-a9a4b71b203a'

SELECT TOP (1000) [user_id]
      ,[recipe_id]
      ,[saved]
      ,[watched]
      ,[watch_time]
  FROM [dbo].[usersInduction]

 INSERT INTO dbo.usersInduction VALUES ('80cdaf14-e344-4618-b834-a9a4b71b203a',333, 0,1,default)

SELECT recipe_id FROM dbo.usersInduction where user_id='80cdaf14-e344-4618-b834-a9a4b71b203a' AND saved = 1



--  SELECT * FROM [dbo].[usersInduction] ORDER BY [watch_time] DESC

 SELECT TOP (3) * FROM [dbo].[usersInduction] WHERE user_id='80cdaf14-e344-4618-b834-a9a4b71b203a' ORDER BY [watch_time] DESC

UPDATE dbo.usersInduction SET saved='1',watch_time=default WHERE user_id='9D342FC9-8871-4375-A7EE-3637D0DE374B' AND recipe_id='2225'

SELECT * FROM dbo.usersInduction where user_id='9D342FC9-8871-4375-A7EE-3637D0DE374B' AND recipe_id=2225

DELETE FROM [dbo].[usersInduction] WHERE recipe_id='595234' AND user_id='80cdaf14-e344-4618-b834-a9a4b71b203a';