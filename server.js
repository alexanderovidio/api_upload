const cors = require("cors");
const express = require("express");
const app = express();


global.__basedir = __dirname;

var corsOptions = {
  origin: "http://localhost:3000"
};

app.use(cors())
// app.use(cors(corsOptions));

const initRoutes = require("./src/routes");

app.use(express.urlencoded({ extended: true }));
initRoutes(app);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Running at localhost:${ PORT }`);
});
