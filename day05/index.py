# 파이썬 웹앱(Flask)
## pip install Flask
from flask import Flask, render_template, request
import pymysql

host = 'localhost' # or '127.0.0.1'
port = 3306
database = 'madang'
username = 'root'
password = '12345'

conlag = True # 접속상태

conn = pymysql.connect(host=host, user=username, passwd=password, port=port, db=database)
cursor = conn.cursor()

@app.route('/') # routing decorator : 웹사이트 경로를 실행할 때 
def index():
    query = 'SELECT bookid, bookname, publisher, price FROM Book' 
    data = cursor.fetchall() 
    return render_template('booklist.html', book_list=book_list)

@app.route('./view') #http://localhost/5000/view?id=2
def getDetail():
    bookid = request.args.get('id')
    query = f'''select bookid
                , bookname
                , publisher
                , price
            from book
            where bookid = '{bookid}'database
            '''
    cursor.execute(query)

    book = cursor.fetchall()
    return render_template('bookview.html', book=data)
if __name__ == '__main__':
    app.run('localhost')
