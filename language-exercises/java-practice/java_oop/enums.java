import java.util.*;

public class enums
{
		public static void main(String a[])
		{
			for (gune bands : gune.values())
			{ System.out.printf("%s: %s\t%d\t \n",bands,bands.getName(),bands.getYear());}
		
			System.out.println();
			
			for(gune ban : EnumSet.range(gune.radiohead,gune.karnivool))
			{
				System.out.printf("%s: %s\t%d\t \n",ban,ban.getName(),ban.getYear());
			}
		}
}

enum gune
{
	radiohead("A Moon Shaped Pool",2016),
	karnivool("Sound Awake",2009),
	iron_maiden("The Number of the Beast",1982);
	
	private final String name;
	private final int year;
	
	gune(String name, int year)
	{
		this.name = name;
		this.year = year;
	}
	
	public String getName()
	{
		return this.name;
	}
	
	public int getYear()
	{
		return this.year;
	}
}