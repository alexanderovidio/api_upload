const util = require("util");
const multer = require("multer");
const maxSize = 2 * 1024 * 1024;
const fs = require("fs");
const validator = require("validator");
const simpleAlgebra = require("simplealgebra");

let storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, __basedir + "/resources/static/assets/uploads/");
  },
  filename: (req, file, cb) => {
    // console.log(file.originalname);
    cb(null, file.originalname);
  },
});

let uploadFile = multer({
  storage: storage,
  limits: { fileSize: maxSize },
  fileFilter: function (req, file, cb) {
    if (!file.originalname.match(/\.(json)$/)) {
      return cb(new Error('Only JSON files are allowed!'));
    }

    

    /* Validar el contenido del archivo */
    // console.log(__basedir + "/resources/static/assets/uploads/" + file.originalname);
    fs.readFile(__basedir + "/resources/static/assets/uploads/" + file.originalname, 'utf8', (err, data) => {
      if(err) {
        console.log(`Error reading file from disk: ${err}`);
      }
      else{

        if (validator.isJSON(data)){
          // Parse JSON string to JSON Object
          const fileContent = JSON.parse(data);
    //       return fileContent;
          // Print all File lines
          fileContent.forEach(fc => {
            // console.log(`${fc.operation}`);
            let test = new simpleAlgebra(fc.operation);
            // console.log(JSON.stringify(test, null, 4));
          });
        }else{
          console.log("File Format Eror");
        }

      }

      //Confirm, to upload File
      cb(null, true)

    });

  }
}).single("file");


let uploadFileMiddleware = util.promisify(uploadFile);
module.exports = uploadFileMiddleware;