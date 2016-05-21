from flask import Flask, jsonify, render_template, request, g, redirect, request
import sqlite3, json

app = Flask(__name__)
app.database = "chart_data.db"
entries = ""
def connect_db():
	return sqlite3.connect(app.database)


@app.route('/', methods=['POST'])
def index():
		#getdata()
		g.db = connect_db()
		#g.db.execute('insert into ghosts (title, description) values (?, ?)',[request.form['title'], request.form['description']])
		g.db.execute('insert into chart_table (name,test_value) values ("Shreyas","23")')
		cur = g.db.execute('select * from chart_table')
		entries = [dict(test_value=row[1],name=row[0]) for row in cur.fetchall()]
		g.db.close()
		#print entries

		with open("static\chartson.json","w") as outfile:
			json.dump(
			entries,outfile) #

		return render_template('index.html', entries=entries)



if __name__ == '__main__':
    app.run(debug=True)
