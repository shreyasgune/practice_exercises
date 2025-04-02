//Queue

#include <iostream>
#include <vector>

using namespace std;

class queue
{

private:
	int maxSize;
	std::vector<int> quevect;
	int front;
	int rear;
	int nItems;

public:
	queue(int s): maxSize(s), front(0), nItems(0)
	{ 
		quevect.resize(maxSize);
	}
	
	//~queue();

	/* data */

	void insert(int j) //put item at the rear of the queue
	{
		if(rear==maxSize-1) //deal with wrap-around
			rear= -1;
		quevect[++rear] = j;
		nItems++;
	}
	//--------------------------------

	int remove() //pop - take item from the queue
	{
		int temp = quevect[front++]; //get value and increment the front
		if(front == maxSize) //deal with wrap-around
			front=0;
		nItems--; //one item is removed
		return temp;
	}

	//-----------------------------
	int peekFront()
	{
		return quevect[front];
	}

	int isEmpty()
	{
		return nItems=0;
	}

	int isFull()
	{
		return nItems=maxSize;
	}

	int size()
	{
		return nItems;
	}

	void printer()
	{
				for(int n = 0; n<= nItems ; n++)
			{
				int k = quevect[n];
				cout<<k<<" ";

			}

	}
};


int main()
{
	queue theQueue(3);
	theQueue.insert(10); //insert 4 items
	theQueue.insert(20);
	theQueue.insert(30);
	theQueue.insert(40);
	theQueue.printer();
	cout<<endl;
	// theQueue.remove(); //remove 3 items
	// theQueue.remove(); // (10, 20, 30)
	// theQueue.remove();
	// theQueue.printer();
	// cout<<endl;
	// theQueue.insert(50); //insert 4 more items
	// theQueue.insert(60); // (wraps around)
	// theQueue.insert(70);
	// theQueue.insert(80);
	// theQueue.printer();
	cout<<endl;
		
	// for(int n = 0; n<= theQueue.size(); n++)
	// {
	// 	int k = theQueue.remove();
	// 	cout<<k<<" ";

	// }

	cout<<endl;
	//cin.get();
	return 0;
}

