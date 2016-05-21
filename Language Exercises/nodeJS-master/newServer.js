var connect = require('connect');
var http = require('http');

var app = connect();


function doFirst(request, response, next){
	console.log("Zazzzz..");
	next();
}

function doSecond(request, response, next){
	console.log("Murderface");
	next();
}

function profile(request,response){
	console.log("User requested profile..");
	next();
}

function forum(request,response){
	console.log("User requested forum...");
	next();
}

app.use(doFirst);
app.use(doSecond);
app.use('./profile',profile);
app.use('./forum',forum);

http.createServer(app).listen(8888); //requestListener argument
console.log("Server is running...");