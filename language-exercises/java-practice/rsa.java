import java.util.*;

public class rsa
{
	public static void main(String args[])
	{
		double message;
		double encrypted;
		double decrypted = 0;

		message = 43;
		encrypted = Math.pow(message,3)%187;
		decrypted = Math.pow(encrypted,107)%187;

		System.out.println("The message is "+message);
		System.out.println("The encrypted message is "+encrypted);
		System.out.println("The decrypted message is "+decrypted);





	}

}