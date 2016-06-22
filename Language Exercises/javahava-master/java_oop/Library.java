import java.util.*;
class Book
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
}

public class Library
{
	private HashMap<String, Book> collection;
	
	public Library()
	{
		this.collection = new HashMap<String, Book>();
	}
	
	public void addBook(Book book)
	{
		String name = stringCleaner(book.getName());
		
		if(this.collection.containsKey(name)) { System.out.println("This book already exists in the library"); }
		else { collection.put(name,book);}
	}
	
	public void removeBook(String bookName)
	{
		bookName = stringCleaner(bookName);
		
		if(this.collection.containsKey(bookName)) { this.collection.remove(bookName); }
		else { System.out.println("This book was not found in the database");}
	}
	
	private String stringCleaner(String string)
	{
		if(string == null ){ return "";}
		string = string.toLowerCase();
		return string.trim();
	}
	
	//get the book
	public Book getBook(String bookName)
	{
		bookName = stringCleaner(bookName);
		return this.collection.get(bookName);
	}
	
	//list of books
	public ArrayList<Book> bookList()
	{
		return new ArrayList<Book>(this.collection.values());
	}
	
	public static void main(String a[])
	{
		//Book(String name, int year, String contents)
		
		Book b1 = new Book("Fight Club",1998," Some book about fighting");
		Book b2 = new Book("Macbeth",1678," Some dude decides to rule Scotland");
		
		Library l = new Library(); //a new hashmap is created
		l.addBook(b1);
		l.addBook(b2);
		System.out.println(l.collection.values());
		System.out.println(l.collection.keySet());
		
		ArrayList<Book> b = l.bookList();
		for(Book z : b) { System.out.println(z);}
		
		
	}
	
}