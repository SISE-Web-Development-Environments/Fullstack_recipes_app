//const DButils = require("./DButils");
//const DButils = require("./modules/DButils");
const DButils = require("./DButils");

const query = `SELECT * FROM dbo.users`;
// const query = `INSERT INTO dbo.users (username,password) VALUES  ('a','a')`;

//#region promise Version
DButils.execQuery(query)
  .then((res) => console.log(res))
  .catch((error) => console.log(error.message));
//#endregion


