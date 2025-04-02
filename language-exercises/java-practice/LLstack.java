class Node
{
	String item;
	Node next;

	// Node(String i1)
	// {
	// 	item = i1;
	// }
	
	public void printNode()
	{
		System.out.print("{"+item+"} ");
	}
}

class linkedlist
{
	Node first;

	linkedlist()
	{
		first = null;
	}

	public void push(String i1)
	{
		Node oldfirst = first;
		first = new Node();
		first.item = i1;
		first.next = oldfirst;
	}

	public Node pop()
	{
		Node temp = first;
		first = first.next;
		return temp;
	}

	public void printlist()
	{
		Node curr = first;
		System.out.print("List : ");
		while(curr != null)
		{
			curr.printNode();
			curr = curr.next;
		}
		System.out.println("");
	}

}

public class LLstack
{
	public static void main(String args[])
	{
		linkedlist list = new linkedlist();

		list.push("hello");
		list.push("hi");
		list.push("whats");

		list.printlist();

		list.pop();
		list.pop();

		list.printlist();
	}
}