var express = require("express");
var router = express.Router();
const DButils = require("../DB/DButils");
const bcrypt = require("bcrypt");
const search_util = require("../routes/utiles/search_recipes");

router.use(function (req, res, next) {
  if (req.session && req.session.user_id) {
    DButils.execQuery("SELECT user_id FROM dbo.users")
      .then((users) => {
        if (users.find((x) => x.user_id === req.session.user_id)) {
          req.user_id = req.session.user_id;
          console.log("user middelwar testing");
        }
        next();
      })
      .catch((error) => next(error));
  } else {
    res.sendStatus({
      status: 401,
      message: "Content is not available to an unrecognized user please log-in",
    }); // if user not found or cookie doesn't exist return unauthorized
  }
});

router.get("/recipeInfo/:ids", (req, res) => {
  const ids = JSON.parse(req.params.ids); //JASON parse enable that return number array(not string array)
  const user = req.user_id;
  console.log(ids, user);
  getUserInfoOnRecipes(user, ids).then((result) => {
    console.log(result);
    res.send(result);
  });
});

router.post("/clicked/:recipeID", (req, res) => {
  var query = `BEGIN TRY  \
      INSERT INTO dbo.usersInduction VALUES ('${req.user_id}', '${req.params.recipeID}', 0, 1, default)  \
    END TRY  \
    BEGIN CATCH  \
      UPDATE  dbo.usersInduction SET watched = 1, watch_time = default WHERE user_id = '${ req.user_id}' AND recipe_id='${ req.params.recipeID}'
       \
    END CATCH`
  DButils.execQuery(query)
    .then(() => res.sendStatus(200))
    .catch((error) => {
      console.log(error);
      res.sendStatus(500);
    });
});

async function getUserInfoOnRecipes(user, ids) {
  var query = " SELECT * FROM dbo.usersInduction where user_id='" + user + "'";
  try {
    let obj = {};
    const recipesResultFromDB = await DButils.execQuery(query);
    let result = recipesResultFromDB
      .filter((x) => ids.includes(x.recipe_id))
      .map((x) => {
        // return { [x.recipe_id]: { saved: x.saved, watched: x.watched } };
        obj = { [x.recipe_id]: { saved: x.saved, watched: x.watched } };
        return obj;
      });

    for (let i = 0; i < ids.length; i++) {
      var bol = false;
      for (let k = 0; k < result.length; k++) {
        if (ids[i] in result[k]) {
          bol = true;
        }
      }
      if (bol === false) {
        result.push({ [ids[i]]: { saved: false, watched: false } });
      }
    }
    return result;
  } catch (error) {
    throw {
      status: 500,
      message: error.message + " Failed to get indication for recipes",
    };
  }
}

//#region favorites
router.get("/getFavorites", function (req, res) {
  const user = req.user_id;
  var query =
    " SELECT recipe_id FROM dbo.usersInduction where user_id='" +
    user +
    "'" +
    " AND saved = 1";
  DButils.execQuery(query)
    .then((recipes_id_list) => {
      search_util
        .searchForRescipes_onlyPreview(recipes_id_list)
        .then((info_array) => res.send(info_array))
        .catch((error) => {
          console.log(error);
          res.sendStatus(500);
        });
    })
    .catch((error) => {
      console.log(error);
      res.sendStatus(500);
    });
});

router.put("/addFavorite/:recipeId", async (req, res) => {
  try {
    // await user_util.addToMyFavoriteRecipes(req.user_id, req.params.recipeId);
    const user = req.user_id;
    const recipeID = req.params.recipeId;
    var query =
      "SELECT * FROM dbo.usersInduction where user_id='" +
      user +
      "'" +
      " AND recipe_id=" +
      recipeID;
    result = await DButils.execQuery(query);
    if (result.length == 0) {
      res.send(
        "The user still not watch recipe with id: " +
          recipeID +
          ", first you need to watch"
      );
    }
    if (result[0].saved == 0) {
      var query =
        "UPDATE dbo.usersInduction SET saved='1',watch_time=default WHERE user_id='" +
        user +
        "'" +
        " AND recipe_id=" +
        recipeID;
      await DButils.execQuery(query);
      res.send("Recipe added succefuly to favorite");
    } else {
      res.send("This recipe already exists in your favorites");
    }
  } catch (error) {
    res.sendStatus(500);
  }
});

// last 3 watched recipes
router.get("/lastwatchedRecipes", (req, res, next) => {
  const user = req.user_id;
  var query =
    "SELECT TOP (3) * FROM [dbo].[usersInduction] where user_id='" +
    user +
    "'" +
    " ORDER BY [watch_time] DESC";
  DButils.execQuery(query)
    .then((row) => {
      search_util
        .searchForRescipes_onlyPreview(row)
        .then((info_array) => res.send(info_array))
        .catch((error) => {
          console.log(error);
          res.sendStatus(500);
        });
    })
    .catch((error) => {
      console.log(error);
      res.sendStatus(500);
    });
});

router.get("/personalRecipes", function (req, res) {
  const user = req.user_id;
  var query = " SELECT * FROM dbo.myRecipes where user_id='" + user + "'";
  DButils.execQuery(query)
    .then((all_user_recipe_info_list) => {
      search_util
        .searchForPersonalRecipes(all_user_recipe_info_list)
        .then((info_array) => res.send(info_array))
        .catch((error) => {
          console.log(error);
          res.sendStatus(500);
        });
    })
    .catch((error) => {
      console.log(error);
      res.sendStatus(500);
    });
});

router.get("/familyRecipes", function (req, res) {
  const user = req.user_id;
  var query = " SELECT * FROM dbo.familyRecipes where user_id='" + user + "'";
  DButils.execQuery(query)
    .then((all_user_recipe_info_list) => {
      search_util
        .searchForfamilyRecipes(all_user_recipe_info_list)
        .then((info_array) => res.send(info_array))
        .catch((error) => {
          console.log(error);
          res.sendStatus(500);
        });
    })
    .catch((error) => {
      console.log(error);
      res.sendStatus(500);
    });
});

module.exports = router;
