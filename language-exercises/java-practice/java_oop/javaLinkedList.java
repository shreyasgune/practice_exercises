import java.util.*;

public class javaLinkedList
{
	public static void main(String args[])
	{
		LinkedList <String> list = new LinkedList<String>();

		list.add("Shreyas");
		list.add("Jonny");
		list.add("Thom");

		
		Iterator<String> itr = list.iterator();

		while(itr.hasNext())
		{
			System.out.println(itr.next());
		}
	}
}