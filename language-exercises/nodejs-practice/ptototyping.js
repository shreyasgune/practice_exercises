function User(){
	this.name = "";
	this.life = 100;
	this.giveLife = function giveLife(targetPlayer) {
		targetPlayer.life +=1;
		console.log(this.name+" gave 1 life to "+ targetPlayer.name);
	}

} 

var shreyas = new User();
var gune = new User();

shreyas.name = "Shreyas";
gune.name = "Gune";

shreyas.giveLife(gune);
console.log("Shreyas: "+shreyas.life);
console.log("Gune: "+gune.life);

//add function to objects
User.prototype.uppercut= function uppercut(targetPlayer) {
	targetPlayer.life -= 3;
	console.log(this.name+" just uppercutted " + targetPlayer.name);
};

gune.uppercut(shreyas);
console.log("Shreyas: "+shreyas.life);
console.log("Gune: "+gune.life);

//can add cumulative properties to all objects
User.prototype.magic = 60;
console.log("Shreyas Magic : "+shreyas.magic);
console.log("Gune Magic : "+ gune.magic);
