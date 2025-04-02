import java.util.*;

public class dhtest
{
	public static void main(String args[])
	{
		int Xa; //random num for A which is < 22
		int Xb; //random num for B which is < 19
		int p; //prime number
		int g; //generator
		int Ya; //public key for A
		int Yb; //public key for B

		int Ka;
		int Kb;

		Xa = 6; //has to be lesser than 22
		Xb = 19; //has to be lesser than 20

		p = 17; //remains constant
		g = 5; //remains constant

		Ya = (int)((Math.pow(g,Xa))%p);
		Yb = (int)((Math.pow(g,Xb))%p);
		Kb = (int)((Math.pow(Ya,Xb))%p);
		Ka = (int)((Math.pow(Yb,Xa))%p);

		System.out.println("Value of Xa: "+Xa);
		System.out.println("Value of Xb: "+Xb);
		System.out.println("Value of p: "+p);
		System.out.println("Value of G: "+g);
		System.out.println("Value of Ya: "+Ya);
		System.out.println("Value of Yb: "+Yb);
		System.out.println("Value of Ka: "+Ka);
		System.out.println("Value of Kb: "+Kb);

	}
}

/*

Value of Xa: 6 //random on Sensortag
Value of Xb: 15 //random on Android
Value of p: 23 //prime number common
Value of G: 5 // Generator Common
Value of Ya: 8 //Public Key from Sensortag
Value of Yb: 19 //Public Key from App
Value of Ka: 2 // Secret on Sensortag
Value of Kb: 2 //Secret on App



*/


/*

Trail runs
PS C:\OPPPO> javac dhtest.java
PS C:\OPPPO> java dhtest
Value of Xa: 3
Value of Xb: 9
Value of p: 17
Value of G: 5
Value of Ya: 6
Value of Yb: 12
Value of Ka: 11
Value of Kb: 11
PS C:\OPPPO> javac dhtest.java
PS C:\OPPPO> java dhtest
Value of Xa: 12
Value of Xb: 13
Value of p: 17
Value of G: 5
Value of Ya: 4
Value of Yb: 3
Value of Ka: 4
Value of Kb: 4
PS C:\OPPPO> javac dhtest.java
PS C:\OPPPO> java dhtest
Value of Xa: 18
Value of Xb: 15
Value of p: 17
Value of G: 5
Value of Ya: 8
Value of Yb: 7
Value of Ka: 15
Value of Kb: 15
PS C:\OPPPO> javac dhtest.java
PS C:\OPPPO> java dhtest
Value of Xa: 18
Value of Xb: 19
Value of p: 17
Value of G: 5
Value of Ya: 8
Value of Yb: 6
Value of Ka: 2
Value of Kb: 2
PS C:\OPPPO> javac dhtest.java
PS C:\OPPPO> java dhtest
Value of Xa: 24
Value of Xb: 12
Value of p: 17
Value of G: 5
Value of Ya: 15
Value of Yb: 4
Value of Ka: 1
Value of Kb: 16
PS C:\OPPPO> javac dhtest.java
PS C:\OPPPO> java dhtest
Value of Xa: 20
Value of Xb: 12
Value of p: 17
Value of G: 5
Value of Ya: 13
Value of Yb: 4
Value of Ka: 1
Value of Kb: 1
PS C:\OPPPO> javac dhtest.java
PS C:\OPPPO> java dhtest
Value of Xa: 22
Value of Xb: 12
Value of p: 17
Value of G: 5
Value of Ya: 2
Value of Yb: 4
Value of Ka: 16
Value of Kb: 16
PS C:\OPPPO> javac dhtest.java
PS C:\OPPPO> java dhtest
Value of Xa: 24
Value of Xb: 12
Value of p: 17
Value of G: 5
Value of Ya: 15
Value of Yb: 4
Value of Ka: 1
Value of Kb: 16
PS C:\OPPPO> javac dhtest.java
PS C:\OPPPO> java dhtest
Value of Xa: 23
Value of Xb: 12
Value of p: 17
Value of G: 5
Value of Ya: 9
Value of Yb: 4
Value of Ka: 13
Value of Kb: 16
PS C:\OPPPO> javac dhtest.java
PS C:\OPPPO> java dhtest
Value of Xa: 22
Value of Xb: 12
Value of p: 17
Value of G: 5
Value of Ya: 2
Value of Yb: 4
Value of Ka: 16
Value of Kb: 16
PS C:\OPPPO> javac dhtest.java
PS C:\OPPPO> java dhtest
Value of Xa: 22
Value of Xb: 24
Value of p: 17
Value of G: 5
Value of Ya: 2
Value of Yb: 15
Value of Ka: 11
Value of Kb: 1
PS C:\OPPPO> javac dhtest.java
PS C:\OPPPO> javac dhtest.java
PS C:\OPPPO> java dhtest
Value of Xa: 22
Value of Xb: 21
Value of p: 17
Value of G: 5
Value of Ya: 2
Value of Yb: 14
Value of Ka: 11
Value of Kb: 15
PS C:\OPPPO> javac dhtest.java
PS C:\OPPPO> java dhtest
Value of Xa: 22
Value of Xb: 20
Value of p: 17
Value of G: 5
Value of Ya: 2
Value of Yb: 13
Value of Ka: 15
Value of Kb: 16
PS C:\OPPPO> javac dhtest.java
PS C:\OPPPO> java dhtest
Value of Xa: 22
Value of Xb: 19
Value of p: 17
Value of G: 5
Value of Ya: 2
Value of Yb: 6
Value of Ka: 8
Value of Kb: 8
PS C:\OPPPO>

*/