class Link
{
	Link next;
	int data;

	public Link(int d)
	{
		this.data = d;
	}

	public void printLink()
	{
		System.out.print(" "+this.data);
	}

}

class linked
{
	Link first;

	public linked()
	{
		first = null;
	}

	public boolean isEmpty()
	{
		return first == null;
	}

	public void insert(int d)
	{
		Link n = new Link(d);
		n.next = first;
		first = n;
	}

	public Link delete()
	{
		Link temp = first;
		first = first.next;
		return temp;
	}

	public void printList()
	{
		Link curr = first;
		while(curr!=null)
		{
			curr.printLink();
			curr = curr.next;
		}
		System.out.println();
	}

}

class LL
{
	public static void main(String args[])
	{
		linked list = new linked();
		list.insert(10);
		list.insert(20);
		list.insert(30);

		list.printList();

		System.out.println(list.delete());
		list.printList();
	}
}


