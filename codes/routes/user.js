var express = require("express");
var router = express.Router();

const DButils = require("../DB/DButils");

const bcrypt = require("bcrypt");
//Authenticate all incoming reuests by use middleware
// router.use(function (req, res, next) {
//   if (req.session && req.session.user_id) {
//     const id = req.session.user_id;
//     checkIdOnDb(id);
//     const username = checkIdOnDb(id); // if user found, the user contains the data about user
//     if (username){ 
//         req.username = username; //we push to req object the data about user
//         next();
//     }
//   } else {
//     res.sendStatus(401); // if user not found or cookie doesn't exist return unauthorized
//   }
// });

router.use(function (req, res, next) {
  if (req.session && req.session.user_id) {
    DButils.execQuery(" SELECT user_id , username FROM dbo.users")
      .then((users) => {
        if (users.find((x) => x.user_id === id)) {
         var y = users.find((y) => y.user_id === id);
         var result=y.username;
         req.username = result;
         next();
        }
      })
      .catch((error) => next(error));
  } else {
    res.sendStatus(401); // if user not found or cookie doesn't exist return unauthorized
  }
});

// function checkIdOnDb(id){
//   DButils.execQuery(" SELECT user_id , username FROM dbo.users")
//       .then((users) => {
//         if (users.find((x) => x.user_id === id)) {
//          var y = users.find((y) => y.user_id === id);
//          var result=y.username;
//          req.username = result;
//          next();
//         }
//       })
//       .catch((error) => next(error));
// }

router.get ("/recipeInfo/:ids", (req,res) => {
  const ids = JSON.parse(req.params.ids); //JASON parse enable that return number array(not string array)
  const user_name = req.username;
  console.log(ids,user_name);
  const userRecipesData =  getUserInfoOnRecipes(user_name, ids); //need to Write getUserInfoOnRecipes function that go to the DB and return  about each recipe id if the user watched and/or saved this recpie
  res.send(userRecipesData);
});

function getUserInfoOnRecipes(user_name, ids){
  console.log("blablabla");
}


module.exports = router;
