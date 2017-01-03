create table course
(course_id varchar (8),
title varchar (50),
dept_name varchar (20),
credits numeric (2,0) check (credits > 0),
primary key (course_id));

create table instructor
(ID varchar (5),
name varchar (20) not null,
dept_name varchar (20),
salary numeric (8,2) check (salary > 29000),
primary key (ID));

create table student
(ID varchar (5),
name varchar (20) not null,
dept_name varchar (20),
tot_cred numeric (3,0) check (tot_cred >= 0),
primary key (ID));

create table takes
(ID varchar(5),
course_id varchar(8),
sec_id varchar(8),
semester varchar(6),
year numeric(4,0),
grade varchar(2),
primary key (ID, course_id, sec_id, semester, year), 
foreign key (ID) references student on delete cascade);

create table teaches
(ID varchar (5),
course_id varchar (8),
sec_id varchar (8),
semester varchar (6),
year numeric (4,0),
primary key (ID, course_id, sec_id, semester, year), 
foreign key (ID) references instructor on delete cascade);
