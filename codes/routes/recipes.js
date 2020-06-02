var express = require("express");
var router = express.Router();

 const search_util = require("../routes/utiles/search_recipes"); 

router.use((req, res, next)=>{
    console.log("Recipes route");
    next();
});

//routes
router.get("/search/query/:searchQuery/amount/:num",(req,res)=>{
    const {searchQuery, num} = req.params; // req.params contains 2 params: num and serch query. fot instance : num: "3" serchQuery: "pizza"
    search_params= {}; 
    search_params.query = searchQuery // in the spooncolar api the name of searchQuery param is "query", so we write -"search_params.query"
    search_params.number = num;
    search_params.instructionRequired = true;
    
    //check if optional queries params exists (cuisine,diet,intolerance) and if they exist we will add them to search_params
    search_util.extractQueriesParams(req.query, search_params); 
    
    search_util
        .searchForRescipes(search_params)
        .then((info_array)=>res.send(info_array)) // return to client info array about the recipes that return from the search
        .catch((error)=>{
            console.log(error);
            res.sendStatus(500);
        });
});

module.exports = router;


