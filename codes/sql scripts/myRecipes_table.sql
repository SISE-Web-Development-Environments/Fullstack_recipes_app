CREATE TABLE [dbo].[myRecipes](
	[user_id] [UNIQUEIDENTIFIER]  NOT NULL,
	[recipe_id] [INT]  NOT NULL,
    [title] [varchar](300) NOT NULL,
	[image] [varchar](300) NOT NULL,
	[readyInMinutes] [INT] NOT NULL,
	[aggregateLikes] [INT] NOT NULL,
	[vegetarian] [BIT] ,
	[vegan] [BIT] ,
	[glutenFree] [BIT] ,
	[ingredientDescriptionAndAmount] [varchar](5000) NOT NULL,
	[instructions] [varchar](5000) NOT NULL,
	[servings] [INT] NOT NULL,
	PRIMARY KEY (user_id,recipe_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id)
)


INSERT INTO dbo.myRecipes VALUES ( '9d342fc9-8871-4375-a7ee-3637d0de374b',2045914242,'Green bean stew',
'https://img.mako.co.il/2019/01/10/shutterstock_247889500_x5.jpg',30, 0,1,1,1,
'<ul> <li> 300g green beans  </li><li>2-3 lemons</li> <li>  4-5 cloves of garlic </li> <li> coarse salt  </li> <li> 3 tablespoons olive oil  </li> </ul>',
'<ul><li> Cook the green beans in a lot of boiling water until it is very tender (if frozen it will happen really fast, if it is fresh it will take a little longer).  </li> <li>  Drain well and transfer the beans while warm to a baking sheet. </li> <li> Grate lots of lemon peel (the yellow part only) and garlic from above. Season with salt and add olive oil generously. Massage together until the beans really fall apart.  </li> <li>  Serve hot. </li> </ul>',
3)
INSERT INTO dbo.myRecipes VALUES ( '9d342fc9-8871-4375-a7ee-3637d0de374b',2045914243,'Sweet corn salad and cherry tomatoes',
'https://img.mako.co.il/2012/07/15/KH_mako_namal_TLV-9_c.jpg',15, 90,1,1,1,
'<ul> <li>Sweet corn kernels - 1 can of packet</li><li>half a cup of cherry tomatoes</li> <li>1 cup of coriander leaves </li> <li> 0.5 chopped red onion  </li><li>0.5 chopped red chilli  </li><li>5 tablespoons olive oil  </li><li> 0.5 teaspoon of salt  </li> <li> 0.5 teaspoon of black pepper  </li></ul>',
 'Mix all ingredients in a bowl, taste and adjust seasoning to taste.',
 4)
INSERT INTO dbo.myRecipes VALUES ( '9d342fc9-8871-4375-a7ee-3637d0de374b',2045914241,'Rice with noodles',
' https://img.mako.co.il/2019/01/31/tzli_of_ve_tapudim_yonit_on_a_plate_g.jpg',30, 91,1,1,1,
'<ul><li>2 cups of Persian rice</li><li>1 cup of thin noodles</li><li>4 tablespoons of oil</li><li>2 chopped garlic cloves</li><li>4.5 cups of water</li></ul>',
 '<ul><li>Rinse the rice well in a colander under running water with the water coming out of it clear.</li><li>Heat oil in a saucepan</li><li> Add noodles and fry for 1 minute until some are browned</li><li>Add rice and fry for another half minute</li><li> Add water and spices, stir and bring to a boil</li><li>Cover, lower low flame and cook until all water is absorbed about 20 minutes.</li></ul>',
 3)

INSERT INTO dbo.myRecipes VALUES ( '80cdaf14-e344-4618-b834-a9a4b71b203a',2045914244,'Chicken and rice stew in one pot',
'https://img.mako.co.il/2017/05/08/chikenricenogluten_i.jpg',120, 93,0,0,1,
'<ul><li>1 large chopped onion</li><li>4 halved garlic cloves</li><li>2 sliced carrots</li><li>2 quartered potatoes</li><li>1 tablespoon olive oil</li><li>2 chicken thighs</li><li>3 water cups</li><li>2.5 teaspoons salt</li><li>0.5 teaspoon turmeric</li><li>0.5 teaspoon red paprika</li><li>1 pack Chopped coriander</li><li>1 cup rice</li></ul>',
 '<ul><li>Fry in a large pot of onions, garlic, carrots and potatoes. After a few minutes, add the chicken, and continue to fry until golden brown.</li><li>Pour the water into a saucepan, season and add the coriander leaves. Bring to a boil and cover the pot. Continue cooking for about half an hour, until vegetables are tender.</li><li>Add the rice to the pot. Stir without injuring the vegetables and cover. Continue to cook on low heat for about 20 minutes, until all the liquid is absorbed in the rice.</li></ul>',
 5)
INSERT INTO dbo.myRecipes VALUES ( '80cdaf14-e344-4618-b834-a9a4b71b203a',2045914245,'Baked schnitzel',
'https://img.mako.co.il/2013/08/28/shnitsel500_c.jpg',20, 0,0,0,0,
'<ul><li>200g cut chicken breast</li><li>1 egg</li><li>5 tablespoons quaker</li><li>1 tablespoon olive oil</li><li>half teaspoon paprika</li><li>salt spoon</li></ul>', 
'<ul><li>Preheat oven to 180 degrees</li><li>Break the egg into a flat bowl and mix</li><li>In a second bowl, mix the quaker, oil, paprika and salt.</li><li>Dip chicken breast in egg and then in quaker mixture.</li><li> Arrange on a lined baking sheet and bake for about 15 minutes until completely browned.</li></ul>',
2)
INSERT INTO dbo.myRecipes VALUES ( '80cdaf14-e344-4618-b834-a9a4b71b203a',2045914246,'Oatmeal cookies',
'https://besttv232-ynet-images1-prod.cdn.it.best-tv.com/PicServer5/2018/05/31/8565155/LAI106593_6.jpg',25, 0,1,0,0,
'<ul><li>1 cup quaker</li><li>2 tbsp sesame</li><li>1 tbsp baking powder</li><li>3 tbsp flour</li><li>2 tbsp sugar</li><li>1 egg</li><li>1 tbsp honey</li><li>2 tbsp grinding</li><li>1/3 cup oil</li><li>5 chopped dark chocolate </li></ul>',
 '<ul><li>In a large bowl, prey (with a manual sprinkler) eggs, honey, tahini and oil.</li><li>Add the dry ingredients - a quaker with sesame seeds, baking powder, flour, sugar, walnuts and cinnamon.</li><li> If you want to add raisins or chocolate chips, it is time to add to the batter.</li><li>Mix the ingredients well and transfer to the refrigerator for 10 minutes. If batter looks too wet, add another tablespoon of flour.</li><li>Line up a baking sheet with baking paper, wet hands form the balls of cookies and place on the mold, with a space between cookie and cookie, slightly pallets with fork.</li><li>Bake the cookies in a hot oven at 180 degrees for about 15 minutes or more, until they turn golden brown.</li></ul>',
20)




SELECT TOP (1000) [user_id]
      ,[recipe_id]
      ,[title]
      ,[image]
      ,[readyInMinutes]
      ,[aggregateLikes]
      ,[vegetarian]
      ,[vegan]
      ,[glutenFree]
      ,[ingredientDescriptionAndAmount]
      ,[instructions]
      ,[servings]
  FROM [dbo].[myRecipes]
-- ------------------------------1---------------------------------------------
  UPDATE [dbo].[myRecipes]
SET instructions = '{
                     "1": "Rinse the rice well in a colander under running water with the water coming out of it clear",
                     "2": "Heat oil in a saucepan", 
                     "3": "Add noodles and fry for 1 minute until some are browned",
                     "4": "Add rice and fry for another half minute",
                     "5": "Add water and spices, stir and bring to a boil",
                     "6": "Cover, lower low flame and cook until all water is absorbed about 20 minutes."
                     }'
WHERE user_id = '9d342fc9-8871-4375-a7ee-3637d0de374b' AND recipe_id=2045914241

 UPDATE [dbo].[myRecipes]
SET ingredientDescriptionAndAmount = '{
                     "1": "2 cups of Persian rice",
                     "2": "1 cup of thin noodles", 
                     "3": "4 tablespoons of oil",
                     "4": "2 chopped garlic cloves",
                     "5": "4.5 cups of water"
                     }'
WHERE user_id = '9d342fc9-8871-4375-a7ee-3637d0de374b' AND recipe_id=2045914241

-- ----------------------------------2-------------------------------------------
 UPDATE [dbo].[myRecipes]
SET instructions = '{
                     "1": "Cook the green beans in a lot of boiling water until it is very tender (if frozen it will happen really fast, if it is fresh it will take a little longer).",
                     "2": "Drain well and transfer the beans while warm to a baking sheet.", 
                     "3": "Grate lots of lemon peel (the yellow part only) and garlic from above. Season with salt and add olive oil generously. Massage together until the beans really fall apart",
                     "4": "Serve hot."
                     }'
WHERE user_id = '9d342fc9-8871-4375-a7ee-3637d0de374b' AND recipe_id=2045914242

 UPDATE [dbo].[myRecipes]
SET ingredientDescriptionAndAmount = '{
                     "1": "300g green beans",
                     "2": "2-3 lemons", 
                     "3": "4-5 cloves of garlic",
                     "4": "coarse salt",
                     "5": "3 tablespoons olive oil"
                     }'
WHERE user_id = '9d342fc9-8871-4375-a7ee-3637d0de374b' AND recipe_id=2045914242
-- -------------------------------------3-------------------------------------------

 UPDATE [dbo].[myRecipes]
SET instructions = '{
                     "1": "Mix all ingredients in a bowl, taste and adjust seasoning to taste."
                     }'
WHERE user_id = '9d342fc9-8871-4375-a7ee-3637d0de374b' AND recipe_id=2045914243

 UPDATE [dbo].[myRecipes]
SET ingredientDescriptionAndAmount = '{
                     "1": "Sweet corn kernels - 1 can of packet",
                     "2": "half a cup of cherry tomatoes", 
                     "3": "1 cup of coriander leaves",
                     "4": "0.5 chopped red onion",
                     "5": "0.5 chopped red chilli",
                     "6": "5 tablespoons olive oil",
                     "7": "0.5 teaspoon of salt",
                     "8": "0.5 teaspoon of black pepper"
                     }'
WHERE user_id = '9d342fc9-8871-4375-a7ee-3637d0de374b' AND recipe_id=2045914243

-- -------------------------------------- 4 -------------------------------------
 UPDATE [dbo].[myRecipes]
SET instructions = '{
                     "1": "Fry in a large pot of onions, garlic, carrots and potatoes. After a few minutes, add the chicken, and continue to fry until golden brown.",
                     "2": "Pour the water into a saucepan, season and add the coriander leaves. Bring to a boil and cover the pot. Continue cooking for about half an hour, until vegetables are tender.", 
                     "3": "Add the rice to the pot. Stir without injuring the vegetables and cover. Continue to cook on low heat for about 20 minutes, until all the liquid is absorbed in the rice"
                     }'
WHERE user_id = '80cdaf14-e344-4618-b834-a9a4b71b203a' AND recipe_id=2045914244

 UPDATE [dbo].[myRecipes]
SET ingredientDescriptionAndAmount = '{
                     "1": "1 large chopped onion",
                     "2": "4 halved garlic cloves", 
                     "3": "2 sliced carrots",
                     "4": "2 quartered potatoes",
                     "5": "1 tablespoon olive oil",
                     "6": "2 chicken thighs",
                     "7": "3 water cups",
                     "8": "2.5 teaspoons salt",
                     "9": "0.5 teaspoon turmeric",
                     "10": "0.5 teaspoon red paprika",
                     "11": "1 pack Chopped coriander",
                     "12": "1 cup rice"
                     }'
WHERE user_id = '80cdaf14-e344-4618-b834-a9a4b71b203a' AND recipe_id=2045914244
-- ------------------------------ 5 ------------------------------------------------
 UPDATE [dbo].[myRecipes]
SET instructions = '{
                     "1": "Preheat oven to 180 degrees",
                     "2": "Break the egg into a flat bowl and mix", 
                     "3": "In a second bowl, mix the quaker, oil, paprika and salt.",
                     "4": "Dip chicken breast in egg and then in quaker mixture.",
                     "5": "Arrange on a lined baking sheet and bake for about 15 minutes until completely browned."
                     }'
WHERE user_id = '80cdaf14-e344-4618-b834-a9a4b71b203a' AND recipe_id=2045914245

 UPDATE [dbo].[myRecipes]
SET ingredientDescriptionAndAmount = '{
                     "1": "200g cut chicken breast",
                     "2": "1 egg", 
                     "3": "5 tablespoons quaker",
                     "4": "1 tablespoon olive oil",
                     "5": "half teaspoon paprika",
                     "6": "salt spoon"
                     }'
WHERE user_id = '80cdaf14-e344-4618-b834-a9a4b71b203a' AND recipe_id=2045914245
-- ---------------------------------- 6 ------------------------------------------
 UPDATE [dbo].[myRecipes]
SET instructions = '{
                     "1": "In a large bowl, prey (with a manual sprinkler) eggs, honey, tahini and oil.",
                     "2": "Add the dry ingredients - a quaker with sesame seeds, baking powder, flour, sugar, walnuts and cinnamon.", 
                     "3": "If you want to add raisins or chocolate chips, its time to add to the batter.",
                     "4": "Mix the ingredients well and transfer to the refrigerator for 10 minutes. If batter looks too wet, add another tablespoon of flour.",
                     "5": "Line up a baking sheet with baking paper, wet hands form the balls of cookies and place on the mold, with a space between cookie and cookie, slightly pallets with fork.",
                     "6": "Bake the cookies in a hot oven at 180 degrees for about 15 minutes or more, until they turn golden brown."
                     }'
WHERE user_id = '80cdaf14-e344-4618-b834-a9a4b71b203a' AND recipe_id=2045914246

 UPDATE [dbo].[myRecipes]
SET ingredientDescriptionAndAmount = '{
                     "1": "1 cup quaker",
                     "2": "2 tbsp sesame", 
                     "3": "1 tbsp baking powder",
                     "4": "3 tbsp flour",
                     "5": "2 tbsp sugar",
                     "6": "1 egg",
                     "7": "1 tbsp honey",
                     "8": "2 tbsp grinding",
                     "9": "1/3 cup oil",
                     "10": "5 chopped dark chocolate"
                     }'
WHERE user_id = '80cdaf14-e344-4618-b834-a9a4b71b203a' AND recipe_id=2045914246