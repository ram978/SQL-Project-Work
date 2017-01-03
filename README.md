# SQL-Project-Work
Tables:

course (course_id, title, dept_name, credits)
instructor (ID, name, dept_name, salary)
teaches (ID, course_id, sec_id, semester, year)
student (ID, name, dept_name, tot_cred)
takes (ID, course_id, sec_id, semester, year, grade)


Queries:

1)Find the student's name whose ID = "113".
2)List all courses which title starts with "G".
3)List all instructor IDs who did not teach any courses in Fall 2016.
4)Find the total number of students in each department. Display the number in ascending order.
5)Find the name of instructor who teaches the most students.
6)List all instructors who teach in all those years that the instructor "McKinnon" teaches.
7)For the department where the instructors have the highest average salary, list the top 2 instructors who have the highest salaries and their salaries.
8)Generate "transcript records" for all students of "Comp. Sci." department. A transcript record should include student name, course title, the year and semester when the student took this course, the credits of this course and the grade of the student on this course. The transcript records from one student should be shown together, and in year, semester descending order. Return only 5 of those transcript records.
9)Increase the salary of instructors whose salary <= 50000 by 10000.
10)Delete all the records in table "takes" which students' name = "Tomason".
