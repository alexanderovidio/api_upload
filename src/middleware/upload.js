const util = require("util");
const multer = require("multer");
var path = require('path')
const maxSize = 2 * 1024 * 1024;
// const fileType = "json";

let storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, __basedir + "/resources/static/assets/uploads/");
  },
  filename: (req, file, cb) => {
    console.log(file.originalname);
    cb(null, file.originalname);
  },
});

let uploadFile = multer({
  storage: storage,
  limits: { fileSize: maxSize },
<<<<<<< HEAD
//   fileFilter: function (req, file, cb) {
//     if (path.extension(file.originalname) !== '.json') {
//         // return cb(null, false);
//         cb("Error: only png, jpeg, and jpg are allowed!");
//     }
//     cb(null, true)
//   }
=======
  fileFilter: function (req, file, cb) {

    if (!file.originalname.match(/\.(json)$/)) {
      return cb(new Error('Only JSON files are allowed!'));
    }

    /* Validar el contenido del archivo */

    return cb(null, true)
  }
>>>>>>> c7b045521b166bc814b87f07944c33a5a00e568f
}).single("file");

let uploadFileMiddleware = util.promisify(uploadFile);
module.exports = uploadFileMiddleware;