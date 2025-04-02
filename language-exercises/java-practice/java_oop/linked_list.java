class Link
{
	public int data1;
	public double data2;
	public Link next;

	//constructor
	public Link(int d1, double d2)
	{
		data1 = d1;
		data2 = d2;
	}

	public void printLink()
	{
		System.out.println("{"+data1+","+data2+"} ");
	}
}


class linked
{
	Link first;

	//constructor for linked list
	public linked()
	{
		first = null;
	}

	//check if list is empty
	public boolean isEmpty()
	{
		return first == null;
	}

	//inserts a new link at the first of the list
	public void insert(int d1, double d2)
	{
		Link link = new Link(d1,d2);
		link.next = first;
		first = link;
	}

	//delete the link at the first
	public Link delete()
	{
		Link temp = first;
		first = first.next;
		return temp;
	}

	//Prints list data
	public void print_list()
	{
		Link curr = first;
		System.out.print("List : ");
		while(curr != null)
		{
			curr.printLink();
			curr = curr.next;
		}
		System.out.println("");
	}


}

public class linked_list
{
	public static void main(String args[])
	{
		linked list = new linked();

		list.insert(1,1.001);
		list.insert(2,2.045);

		list.print_list();

		

		while(!list.isEmpty())
		{
			Link deleted = list.delete();
			System.out.print("Deleted:");
			deleted.printLink();
			System.out.println("");
		}

		list.print_list();
	}
}