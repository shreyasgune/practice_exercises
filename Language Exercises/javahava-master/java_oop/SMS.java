import java.util.*;
interface Readable
{
	String read();
}

public class SMS implements Readable
{
	private String sender;
	private String content;
	
	public SMS(String sender, String content)
	{
		this.sender = sender;
		this.content = content;
	}
	
	public String getSender()
	{
		return this.sender;
	}
	
	public String read()
	{
		return this.sender+" : "+this.content;
	}
	
	public static void main(String a[])
	{
		SMS m = new SMS("Gune","BLUR Song 2");
		//System.out.println(message.read());
		
		ArrayList<SMS> messages = new ArrayList<SMS>();
		messages.add(new SMS("Gune2","ParkLife"));
		messages.add(m);
		
		for(SMS s : messages) { System.out.println(s.read());}
		
		Readable readable = new SMS("Oasis","Wonderwall");
		ArrayList<Readable> numberList = new ArrayList<Readable>();
		
		numberList.add(readable);
		numberList.add(new SMS("teacher", "never been programming before..."));
		numberList.add(new SMS("teacher", "gonna love it i think!"));
		numberList.add(new SMS("teacher", "give me something more challenging! :)"));
		numberList.add(new SMS("teacher", "you think i can do it?"));
		numberList.add(new SMS("teacher", "up here we send several messages each day"));
	
    for (Readable readabble: numberList) {
        System.out.println(readabble.read());
    }
		
	}
}