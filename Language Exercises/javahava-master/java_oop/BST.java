class Node
{
	int data;
	Node left,right;

	public Node(int v)
	{
		this.data = v;
		left = null;
		right = null;
	}

	//Iterative Search
	public static Node search(Node root, int target)
	{
		Node ptr = root;
		while(ptr!=null)
		{
			if (target == ptr.data)
			{ return ptr; } // node that has the data is returned

			if(target < ptr.data)
			{ ptr = ptr.left;}
			else { ptr = ptr.right; } 

		}
		return null; // target was not found
	}

	//Recursive Search
	public static Node RecurSearch(Node root, int target)
	{
		if (root == null)
		{ return null ; }

		if(target == root.data)
		{ return root;}

		if(target < root.data)
		{ return RecurSearch(root.left, target); }

		if(target > root.data)
		{ return RecurSearch( root.right, target) ; } 
		
		return null;
	}


	public boolean add(int val)
	{
		if (val == this.data) 
		{
			return false;
		}
		else if(val < this.data)
		{
			if(left == null) { left = new Node(val); return true; } // a new left child is created
			else { return left.add(val);  } //the value is added to the left child
		}
		else if(val > this.data)
		{
			if(right == null) { right = new Node(val); return true; } //a new right child is created
			else { return right.add(val); } //the value is added to the right child
		}

		return false; //node of the conditions are satisfied, so the value is not added or the value exists
	}
	/*
	public void InOrder()
	{
		if(left!= null)
		{
			left.InOrder();
		}
		System.out.println(data);
		if(right!=null)
		{
			right.InOrder();
		}
	
	}
	*/
	
	

}

public class BST
{
	Node root;

	public BST()
	{ root = null; } 

	//adding a value to a node
	public boolean add(int value)
	{
		if(root == null) { root = new Node(value); return true; } //a new root node is created with the value that you've inserted
		else { return root.add(value); } //this add method is defined in the Node class
	}

	void inorderRec(Node root)
	{
		if(root!= null)
		{ 
			inorderRec(root.left);
			System.out.println(root.data);
			inorderRec(root.right);
		}
	}

	void inorder()
	{	inorderRec(root); } 

	public static void main(String args[])
	{

		BST bst = new BST();

		bst.add(10);
		bst.add(20);
		bst.add(33);
		bst.add(45);
		bst.add(72);

		bst.inorder();
	}
} 

	




