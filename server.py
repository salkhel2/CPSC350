from flask import Flask, render_template, request, redirect, url_for
app = Flask(__name__)
import MySQLdb
import utils

game = ""

@app.route('/')
def mainIndex():
  return render_template('index.html')

@app.route('/report')
def report():
  return render_template('report.html')
  return render_template('report.html', selectedMenu='Report')


@app.route('/thanks', methods=['POST'])
def thanks():
  return render_template('thanks.html', firstname=request.form['firstname'])


@app.route('/info')
def info():
  return render_template('info.html', selectedMenu='Find Gamers')
  
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
  
  return redirect(url_for('list'))
  
  
@app.route('/list')
def list():
  db = utils.db_connect()
  cur = db.cursor(cursorclass=MySQLdb.cursors.DictCursor)
  query = "SELECT * from users WHERE game ='" + game + "'"
  cur.execute(query)
  rows = cur.fetchall()
    
  return render_template('list.html', users=rows, selectedMenu='List')


if __name__ == '__main__':
  app.debug=True
  app.run(host='0.0.0.0', port=3000)
