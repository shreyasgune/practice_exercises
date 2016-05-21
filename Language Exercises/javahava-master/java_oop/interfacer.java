interface A
{
	public void show();
	int i = 10;
}

interface C 
{
	int i = 30;
}
class B implements A,C
{
	int i=20; //local to B
	public void show()
	{
		System.out.println("show() from B");
	}
	
	public void display()
	{
		System.out.println("display() from B "+i);
	}
	
	public void test()
	{
		System.out.println("i from A "+A.i);
		System.out.println("i from C "+C.i);
	}
}

class interfacer
{
	public static void main(String args[])
	{
		B b = new B();
		b.show();
		b.display();
		b.test();
		
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