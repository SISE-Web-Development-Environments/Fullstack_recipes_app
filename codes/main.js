// libraries importing
require("dotenv").config();
const express = require("express");//
const bodyParser = require("body-parser");
//var path = require("path");
const logger = require("morgan");//
const session = require("client-sessions");   
const DButils = require("./DB/DButils");

//Routes importing
const auth = require("./routes/auth");
const user = require("./routes/user");
const recipes = require("./routes/recipes");

//App settings and config
var app = express();
var port = process.env.PORT;

//parse application/x-www-urlencoded
app.use(bodyParser.urlencoded({extended: false}));
//parse application/json
app.use(bodyParser.json());
//print request logs
app.use(logger(":method :url :status :res[content-length] - :response-time ms")); //logger
//settings cookies configuration
app.use(
  session({
      cookieName: "session", 
      secret: process.env.COOKIE_SECRET , // the encryption key - check with shir what we need set here!
      duration: 60*60 * 1000, //expired after 1 hour
      activeDuration: 0,
  })
);

//app.use(express.static(path.join(__dirname, "public"))); //To serve static files such as images, CSS files, and JavaScript files

//end point that check if the server is alive
app.get("/alive",(req,res)=>{
  res.send("I'm alive");
});

//Routing
app.use("/user", user);
app.use("/recipes", recipes);
app.use(auth); // anything that doesn't start in "/users" or "/recipes" enter here (auth contains register and login)

//Default router - not "/users" or "/recipes" or auth(register/login) or /profile
app.use((req,res)=>{
  res.sendStatus(404); //not found 
});


app.use(function (err, req, res, next) {
  console.error(err);
  res.status(err.status || 500).send({ message: err.message, success: false });
});

const server = app.listen(port, () => {
  console.log(`Server listen on port ${port}`);
});



// app.use(function (req, res, next) {
//   if (req.session && req.session.user_id) {
//     DButils.execQuery("SELECT user_id FROM dbo.users")
//       .then((users) => {
//         if (users.find((x) => x.user_id === req.session.user_id)) {
//           req.user_id = req.session.user_id;
//         }
//         next();
//       })
//       .catch((error) => next(error));
//   } else {
//     next();
//   }
// });