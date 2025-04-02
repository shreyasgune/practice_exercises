class Person
{
	void method1()
	{
		System.out.println("Person 1");
	}
	void method2()
	{
		System.out.println("Person 2");
	}
	
}

class Student extends Person
{
	void method1()
	{
		System.out.println("Student 1");
		super.method1();
		method2();
	}
	void method2()
	{
		System.out.println("Student 2");
	}
}

class Undergrad extends Student
{
	void method2()
	{
		System.out.println("Undergrad 2");
	}
	
}

class overloadride extends Undergrad
{
	public static void main(String args[])
	{
		Person u = new Undergrad();
		u.method1();
	}
}

/*
Explanation
u is an Undergrad() object. Undergrad class does not have a method1() function.
But , it does extend Student, which does have a method1().
It finds method1() in Student, and executes the SOP("Student 1").
Then it goes to super.method1(); , which is in Person class, since super of Student is Person.
In Person class's method1() , we get SOP("Person 1"), so we get that output.
Then we're back to Student's method1(). We get method2(). Which one is it?
Since we don't have a calling object for method2(), java inserts <this>.method2();
<this> is going to find the actual object type at runtime, which is the actaul Undergrad Object : u
so, we go down to the Undergrad class, access method2() and print out SOP("Undergrad 2")

There is a difference when there is a call to a super() and a method versus a call to <this> and a method.
>Calls to super get bound to compile time, java looks at the code, figures out what class it is in, and what the 
superclass of that class is.
>Calls to <this> and a method name get bound to runtime, java looks at the actual type of the object.





