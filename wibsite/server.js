const express = require("express");
//const firebase = require('firebase');
const app = express();
const PORT = 3000;

/*const firebaseConfig = {
    apiKey: "AIzaSyBoGkZkf3pI6aIU4ROv0M8x95wGLDlc7DA",
    authDomain: "fir-application-9a3af.firebaseapp.com",
    projectId: "fir-application-9a3af",
    storageBucket: "fir-application-9a3af.appspot.com",
    messagingSenderId: "849658425487",
    appId: "1:849658425487:web:f02e7f83c0439bd39940fa",
    measurementId: "G-TSPQH0GZ50"
  };

  firebase.initializeApp(firebaseConfig);

  const db = firebase.firestore();
*/
app.use(express.static("public"));
app.get("/", (req, res) => {
    console.log("hello express");
    res.send("hello");
});

app.listen(PORT, () => console.log("サーバーを起動しました。"));