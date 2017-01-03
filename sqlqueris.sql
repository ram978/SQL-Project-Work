//Query 1
select ID, name from student where ID = 113;


//Query 2
select title from course where title like ‘G%’;


//Query 3
SELECT DISTINCT ID 
FROM teaches 
WHERE COURSE_ID NOT IN (SELECT COURSE_ID FROM teaches WHERE SEMESTER='Fall' AND YEAR=2016);

//Query 4

SELECT NUM_ID, DEPT_NAME 
FROM (SELECT COUNT(ID) AS NUM_ID, DEPT_NAME FROM student GROUP BY DEPT_NAME) 
ORDER BY NUM_ID ASC;


//Query 5

WITH count_enrollment AS(SELECT COURSE_ID, SEC_ID, SEMESTER, YEAR, COUNT(ID) 
AS enrollment FROM takes NATURAL JOIN student GROUP BY COURSE_ID, SEC_ID, SEMESTER, YEAR), max_enrollment
AS (SELECT COURSE_ID, SEC_ID, SEMESTER, YEAR, ENROLLMENT FROM count_enrollment WHERE enrollment=(SELECT MAX(enrollment) FROM count_enrollment)) 
SELECT DISTINCT NAME FROM max_enrollment NATURAL JOIN teaches NATURAL JOIN instructor;

//Query 6
/*SELECT DISTINCT ID, DISTINCT NAME, YEAR FROM teaches NATURAL JOIN instructor 
WHERE YEAR IN (SELECT DISTINCT YEAR FROM teaches NATURAL JOIN instructor WHERE NAME = 'McKinnon') and name not in ('McKinnon');
*/
select distinct name FROM teaches NATURAL JOIN instructor WHERE YEAR IN (SELECT DISTINCT YEAR FROM teaches NATURAL JOIN instructor WHERE NAME = 'McKinnon') and name not in ('McKinnon');


//Query 7

with sal(value) as (select salary from instructor order by salary desc),
dept(value2) as (select dept_name from instructor group by dept_name having avg(salary)>=all(select avg(salary) 
from instructor 
group by dept_name))
select salary,name 
from instructor, sal, dept 
where salary = sal.value and dept_name=dept.value2 and rownum<=2;

//Query 8

WITH STUDENT_TAKES AS (SELECT ID, NAME, COURSE_ID, SEMESTER, YEAR, GRADE FROM STUDENT NATURAL JOIN TAKES WHERE 
DEPT_NAME='Comp. Sci.'), STUDENT_TAKES_COURSE AS (SELECT *FROM STUDENT_TAKES NATURAL JOIN COURSE ORDER BY ID, YEAR DESC) SELECT NAME, SEMESTER, YEAR, GRADE, TITLE, CREDITS FROM STUDENT_TAKES_COURSE WHERE ROWNUM<=5;

//Query 9

update instructor set salary = salary+10000 where salary<=50000;

//Query 10

delete from takes where ID in (select ID from student where name ='Tomason');
