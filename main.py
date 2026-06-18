import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Muluneshshewangizaw@0267",
    database="student_db"
)

cursor = db.cursor()

def add_student(first, last, age):
    sql = "INSERT INTO Students (FirstName, LastName, Age) VALUES (%s, %s, %s)"
    cursor.execute(sql, (first, last, age))
    db.commit()

def view_students():
    cursor.execute("SELECT * FROM Students")
    for row in cursor.fetchall():
        print(row)

def update_student(student_id, age):
    cursor.execute("UPDATE Students SET Age=%s WHERE StudentID=%s", (age, student_id))
    db.commit()

def delete_student(student_id):
    cursor.execute("DELETE FROM Students WHERE StudentID=%s", (student_id,))
    db.commit()

def show_join():
    sql = """
    SELECT Students.FirstName, Students.LastName, Courses.CourseName
    FROM Enrollments
    JOIN Students ON Students.StudentID = Enrollments.StudentID
    JOIN Courses ON Courses.CourseID = Enrollments.CourseID
    """
    cursor.execute(sql)
    for row in cursor.fetchall():
        print(row)

# TEST RUN
add_student("Zelalem", "Eshetu", 25)
view_students()