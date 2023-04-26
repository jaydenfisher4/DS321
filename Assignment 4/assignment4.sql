-- SQL Script for Assignment 4

-- Creating database with full name

CREATE DATABASE d321dvgassignment4;


-- Connecting to database 
\c d321dvgassignment4


-- Domains

CREATE TABLE P(p text);
CREATE TABLE C(c text);
CREATE TABLE M(m text);

INSERT INTO P VALUES
 ('Emma'),
 ('Eric'),
 ('Vidya'),
 ('Anna'),
 ('YinYue'),
 ('Latha'),
 ('Qin'),
 ('Ryan'),
 ('Deepa'),
 ('Hasan'),
 ('Linda'),
 ('Chris'),
 ('Lisa'),
 ('Nick'),
 ('Arif'),
 ('Megan'),
 ('Margaret'),
 ('Jean'),
 ('John'),
 ('Danielle');

INSERT INTO C VALUES
 ('AI'),
 ('DataScience'),
 ('Algorithms'),
 ('Complexity'),
 ('Networks'),
 ('Databases'),
 ('Logic'),
 ('Programming'),
 ('Physics'),
 ('D321');

INSERT INTO M VALUES
 ('DataScience'),
 ('Math'),
 ('English'),
 ('Physics'),
 ('CS'),
 ('Chemistry'),
 ('Philosophy');

-- Unary Predicates

CREATE TABLE Professor(p text);
CREATE TABLE Student(p text);


INSERT INTO Professor VALUES
 ('Jean'),
 ('Arif'),
 ('Eric'),
 ('Pedro'),
 ('Emma'),
 ('Anna');


INSERT INTO Student VALUES
 ('YinYue'),
 ('Lisa'),
 ('Margaret'),
 ('Hasan'),
 ('Deepa'),
 ('Megan'),
 ('Chris'),
 ('Linda'),
 ('Latha'),
 ('Nick'),
 ('Vidya'),
 ('Danielle'),
 ('Qin'),
 ('Ryan'),
 ('John');

-- Binary Predicates

CREATE TABLE Enroll (p text,
                     c text);

CREATE TABLE Teaches (p text,
                      c text);

CREATE TABLE hasMajor (p text,
                       m text);


CREATE TABLE Knows(p1 text,
                   p2 text);


INSERT INTO Enroll VALUES 
 ('Nick','Logic'),
 ('Hasan','Logic'),
 ('Eric','Complexity'),
 ('Vidya','DataScience'),
 ('Jean','Physics'),
 ('Deepa','Complexity'),
 ('Megan','AI'),
 ('Vidya','AI'),
 ('Hasan','Databases'),
 ('Deepa','D321'),
 ('Deepa','D321'),
 ('Anna','Physics'),
 ('Danielle','D321'),
 ('Emma','Complexity'),
 ('Hasan','Physics'),
 ('Nick','Programming'),
 ('Jean','AI'),
 ('Anna','D321'),
 ('John','Logic'),
 ('Jean','Logic'),
 ('Lisa','Physics'),
 ('Jean','DataScience'),
 ('Hasan','Networks'),
 ('Jean','Complexity'),
 ('YinYue','AI'),
 ('John','AI'),
 ('Chris','DataScience'),
 ('Margaret','Logic'),
 ('Latha','Physics'),
 ('Jean','Networks'),
 ('Qin','Complexity'),
 ('Latha','Logic'),
 ('Deepa','Physics'),
 ('Linda','Networks'),
 ('Anna','Databases'),
 ('Margaret','AI'),
 ('Linda','Logic'),
 ('Jean','Programming'),
 ('Qin','Networks'),
 ('Eric','Logic'),
 ('Ryan','DataScience'),
 ('Latha','Networks'),
 ('Deepa','Programming'),
 ('Nick','DataScience'),
 ('Ryan','D321'),
 ('Anna','DataScience'),
 ('Latha','D321'),
 ('Chris','Programming'),
 ('Vidya','Complexity'),
 ('Arif','Programming'),
 ('Emma','Programming'),
 ('Margaret','Complexity'),
 ('Eric','D321'),          
 ('Margaret','Algorithms'),
 ('Hasan', 'Algorithms'),
 ('Hasan', 'AI');

INSERT INTO Teaches VALUES
 ('Jean','Databases'),
 ('Emma','Networks'),
 ('Eric','Databases'),
 ('Eric','D321'),
 ('Emma','Algorithms'),
 ('Pedro','AI'),
 ('Emma','Complexity'),
 ('Anna','Complexity'),
 ('Jean','Logic'),
 ('Arif','Networks'),
 ('Emma','Logic'),
 ('Anna','AI'),
 ('Eric','Logic'),
 ('Anna','D321'),
 ('Eric','AI'),
 ('Emma','Physics'),
 ('Eric','Networks'),
 ('Emma','DataScience'),
 ('Jean','D321');


INSERT INTO hasMajor VALUES
('Qin','Chemistry'),
 ('Danielle','Chemistry'),
 ('Megan','Chemistry'),
 ('John','Chemistry'),
 ('Lisa','English'),
 ('YinYue','Physics'),
 ('Margaret','English'),
 ('Latha','Math'),
 ('Deepa','English'),
 ('Nick','Chemistry'),
 ('Hasan','English'),
 ('Megan','DataScience'),
 ('John','English'),
 ('Danielle','Physics'),
 ('Latha','Chemistry'),
 ('Danielle','Math'),  
 ('Hasan','DataScience'),
 ('Margaret','Physics');



INSERT INTO Knows VALUES
 ('Jean','Megan'),
 ('Nick','Megan'),
 ('Margaret','Lisa'),
 ('Danielle','YinYue'),
 ('Eric','Megan'),
 ('Nick','Margaret'),
 ('Lisa','John'),
 ('Qin','Chris'),
 ('Vidya','Margaret'),
 ('Ryan','Emma'),
 ('Latha','Emma'),
 ('Hasan','Vidya'),
 ('Vidya','Anna'),
 ('Anna','Deepa'),
 ('Emma','Jean'),
 ('Deepa','Qin'),
 ('Megan','Deepa'),
 ('Danielle','Hasan'),
 ('Vidya','Latha'),
 ('Lisa','YinYue'),
 ('Anna','Linda'),
 ('Emma','Linda'),
 ('Hasan','Danielle'),
 ('Chris','Eric'),
 ('Ryan','Eric'),
 ('Qin','Qin'),
 ('YinYue','Emma'),
 ('Ryan','Hasan'),
 ('Megan','Eric'),
 ('Deepa','Linda'),
 ('Qin','YinYue'),
 ('Vidya','YinYue'),
 ('Eric','Qin'),
 ('Lisa','Jean'),
 ('Danielle','Nick'),
 ('Eric','Ryan'),
 ('Linda','John'),
 ('Lisa','Margaret'),
 ('Qin','Nick'),
 ('Ryan','Linda'),
 ('Chris','Lisa'),
 ('Chris','Anna'),
 ('Anna','Lisa'),
 ('Arif','Arif'),
 ('Nick','Qin'),
 ('Arif','Latha'),
 ('Margaret','Latha'),
 ('Anna','Arif'),
 ('Megan','Margaret'),
 ('Deepa','Hasan'),
 ('Arif','YinYue');


-- Boolean functions for unary predicates Student(p) and Professor(p)

create or replace function Student(p text) 
returns boolean as
$$
select p in (select * from Student);
$$ language sql;


create or replace function Professor(p text) 
returns boolean as
$$
select p in (select * from Professor);
$$ language sql;


-- Boolean functions for binary predicates Enroll(p,c), Teaches (p,c),
-- hasMajor(p,m), and Knows(p_1,p_2)


create or replace function Enroll(p text, c text)

returns boolean as
$$
select (p,c) in (select * from Enroll);
$$ language sql;



create or replace function Teaches(p text, c text)
returns boolean as
$$
select (p,c) in (select * from Teaches);
$$ language sql;



create or replace function hasMajor(p text, m text)
returns boolean as
$$
select (p,m) in (select * from hasMajor);
$$ language sql;



create or replace function Knows(p1 text, p2 text)
returns boolean as
$$
select (p1,p2) in (select * from Knows);
$$ language sql;


create or replace function Implies(P boolean, Q boolean)
returns boolean as
$$
select not P or Q;
$$ language sql;


create or replace function Iff(P boolean, Q boolean)
returns boolean as
$$
select (P and Q) or (not P and not Q);
$$ language sql;


\qecho 'Problem 5.a'
-- Some student knows a professor who teaches the ‘Databases’ course.

-- Your SQL code for this problem must go here
SELECT DISTINCT p1.*
FROM P p1, P p2, C c
WHERE student(p1.P) AND professor(p2.P) AND knows(p1.P, p2.P) AND teaches(p2.P, c) AND c = 'Databases'

\qecho 'Problem 6.a'
-- Each course taught by professor ‘Anna’ is taken by at least two
-- students.

-- Your SQL code for this problem must go here
SELECT c.*
FROM C c, P p1, P p2
WHERE teaches('Anna', c) AND professor('Anna')
AND EXISTS (
SELECT 1
FROM P p1, P p2
WHERE p1 <> p2 AND student(p1.P) AND student(p2.P) AND enroll(p1.P, c) AND enroll(p2.P, c)
)


\qecho 'Problem 7.a'
-- Find the majors of students who are enrolled in the course `Algorithms'

-- Your SQL code for this problem must go here
SELECT m.*
FROM M m, P p
WHERE hasMajor(p, m) AND EXISTS (
SELECT 1
FROM C c
WHERE c = 'Algorithms' AND enroll(p, c)
)




\qecho 'Problem 8.a'
-- Find each student who knows a student who takes a course taught by
-- professor ‘Emma’ or a course taught by professor ‘Arif' or by Professor 'Anna'.

-- Your SQL code for this problem must go here
SELECT DISTINCT p1.*
FROM P p1, P p2, C c
WHERE knows(p1.P, p2.P) AND (
(teaches('Emma', c) AND professor('Emma') AND enroll(p2.P, c))
OR (teaches('Arif', c) AND professor('Arif') AND enroll(p2.P, c))
OR (teaches('Anna', c) AND professor('Anna') AND enroll(p2.P, c))
)


\qecho 'Problem 9.a'
-- Find each pair of different students who both know a same professor
-- who teaches the course ‘Databases’

-- Your SQL code for this problem must go here
SELECT DISTINCT p1.P, p2.P
FROM P p1, P p2, P professor
WHERE p1 <> p2 AND knows(p1.P, professor.P) AND knows(p2.P, professor.P) AND teaches(professor.P, 'Databases')



\qecho 'Problem 10.a'
-- Find each professor who only teaches courses taken by all students
-- who major in `DataScience'

-- Your SQL code for this problem must go here
SELECT DISTINCT p.*
FROM P p, C c
WHERE professor(p) AND teaches(p, c) AND c IN (
SELECT c.*
FROM C c
WHERE EXISTS (
SELECT 1
FROM P p1
WHERE hasMajor(p1.P, 'DataScience') AND NOT EXISTS (
SELECT 1
FROM C c2
WHERE c2.C = c AND NOT EXISTS (
SELECT 1
FROM P p2
WHERE enroll(p2.P, c2.C) AND hasMajor(p2.P, 'DataScience')
)
)
)
)


\qecho 'Problem 11.a'
-- Find each professor who does not know any student who majors in
-- both ‘DataScience’ and in ‘Chemistry'

-- Your SQL code for this problem must go here
SELECT DISTINCT p.*
FROM P p3
WHERE professor(p3.P) AND NOT EXISTS (
SELECT 1
FROM P p1, P p2, C c
WHERE p1 <> p2 AND hasMajor(p1.P, 'DataScience') AND hasMajor(p2.P, 'Chemistry')
AND enroll(p1.P, c) AND enroll(p2.P, c) AND knows(p3.P, p1.P) AND knows(p3.P, p2.P)
)


\qecho 'Problem 12.a'

-- Find each pair of different students who have a common major and who
-- take none of the courses taught by professor `Pedro'

-- Your SQL code for this problem must go here
SELECT DISTINCT p1.P, p2.P
FROM P p1, P p2, M m
WHERE p1 <> p2 AND hasMajor(p1.P, m) AND hasMajor(p2.P, m)
AND NOT EXISTS (
SELECT 1
FROM C c, P p3
WHERE teaches('Pedro', c) AND teaches(p3.P, c) AND (enroll(p1.P, c) OR enroll(p2.P, c))
)

-- !!!!!!!!!!!!!!!!!
-- KEEP the statement below in your submission.
-- We need to grade your assignment and want to need upload in our database
-- your database!!!!!!!!

\c postgres


DROP DATABASE d321dvgassignment4;


