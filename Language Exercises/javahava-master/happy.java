import processing.core.PApplet;

public class happy extends PApplet 
{
	public void setup()
	{
		background(200,200,200);
		//size(400,400);
	}
	public void settings()
	{
		size(400,400);
	}

	public void draw()
	{
		fill(255,255,0);
		ellipse(200,200,390,390);
		fill(0,0,0);
		ellipse(120,130,50,70);	
		fill(0,0,0);
		ellipse(280,130,50,70);	


		noFill();
		arc(200,280,75,75,0,PI);


	}

	public static void main (String[] args) {
		//Add main method for running as application
		PApplet.main(new String[] {"--present", "happy"});
	}
}