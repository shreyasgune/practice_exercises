#!/usr/bin/env python

import argparse

def gman_parser():
    parser = argparse.ArgumentParser(description="gman parsing")

    parser.add_argument("message", help="A message for the gman")
    parser.add_argument("--twice", "-t", help="do it twice", action="store_true")
    
    #sub parser stuff
    # parser.add_subparsers(dest="func")
    # parser.add_argument("--greetme","-g", help="greetings wanted?", default="")

    return parser.parse_args()

def greet(name):
    print(f"Hello {name}")
     

if __name__ == '__main__':
    args = gman_parser()
    print(args.message)

    if args.twice:
            print(args.message)

