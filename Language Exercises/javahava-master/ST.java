import jaba.util.*;


public class ST<Key extends Comparable<Key>, Value> implements Iterable<Key> 
{
	public TreeMap<Key, Value> st;

	public ST() 
	{
		st = new TreeMap<Key,Value>();
	}

	public Value get(Key key)
	{
		if(key == null)
		{
			throw new NullPointerException("called get() with null key");
			return st.get(key);
		}
	}

	

}