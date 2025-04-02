#include <iostream>
int arr[0];
class StackX
{
	int maxSize;
	
	int top;

public:

	StackX(int s)
	{
		maxSize = s;
		top = -1;
		arr[maxSize];
	}


	void push(int j)
	{
		arr[++top] = j;
	}

	int pop()
	{
		return arr[top--];
	}

	int peek()
	{
		return arr[top];
	}

	bool isEmpty()
	{
		return (top==-1);
	}

	bool isFull()
	{
		return (top == (maxSize-1));
	}

	void display()
	{
		
	}
};

int main()
{
	StackX stacker(6);
	stacker.push(10);
	stacker.push(20);
	stacker.push(30);
	stacker.push(40);
	stacker.push(50);
	stacker.push(60);
	

	for(int i = 0;i<6;i++)
		cout<<arr[i]<<" ";
		//double value = stacker.pop();
		
	
	cout<<endl;
	stacker.pop();
	cout<<stacker.peek();

	cin.get();
	return 0;

}