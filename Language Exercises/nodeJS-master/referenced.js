//whenever you're working with node, everything is //referenced

var shreyas = {
	favFood : "biriyani",
	favMovie : "Oceans 11"

};

var Person  = shreyas;
Person.favFood = "Paneer Tikka";
console.log(shreyas.favFood);