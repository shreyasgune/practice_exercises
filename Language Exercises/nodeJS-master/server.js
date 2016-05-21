var http = require('http');
var fs = require('fs');


//404 response

function Send404(response){
	response.writeHead(404,{"Content-Type":"text/plain"});
	response.write("ERROR 404 : PAGE Ain't HERE!");
	response.end();
}


//handling a user request
function onRequest(request, response){
	console.log("A user has made a request.."+request.url);
	// response.writeHead(200,{"Context-Type ": "text/plain"});
	// response.write("Here is your response");
	// response.end(); 
	//200-  everything went okay, 404:shit went wrong

	//sending back html file
	if(request.method == 'GET' && request.url== '/'){
		response.writeHead(200,{"Content-Type":"text/html"});
		fs.createReadStream("./index.html").pipe(response);

	}
	else {
		Send404(response);
	}


}
//this funciton will define a callback to run something
//when the user is connected on your server
http.createServer(onRequest).listen(8888); //port number 8888
console.log("Server is now running...");


// PS C:\Users\Shreyas\nodejs> node server.js
// Server is now running...
// A user has made a request../
// A user has made a request../favicon.ico <-- this is the icon thingy