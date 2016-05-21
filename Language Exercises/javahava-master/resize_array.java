public class resize_array
{

	//global variables
	String s[];
	int N;

	public resize_array()
	{
		s = new String[1];
	}

	public void push(String item)
	{
		//this bit of code makes the resize possible.
		if (N==s.length)
		{
			resize(2*s.length);
		}
		s[N++] = item;
	}
	
	public void resize(int capacity)
	{
		String[] cpy = new String[capacity];
		for(int i = 0; i< N; i++)
		{
			cpy[i] = s[i];
		}
		s = cpy;
	}
	
	public void printstack()
	{
		int i = 0;
		while(i<s.length)
		{
			System.out.println("item"+i+":"+s[i]);
			i++;
		}

	}

	public  static void main(String args[])
	{
		resize_array re = new resize_array();
		re.push("choco");
		re.push("lega");
		re.push("leggaaaaaa");
		re.push("leeenaaaa");
		re.printstack();

	}

	
}
