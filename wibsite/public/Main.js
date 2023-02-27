var name ="yusuke";
var weather="sunny";
var locationname="america";
var temperature="10";//changepoint
var humidity="50";//changepoint
var light="700";//changepoint
var nostring="";

window.onload = function(){
  document.getElementById("name").innerText = name;
        document.getElementById("weather").innerText = weather;
        document.getElementById("location").innerText = locationname;       
      
  }
    
    function foo() {
      if (document.getElementById("switch").checked) {
        document.getElementById("temperature").innerText = temperature + "°";
        document.getElementById("humidity").innerText = humidity + "%";
        document.getElementById("light").innerText = "level of " + light;       
      } else {
        document.getElementById("temperature").innerText = nostring;
        document.getElementById("humidity").innerText = nostring;
        document.getElementById("light").innerText = nostring;       
    }
  }