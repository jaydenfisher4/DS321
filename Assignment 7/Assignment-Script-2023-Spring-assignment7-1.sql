CREATE DATABASE assignment7;

-- Connecting to database 
\c assignment7;

-- Relation schemas and instances for assignment 7




CREATE TABLE Student(sid integer,
                     sname text,
                     homeCity text,
                     primary key (sid));

CREATE TABLE Department(deptName text,
                        mainOffice text,
                        primary key (deptName));

CREATE TABLE Major(major text,
                   primary key (major));


CREATE TABLE employedBy(sid integer,
                        deptName text,
                        salary integer,
                        primary key (sid),
                        foreign key (sid) references Student (sid));


CREATE TABLE departmentLocation(deptName text,
                                building text,
                                primary key (deptName, building),
                                foreign key (deptName) references Department (deptName));


CREATE TABLE studentMajor(sid integer,
                          major text,
                          primary key (sid, major),
                          foreign key (sid) references Student (sid),
                          foreign key (major) references Major (major));


CREATE TABLE hasFriend(sid1 integer,
                       sid2 integer,
                       primary key(sid1,sid2),
                       foreign key (sid1) references Student (sid),
                       foreign key (sid2) references Student (sid));


INSERT INTO Student VALUES
     (1001,'Jean','Cupertino'),
     (1002,'Vidya', 'Cupertino'),
     (1003,'Anna', 'Seattle'),
     (1004,'Qin', 'Seattle'),
     (1005,'Megan', 'MountainView'),
     (1006,'Ryan', 'Chicago'),
     (1007,'Danielle','LosGatos'),
     (1008,'Emma', 'Bloomington'),
     (1009,'Hasan', 'Bloomington'),
     (1010,'Linda', 'Chicago'),
     (1011,'Nick', 'MountainView'),
     (1012,'Eric', 'Cupertino'),
     (1013,'Lisa', 'Indianapolis'), 
     (1014,'Deepa', 'Bloomington'), 
     (1015,'Chris', 'Denver'),
     (1016,'YinYue', 'Chicago'),
     (1017,'Latha', 'LosGatos'),
     (1018,'Arif', 'Bloomington'),
     (1019,'John', 'NewYork');


INSERT INTO Department VALUES
     ('CS', 'LuddyHall'),
     ('DataScience', 'LuddyHall'),
     ('Mathematics', 'RawlesHall'),
     ('Physics', 'SwainHall'),
     ('Biology', 'JordanHall'),
     ('Chemistry', 'ChemistryBuilding'),
     ('Astronomy', 'SwainHall');


INSERT INTO employedBy VALUES
     (1001,'CS', 65000),
     (1002,'CS', 45000),
     (1003,'DataScience', 55000),
     (1004,'DataScience', 55000),
     (1005,'Mathematics', 60000),
     (1006,'DataScience', 55000),
     (1007,'Physics', 50000),
     (1008,'DataScience', 50000),
     (1009,'CS',60000),
     (1010,'DataScience', 55000),
     (1011,'Mathematics', 70000), 
     (1012,'CS', 50000),
     (1013,'Physics', 55000),
     (1014,'CS', 50000), 
     (1015,'DataScience', 60000),
     (1016,'DataScience', 55000),
     (1017,'Physics', 60000),
     (1018,'CS', 50000),
     (1019,'Biology', 50000);

INSERT INTO departmentLocation VALUES
   ('CS', 'LindleyHall'),
   ('DataScience', 'LuddyHall'),
   ('DataScience', 'Kinsey'),
   ('DataScience', 'WellsLibrary'),
   ('Mathematics', 'RawlesHall'),
   ('Physics', 'SwainHall'),
   ('Physics', 'ChemistryBuilding'),
   ('Biology', 'JordanHall'),
   ('CS', 'LuddyHall'),
   ('Mathematics', 'SwainHall'),
   ('Physics', 'RawlesHall'),
   ('Biology', 'MultiDisciplinaryBuilding'),
   ('Chemistry', 'ChemistryBuilding');

INSERT INTO Major VALUES
   ('CS'),
   ('DataScience'),
   ('Physics'),
   ('Chemistry'),
   ('Biology');

INSERT INTO studentMajor VALUES
 (1001,'CS'),
 (1001,'DataScience'),
 (1002,'CS'),
 (1002,'DataScience'),
 (1004,'DataScience'),
 (1004,'CS'),
 (1005,'DataScience'),
 (1005,'CS'),
 (1005,'Physics'),
 (1006,'CS'),
 (1006,'Chemistry'),
 (1007,'Chemistry'),
 (1007,'CS'),
 (1009,'Chemistry'),
 (1009,'Physics'),
 (1010,'Physics'),
 (1011,'Physics'),
 (1011,'Chemistry'),
 (1011,'DataScience'),
 (1011,'CS'),
 (1012,'DataScience'),
 (1012,'Chemistry'),
 (1012,'CS'),
 (1013,'CS'),
 (1013,'DataScience'),
 (1013,'Chemistry'),
 (1013,'Physics'),
 (1014,'Chemistry'),
 (1014,'DataScience'),
 (1014,'Physics'),
 (1015,'CS'),
 (1015,'DataScience'),
 (1016,'Chemistry'),
 (1016,'DataScience'),
 (1017,'Physics'),
 (1017,'CS'),
 (1018,'DataScience'),
 (1019,'Physics');

INSERT INTO hasFriend VALUES
 (1001,1008),
 (1001,1012),
 (1001,1014),
 (1001,1019),
 (1002,1001),
 (1002,1002),
 (1002,1011),
 (1002,1014),
 (1002,1015),
 (1003,1004),
 (1004,1002),
 (1004,1003),
 (1004,1012),
 (1004,1013),
 (1004,1014),
 (1004,1019),
 (1005,1015),
 (1006,1003),
 (1006,1004),
 (1006,1006),
 (1007,1008),
 (1007,1013),
 (1007,1016),
 (1007,1017),
 (1008,1001),
 (1008,1007),
 (1008,1015),
 (1008,1019),
 (1009,1001),
 (1009,1005),
 (1009,1013),
 (1010,1008),
 (1010,1013),
 (1010,1014),
 (1011,1005),
 (1011,1009),
 (1011,1010),
 (1011,1011),
 (1012,1011),
 (1013,1002),
 (1013,1007),
 (1013,1018),
 (1014,1005),
 (1014,1006),
 (1014,1012),
 (1014,1017),
 (1015,1002),
 (1015,1003),
 (1015,1005),
 (1015,1011),
 (1015,1015),
 (1015,1018),
 (1016,1004),
 (1016,1006),
 (1016,1015),
 (1017,1013),
 (1017,1014),
 (1017,1019),
 (1018,1004),
 (1018,1007),
 (1018,1009),
 (1018,1010),
 (1018,1013),
 (1019,1001),
 (1019,1006),
 (1019,1008),
 (1019,1013);


\qecho 'Problem 1'
-- Find the sid, sname of each student who (a) has home homeCity Bloomington, (b)
-- works for a department where he or she earns a salary that is higher than
-- 20000, and (c) has at least one friend.
SELECT Student.sid, Student.sname
FROM Student
JOIN employedBy ON Student.sid = employedBy.sid
JOIN hasFriend ON Student.sid = hasFriend.sid1
WHERE Student.homecity = 'Bloomington' AND employedBy.salary > 20000


\qecho 'Problem 2'
-- Find the pairs $(d_1, d_2)$ of names of different departments whose main offices
-- are located in the same building.
SELECT DISTINCT d1.deptName, d2.deptName
FROM Department d1, Department d2, departmentLocation dl1, departmentLocation dl2
WHERE d1.deptName <> d2.deptName AND dl1.deptName = d1.deptName AND dl2.deptName = d2.deptName AND dl1.building = dl2.building

\qecho 'Problem 3'
-- Find the sid and sname of each student whose home homeCity
-- different than those of his or her friends.
SELECT Student.sid, Student.sname
FROM Student
JOIN hasFriend ON Student.sid = hasFriend.sid1
WHERE Student.homecity NOT IN (SELECT homecity FROM Student WHERE sid = hasFriend.sid2)

\qecho 'Problem 4'
-- Find each major that is the major of at most 2 students.
SELECT major
FROM studentMajor
GROUP BY major
HAVING COUNT(sid) <= 2

\qecho 'Problem 5'
-- Find the sid, sname, and salary of each student who has at least two
-- friends such that these friends have a common major but provided that
-- it is not the ‘Mathematics’ major.
SELECT s.sid, s.sname, e.salary
FROM Student s
JOIN employedBy e ON s.sid = e.sid
JOIN hasFriend f1 ON s.sid = f1.sid1
JOIN hasFriend f2 ON f1.sid2 = f2.sid2 AND f1.sid1 < f2.sid1
JOIN studentMajor sm1 ON s.sid = sm1.sid
JOIN studentMajor sm2 ON f2.sid1 = sm2.sid AND sm1.major = sm2.major
WHERE sm1.major != 'Mathematics'
GROUP BY s.sid, s.sname, e.salary
HAVING COUNT(DISTINCT f1.sid2) >= 2;

\qecho 'Problem 6'
-- Find the deptName of each department that not only employs students
-- whose home homeCity is Indianapolis.  (In other words, there exists at
-- least one student who is employed by such a department whose home homeCity
-- is not Indianapolis.)
SELECT DISTINCT d.deptName
FROM Department d
JOIN employedBy e ON d.deptName = e.deptName
JOIN Student s ON e.sid = s.sid AND s.homecity <> 'Indianapolis';

\qecho 'Problem 7'
-- For each department, list its name along with the highest salary made
-- by students who are employed by it.
SELECT d.deptName, MAX(e.salary)
FROM Department d
JOIN employedBy e ON d.deptName = e.deptName
GROUP BY d.deptName;


\qecho 'Problem 8'
-- Find the sid and sname of each student $s$ who is employed by a
-- department $d$ and who has a salary that is strictly higher than the
-- salary of each of his friends who is employed by that department $d$.
SELECT s.sid, s.sname
FROM Student s
JOIN employedBy e ON s.sid = e.sid
JOIN hasFriend f ON s.sid = f.sid1 AND e.deptName = (SELECT e1.deptName FROM employedBy e1 WHERE e1.sid = f.sid2)
WHERE e.salary > ALL (SELECT e2.salary FROM employedBy e2 WHERE e2.sid = f.sid2 AND e2.deptName = e.deptName);

-- Object-Relational queries

-- Relation schemas and instances for object-relational database queries

CREATE TABLE Person(pid integer,
                    pname text,
                    city text,
                    primary key (pid));

CREATE TABLE Company(cname text,
                     headquarter text,
                     primary key (cname));

CREATE TABLE Skill(skill text,
                   primary key (skill));


CREATE TABLE worksFor(pid integer,
                      cname text,
                      salary integer,
                      primary key (pid),
                      foreign key (pid) references Person (pid),
                      foreign key (cname) references Company(cname));


CREATE TABLE companyLocation(cname text,
                             city text,
                             primary key (cname, city),
                             foreign key (cname) references Company (cname));


CREATE TABLE personSkill(pid integer,
                         skill text,
                         primary key (pid, skill),
                         foreign key (pid) references Person (pid) on delete cascade,
                         foreign key (skill) references Skill (skill) on delete cascade);


CREATE TABLE Knows(pid1 integer,
                   pid2 integer,
                   primary key(pid1, pid2),
                   foreign key (pid1) references Person (pid),
                   foreign key (pid2) references Person (pid));



INSERT INTO Person VALUES
     (1001,'Jean','Cupertino'),
     (1002,'Vidya', 'Cupertino'),
     (1003,'Anna', 'Seattle'),
     (1004,'Qin', 'Seattle'),
     (1005,'Megan', 'MountainView'),
     (1006,'Ryan', 'Chicago'),
     (1007,'Danielle','LosGatos'),
     (1008,'Emma', 'Bloomington'),
     (1009,'Hasan', 'Bloomington'),
     (1010,'Linda', 'Chicago'),
     (1011,'Nick', 'MountainView'),
     (1012,'Eric', 'Cupertino'),
     (1013,'Lisa', 'Indianapolis'),
     (1014,'Deepa', 'Bloomington'),
     (1015,'Chris', 'Denver'),
     (1016,'YinYue', 'Chicago'),
     (1017,'Latha', 'LosGatos'),
     (1018,'Arif', 'Bloomington'),
     (1019,'John', 'NewYork');

INSERT INTO Company VALUES
     ('Apple', 'Cupertino'),
     ('Amazon', 'Seattle'),
     ('Google', 'MountainView'),
     ('Netflix', 'LosGatos'),
     ('Microsoft', 'Redmond'),
     ('IBM', 'NewYork'),
     ('ACM', 'NewYork'),
     ('Yahoo', 'Sunnyvale');


INSERT INTO worksFor VALUES
     (1001,'Apple', 65000),
     (1002,'Apple', 45000),
     (1003,'Amazon', 55000),
     (1004,'Amazon', 55000),
     (1005,'Google', 60000),
     (1006,'Amazon', 55000),
     (1007,'Netflix', 50000),
     (1008,'Amazon', 50000),
     (1009,'Apple',60000),
     (1010,'Amazon', 55000),
     (1011,'Google', 70000),
     (1012,'Apple', 50000),
     (1013,'Yahoo', 55000),
     (1014,'Apple', 50000),
     (1015,'Amazon', 60000),
     (1016,'Amazon', 55000),
     (1017,'Netflix', 60000),
     (1018,'Apple', 50000),
     (1019,'Microsoft', 50000);

INSERT INTO companyLocation VALUES
   ('Apple', 'Bloomington'),
   ('Amazon', 'Chicago'),
   ('Amazon', 'Denver'),
   ('Amazon', 'Columbus'),
   ('Google', 'NewYork'),
   ('Netflix', 'Indianapolis'),
   ('Netflix', 'Chicago'),
   ('Microsoft', 'Bloomington'),
   ('Apple', 'Cupertino'),
   ('Amazon', 'Seattle'),
   ('Google', 'MountainView'),
   ('Netflix', 'LosGatos'),
   ('Microsoft', 'Redmond'),
   ('IBM', 'NewYork'),
   ('Yahoo', 'Sunnyvale');

INSERT INTO Skill VALUES
   ('Programming'),
   ('AI'),
   ('Networks'),
   ('OperatingSystems'),
   ('Databases');

INSERT INTO personSkill VALUES
 (1001,'Programming'),
 (1001,'AI'),
 (1002,'Programming'),
 (1002,'AI'),
 (1004,'AI'),
 (1004,'Programming'),
 (1005,'AI'),
 (1005,'Programming'),
 (1005,'Networks'),
 (1006,'Programming'),
 (1006,'OperatingSystems'),
 (1007,'OperatingSystems'),
 (1007,'Programming'),
 (1009,'OperatingSystems'),
 (1009,'Networks'),
 (1010,'Networks'),
 (1011,'Networks'),
 (1011,'OperatingSystems'),
 (1011,'AI'),
 (1011,'Programming'),
 (1012,'AI'),
 (1012,'OperatingSystems'),
 (1012,'Programming'),
 (1013,'Programming'),
 (1013,'OperatingSystems'),
 (1013,'Networks'),
 (1014,'OperatingSystems'),
 (1014,'AI'),
 (1014,'Networks'),
 (1015,'Programming'),
 (1015,'AI'),
 (1016,'OperatingSystems'),
 (1016,'AI'),
 (1017,'Networks'),
 (1017,'Programming'),
 (1018,'AI'),
 (1019,'Networks'),
 (1010,'Databases'),
 (1011,'Databases'),
 (1013,'Databases'),
 (1014,'Databases'),
 (1017,'Databases'),
 (1019,'Databases'),
 (1005,'Databases'),
 (1006,'AI'),
 (1009,'Databases');


INSERT INTO Knows VALUES
 (1011,1009),
 (1007,1016),
 (1011,1010),
 (1003,1004),
 (1006,1004),
 (1002,1014),
 (1009,1005),
 (1018,1009),
 (1007,1017),
 (1017,1019),
 (1019,1013),
 (1016,1015),
 (1001,1012),
 (1015,1011),
 (1019,1006),
 (1013,1002),
 (1018,1004),
 (1013,1007),
 (1014,1006),
 (1004,1014),
 (1001,1014),
 (1010,1013),
 (1010,1014),
 (1004,1019),
 (1018,1007),
 (1014,1005),
 (1015,1018),
 (1014,1017),
 (1013,1018),
 (1007,1008),
 (1005,1015),
 (1017,1014),
 (1015,1002),
 (1018,1013),
 (1018,1010),
 (1001,1008),
 (1012,1011),
 (1002,1015),
 (1007,1013),
 (1008,1007),
 (1004,1002),
 (1015,1005),
 (1009,1013),
 (1004,1012),
 (1002,1011),
 (1004,1013),
 (1008,1001),
 (1008,1019),
 (1019,1008),
 (1001,1019),
 (1019,1001),
 (1004,1003),
 (1006,1003),
 (1015,1003),
 (1016,1004),
 (1016,1006),
 (1008,1015),
 (1010,1008),
 (1017,1013),
 (1002,1001),
 (1009,1001),
 (1011,1005),
 (1014,1012),
 (1010,1002),
 (1010,1012),
 (1010,1018);


-- We define the following functions and predicates

/*
Functions:
set_union(A,B)               A union B
set_intersection(A,B)        A intersection B
set_difference(A,B)          A - B
add_element(x,A)             {x} union A
remove_element(x,A)          A - {x}
make_singleton(x)            {x}
choose_element(A)            choose some element from A
bag_union(A,B)               the bag union of A and B
bag_to_set(A)                coerce a bag A to the corresponding set

Predicates:
is_in(x,A)                   x in A
is_not_in(x,A)               not(x in A)
is_empty(A)                  A is the emptyset
is_not_emptyset(A)           A is not the emptyset
subset(A,B)                  A is a subset of B
superset(A,B)                A is a super set of B
equal(A,B)                   A and B have the same elements
overlap(A,B)                 A intersection B is not empty
disjoint(A,B)                A and B are disjoint
*/

-- Set Operations: union, intersection, difference

-- Set union $A \cup B$:
create or replace function set_union(A anyarray, B anyarray)
returns anyarray as
$$
   select array(select unnest(A) union select unnest(B) order by 1);
$$ language sql;

-- Set intersection $A\cap B$:
create or replace function set_intersection(A anyarray, B anyarray)
returns anyarray as
$$
   select array(select unnest(A) intersect select unnest(B) order by 1);
$$ language sql;

-- Set difference $A-B$:
create or replace function set_difference(A anyarray, B anyarray)
returns anyarray as
$$
   select array(select unnest(A) except select unnest(B) order by 1);
$$ language sql;

-- Set Predicates: set membership, set non membership, emptyset, subset, superset, overlap, disjoint

-- Set membership $x \in A$:
create or replace function is_in(x anyelement, A anyarray)
returns boolean as
$$
   select x = SOME(A);
$$ language sql;

-- Set non membership $x \not\in A$:
create or replace function is_not_in(x anyelement, A anyarray)
returns boolean as
$$
   select not(x = SOME(A));
$$ language sql;

-- emptyset test $A = \emptyset$:
create or replace function is_empty(A anyarray)
returns boolean as
$$
   select A <@ '{}';
$$ language sql;


-- non emptyset test $A \neq \emptyset$:
create or replace function is_not_empty(A anyarray)
returns boolean as
$$
   select not(A <@ '{}');
$$ language sql;

-- Subset test $A\subseteq B$:
create or replace function subset(A anyarray, B anyarray)
returns boolean as
$$
   select A <@ B;
$$ language sql;

-- Superset test $A \supseteq B$:
create or replace function superset(A anyarray, B anyarray)
returns boolean as
$$
   select A @> B;
$$ language sql;

-- Equality test $A = B$
create or replace function equal(A anyarray, B anyarray)
returns boolean as
$$
   select A <@ B and A @> B;
$$ language sql;

-- Overlap test $A\cap B \neq \emptyset$:
create or replace function overlap(A anyarray, B anyarray)
returns boolean as
$$
   select A && B;
$$ language sql;

-- Disjointness test $A\cap B = \emptyset$:
create or replace function disjoint(A anyarray, B anyarray)
returns boolean as
$$
   select not A && B;
$$ language sql;

-- Complex-object functions

-- The function companyHasEmployees with associates with each company
-- the set of pids of persons who work for that company.


create or replace function companyHasEmployees(c text)
returns int[] as
$$
select array(select w.pid
             from   worksFor w
             where  w.cname = c order by 1);
$$ language sql;


-- The function cityHasCompanies with each city the set of cnames of
-- companies who are located in that city.

create or replace function cityHasCompanies(c text)
returns text[] as
$$
select array(select cname
             from   companyLocation
             where  city = c order by 1);
$$ language sql;


-- The function {\tt companyLocations(cname)} which associates
-- with each company, identified by a cname, the set of cities in which
-- that company is located.

create or replace function companyHasLocations(c text)
returns text[] as
$$
select array(select city
             from   companyLocation
             where  cname = c order by 1);
$$ language sql;



-- The function {\tt knowsPersons(pid)} which associates with each
-- person, identified by a pid, the set of pids of persons who he or
-- she knows.

create or replace function knowsPersons (p int)
returns int[] as
$$
select array(select pid2
             from   Knows
             where  pid1 = p order by 1);
$$ language sql;   

-- The function {\tt isKnownByPersons(pid)} which associates with
-- each person, identified by a pid, the set of pids of persons who know
-- that person.  

create or replace function isKnownByPersons(p int) 
returns    int[] as
$$
select array(select pid1
             from   Knows
             where  pid2 = p order by 1);
$$ language sql; 

-- The function {\tt personHasSkills(pid,skills)} which associates with
--  each person, identified by a pid, his or her set of job skills.

create or replace function personHasSkills(p int) 
returns text[] as
$$
select array(select s.skill
             from   personSkill s
             where  pid = p order by 1);
$$ language sql;


-- The function {\tt skillOfPersons(skill)} which associates with each
--  skill the set of pids of persons who have that skill.

create or replace function skillOfPersons(s text)
returns int[] as
$$
select array(select pid
             from   personSkill
             where  skill = s order by 1);
$$ language sql;



\qecho 'Problem 9'

-- Find the cname and headquarter of each company that employs at
-- least three persons who have a common job skill.
SELECT c.cname, c.headquarter 
FROM Company c 
JOIN worksFor w1 ON c.cname = w1.cname 
JOIN personSkill ps1 ON w1.pid = ps1.pid 
WHERE ps1.skill IN 
    (SELECT ps2.skill 
     FROM personSkill ps2 
     JOIN worksFor w2 ON ps2.pid = w2.pid 
     WHERE w1.cname = w2.cname 
     GROUP BY ps2.skill 
     HAVING COUNT(DISTINCT w2.pid) >= 3)
GROUP BY c.cname, c.headquarter;

\qecho 'Problem 10'

-- Find each person who has no skill in common with those
-- of the persons who works for Yahoo or for Netflix.
SELECT DISTINCT p1.pid, p1.pname 
FROM Person p1 
JOIN personSkill ps1 ON p1.pid = ps1.pid 
WHERE ps1.skill NOT IN 
    (SELECT ps2.skill 
     FROM Person p2 
     JOIN worksFor w ON p2.pid = w.pid 
     JOIN personSkill ps2 ON p2.pid = ps2.pid 
     WHERE w.cname IN ('Yahoo', 'Netflix') 
     AND p2.pid <> p1.pid) 
GROUP BY p1.pid, p1.pname;

\qecho 'Problem 11'

-- Find the set of companies that employ at least 2 persons who each
-- know fewer than 3 persons.  (So this query returns {\bf just one}
-- object, i.e., the set of companies specified in the query.)
SELECT w.cname 
FROM worksFor w 
WHERE w.pid IN 
    (SELECT DISTINCT k1.pid1 
     FROM Knows k1 
     WHERE k1.pid2 IN 
         (SELECT k2.pid2 
          FROM Knows k2 
          WHERE k2.pid1 = k1.pid1) 
     GROUP BY k1.pid1 
     HAVING COUNT(DISTINCT k1.pid2) < 3) 
GROUP BY w.cname 
HAVING COUNT(DISTINCT w.pid) >= 2;

\qecho 'Problem 12'

-- Find the pid and name of each person $p$ along with the set of pids
-- of persons who (1) are known by $p$ and (2) who have both the
-- Programming and AI skills.
SELECT p1.pid, p1.pname, array_agg(DISTINCT p2.pid) as related_persons
FROM person p1
JOIN knows k ON k.pid1 = p1.pid
JOIN person p2 ON k.pid2 = p2.pid
JOIN personSkill ps1 ON p1.pid = ps1.pid
JOIN personSkill ps2 ON p2.pid = ps2.pid
WHERE ps1.skill = 'Programming' AND ps2.skill = 'AI'
  AND p2.pid <> p1.pid
  AND EXISTS (
    SELECT 1
    FROM personSkill ps3
    WHERE ps3.pid = p2.pid
      AND ps3.skill = 'Programming'
  )
GROUP BY p1.pid, p1.pname;


\qecho 'Problem 13'

-- Find each pair $(s_1,s_2)$ of different skills $s_1$ and $s_2$ such
-- that the number of employees who have skill $s_1$ and who make
-- strictly less than 55000 is strictly smaller than the number of
-- employees who have skill $s_2$ and who make strictly more than 55000.
WITH s1_counts AS (
  SELECT skill, COUNT(*) AS count
  FROM personSkill JOIN worksFor ON personSkill.pid = worksFor.pid
  WHERE salary < 55000
  GROUP BY skill
), 
s2_counts AS (
  SELECT skill, COUNT(*) AS count
  FROM personSkill JOIN worksFor ON personSkill.pid = worksFor.pid
  WHERE salary > 55000
  GROUP BY skill
)
SELECT s1.skill, s2.skill
FROM s1_counts s1 JOIN s2_counts s2 ON s1.skill <> s2.skill AND s1.count < s2.count;

\qecho 'Problem 14'

-- Find each $(c,p)$ pair where $c$ is the cname of a company and $p$
-- is the pid of a person who works for that company and who is known
-- by all other persons who work for that company.
SELECT DISTINCT w1.cname, w1.pid 
FROM worksFor w1 
WHERE NOT EXISTS 
    (SELECT w2.pid 
     FROM worksFor w2 
     WHERE w1.cname = w2.cname 
     AND w1.pid <> w2.pid 
     AND NOT EXISTS 
         (SELECT k.pid2 
          FROM Knows k 
          WHERE k.pid1 = w1.pid 
          AND k.pid2 = w2.pid));

\qecho 'Problem 15'

-- Find the pid and name of each person who has all the skills of the
-- combined set of job skills of the highest paid persons who work for
-- Yahoo.
SELECT p.pid, p.pname
FROM Person p
WHERE NOT EXISTS (
    SELECT s.skill
    FROM Skill s
    WHERE s.skill NOT IN (
        SELECT ps.skill
        FROM worksFor w
        JOIN personSkill ps ON w.pid = ps.pid
        WHERE w.cname = 'Yahoo'
        AND w.salary = (
            SELECT MAX(salary)
            FROM worksFor
            WHERE cname = 'Yahoo'
        )
    )
    AND s.skill NOT IN (
        SELECT ps.skill
        FROM worksFor w
        JOIN personSkill ps ON w.pid = ps.pid
        WHERE w.cname = 'Netflix'
        AND w.salary = (
            SELECT MAX(salary)
            FROM worksFor
            WHERE cname = 'Netflix'
        )
    )
    AND s.skill NOT IN (
        SELECT ps.skill
        FROM worksFor w
        JOIN personSkill ps ON w.pid = ps.pid
        WHERE w.cname = 'Netflix'
        AND w.salary = (
            SELECT MAX(salary)
            FROM worksFor
            WHERE cname = 'Yahoo'
        )
    )
);



-- \c postgres

-- drop database dirkassignment7;






-- Connect to default database
\c postgres;

-- Drop database created for this assignment
DROP DATABASE assignment7;





