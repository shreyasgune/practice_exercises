import java.math.BigInteger;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.SecureRandom;

import javax.crypto.spec.DHParameterSpec;
import javax.crypto.spec.DHPublicKeySpec;

public class diffH {
  public final static int pValue = 47;

  public final static int gValue = 71;

  public final static int XaValue = 9;

  public final static int XbValue = 14;

   

  public static void main(String[] args) throws Exception {
    BigInteger p = new BigInteger(Integer.toString(pValue));
    BigInteger g = new BigInteger(Integer.toString(gValue));
    BigInteger Xa = new BigInteger(Integer.toString(XaValue));
    BigInteger Xb = new BigInteger(Integer.toString(XbValue));
    System.out.println("pValue : "+pValue+"  "+"gValue : "+gValue+"XaValue : "+XaValue+"  "+"XbValue : "+XbValue);
    
    System.out.println("p : "+p+"  "+"g : "+g+"Xa : "+Xa+"  "+"Xb : "+Xb);


    createKey();
   

    int bitLength = 512; // 512 bits
    SecureRandom rnd = new SecureRandom();
    System.out.println("random number :"+rnd);
    p = BigInteger.probablePrime(bitLength, rnd);
    System.out.println("new p"+p);
    g = BigInteger.probablePrime(bitLength, rnd);
    System.out.println("new g"+g);
    createSpecificKey(p, g);
    
  }

  public static void createKey() throws Exception {
    KeyPairGenerator kpg = KeyPairGenerator.getInstance("DiffieHellman");

    kpg.initialize(512);
    KeyPair kp = kpg.generateKeyPair();
    KeyFactory kfactory = KeyFactory.getInstance("DiffieHellman");

    DHPublicKeySpec kspec = (DHPublicKeySpec) kfactory.getKeySpec(kp.getPublic(),
        DHPublicKeySpec.class);

  }

  public static void createSpecificKey(BigInteger p, BigInteger g) throws Exception {
    KeyPairGenerator kpg = KeyPairGenerator.getInstance("DiffieHellman");

    DHParameterSpec param = new DHParameterSpec(p, g);
    kpg.initialize(param);
    KeyPair kp = kpg.generateKeyPair();

    KeyFactory kfactory = KeyFactory.getInstance("DiffieHellman");

    DHPublicKeySpec kspec = (DHPublicKeySpec) kfactory.getKeySpec(kp.getPublic(),
        DHPublicKeySpec.class);
    
  }
}