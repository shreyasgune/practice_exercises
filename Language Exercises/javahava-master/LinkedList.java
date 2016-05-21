public class LinkedList
{
	Node head; //reference to head node
	int listCount;

	public LinkedList()
	{
		head = new Node(null); //empty list bro
		listCount = 0; //aint nothing in there 
	}

    //adds item to the end of the list
	public void add(Object data) 
	{
		Node temp = new Node(data);
		Node current = head;

		//start at the head and go till the end of the list
		while(current.getNext()!= null)
		{
			current = current.getNext();
		}

		//now that we at the end, set the next of last node to our current
		current.setNext(temp);
		listCount++; //increment the number of elements

	}

	//add our item at position = index
	public void add(Object data, int index)
	{
		Node temp = new Node(data);
		Node current = head;

		for(int i=1;i< index && current.getNext() != null; i++)
		{
			current = current.getNext();
		}

		temp.setNext(current.getNext());
		current.setNext(temp);
		listCount++;
	}

	public Object get(int index)
	{
		if(index <=0)
			return null;

		Node current = head.getNext();
		for(int i = 1; i< index;i++)
		{
			if(current.getNext() == null)
			{
				return null;
			}
			current = current.getNext();
		}
		return current.getData();
	}

	public boolean remove(int index)
	{
		if(index<1 || index > size())
			return false;

		Node current = head;
		for(int i = 1; i< index; i++)
		{
			if(current.getNext() == null)
				return false;
			current =current.getNext();
		}
		current.setNext(current.getNext().getNext());
		listCount--;
		return true;
	}

	public int size()
	{
		return listCount;
		//retruns count
	}

	public String toString()
	{
		Node current = head.getNext();
		String output = "";
		while(current!= null)
		{
			output += "[" + current.getData().toString() + "]";
			current = current.getNext();
		}
		return output;
	}

	public class Node
	{
		Node next;
		Object data;

		public Node(Object _data)
		{
			next = null;
			data = _data;

		}

		public Object getData()
		{
			return data;
		}

		public void setData(Object _data)
		{
			data = _data;
		}

		public Node getNext()
		{
			return next;
		}

		public void setNext(Node _next)
		{
			next = _next;
		}
	}


}