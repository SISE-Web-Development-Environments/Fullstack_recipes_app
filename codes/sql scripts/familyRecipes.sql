        CREATE TABLE [dbo].[familyRecipes](
            [user_id] [UNIQUEIDENTIFIER]  NOT NULL,
            [recipe_id] [INT]  NOT NULL,
            [title] [varchar](300) NOT NULL,
            [recipe_owner][varchar](200)NOT NULL,
            [traditional_preparation_time][varchar](200)NOT NULL,
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


INSERT INTO dbo.familyRecipes VALUES ( '9d342fc9-8871-4375-a7ee-3637d0de374b',2045914247,'Chocolate Chip Cookies','Granny Miriam','every friday',
'https://res.cloudinary.com/dfgjujaok/image/upload/v1591277053/Chocolate_Chip_Cookies_ogejrq.jpg',60, 0,1,0,0,
'<ul> <li>1 cup butter, softened</li> <li>   1 cup white sugar</li> <li>1 cup packed brown sugar</li><li>2 eggs</li><li>2 teaspoons vanilla extract</li><li>1 teaspoon baking soda</li><li>2 teaspoons hot water</li><li>½ teaspoon salt</li><li>3 cups all-purpose flour</li><li>2 cups semisweet chocolate chips</li><li>1 cup chopped walnuts</li>  </ul>',
 '<ul> <li>Preheat oven to 350 degrees F (175 degrees C).</li> <li>Cream together the butter, white sugar, and brown sugar until smooth. Beat in the eggs one at a time, then stir in the vanilla. Dissolve baking soda in hot water. Add to batter along with salt. Stir in flour, chocolate chips, and nuts. Drop by large spoonfuls onto ungreased pans.</li> <li>Bake for about 10 minutes in the preheated oven, or until edges are nicely browned.</li></ul>',
24)
INSERT INTO dbo.familyRecipes VALUES ( '9d342fc9-8871-4375-a7ee-3637d0de374b',2045914248,'Granny Miriams chicken','Granny Miriam','once a week',
'https://res.cloudinary.com/dfgjujaok/image/upload/v1591277053/Granny_Miriam_s_chicken_szxpgk.jpg',360, 0,0,0,1,
'<ul> <li>4 eaches skinless, boneless chicken thighs</li> <li>0.5 cup soy sauce</li> <li>0.5 cup ketchup</li><li>⅓ cup honey</li><li>3 cloves garlic, minced</li><li>1 teaspoon dried basil</li></ul>',
 '<ul> <li>Lay chicken thighs into the bottom of a 4-quart slow cooker.</li> <li>Whisk soy sauce, ketchup, honey, garlic, and basil together in a bowl; pour over the chicken.</li> <li>Cook on Low for 6 hours.</li></ul>',
4)
INSERT INTO dbo.familyRecipes VALUES ( '9d342fc9-8871-4375-a7ee-3637d0de374b',2045914249,'Alines Cherry Cheesecake','Mother Aline','every saturday',
'https://res.cloudinary.com/dfgjujaok/image/upload/v1591277052/Aline_s_Cherry_Cheesecake_r1vxo7.jpg',80, 0,1,1,0,
'<ul> <li>28 graham crackers, crushed</li> <li>0.5 cup butter, melted</li> <li>1 cup milk</li><li>2 (1.3 ounce) envelopes dry whipped topping mix </li><li>1 (8 ounce) package cream cheese, softened</li><li>0.5 cup white sugar</li><li>1 (21 ounce) can cherry pie filling</li></ul>',
 '<ul> <li>Mix crushed graham crackers and butter in a bowl; press mixture into a 9x11-inch dish.</li> <li>Beat milk and whipped topping mix in a bowl until fluffy.</li> <li>Beat cream cheese and sugar in a separate bowl until fully incorporated; stir into whipped topping mixture until smooth. Spread mixture onto the graham cracker crust. Refrigerate until set, 1 to 2 hours. Top with cherry pie filling.</li></ul>',
10)

INSERT INTO dbo.familyRecipes VALUES ( '80cdaf14-e344-4618-b834-a9a4b71b203a',2045914210,'Brownies','Mother Ilana','every saturday',
'https://res.cloudinary.com/dfgjujaok/image/upload/v1591277053/Brownies_lr4507.jpg',60, 0,1,0,0,
'<ul> <li>½ cup butter</li> <li>1 cup white sugar</li> <li>2 eggs</li><li>1 teaspoon vanilla extract</li><li>⅓ cup unsweetened cocoa powder</li><li>½ cup all-purpose flour</li><li>¼ teaspoon salt</li><li>¼ teaspoon baking powder</li><li>3 tablespoons butter, softened</li><li>3 tablespoons unsweetened cocoa powder</li><li>1 tablespoon honey</li><li>1 teaspoon vanilla extract</li><li>1 cup confectioners sugar</li></ul>',
 '<ul> <li>Preheat oven to 350 degrees F (175 degrees C). Grease and flour an 8-inch square pan.</li> <li>In a large saucepan, melt 1/2 cup butter. Remove from heat, and stir in sugar, eggs, and 1 teaspoon vanilla. Beat in 1/3 cup cocoa, 1/2 cup flour, salt, and baking powder. Spread batter into prepared pan.</li> <li>Bake in preheated oven for 25 to 30 minutes. Do not overcook.</li><li>To Make Frosting: Combine 3 tablespoons softened butter, 3 tablespoons cocoa, honey, 1 teaspoon vanilla extract, and 1 cup confectioners sugar. Stir until smooth. Frost brownies while they are still warm.</li></ul>',
16)

INSERT INTO dbo.familyRecipes VALUES ( '80cdaf14-e344-4618-b834-a9a4b71b203a',2045914211,'Luvush(kavkazi bread)','Granny Hadassah','Holidays',
' https://res.cloudinary.com/dfgjujaok/image/upload/v1591277054/luvush_a1kdvj.jpg',180, 0,1,0,0,
'<ul> <li>1 (0.25 ounce) package active dry yeast</li> <li>1 cup warm water</li> <li>¼ cup white sugar</li><li>3 tablespoons milk</li><li>1 egg, beaten</li><li>2 teaspoons salt</li><li>4.5 cups bread flour</li><li>2 teaspoons minced garlic (optional)</li><li>0.25 cup butter, melted</li></ul>',
 '<ul> <li>In a large bowl, dissolve yeast in warm water. Let stand about 10 minutes, until frothy. Stir in sugar, milk, egg, salt, and enough flour to make a soft dough. Knead for 6 to 8 minutes on a lightly floured surface, or until smooth. Place dough in a well oiled bowl, cover with a damp cloth, and set aside to rise. Let it rise 1 hour, until the dough has doubled in volume.</li> <li>Punch down dough, and knead in garlic. Pinch off small handfuls of dough about the size of a golf ball. Roll into balls, and place on a tray. Cover with a towel, and allow to rise until doubled in size, about 30 minutes.</li> <li>During the second rising, preheat grill to high heat.</li><li>At grill side, roll one ball of dough out into a thin circle. Lightly oil grill. Place dough on grill, and cook for 2 to 3 minutes, or until puffy and lightly browned. Brush uncooked side with butter, and turn over. Brush cooked side with butter, and cook until browned, another 2 to 4 minutes. Remove from grill, and continue the process until all the naan has been prepared.</li></ul>',
14)

INSERT INTO dbo.familyRecipes VALUES ( '80cdaf14-e344-4618-b834-a9a4b71b203a',2045914212,'Grandma Hadassahs orange cake','Granny Hadassah','every saturday',
'https://res.cloudinary.com/dfgjujaok/image/upload/v1591277053/Grandma_Hadassah_s_orange_cake_lwyn4m.jpg',120, 0,1,0,0,
'<ul> <li>1 (18.25 ounce) package yellow cake mix</li> <li>1 (3 ounce) package instant lemon pudding mix</li> <li>0.75 cup orange juice</li><li>0.5 cup vegetable oil</li><li>4 eggs</li><li>1 teaspoon lemon extract</li><li>⅔ cup white sugar</li><li>0.25 cup butter</li></ul>',
 '<ul> <li>Grease a 10 inch Bundt pan. Preheat oven to 325 degrees F (165 degrees C).</li> <li>In a large bowl, stir together cake mix and pudding mix. Make a well in the center and pour in 3/4 cup orange juice, oil, eggs and lemon extract. Beat on low speed until blended. Scrape bowl, and beat 4 minutes on medium speed. Pour batter into prepared pan.</li> <li>Bake in preheated oven for 50 to 60 minutes. Let cool in pan for 10 minutes, then turn out onto a wire rack and cool completely.</li><li>In a saucepan over medium heat, cook 1/3 cup orange juice, sugar and butter for two minutes. Drizzle over cake.</li></ul>',
12)


SELECT TOP (1000) [user_id]
      ,[recipe_id]
      ,[title]
      ,[recipe_owner]
      ,[traditional_preparation_time]
      ,[image]
      ,[readyInMinutes]
      ,[aggregateLikes]
      ,[vegetarian]
      ,[vegan]
      ,[glutenFree]
      ,[ingredientDescriptionAndAmount]
      ,[instructions]
      ,[servings]
  FROM [dbo].[familyRecipes]

UPDATE [dbo].[familyRecipes] 
SET  image='https://res.cloudinary.com/dfgjujaok/image/upload/c_scale,h_400/v1594825040/Grandma_Hadassah_s_orange_cake_lwyn4m.jpg'
WHERE user_id = '80cdaf14-e344-4618-b834-a9a4b71b203a' AND recipe_id=2045914212

UPDATE [dbo].[familyRecipes]
SET instructions = '{"1":"Preheat oven to 350 degrees F (175 degrees C). Grease and flour an 8-inch square pan.","2":"In a large saucepan, melt 1/2 cup butter. Remove from heat, and stir in sugar, eggs, and 1 teaspoon vanilla. Beat in 1/3 cup cocoa, 1/2 cup flour, salt, and baking powder. Spread batter into prepared pan.","3":"Bake in preheated oven for 25 to 30 minutes. Do not overcook.","4":"To Make Frosting: Combine 3 tablespoons softened butter, 3 tablespoons cocoa, honey, 1 teaspoon vanilla extract, and 1 cup confectioners sugar. Stir until smooth. Frost brownies while they are still warm."}'
WHERE user_id = '80cdaf14-e344-4618-b834-a9a4b71b203a' AND recipe_id=2045914210

UPDATE [dbo].[familyRecipes]
SET instructions = '{
                     "1": "In a large bowl, dissolve yeast in warm water. Let stand about 10 minutes, until frothy. Stir in sugar, milk, egg, salt, and enough flour to make a soft dough. Knead for 6 to 8 minutes on a lightly floured surface, or until smooth. Place dough in a well oiled bowl, cover with a damp cloth, and set aside to rise. Let it rise 1 hour, until the dough has doubled in volume.",
                     "2": "Punch down dough, and knead in garlic. Pinch off small handfuls of dough about the size of a golf ball. Roll into balls, and place on a tray. Cover with a towel, and allow to rise until doubled in size, about 30 minutes.", 
                     "3": "During the second rising, preheat grill to high heat.",
                     "4": "At grill side, roll one ball of dough out into a thin circle. Lightly oil grill. Place dough on grill, and cook for 2 to 3 minutes, or until puffy and lightly browned. Brush uncooked side with butter, and turn over. Brush cooked side with butter, and cook until browned, another 2 to 4 minutes. Remove from grill, and continue the process until all the naan has been prepared."
                     }'
WHERE user_id = '80cdaf14-e344-4618-b834-a9a4b71b203a' AND recipe_id=2045914211

UPDATE [dbo].[familyRecipes]
SET instructions = '{
                     "1": "Grease a 10 inch Bundt pan. Preheat oven to 325 degrees F (165 degrees C).",
                     "2": "In a large bowl, stir together cake mix and pudding mix. Make a well in the center and pour in 3/4 cup orange juice, oil, eggs and lemon extract. Beat on low speed until blended. Scrape bowl, and beat 4 minutes on medium speed. Pour batter into prepared pan.", 
                     "3": "Bake in preheated oven for 50 to 60 minutes. Let cool in pan for 10 minutes, then turn out onto a wire rack and cool completely.",
                     "4": "In a saucepan over medium heat, cook 1/3 cup orange juice, sugar and butter for two minutes. Drizzle over cake."
                     }'
WHERE user_id = '80cdaf14-e344-4618-b834-a9a4b71b203a' AND recipe_id=2045914212

-- //////////////////////////////////////////////////////////////////////////////////

UPDATE [dbo].[familyRecipes]
SET ingredientDescriptionAndAmount = '{"1":"½ cup butter","2":"1 cup white sugar","3":"2 eggs","4":"1 teaspoon vanilla extract","5":"⅓ cup unsweetened cocoa powder","6":"½ cup all-purpose flour","7":"¼ teaspoon salt","8":"¼ teaspoon baking powder","9":"3 tablespoons butter, softened","10":"3 tablespoons unsweetened cocoa powder",
                    "11":"1 tablespoon honey",
                    "12":"1 teaspoon vanilla extract",
                    "13":"1 cup confectioners sugar"
                    }'
WHERE user_id = '80cdaf14-e344-4618-b834-a9a4b71b203a' AND recipe_id=2045914210

UPDATE [dbo].[familyRecipes]
SET ingredientDescriptionAndAmount = '{"1":"1 (0.25 ounce) package active dry yeast","2":"1 cup warm water","3":"¼ cup white sugar","4":"3 tablespoons milk","5":"1 egg beaten","6":"2 teaspoons salt","7":"4 ½ cups bread flour","8":"2 teaspoons minced garlic ","9":"¼ cup butter melted"
                    }'
WHERE user_id = '80cdaf14-e344-4618-b834-a9a4b71b203a' AND recipe_id=2045914211

UPDATE [dbo].[familyRecipes]
SET ingredientDescriptionAndAmount = '{
                    "1":"1 (18.25 ounce) package yellow cake mix",
                    "2":"1 (3 ounce) package instant lemon pudding mix",
                    "3":"¾ cup orange juice",
                    "4":"½ cup vegetable oil",
                    "5":"4 eggs",
                    "6":"1 teaspoon lemon extract",
                    "7":"⅔ cup white sugar",
                    "8":"¼ cup butter"
                    }'
WHERE user_id = '80cdaf14-e344-4618-b834-a9a4b71b203a' AND recipe_id=2045914212

-- ************************************ yarin recipes
UPDATE [dbo].[familyRecipes]
SET ingredientDescriptionAndAmount = '{
                    "1":"1 cup butter softened",
                    "2":"1 cup white sugar",
                    "3":"1 cup packed brown sugar",
                    "4":"2 eggs",
                    "5":"2 teaspoons vanilla extract",
                    "6":"1 teaspoon baking soda",
                    "7":"2 teaspoons hot water",
                    "8":"½ teaspoon salt",
                    "9":"½ teaspoon salt",
                    "10":"3 cups all purpose flour"
                    }'
WHERE user_id = '9d342fc9-8871-4375-a7ee-3637d0de374b' AND recipe_id=2045914247

UPDATE [dbo].[familyRecipes]
SET ingredientDescriptionAndAmount = '{
                    "1":"4 eaches skinless boneless chicken thighs",
                    "2":"½ cup soy sauce",
                    "3":"½ cup ketchup",
                    "4":"⅓ cup honey",
                    "5":"3 cloves garlic minced",
                    "6":"1 teaspoon dried basil"
                    }'
WHERE user_id = '9d342fc9-8871-4375-a7ee-3637d0de374b' AND recipe_id=2045914248

UPDATE [dbo].[familyRecipes]
SET ingredientDescriptionAndAmount = '{
                    "1":"28 graham crackers crushed",
                    "2":"½ cup butter melted",
                    "3":"1 cup milk",
                    "4":"2 (1.3 ounce) envelopes dry whipped topping mix ",
                    "5":"1 (8 ounce) package cream cheese softened",
                    "6":"½ cup white sugar",
                    "7":"½ cup white sugar"
                    }'
WHERE user_id = '9d342fc9-8871-4375-a7ee-3637d0de374b' AND recipe_id=2045914249

-- ***************************************************
UPDATE [dbo].[familyRecipes]
SET instructions = '{
                    "1":"Preheat oven to 350 degrees F (175 degrees C).",
                    "2":"Cream together the butter, white sugar, and brown sugar until smooth. Beat in the eggs one at a time, then stir in the vanilla. Dissolve baking soda in hot water. Add to batter along with salt. Stir in flour, chocolate chips, and nuts. Drop by large spoonfuls onto ungreased pans.",
                    "3":"Bake for about 10 minutes in the preheated oven, or until edges are nicely browned."
                    }'
WHERE user_id = '9d342fc9-8871-4375-a7ee-3637d0de374b' AND recipe_id=2045914247

UPDATE [dbo].[familyRecipes]
SET instructions = '{
                    "1":"Lay chicken thighs into the bottom of a 4-quart slow cooker.",
                    "2":"Whisk soy sauce, ketchup, honey, garlic, and basil together in a bowl; pour over the chicken.",
                    "3":"Cook on Low for 6 hours."
                    }'
WHERE user_id = '9d342fc9-8871-4375-a7ee-3637d0de374b' AND recipe_id=2045914248

UPDATE [dbo].[familyRecipes]
SET instructions = '{
                    "1":"Mix crushed graham crackers and butter in a bowl; press mixture into a 9x11-inch dish.",
                    "2":"Beat milk and whipped topping mix in a bowl until fluffy.",
                    "3":"Beat cream cheese and sugar in a separate bowl until fully incorporated; stir into whipped topping mixture until smooth. Spread mixture onto the graham cracker crust. Refrigerate until set, 1 to 2 hours. Top with cherry pie filling."
                    }'
WHERE user_id = '9d342fc9-8871-4375-a7ee-3637d0de374b' AND recipe_id=2045914249