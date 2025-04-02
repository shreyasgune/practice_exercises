class Person 
{
	private String name;
	
	Person(String n)
	{
		this.name = n;
		System.out.print("#1 ");
	}
}

class Student extends Person
{
	Student()
	{
		this("Student");
		System.out.print("#2 ");
	}
	
	Student(String n)
	{
		super(n);
		System.out.print("#3 ");
	}
	
	public static void main(String args[])
	{
		Student s = new Student();
	}
	
}

/* Explanation
When the object Student s = new Student() gets created , we go to Student() constructor
There, we find this("student") which actually calls Student(argumnet) constructor.
When we go to Student(String n) , we see super(n) , which actually calls Person(argument).
So we go to Person(String n). There we print out #1. 
Then we return back to Student(arg) , print #3.
Then we return back to Student() , print #2.
That's how it works.
*/