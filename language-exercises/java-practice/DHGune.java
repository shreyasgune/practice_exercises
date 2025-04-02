//ModVersion of Diffie Hellman Algo 

//author - shreyas gune
//inspired by - pannous on Github , he has a more deeply implemented version with SHA-2 and AES.

import java.math.*;
import java.util.*;
import java.security.MessageDigest;
import javax.crypto.*;
import javax.crypto.spec.SecretKeySpec;
import java.io.*;



public class DHGune {

	int bitLength=512;	
	int certainty=20;// probabilistic prime generator 1-2^-certainty => practically 'almost sure'

    private static final Random rnd = new Random(); // a new random number is generated.
	
	public static void main(String [] args) throws Exception
	{
		new DHGune(); // calling the constructor
	}

	public DHGune() throws Exception{
	    Random randomGenerator = new Random();
	    BigInteger generatorValue,primeValue,publicA,publicB,secretA,secretB,sharedKeyA,sharedKeyB; //basically we are using big integer to make sure it can't be worked backwards

	    primeValue = findPrime();// BigInteger.valueOf((long)g); //finds the prime number
	    System.out.println();System.out.println();System.out.println("***************");
	    System.out.println("the prime is "+primeValue);
	    System.out.println();
	    System.out.println();
	     generatorValue	= findPrimeRoot(primeValue);//BigInteger.valueOf((long)p);
	    System.out.println("the generator of the prime is "+generatorValue);
	    System.out.println();System.out.println();System.out.println();

		// on machine 1
	    secretA = new BigInteger(bitLength-2,randomGenerator); //could be anything to be honest
	    
		// on machine 2
	    secretB = new BigInteger(bitLength-2,randomGenerator); // could be anything

		// to be published:
	    publicA=generatorValue.modPow(secretA, primeValue);
	    publicB=generatorValue.modPow(secretB, primeValue);
	    sharedKeyA = publicB.modPow(secretA,primeValue);// should always be same as:
	    sharedKeyB = publicA.modPow(secretB,primeValue);

	    System.out.println("the public key of A is "+publicA);
	    System.out.println();
	    System.out.println("the public key of B is "+publicB);
	    System.out.println();
	

	    System.out.println("The secret key for A is "+secretA);
	    System.out.println();
	    System.out.println("The secret key for B is "+secretB);
	    System.out.println();

	        System.out.println("Secret Data to be shared between A and B where A uses B's public key to unravel "+sharedKeyA);
	    System.out.println();
	     System.out.println("Secret Data to be shared between A and B where B uses A's public key to unravel "+sharedKeyB);
	    System.out.println();

	    String getAValue=sharedKeyA.toString();
	    String getBValue=sharedKeyB.toString();

	    

	  
	}

	//https://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test
	private static boolean miller_rabin_pass(BigInteger a, BigInteger n) {
	    BigInteger n_minus_one = n.subtract(BigInteger.ONE);
	    BigInteger d = n_minus_one;
		int s = d.getLowestSetBit();
		d = d.shiftRight(s);
	    BigInteger a_to_power = a.modPow(d, n);
	    if (a_to_power.equals(BigInteger.ONE)) return true;
	    for (int i = 0; i < s-1; i++) {
	        if (a_to_power.equals(n_minus_one)) return true;
	        a_to_power = a_to_power.multiply(a_to_power).mod(n);
	    }
	    if (a_to_power.equals(n_minus_one)) return true;
	    return false;
	}

	public static boolean miller_rabin(BigInteger n) {
	    for (int repeat = 0; repeat < 20; repeat++) {
	        BigInteger a;
	        do {
	            a = new BigInteger(n.bitLength(), rnd);
	        } while (a.equals(BigInteger.ZERO));
	        if (!miller_rabin_pass(a, n)) {
	            return false;
	        }
	    }
	    return true;
	}

boolean isPrime(BigInteger r){
	return miller_rabin(r);
	// return BN_is_prime_fasttest_ex(r,bitLength)==1;
}

public List<BigInteger> primeFactors(BigInteger number) {
    BigInteger n = number;
	BigInteger i=BigInteger.valueOf(2);
	BigInteger limit=BigInteger.valueOf(10000);// speed hack! -> consequences ???
   	List<BigInteger> factors = new ArrayList<BigInteger>();
   	while (!n.equals(BigInteger.ONE)){
		while (n.mod(i).equals(BigInteger.ZERO)){
        factors.add(i);
		n=n.divide(i);
		// System.out.println(i);
		// System.out.println(n);
		if(isPrime(n)){
			factors.add(n);// yes?
			return factors;
		}
     	}
		i=i.add(BigInteger.ONE);
		if(i.equals(limit))return factors;// hack! -> consequences ???
		// System.out.print(i+"    \r");
	}
		System.out.println(factors);
   return factors;
 }

boolean isPrimeRoot(BigInteger g, BigInteger p)
{
    BigInteger totient = p.subtract(BigInteger.ONE); //p-1 for primes;// factor.phi(p);
    List<BigInteger> factors = primeFactors(totient);
    int i = 0;
    int j = factors.size();
    for(;i < j; i++)
    {
        BigInteger factor = factors.get(i);//elementAt
        BigInteger t = totient.divide( factor);
		if(g.modPow(t, p).equals(BigInteger.ONE))return false;
    }
    return true;
}


BigInteger findPrimeRoot(BigInteger p){
	int start= 2001;// first best probably precalculated by NSA?
	

	for(int i=start;i<100000000;i++)
		if(isPrimeRoot(BigInteger.valueOf(i),p))
			return BigInteger.valueOf(i);
			// if(isPrimeRoot(i,p))return BigInteger.valueOf(i);
	return BigInteger.valueOf(0);
}


BigInteger findPrime(){
	Random rnd=new Random();
	BigInteger p=BigInteger.ZERO;
	// while(!isPrime(p))
	p= new BigInteger(bitLength, certainty, rnd);// sufficiently NSA SAFE?!!
	return p;
		
	
}


}