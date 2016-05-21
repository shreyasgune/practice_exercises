import java.io.*;
import java.lang.*;

class diamond
{
	public static void main (String args[])
	{
		for(int i =1 ; i<6; i+= 2)
		{
			for(int j=0;j<5-i/2;j++)
				System.out.print(" ");

            for(int k=0;k<i;k++)
				System.out.print("*");

			System.out.print("\n");
			
		}

		for(int i=3; i>0;i-=2)
		{
			for (int j =0 ; j <5-i/2; j++)
				System.out.print(" ");

            for(int k=0;k<i;k++)
				System.out.print("*");

			System.out.print("\n");
		}


	}
}