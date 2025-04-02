import java.util.*;

public class collect
{
	public static void main(String a[])
	{
		Map<String, String> t = new HashMap<String,String>();
		t.put("Cog","Bird of Feather");
		t.put("Karnivool","Deadman");
		
		Set<String> keys = t.keySet();
		Collection<String> keySet = keys;
		
		System.out.println("Keys: ");
		for(String s: keySet) { System.out.println(s);}
		
		System.out.println();
		System.out.println("Values: ");
		Collection<String> values = t.values();
		for(String v : values) { System.out.println(v);}
	}
}