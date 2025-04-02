//the 'THIS' keyword

var shreyas = {
	printFirstName : function() {
	console.log("My name is Shreyas");
	console.log(this === shreyas); // true
	}
};

shreyas.printFirstName();

//the defaul calling context is global

function useless(){
	console.log("\nNothigh");
	console.log(this === global);
}

useless();


