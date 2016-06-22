
import java.util.*;
class someclass
{
	// private int s;
	// private String v;
	
	// public someclass(String n, int d)
	// {
		// this.s = d;
		// this.v = n;
	// }
	
	
}


class test  
{
	public static void main(String[] args) {

		test obj = new test();
		obj.overLoad(null);
	}

	private void overLoad(Object o) {
		System.out.println("Object o argument method.");
	}

	private void overLoad(double[] dArray) {
		System.out.println("double array argument method.");
	}


	// public static void main(String a[])
	// {	//Thread t =
		 // new Thread(new Runnable() {
			
			// @Override
			// public void run()
			// {
				// for(int i=0;i<10;i++)
				// {
					// System.out.println("Radiohead is the greatest band"+i);
					
					// try
					// { Thread.sleep(1000);}
					// catch(InterruptedException e)
					// {
						// break;
					// }
					
					
				// }
			// }
		// }).start();
		//t.start();
	// }
}

// HashMap<someclass, String> loaners = new HashMap<someclass, String>();
		
		// someclass some = new someclass("Decks Dark",3);
		// loaners.put(some,"A Moon Shaped Pool");
		// System.out.println(some.hashCode());
		
		// String[] s = {"Hello","Hello","Hello","Hello","Hi","Go","To","Sleep"};
		// List<String> list = Arrays.asList(s);
		// System.out.printf("%s",list);
		// System.out.println();
		
	//	creating HashSet
		// Set<String> set = new HashSet<String>(list);
		// System.out.printf("%s",set);
		


// HashMap<Integer, String> numbers = new HashMap<Integer, String>(); //a new object of class HashMap is created
		// numbers.put(1,"one");
		// numbers.put(2,"two");
		// numbers.put(3,"three");
		
		// System.out.println(numbers.get(1));
		// System.out.println(numbers.get(2));
		// System.out.println(numbers.get("three"));
		
	
// Scanner reader = new Scanner(System.in);
		// System.out.print("Write password: ");
		// String password = reader.nextLine();
		
		// if(password.equals("choco"))
		// {
			// System.out.println("Access Granted");
		// }
		// else { System.out.println("DENIED!");}	