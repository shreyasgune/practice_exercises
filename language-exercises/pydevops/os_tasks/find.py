#!/usr/bin/env python

#The pathlib library represents paths as objects rather than strings.

import os
import sys
import pathlib

def find_file(file_name):
    
    current_dir = pathlib.Path.cwd()
    print(f"Pathlib Object: {pathlib.Path(current_dir)}")
    dir_path = pathlib.Path(file_name)
    print(f"{current_dir}\n{dir_path}")
    #return the full path as string
    full_path = current_dir/file_name
    return full_path.as_posix()


def main():
    find_file(sys.argv[1])

if __name__ == "__main__":
    print(main())