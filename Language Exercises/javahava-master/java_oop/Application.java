import java.util.*;

class Worker implements Runnable //extends Thread
{	
	@Override
	public void run()
	{
		for(int i =0 ;i<10;i++)
		{
			System.out.println(i+" Looping..\n");
			
			//if(i == 8) { //interrupt();}
		
		try
		{
			Thread.sleep(500);
		}
		catch(InterruptedException e)
		{
			break;
		}
		}
		
	
	}
}

public class Application 
{
	public static void main(String ar[])
	{
			Worker w = new Worker();
			
			Thread thread1 = new Thread(w);
			Thread thread2 = new Thread(w);
			
			thread1.start();
			thread2.start();
		
		
		// Worker w1 = new Worker();
		// w1.start();
		// w1.run();
		// Worker w2 = new Worker();
		// w2.start();
		// w2.run();
	}
}