import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="student_user",
    password="1234",
    database="student_db",
    port=3306
)

print("Connection successful!")

cursor = conn.cursor()
cursor.execute("SELECT * FROM students")

for row in cursor.fetchall():
    print(row)

conn.close()