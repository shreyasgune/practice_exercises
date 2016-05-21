//listInsertionSort.cpp
//demonstrates sorted list used for sorting
#include <iostream>
#include <cstdlib> //for random numbers
#include <ctime> //for random seed
using namespace std;
////////////////////////////////////////////////////////////////
class Link
{
public:
double dData; //data item
Link* pNext; //next link in list
//-------------------------------------------------------------
Link(double dd) : dData(dd), pNext(NULL) //constructor
{ }
//-------------------------------------------------------------
}; //end class Link
////////////////////////////////////////////////////////////////
class SortedList
{
private:
Link* pFirst; //ptr to first item on list
public:
//-------------------------------------------------------------
SortedList() : pFirst(NULL) //constructor (no args)
{ } //initialize list
//-------------------------------------------------------------
//constructor
SortedList(Link** linkArr, int length) : pFirst(NULL)
{ //(initialized with array)
for(int j=0; j<length; j++) //copy array
insert( linkArr[j] ); //to list
}
//-------------------------------------------------------------
void insert(Link* pArg) //insert (in order)
{
Link* pPrevious = NULL; //start at first
Link* pCurrent = pFirst;
//until end of list,
while(pCurrent != NULL && pArg->dData > pCurrent->dData)
{ //or key > current,
pPrevious = pCurrent;
pCurrent = pCurrent->pNext; //go to next item
}
if(pPrevious==NULL) //at beginning of list
pFirst = pArg; //first --> k

else //not at beginning
pPrevious->pNext = pArg; //old prev --> k
pArg->pNext = pCurrent; //k --> old currnt
} //end insert()
//-------------------------------------------------------------
Link* remove() //return & delete first link
{ //(assumes non-empty list)
Link* pTemp = pFirst; //save first
pFirst = pFirst->pNext; //delete first
return pTemp; //return value
}
//-------------------------------------------------------------
}; //end class SortedList
////////////////////////////////////////////////////////////////
int main()
{
int j;
time_t aTime; //seed random numbers
srand(static_cast<unsigned>(time(&aTime)) );
const int size = 10; //array size
Link* linkArray[size]; //array of ptrs to links
for(j=0; j<size; j++) //fill with ptrs to links
{
int n = rand() % 99; //random number (0 to 99)
Link* pNewLink = new Link(n); //make link
linkArray[j] = pNewLink; //put ptr to link in array
}
cout << "Unsorted array: " ; //display array contents
for(j=0; j<size; j++)
cout << linkArray[j]->dData << " ";
cout << endl;
//create new list
SortedList theSortedList(linkArray, size); //initialized
//with array
for(j=0; j<size; j++) //links from list to array
linkArray[j] = theSortedList.remove();
cout << "Sorted Array: "; //display array contents
for(j=0; j<size; j++)
cout << linkArray[j]->dData << " ";
cout << endl;
for(j=0; j<size; j++) //delete individual links
delete linkArray[j];
return 0;
} //end main()