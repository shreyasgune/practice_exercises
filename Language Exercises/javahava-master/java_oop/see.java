public class see
{	
	int k;

	public see(int k)
	{	this.k = k;
		System.out.println(this+" "+this.k);
	}
		
	public static void main(String a[])
	{
		see s = new see(4);
		see s2 = new see(5);
		
		//print();
	}
} 
