var fs = require('fs');

fs.writeFileSync("test.txt", "This is a test file to see how the fs-core-module functionality works");
console.log(fs.readFileSync("test.txt"));
console.log((fs.readFileSync("test.txt")).toString());

var path = require('path');
var websitehome = "Desktop/shreyas//thegoonman/index.html";
var websiteabout = "Desktop/shreyas//thegoonman/about.html";

console.log(path.normalize(websitehome)); //sorts the path out.. no more path mistakes YO
console.log(path.dirname(websiteabout)); //Desktop/shreyas//thegoonman
console.log(path.basename(websiteabout)); // about.html
console.log(path.extname(websiteabout)); // .html


console.log(__dirname); //gives full directory name
console.log(__filename); //gives full file name


// setInterval(function (){
// 	console.log("shreyas");
// }, 2000);

//setTimeout runs once after the period of time
//setInterval runs repeatedly.



