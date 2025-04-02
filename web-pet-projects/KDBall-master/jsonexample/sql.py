import sqlite3

with sqlite3.connect("chart_data.db") as connection:
	c = connection.cursor()
	c.execute("CREATE TABLE chart_table(name TEXT, test_value INTEGER)")
