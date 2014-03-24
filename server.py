from flask import Flask, render_template, request, redirect, url_for, session

app = Flask(__name__)
app.secret_key = 'Zq4oA4Dqq3'

import MySQLdb
import utils

currentUser = ''
game = ""

@app.route('/')
def mainIndex():
  return render_template('index.html')

@app.route('/report')
def report():
  db = utils.db_connect()
  cur = db.cursor(cursorclass=MySQLdb.cursors.DictCursor)
  query = 'select * from games'
  cur.execute(query)
  rows = cur.fetchall()
  return render_template('report.html', games=rows, selectedMenu='Report')


@app.route('/report2', methods=['POST'])
def report2():
  
  firstname = request.form['firstname']
  lastname = request.form['lastname']
  username = request.form['username']
  password = request.form['password']
  school = request.form['school']
  city = request.form['city']
  state = request.form['state']
  game = request.form['game']
  
  #query = "SELECT id from games where title = '" + game + "'"
  #"(SELECT id from users where users.username ='" + username + "' AND users.password ='" + password + "')"
    
  db = utils.db_connect()
  cur = db.cursor(cursorclass=MySQLdb.cursors.DictCursor)

  query = "INSERT INTO users (firstname, lastname, username, password, game) VALUES ('";
  query += request.form['firstname'] + "', '" + request.form['lastname'] + "', '" + username + "', '" + password + "', (SELECT id from games where games.title = '" + game + "'))"
  print query
  cur.execute(query)
  db.commit()
  
  query = "INSERT INTO userInfo (userid, school, city, state) VALUES ((SELECT id from users where users.username ='" + username + "' AND users.password ='" + password + "'),'" + school + "' , '" + city + "', '" + state + "')"   
  print query
  cur.execute(query)
  db.commit()
    
  return redirect(url_for('list'))









@app.route('/thanks', methods=['POST'])
def thanks():
  return render_template('thanks.html', firstname=request.form['firstname'])


@app.route('/info')
def info():
  db = utils.db_connect()
  cur = db.cursor(cursorclass=MySQLdb.cursors.DictCursor)
  query = 'select * from games'
  cur.execute(query)
  rows = cur.fetchall()
  
  return render_template('info.html', games=rows, selectedMenu='Find Gamers')
  
@app.route('/info2', methods=['POST'])
def info2():
  
  firstname = request.form['firstname']
  lastname = request.form['lastname']
  school = request.form['school']
  city = request.form['city']
  state = request.form['state']
  game = request.form['game']
    
  db = utils.db_connect()
  cur = db.cursor(cursorclass=MySQLdb.cursors.DictCursor)

  query = "INSERT INTO users (firstname, lastname, school, city, state, game) VALUES ('";
  query += request.form['firstname'] + "', '" + request.form['lastname'] + "')"
  
  query = "INSERT INTO userInfo (school, city, state) VALUES ('" + school + "' , '" + city + "', '" + state + "')"
    
  print query
  cur.execute(query)
  db.commit()
    
  return redirect(url_for('list'))



@app.route('/games')
def games():
      
  return render_template('games.html', selectedMenu='Info')
  
  
@app.route('/games2', methods=['POST'])
def games2():
  gamename = request.form['gamename']
  rating = request.form['rating']
  
  db = utils.db_connect()
  cur = db.cursor(cursorclass=MySQLdb.cursors.DictCursor)
  
  query = "insert into games (title, rating) VALUES ('" + gamename + "', '" + rating + "')"
  print query
  cur.execute(query)
  db.commit()
    
  return redirect(url_for('info'))
  
  
@app.route('/list')
def list():
  db = utils.db_connect()
  cur = db.cursor(cursorclass=MySQLdb.cursors.DictCursor)
  query = "SELECT * from users WHERE game ='" + game + "'"
  cur.execute(query)
  rows = cur.fetchall()
    
  return render_template('list.html', users=rows, selectedMenu='List')

@app.route('/login', methods=['GET', 'POST'])
def login():
	global currentUser
	global zipcode
	db = utils.db_connect()
	cur = db.cursor(cursorclass=MySQLdb.cursors.DictCursor)
	# if user typed in a post ...
	if request.method == 'POST':
		print "HI"
		session['username'] = MySQLdb.escape_string(request.form['username'])
		currentUser = session['username']
		session['pw'] =  MySQLdb.escape_string(request.form['pw'])
		
		query = "select zipcode from users WHERE username = '%s' AND password = SHA2('%s', 0)" % (session['username'], session['pw'])

		print query
		cur.execute(query)
		r = cur.fetchone()
		session['zipcode'] = r['zipcode']
		zipcode = session['zipcode']
		if cur.fetchone():
			return redirect(url_for('mainIndex'))

	return render_template('login.html', selectedMenu='Login', username = currentUser)

@app.route('/logout', methods=['GET', 'POST'])
def logout():
	global currentUser
	global zipcode
	currentUser = ''
	zipcode = ''
	session.pop('username', None)
	session.pop('zipcode', None)
	session.pop('pw', None)
	
	return redirect(url_for('mainIndex'))


if __name__ == '__main__':
  app.debug=True
  app.run(host='0.0.0.0', port=3000)
