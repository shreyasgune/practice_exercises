class Node
{
	Node left, right;
	int data;

	public Node(int n)
	{
		this.data = n;
		left = null;
		right = null;
	}

	public boolean add(int n)
	{
		if(n == this.data)
		{	System.out.println("The data "+n+ "exists");return false;}
		
		else if(n < this.data)
		{	System.out.println(n+"<"+this.data);
			if(left == null) {  left = new Node(n); System.out.println("\nA new left child is created at "+left+" with data "+left.data); } //a new node for left is created with it's sub child (LR) 
			else { System.out.println("Left is not null, so we go down below. \n"); return left.add(n) ;  } //System.out.println("A left child has data"+left.data);
		}
		else if(n > this.data)
		{  System.out.println(n+">"+this.data);
		  	if(right == null) {   right = new Node(n) ; System.out.println("\nA new right child is created at"+right+" with data "+right.data); } // a new node for right is created with it's sub child (LR) 
			else {  System.out.println("Right is not null, so we go down below.\n");  return right.add(n) ;} //System.out.println("A right child has data"+right.data); 
		} 

		return false;
	}
			

}

class bst_practic
{
	Node root;

	public bst_practic()
	{
		root = null;
	}

	public boolean add(int n)
	{
		if(root == null)
		{
			Node node = new Node(n);
			root = node;
			System.out.println("\nA new ROOT is just created at "+root+" with  data " +root.data);
			System.out.println();
			return true;
		}
		else
		{  root.add(n) ; System.out.println("\nThe item "+n+" is now added at node: "+root); System.out.println(); return true; } 
		//return false;
			
	}

	public static void main (String arg[])
	{
		bst_practic tree = new bst_practic();
	
		System.out.println("Data in consideration: 5 ");
		tree.add(5);
		System.out.println("Data in consideration: 2 ");
		tree.add(2);
		System.out.println("Data in consideration: 18 ");
		tree.add(18);
		System.out.println("Data in consideration: -4 ");
		tree.add(-4);
		System.out.println("Data in consideration: 3 ");
		tree.add(3);
	}

}

