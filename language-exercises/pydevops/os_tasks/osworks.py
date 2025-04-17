#!/usr/bin/env python
# the shebang is a good practice. It lets you execute the python file directly.

import os
import sys
import datetime

current_time = print(f"{datetime.datetime.now()}")

with open('test_file.txt', 'w') as open_file:
    open_file.write(f"{current_time}")


# make dir. If you want to make a dir on a particular path, you do os.makedirs
os.mkdir('test_dir')

# list current dir
os.listdir('.')

# rename a file
os.rename('test_dir', 'test_dir_1')

# change perms on the dir
os.chmod('test_dir_1', 0o777)

# get current dir
cur_dir = os.getcwd()
print(cur_dir)

# split the dir
split_dir = os.path.split(cur_dir)
print(split_dir)

# parent path
parent_path = os.path.dirname(cur_dir)
print(parent_path)

#leaf path
leaf_path = os.path.basename(cur_dir)
print(leaf_path)

# does the path exist?
print(os.path.exists(cur_dir))

#expand the path
print(os.path.expandvars(cur_dir))

# Check user home directory
home_dir = os.path.expanduser("~/")
# then join it
full_path = os.path.join(home_dir, 'test_dir_1')
print(full_path)

# python file path itself
print(__file__)

if( len(sys.argv) > 1 and sys.argv[1]== 'rmdir'):
    os.rmdir('test_dir_1')
    #to recursively remove all stuff leaf-wise, os.removedirs()
    # Delete a tree of directories, starting with the leaf directory and
    # working up the tree. The operation stops with the first nonempty directory.
else:
    pass



os.stat('test_file.txt')


#WALK by Pantera
def pantera_walk(the_path):
    print(f"Walking {the_path}")
    for parent_path, dirs, files in os.walk(the_path):
        print(f"Checking {parent_path}")
        for file_name in files:
            file_path = os.path.join(parent_path, file_name)
            last_access = os.path.getatime(file_path)
            size = os.path.getsize(file_path)
            print(f"{file_path}")
            print(f"\t{last_access}")
            print(f"\t{size}")


pantera_walk(home_dir)
# os.stat_result()




