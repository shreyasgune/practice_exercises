#!/usr/bin/env python

import os
import sys
import subprocess

def os_deets():
    print(f"Byte Order is: {(sys.byteorder)}")
    print(f"Platform is: {(sys.platform)}")
    print(f"Major Version: {sys.version_info.major} \nMinor Version: {(sys.version_info.minor)}")

def run_process(cmd):
    return subprocess.run([cmd, '.'], capture_output=True, universal_newlines=True)


def main():
    os_deets()
    cp = run_process('ls')
    print(f"STD OUT: {cp.stdout}")
    print(f"STD ERR: {cp.stderr}")
    print(f"RETURN CODE: {cp.returncode}")
    


if __name__ == "__main__":
    main()