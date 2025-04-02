//this is our server
var http = require('http');
var express = require('express');
var app = express();

const PORT = 3000;

// function handleRequest(req,res){
// 	res.end('It works. Path hit :: '+req.url);
// }


app.get('/', function(request, response){
    response.sendfile('index.html');
});;

// app.get('/view1', function(request, response){
//     response.sendfile('/Partials/view1.html');
// });;

// app.get('/view2', function(request, response){
//     response.sendfile('/Partials/view2.html');
// });;



app.listen(3000, function() {
  console.log('I\'m Listening...');
});


