#!/usr/bin/env python

import argparse

def gman_parser():

    #create a main parser
    parser = argparse.ArgumentParser(description="gman parsing")

    # add primary args
    parser.add_argument("message", help="A message for the gman")
    parser.add_argument("--twice", "-t", help="do it twice", action="store_true")
    
    #add a sub praser. The dest is the name of the attribute used to choose a subparser.
    subparsers = parser.add_subparsers(dest="func")

    greetparser = subparsers.add_parser('greetings', help = "greetings pls")
    
    # add an arg to the subparser
    greetparser.add_argument('name',help='mention a name')
    
    # parser.add_argument("--greetme","-g", help="greetings wanted?", default="")

    return parser.parse_args()

def greet(name):
    print(f"Hello {name}")
     

if __name__ == '__main__':
    args = gman_parser()
    print(args.message)

    if args.func == 'greetings':
            greet(args.name)

