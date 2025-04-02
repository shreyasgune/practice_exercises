class Person
{
	private String name;
	public Person(String name) { this.name = name;}
	public boolean isAsleep(int hr){ return 22<hr || 7>hr; }
	public String toString() { return name; }


public void status(int hr)
{
	if(this.isAsleep(hr))
		System.out.println("Now Offline: "+this);
	else
		System.out.println("Now online: "+this);
	}
	
	
}

public class Student extends Person{
	public Student(String name)
	{
		super(name);
	}
	
	public boolean isAsleep(int hr) //override
	{
		return 2 < hr && 8 > hr;
	}
	
	public static void main(String args[])
	{
		Person p = new Student("Shreyas");
		p.status(4);
	}
}


/*
Explanation 
Even though 'p' is a person reference, the actual object it refers to is Student().
p.status(arg) is being called on a student object. 
So, we look in the Student class but hey, it does not have a 'status()' method.
Since we have inherited the Person class, we go and look for 'status()' in the Person class.
The status() takes an argument 'int'. Within the status() method, within the if() condition,
<this> ===> points to the reference 'p' for the Student() object. This is determined on runtime.
This is because the student object is the one that called the function originally. So <this> gets dynamically
assigned to the Student() object. That's where isAsleep() is called.  
As per the conidtion, the argument intered for status() is integer '4'. if() returns TRUE
and output = Now Offline: Shreyas. Note that since 'p' is a reference to the Student() obeject taking String "Shreyas",
<this> points to "Shreyas" cuz Student(String name) returns super(name) ==> constructor of Person(String name) { this.name = name }
*/