var express = require("express");
var router = express.Router();

const DButils = require("../DB/DButils");
const bcrypt = require("bcrypt");

router.post("/Register", async (req, res, next) => {
  try {
    // missing parameters
    if (
      !req.body.firstname ||
      !req.body.lastname ||
      !req.body.email ||
      !req.body.profileurl ||
      !req.body.username ||
      !req.body.password ||
      !req.body.country
    ) {
      throw { status: 500, message: "one or more of the details is missing" };
    }
    const users = await DButils.execQuery("SELECT username FROM dbo.users");
    // username exists
    if (users.find((x) => x.username === req.body.username))
      throw { status: 500, message: "Username already exist" };
    const emails = await DButils.execQuery("SELECT email FROM dbo.users ");
    //confirmation_password
    if (req.body.password != req.body.confirmation_password) {
      throw { status: 500, message: "The password does not match" };
    }
    // add the new user
    let hash_password = bcrypt.hashSync(
      req.body.password,
      parseInt(process.env.bcrypt_saltRounds)
    );
    await DButils.execQuery(
      `INSERT INTO dbo.users VALUES (default, '${req.body.username}','${req.body.firstname}','${req.body.lastname}','${req.body.country}', '${hash_password}','${req.body.email}','${req.body.profileurl}')`
    );
    res.status(200).send({ message: "user created", success: true });
  } catch (error) {
    next(error);
  }
});

router.post("/Login", async (req, res, next) => {
  try {
    // check that username exists
    const users = await DButils.execQuery("SELECT username FROM dbo.users");
    if (!users.find((x) => x.username === req.body.username))
      throw { status: 401, message: "Username or Password incorrect" };

    // check that the password is correct
    const user = (
      await DButils.execQuery(
        `SELECT * FROM dbo.users WHERE username = '${req.body.username}'`
      )
    )[0];

    if (!bcrypt.compareSync(req.body.password, user.password)) {
      throw { status: 401, message: "Username or Password incorrect" };
    }

    // Set cookie
    req.session.user_id = user.user_id;

    // return cookie
    res.status(200).send({ message: "login succeeded", success: true });
  } catch (error) {
    next(error);
  }
});

router.post("/Logout", function (req, res) {
  req.session.reset(); // reset the session info --> send cookie when  req.session == undefined!!
  res.send({ success: true, message: "logout succeeded" });
});

module.exports = router;
