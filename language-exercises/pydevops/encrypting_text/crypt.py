from cryptography.fernet import Fernet
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.asymmetric import rsa,padding
import base64
import sys

def generate_rsa():
    return rsa.generate_private_key( public_exponent=65537, key_size=4096, backend=default_backend())

def generate_key():
    return Fernet.generate_key()

def encrypt(f,secret):
    return f.encrypt(secret)

def decrypt(f,secret):
    return f.decrypt(secret)
 
def main():
    
    # Create a key
    key = generate_key()
    print(f"Key: {key.decode()}")

    f = Fernet(key)

    secret = sys.argv[1]
    secret_bytes = secret.encode('utf-8')
    encrypted_secret = encrypt(f,secret_bytes)
    decrypted_secret = decrypt(f, encrypted_secret) 
    print(f"Original Text: {secret}")
    print(f"Encrypted Text: {encrypted_secret.decode()}")
    print(f"Decrypted Text: {decrypted_secret.decode()}")

    #RSA Stuff
    private_key = generate_rsa()
    public_key = private_key.public_key()

    rsa_encrypted = public_key.encrypt(secret_bytes,padding.OAEP(mgf=padding.MGF1(algorithm=hashes.SHA256()),algorithm=hashes.SHA256(), label=None))
    rsa_decrypted = private_key.decrypt(rsa_encrypted, padding.OAEP(mgf=padding.MGF1(algorithm=hashes.SHA256()), algorithm=hashes.SHA256(), label=None))

    print(f"RSA Encrypted Text: {base64.b64encode(rsa_encrypted).decode('ascii')}")
    print(f"RSA Decrypted Text: {rsa_decrypted.decode('utf-8')}")

if __name__ == "__main__":
    main()