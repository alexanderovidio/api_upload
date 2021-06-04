import * as firebase from "firebase";
import "firebase/database";

const firebaseConfig = {
    apiKey: "AIzaSyDbcBNuqgenR4vZfsKldE47CX09lXwhxRc",
    authDomain: "math-operations-b63b4.firebaseapp.com",
    databaseURL: "https://math-operations-b63b4-default-rtdb.firebaseio.com",
    projectId: "math-operations-b63b4",
    storageBucket: "math-operations-b63b4.appspot.com",
    messagingSenderId: "399756251938",
    appId: "1:399756251938:web:693bf87dfc97888bfb4b7b"
};

firebase.initializeApp(firebaseConfig);

export default firebase.database();
