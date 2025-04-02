class Person
{
	private String name;
	
	public Person(String n)
	{
		super();
		this.name = n;
	}
	
	public void setName(String n)
	{
		this.name = n;
	}
}

class Student extends Person 
{
	public Student()
	{
		super(); //the added line that adheres to rule 3.
		this.setName("Student");
	}
	
	public static void main(String args)
	{
		Student s = new Student();
	}
}
/*Explanation
On the first go, this is going to give us an error. This is so because, 
if we see the Student() constructors, we see that the first line ain't a call
to the superclass constructor that takes no arguments. The compiler just pushes it.
Since we dont' really have a Person() constructor, JAVA will not push one in for us.
That is why we get the error.
*/
