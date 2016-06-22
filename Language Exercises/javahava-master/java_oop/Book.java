import java.util.*;
public class Book
{
		private String name;
		private String contents;
		private int year;
		
		public Book(String name, int year, String contents)
		{
			this.name = name;
			this.year = year;
			this.contents = contents;
		}
		
		//getters and setters
		public String getName() {return this.name;}
		public String setName(String name) { return this.name=name;}
		
		public String getContents() { return this.contents;}
		public String setContents(String contents) { return this.contents= contents;}
		
		
		public int getYear() { return this.year;}
		public int setYear(int year) { return this.year = year;}
		
		public String toString()
		{
			return "Name: "+this.name+" ("+this.year+") "+" Contents: "+this.contents;
		}
		/*		
		public static void main(String a[])
		{
			Book book1 = new Book("A Tale of Two Cities", 1882, "Some weird ass book about two cities fighting");
			Book book2 = new Book("Fight Club", 1998, "Some book about dude who thinks he's some other dude, starting a fight club");
			
			HashMap<String, Book> bookCollection = new HashMap<String, Book>();
			bookCollection.put(book1.getName(), book1);
			bookCollection.put(book2.getName(), book2);
			
			//now to search for a book
			Book getbook = bookCollection.get("A Tale of Two Cities");
			System.out.println(getbook);
		}
		*/
		
}

