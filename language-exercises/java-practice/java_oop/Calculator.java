public class Calculator
{
	int value;

	public Calculator(int v)
	{
		this.value = v;
	}

	public static Calculator create(int val)
	{	
		return new Calculator(val);
	}

	public String toString()
	{
		return ("The Value is :"+this.value);
	}

	public static void main(String a[])
	{
		Calculator c1 = new Calculator(10);
		System.out.println("c1 : "+c1);
		Calculator c2 = create(20);
		System.out.println("c2 : "+c2);

	}
}


