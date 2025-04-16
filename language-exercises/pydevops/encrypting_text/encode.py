import hashlib
import sys
import pprint

secret = sys.argv[1]

def encode(secret):
    encoded_secret = secret.encode()
    return encoded_secret

def hashed(secret):
    m = hashlib.sha256()
    m.update(secret)
    return m.hexdigest()

def main():
    encoded_secret = encode(secret)
    hashed_secret = hashed(encoded_secret)
    decoded_secret = encoded_secret.decode()
    pprint.pprint(f"Original Text: {secret}")
    pprint.pprint(f"Encoded Text: {encoded_secret.hex()}")
    pprint.pprint(f"Hashed Version: {hashed_secret}")
    pprint.pprint(f"Decoded Text: {decoded_secret}")

if __name__ == "__main__":
    main()