import java.util.*;

public class ClubMember implements Comparable<ClubMember>
{
	private String name;
	private int height;
	
	public ClubMember(String name, int height)
	{
		this.name = name;
		this.height = height;
	}
	
	public String getName()
	{
		return this.name;
	}
	
	public int getHeight()
	{
		return this.height;
	}
	
	public void setName(String name) { this.name = name; }
	public void setHeight(int height) { this.height = height; }
	
	@Override
	public String toString()
	{
		return this.getName()+" "+this.getHeight();
	}
	
	@Override
	public int compareTo(ClubMember club)
	{
		if(this.height == club.getHeight()) { return 0;}
		else if (this.height > club.getHeight()) { return 1;}
		else { return -1; }
	}
	
	public static void main(String a[])
	{
		List<ClubMember> cl = new ArrayList<ClubMember>();
		cl.add(new ClubMember("Thom",200));
		cl.add(new ClubMember("Jonny",18));
		cl.add(new ClubMember("Ed",192));
		
		System.out.println(cl);
		Collections.sort(cl);
		System.out.println(cl);
		
		}
}