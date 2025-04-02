function placeAnOrder (orderNum){
	console.log("Customer Order :",orderNum);
	cookAndDeliverFood(function () {
		console.log("Delivered Food Order ::",orderNum);
	});


}

//simulate a 5 second operation
function cookAndDeliverFood (callback){
setTimeout(callback, 5000);
}

//simulate users 
placeAnOrder(1);
placeAnOrder(2);
placeAnOrder(3);
placeAnOrder(4);
placeAnOrder(5);
placeAnOrder(6);

//Why does it concurrently run placeAnOrder ?
//whats happening is you schedule the callback method 
//to run in 5 seconds.. while you continue with other calls to placeAnOrder
//so basically callback the function while I go do other stuff.
//neat, don't you think?