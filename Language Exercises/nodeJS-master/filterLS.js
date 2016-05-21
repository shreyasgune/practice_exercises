var fs = require('fs');
var path = require('path');
var dirName = process.argv[2];
var ext = process.argv[3];

fs.readdir(dirName, function(err,files){
	Array.prototype.forEach.call(files, function(el){
		if(path.extname(el).slice(1) === ext) {
			console.log(el);
		}
	});
});

