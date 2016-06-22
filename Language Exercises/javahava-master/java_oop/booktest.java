public class booktest
{
	private String name;
	private int year;
	
	public booktest(String name, int year)
	{
		this.name = name;
		this.year = year;
	}
	
	public String getName()
	{
		return this.name;
	}
	
	public int getYear()
	{
		return this.year;//();//this.year;
	}
	
	// @Override
	// public String toString()
	// {
		// return getName()+" "+getYear();//this.name+" Year: "+this.year;
	// }
	
	public static void main(String a[])
	{
		booktest b = new booktest("A Moon Shaped Pool",2016);
		System.out.println(b);
	}
}