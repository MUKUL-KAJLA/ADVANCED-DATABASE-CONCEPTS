-- Assignment 4

-- Creating database with full name

CREATE DATABASE mukulkajla;

-- Connecting to database 
\c mukulkajla

-- Relation schemas and instances for assignment 2

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


CREATE TABLE hasManager(eid integer,
                        mid integer,
                        primary key (eid, mid),
                        foreign key (eid) references Person (pid),
                        foreign key (mid) references Person (pid));

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
 

INSERT INTO hasManager VALUES
 (1004, 1003),
 (1006, 1003),
 (1015, 1003),
 (1016, 1004),
 (1016, 1006),
 (1008, 1015),
 (1010, 1008),
 (1013, 1007),
 (1017, 1013),
 (1002, 1001),
 (1009, 1001),
 (1014, 1012),
 (1011, 1005);


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

\qecho 'Problem 1'
/*Find each pair (c, p) where c is the city and p is the pid
of the person that lives in c, and earns the highest salary
among all persons living in c. You must not use set predi-
cates in this query*/

 with cityPeople as 
 (select distinct p.pid,p.city,w.salary  from person p, worksFor w where p.pid=w.pid)
 select p.city as c,p.pid as p from cityPeople cp, person p where cp.pid=p.pid and cp.salary=
 (select max(w1.salary) from worksFor w1, cityPeople cp1 where w1.pid=cp1.pid and cp1.city=p.city);


\qecho 'Problem 2'
/*Find the pid and pname of each person that knows the least
amount of people (greater than 0) at the company that they
work at. (The persons they know should work at the same
company).You must not use set predicates in this query.*/


with knowsPeopleFromCompany as 
    (select w.pid,w.cname, count(1) as knowsPeople from knows k, worksFor w,worksFor w1 
     where k.pid1=w.pid and k.pid2=w1.pid and w.pid!=w1.pid and k.pid1!=k.pid2 and w.cname=w1.cname 
     group by w.pid ) 
	
select distinct kpc.pid, p.pname from person p, knowsPeopleFromCompany kpc 
	where p.pid=kpc.pid and kpc.knowspeople = 
	(select min(kpc1.knowspeople) from knowsPeopleFromCompany kpc1 where kpc1.cname=kpc.cname );  
	

\qecho 'Problem 3'
/*Find each pair (c, a) where c is the cname of each company
that has more than one manager, and a is the average salary
of all employees working at the company who are not man-
agers.You must not use set predicates in this query.*/

with companyName as 
(select w.cname from worksFor w, hasManager hm 
where w.pid=hm.mid group by w.cname having count(w.pid)>1) ,
NotManager as 
(select w.pid from worksfor w, companyName cn where w.cname=cn.cname 
except  
(select w.pid from worksFor w , hasManager hm where w.pid=hm.mid))
select cn.cname as c, round(avg(w.salary),2) as a 
from worksfor w, companyName cn, NotManager nm  
where cn.cname=w.cname and w.pid=nm.pid group by cn.cname;

\qecho 'Problem 4'
/*Find each pair (c, n) where c is the cname of a company
and n is the number of persons who
     (a) Work at c and earn strictly more than 55000
     (b) Have fewer than 4 skills
You must not use set predicates in this query.*/

with companyAndEmp as 
(select w.cname, w.pid from worksFor w where w.salary>55000),
fewerSkills as 
(select w.pid from worksFor w,personSkill ps where w.pid=ps.pid group by w.pid having count(ps.skill)<4)
select w.cname as c, 
(select count(fws.pid) from fewerSkills fws, companyAndEmp cae where fws.pid=cae.pid and w.cname=cae.cname) as n 
from worksfor w, CompanyAndEmp cae, fewerSkills fws 
where w.cname=cae.cname and w.pid=fws.pid group by w.cname; 


\qecho 'Problem 5'
/*Find the cname of each company, such that some person
that works there knows at-least half the people that work
at Google.*/

with googleEmployee as 
(select k.pid1 as pid, count(k.pid2) as num from knows k,worksfor w 
 where k.pid2=w.pid and w.cname='Google' group by k.pid1)
 
select distinct w.cname from worksFor w, knows k, googleEmployee ge 
where w.pid=k.pid1 and ge.pid = k.pid1 and 
ge.num >= (select count(1) from worksfor w1 where w1.cname='Google')/2;


\qecho 'Problem 6'
/*
Find each skill that is the skill of a person who works at
a company that pays the lowest average salary among all
companies.
*/

create or replace function AvgSalaryAtCompany() 
   returns table (cname text, salary int ) as
  $$
   with avg_salary as 
   (select w.cname, avg(w.salary) as avg_sal  
    from   worksfor w group by w.cname )   
	
	select distinct avs.cname, avs.avg_sal from avg_salary avs where avs.avg_sal= 
	(select min(avg_salary.avg_sal) from avg_salary) 
	
	$$ language sql;
	
  select ps.skill from personSkill ps, worksFor w, AvgSalaryAtCompany() avg_salAtC 
  where ps.pid=w.pid and w.cname=
  (select avg_salAtC.cname from AvgSalaryAtCompany() avg_salAtC);


\qecho 'Problem 7'
/*Find each triple (p1, p2, n), where p1 and p2 are pids of
different persons, and n is the number of common skills
between p1 and p2.*/

create or replace function commonSkills (pid1 int,pid2 int) 
 returns table (num int) as 
 $$ 
 select count(s.skill) from  skill s, personSkill ps1, personSkill ps2 
 where ps1.skill=s.skill and ps2.skill=s.skill and 
 ps1.pid=pid1 and ps2.pid=pid2 and ps1.skill= ps2.skill;
 $$ language sql;
 select distinct p.pid as p1, p1.pid as p2, commonSkills(p.pid,p1.pid) as n 
 from person p, person p1 where p.pid!=p1.pid;



\qecho 'Problem 8'
/*
Using the GROUP BY count method, define a function personInfo
that returns for a company c identified by its cname, the
triple (p, s, n), where:
     - p is the pid of a person that works at c
     - s is the salary of p
     - n is the number of skills p has

create or replace function personInfo(c text)
returns table (p int, s int, n int) as
$$
...
$$language sql;

Test this function with:
     (a) personInfo(’Apple’)
     (b) personInfo(’Amazon’)
*/

create or replace function personInfo(c text) 
returns table (p int, s int, n int) as 
$$ 
with personAndSkill as 
(select p.pid , count(ps.skill) as num  
from person p left join personSkill ps on p.pid=ps.pid group by p.pid)
select pas.pid as p, w.salary as s, pas.num as n 
from personAndSkill pas, worksFor w where pas.pid=w.pid and w.cname=personInfo.c ;
$$ language sql ;

select * from personInfo('Apple');
select * from personInfo('Amazon');

\qecho 'Problem 9'
drop table if exists Point;
create table Point(x int, y int);
insert into Point values (1,3),(2,4),(3,1),(5,5),(6,2),(1,2),(2,1);

/*
Let Point(x int, y int) be a binary relation. Each pair
(x, y) in Point represents a point in 2-D Space.
With the data given in the script file, write a SQL query
that generates a tuple (x1, y1, x2, y2) of different points (x1, y1)
and (x2, y2), such that:

     (a) x1 ̸= x2 and y1 ̸= y2, and
     (b) x1 + y1 = x2 + y2, and
     (c) sqrt((x1 −x2)^2 + (y1 −y2)^2) > 2
*/

CREATE OR REPLACE FUNCTION POINT_PAIRS() 
RETURNS TABLE (x1 int, y1 int, x2 int, y2 int) AS 
$$
SELECT p.x as x1, p.y as y1, p1.x as x2, p1.y as y2 
FROM POINT P, POINT P1 
WHERE p.x!=p1.x and p.y!=p1.y and 
      p.x+p.y = p1.x+p1.y and 
	  sqrt(power(p.x-p1.x,2) + power(p.y-p1.y,2)) > 2 ;
$$ LANGUAGE SQL;

SELECT * FROM POINT_PAIRS();


\qecho 'Problem 10'
/*
In statistics, the standard deviation is a measure of the
amount of variation or dispersion of a set of values. A
low standard deviation indicates that the values tend to be
close to the mean (also called the expected value) of the
set, while a high standard deviation indicates that the val-
ues are spread out over a wider range. You can read more
about it here:
https://en.wikipedia.org/wiki/Standard deviation
Define a function SalaryStandardDeviation(cname text),
that returns the standard deviation of the salaries of the
people working at the company identified by cname.

     create or replace function SalaryStandardDeviation(cname
     text)
     returns table (std deviation float) as
     $$
     ...
     $$language sql;

Some inbuilt functions that may come in handy:
https://www.postgresql.org/docs/7.4/functions-math.html

Test this function with:
(a) SalaryStandardDeviation(’Apple’)
(b) SalaryStandardDeviation(’Amazon’)
(c) SalaryStandardDeviation(’Google’)
(d) SalaryStandardDeviation(’Netflix’) 
*/

CREATE OR REPLACE FUNCTION SALARYSTANDARDDEVIATION(CNAME TEXT) 
RETURNS TABLE (STD_DEVIATION FLOAT) AS 
$$
WITH AVG_SAL AS (SELECT AVG(W.SALARY) AVG_SL FROM WORKSFOR W WHERE W.CNAME = SALARYSTANDARDDEVIATION.CNAME), 
NUMOFEMP AS (SELECT COUNT(W.PID) AS NUMEMP FROM WORKSFOR W WHERE W.CNAME=SALARYSTANDARDDEVIATION.CNAME)
SELECT SQRT(SUM(POWER(W.SALARY-AVG_SL,2))/NUMEMP) 
FROM WORKSFOR W, AVG_SAL, NUMOFEMP WHERE W.CNAME=SALARYSTANDARDDEVIATION.CNAME GROUP BY NUMEMP;
$$ LANGUAGE SQL;

SELECT * FROM SALARYSTANDARDDEVIATION('Apple');
SELECT * FROM SALARYSTANDARDDEVIATION('Amazon');
SELECT * FROM SALARYSTANDARDDEVIATION('Google');
SELECT * FROM SALARYSTANDARDDEVIATION('Netflix');


-- Connect to default database
\c postgres

-- Drop database created for this assignment
DROP DATABASE mukulkajla    ;


 


