public class TestInterfaces implements MyInterface 
{
	@Override
	public void display()
	{
		System.out.println("Hello from Interface");
	}
	public static void main(String a[])
	{
		TestInterfaces t = new TestInterfaces();
		t.display();
		
	}
}

interface MyInterface 
{
	public void display();
	
}