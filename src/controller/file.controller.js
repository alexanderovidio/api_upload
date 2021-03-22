const uploadFile = require("../middleware/upload");
const fs = require("fs");
const baseUrl = "http://localhost:8080/files/";
const simpleAlgebra = require("simplealgebra");
const validator = require("validator");
const admin = require("firebase-admin");

admin.initializeApp({
  credential: admin.credential.cert('./credentials.json')
});
const upload = async (req, res) => {
  try {
    const directoryPath = __basedir + "/resources/static/assets/uploads/";
    await uploadFile(req, res);
    // console.log(res);
    if (req.file == undefined) {
      return res.status(400).send({ message: "Please upload a file!" });
    }

    res.status(200).send({
      message: "Uploaded the file successfully: " + req.file.originalname,
    });

    /* Realizar las operaciones */
    // fs.readFile(directoryPath,function (err, req) {
    // console.log(req.file.originalname);
    // async
    fs.readFile(directoryPath + req.file.originalname, 'utf8', (err, data) => {
      if (err) {
          console.log(`Error reading file from disk: ${err}`);
      } else {

          if (validator.isJSON(data)){
    //         // parse JSON string to JSON object
            const fileContent = JSON.parse(data);
    //         // console.log(fileContent);
    //         // print all databases
            fileContent.forEach(fc => {
    //           // console.log(`${fc.operation}`);
              let test = new simpleAlgebra(fc.operation);
              console.log(JSON.stringify(test, null, 4));
    //           fillOp.push({
    //             steps: JSON.stringify(test, null, 4),
    //           });
        
            });
          }else{
            console.log("File Format Eror");
          }
          
      }

      
    });
    
    // async

    /* Insert a la base de datos */
    const db = admin.firestore();
    //console.log(req.file);
      // await 
      db.collection("products")
        .doc("/"+ req.body.id + "/")
        .create({
          name: req.body.name
        });
      // return res.status(204).json();

      // console.log(error);
      // return res.status(500).send(error);
    // await db.collection('ops')
    //   .doc('/' + req.body.id + '/')
    //   .create({});

  } catch (err) {
    res.status(500).send({
      message: `Could not upload the file: ${err}`,
    });
  }
};

const getListFiles = (req, res) => {
  const directoryPath = __basedir + "/resources/static/assets/uploads/";
  fs.readdir(directoryPath, function (err, files) {

    if (err) {
      res.status(500).send({
        message: "Unable to scan files!",
      });
    }

  let fileInfos = [];
  
  // fs.readFile(directoryPath + file, 'utf8', (err, data) => {
  

  files.forEach((file) =>  {
    fileInfos.push({
      file_name: file,
      url: baseUrl + file,
    });
  });

    res.status(200).send(fileInfos);

  });


};

const download = (req, res) => {
  const fileName = req.params.name;
  const directoryPath = __basedir + "/resources/static/assets/uploads/";

  res.download(directoryPath + fileName, fileName, (err) => {
    if (err) {
      res.status(500).send({
        message: "Could not download the file. " + err,
      });
    }
  });
};


module.exports = {
  upload,
  getListFiles,
  download
};