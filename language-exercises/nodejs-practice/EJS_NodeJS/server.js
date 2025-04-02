//server.js

var express = require('express');
var app = express();

//setting the view engine to ejs
app.set('view engine','ejs'); //nned this to use res.render

//use res.render to load up an ejs view file


//reading stuff off JSON file.
app.locals.test = "IRON MAIDEN";
app.locals.member = require("./members.json");

//note that res.render looks into views folder by default.
//index page
app.get('/', function(req,res){

	//passing data into our pages
	var bands = [
	{name : "Iron Maiden", metalness : 10},
	{name : "Karnivool", metalness :7},
	{name : "Porcupine Tree", metalness: 8}
	];

	var tagline = "We live for the mantle of metal. Forever and Always";
	res.render('pages/index', {
		bands : bands,
		tagline: tagline
	});
});

//about page
app.get('/about', function(req,res){
	res.render('pages/about');
});

app.listen(8888);
console.log('8888 is the port we are using now.');