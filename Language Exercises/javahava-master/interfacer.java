interface A
{
	public void show();
}

class B implements A 
{
	public void show()
	{
		System.out.println("show() from B");
	}
	
	public void display()
	{
		System.out.println("display() from B");
	}
}

class interfacer
{
	public static void main(String args[])
	{
		B b = new B();
		b.show();
		b.display();
		
		//create a reference of A and allocate memory from B.
		A obj = new B();
		obj.show();
		
		/*
		obj.display(); this throws error.
		
		C:\dev\java_oop>javac interfacer.java
		interfacer.java:30: error: cannot find symbol
                obj.display();
                   ^
		  symbol:   method display()
		  location: variable obj of type A
		1 error
		
		*/
	}
}