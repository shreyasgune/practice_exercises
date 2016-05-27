import java.util.*;

public class MyIterator {
	public static void main(String args[])
	{
		//create an Array List
		ArrayList al = new ArrayList();

		al.add("O");
		al.add("A");
		al.add("I");
		al.add("S");
		al.add("I");
		al.add("S");


		//user iterator to display contents
		System.out.println("Original Contents: ");
		Iterator itr = al.iterator();
		while(itr.hasNext())
		{
			Object element = itr.next();
			System.out.print(element+" ");
		}

		System.out.println();

		//Modify Objects being iterated

		ListIterator litr = al.listIterator();
		while(litr.hasNext())
		{
			Object element = litr.next();
			litr.set(element+"+");
		}
		System.out.print("Modified contents of al:" );

		itr = al.iterator();
     	while(itr.hasNext()) 
     	{
     	 	Object element = itr.next();
         	System.out.print(element + " ");
      	}
  	    System.out.println();

      // Now, display the list backwards
    	System.out.print("Modified list backwards: ");
      	while(litr.hasPrevious()) 
      	{
         	Object element = litr.previous();
         	System.out.print(element + " ");
       	}
       	System.out.println();

	}
}