## doing basic filesystem based things
import datetime
import pathlib

#Create a file, add stuff to it, then read it, then also delete it.

current_time = print(f"{datetime.datetime.now()}")

file_path = "my_test_file.txt"
full_path = pathlib.Path(file_path)

print(f" the full path of file is {full_path}")

with open(file_path, 'w') as open_file:
    open_file.write(f"{current_time}")

with open(file_path, 'r') as open_file:
    text = open_file.readlines()
    print(text)

#reading a jpeg (binary file)

with open("test.jpg", 'rb') as open_file:
    binary_data = open_file.read()

