//creating the canvas

var canvas = document.createElement("canvas");
var ctx = canvas.getContext("2d");
canvas.width = 512;
canvas.height = 480;
document.body.appendChild(canvas);


//background image
var bgReady = false;
var bgImage = new Image();
bgImage.onload = function()
{
	bgReady = true;
};
bgImage.src = "images/background.png"

//Kunal Image
var kunalReady = false;
var kunalImage = new Image();
kunalImage.onload = function()
{
	kunalReady = true;
};
kunalImage.src = "images/kd.png"

//Old Monk Image
var omReady = false;
var omImage = new Image();
omImage.onload = function()
{
	omReady = true;
};
omImage.src = "images/om.png"


//Game objects
var kunal = 
{
	speed : 256,
	x: 0,
	y: 0
};

var oldmonk = 
{
	x:0,
	y:0
};

var omCaught = 0;

//handle user inputs
var keysDown = {};

addEventListener("keydown", function(e) 
{
	keysDown[e.keyCode] = true;
} , false);

addEventListener("keyup", function(e) 
{
	delete keysDown[e.keyCode];
}, false);




// Reset the game when Kunal gets his old monk.
var reset =  function() 
{
	kunal.x = canvas.width/2;
	kunal.y = canvas.height/2;

	//make old monk appear randomly

oldmonk.x = 32 + (Math.random() * (canvas.width-64));
oldmonk.y = 32 + (Math.random() * (canvas.height-64));

};

//updating game objects

var update = function(modifier)
{
	if(38 in keysDown)
	{
		kunal.y -= kunal.speed*modifier;
	}
		
	if(40 in keysDown)	
	{
		kunal.y += kunal.speed*modifier;
	}

	if(37 in keysDown)	
	{
		kunal.x -= kunal.speed*modifier;
	}

	if(39 in keysDown)	
	{
		kunal.x += kunal.speed*modifier;
	}

	//KD gets the OldMonk

	if(kunal.x <= (oldmonk.x +32) && oldmonk.x<=(kunal.x+32) && kunal.y <= (oldmonk.y+32) && oldmonk.y <= (kunal.y+32))
	{
		++omCaught;
		reset();

	}

	


};

//Draw Everything

var render = function()
{
	if(bgReady)
	{
		ctx.drawImage(bgImage,0,0);
	}

	if(kunalReady)
	{
		ctx.drawImage(kunalImage,kunal.x,kunal.y);
	}

	if(omReady)
	{
		ctx.drawImage(omImage,oldmonk.x,oldmonk.y)
	}

	//scoring

	ctx.fillStyle = "rgb(250,250,250)";
	ctx.font = "18px Trebuchet MS";
	ctx.textAlign = "left";
	ctx.textBaseline = "top";
	ctx.fillText("Old Monks Acquired :"+omCaught,32,32);

	if(omCaught==5)
	{
		//alert("hello");
	kunalImage.src = "images/kd2.png"
	ctx.fillText("KD, STOP IT! ",200,100);
	

	}

	if(omCaught==10)
	{
		//alert("hello");
	kunalImage.src = "images/kd3.png"	
	ctx.fillText("KD, That's enough! ",200,100);

	}

	if(omCaught==15)
	{
		//alert("hello");
	kunalImage.src = "images/kd4.png"	
	ctx.fillText("KD, Please. This is not healthy for you.",100,100);
	}

	if(omCaught==20)
	{
		//alert("hello");
	kunalImage.src = "images/kd5.png"	
	ctx.fillText("KD...FULL SHYAAON! ",200,100);
	}

	if(omCaught==30)
	{
		alert("Kunal has passed out!")
	}


};


// The main game loop
var main = function () {
	var now = Date.now();
	var delta = now - then;

	update(delta / 1000);
	render();

	then = now;

	// Request to do this again ASAP
	requestAnimationFrame(main);
	

	};


// Cross-browser support for requestAnimationFrame
var w = window;
requestAnimationFrame = w.requestAnimationFrame || w.webkitRequestAnimationFrame || w.msRequestAnimationFrame || w.mozRequestAnimationFrame;

// Let's play this game!
var then = Date.now();
reset();
main();