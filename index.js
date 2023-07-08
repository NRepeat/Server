const express = require("express");
const { validateUserSignUp } = require("./middlewares/validate.mv");
const UserController = require('./controllers/userController');
const app = express();
const port = 3000;


app.get("/", (req, res) => {
  console.log("hello");
  res.send();
});
// розпарсить тіло запиту і покладе його в req.body
const bodyParser = express.json();

app.post("/users", bodyParser, validateUserSignUp,UserController.createUser );

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
