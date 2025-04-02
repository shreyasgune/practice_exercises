public class stack
{
	int maxSize;
	long[] stackArray;
	int top;

	public stack(int s)
	{
		maxSize = s;
		stackArray = new long[maxSize];
		top = -1;
	}

	public void push(long j)
	{
		stackArray[++top] = j;
	}

	public long pop()
	{
		return stackArray[top--]; 
	}

	public long peek()
	{
		return stackArray[top];
	}

	public boolean isEmpty()
	{
		return (top == -1);
	}

	public boolean isFull()
	{
		return (top == maxSize-1);
	}

	public static void main(String args[])
	{
		stack stacks = new stack(10);
		stacks.push(10);
		stacks.push(20);
		stacks.push(30);
		stacks.push(40);

		while(!stacks.isEmpty())
		{
			long value = stacks.pop();
			System.out.println(value);
			System.out.println(" ");
		}

		System.out.println(" ");

	}
			
}