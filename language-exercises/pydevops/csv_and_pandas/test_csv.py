import csv

import pandas as pd

with open('test.csv', 'r') as csv_file:
    csv_reader = csv.reader(csv_file)
    for row in csv_reader:
        # print(row)

# using pandas
df=pd.read_csv('test.csv')
