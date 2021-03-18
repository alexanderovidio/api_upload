const util = require("util");
const multer = require("multer");
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
//   fileFilter: function (req, file, cb) {
//     if (path.extension(file.originalname) !== '.json') {
//         // return cb(null, false);
//         cb("Error: only png, jpeg, and jpg are allowed!");
//     }
//     cb(null, true)
//   }
}).single("file");

let uploadFileMiddleware = util.promisify(uploadFile);
module.exports = uploadFileMiddleware;