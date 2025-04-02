import java.util.*;

public class generic<T>
{
	private T key;
	
	public void setValue(T key)
	{
		this.key = key;
	}
	
	public T getValue()
	{
		return this.key;
	}
	
	public static void main(String args[])
	{
		generic<String> m = new generic<String>();
		m.setValue("Hello");
		System.out.println(m.getValue());
	}
	
}
