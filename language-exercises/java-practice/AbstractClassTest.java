class AbstractClassTest
{
	public static void main(String args[])
	{
		//MySuperClass m = new MySuperClass(); // NOT ALLOWED.
		MySubClass m = new MySubClass();
		m.printInfo();
	}

}

abstract class MySuperClass
{
	abstract public void printInfo();
	
}

class MySubClass extends MySuperClass
{
	public void printInfo()
	{
		System.out.println("I'm in the sub class");
	}
	
}