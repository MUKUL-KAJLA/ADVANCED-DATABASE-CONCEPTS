-- Creating database with full name
 
CREATE DATABASE mukulkajla;

-- Connecting to database 
\c mukulkajla;

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
     ('IBM', 'Seattle'),
     ('ACM', 'NewYork');


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
     (1013,'Netflix', 55000),
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
   ('IBM', 'NewYork');

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
 (1013,'AI'),
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
 (1019,'Networks');

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
 (1014, 1012);

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
 (1014,1012);

\qecho 'Problem 11'
--Find the cname and headquarter of each company that employs persons who earn 
--less than 60000 and has Networks skill.
A)
select c.cname, c.headquarter 
from company c 
where c.cname in (select w.cname 
from worksfor w 
where w.salary < 60000 and 
w.pid = SOME (select ps.pid 
from personSkill ps 
where ps.skill = 'Networks')); 

Step-1:The given SQL query can be translated to: 

SELECT q.cname, q.headquarter from 
(select c.* from Company c, worksFor w 
where c.cname=w.cname and w.salary<60000 
and
w.pid = SOME (select ps.pid
from personSkill ps
where ps.skill = 'Networks'))q; 

Step-2: Which can be translated to:
select q.cname, q.headquarter from 
(select c.* from company c natural join worksFor w where 
 w.salary < 60000 
 intersect 
 select c.* from Company c natural join worksFor w natural join personSkill ps 
 where  ps.skill='Networks')q ; 



\qecho 'Problem 12'
--Find the manager id whose salary is not less than 45000 and his/her employee 
--earns less than 40000 and doesn't stay in the same city as the company's headquarter.
A)
Step-1: Eliminating first level EXISTS 
select q.mid from 
(select hm.* from hasManager hm, worksFor w, Person p, Company c where 
w.cname=c.cname and p.pid=hm.mid and w.pid=hm.mid and w.salary>55000 
and exists 
(select 1
 from Person e
 where (e.pid, w.cname) in (select ws.pid, ws.cname
 from worksFor ws
 where ws.pid = hm.eid
 and ws.salary < 55000
 and e.city <> c.headquarter)))q;

Step-2: Eliminating Second Level EXISTS and IN 
select hm.mid from hasManager hm, worksFor w, worksFor ws, Person p, Person p1, Company c where 
w.cname=c.cname and p.pid=hm.mid and w.pid=hm.mid and w.salary>55000 
and p1.pid=ws.pid and w.cname=ws.cname
 and ws.pid = hm.eid
 and ws.salary < 55000
 and p1.city != c.headquarter;

Step-3:
SELECT q.mid from 
 (select hm.* from hasManager hm natural join worksFor w where hm.mid=w.pid and w.salary>55000
  intersect 
 select hm.* from hasManager hm natural join worksFor w natural join 
  (select p.pid from person p natural join worksFor w natural join company c where p.city!=c.headquarter)p 
 where hm.eid=w.pid and w.salary<55000)q;


\qecho 'Problem 13'
--Find the pid and name of each person who works for a company headquartered at Seattle 
--and earns strictly greater than 50000 but his/her manager does not live in Seattle.
A)
Step-1: Eliminating first level NOT EXISTS
select q.pid, q.pname from 
(SELECT p.* from person p 
except
(select p.* from person p, worksFor w 
where p.pid = w.pid and
 w.cname not in (select c.cname
 from company c
 where w.salary > 50000 and c.headquarter = 'Seattle'
 and exists (select 1
 from hasManager hm
 where p.pid in (select hm.eid
 from person p1
 where hm.mid = p1.pid
 and p1.city != 'Seattle')))))q;

Step-2: Eliminating  NOT IN and EXISTS  
select q.pid, q.pname from 
(SELECT p.* from person p 
except
(select p.* from person p, worksFor w 
where p.pid = w.pid 
 except
  (select p.* from Person p, Person p1, worksFor w, Company c, hasManager hm 
 where p.pid=w.pid and w.salary > 50000 and w.cname=c.cname and c.headquarter = 'Seattle' and p.pid=hm.eid and 
 hm.mid = p1.pid
 and p1.city != 'Seattle')))q;

Step:3-
select q.pid, q.pname from 
(SELECT p.* from person p 
 except 
 (select p.* from person p natural join worksFor w  
		 except
select p.* from Person p natural join worksFor w natural join 
   (select c.cname from Company c where c.headquarter='Seattle')c
 where w.salary > 50000 
   intersect 
  select p.* from Person p join hasManager hm on (p.pid=hm.eid) join Person p1 on (hm.mid=p1.pid)  
 where p1.city != 'Seattle'))q;


\qecho 'Problem 14'
-- Find the skill of each employee who lives in Cupertino and earns not greater than 50000.

A)
Step-1: Translating the first IN
SELECT q.skill from 
(select distinct s.* from Skill s, personSkill ps where s.skill=ps.skill and ps.pid not in 
(select p.pid
from person p
where p.city <> 'Cupertino') and
ps.pid not in (select w.pid
from worksFor w
where w.salary > 50000))q;



\qecho 'Problem 15'
-- Find the pids of persons who work for a company that has two managers.

A)
Step-1: Translating EXISTS 
select p.pid
from person p, worksfor w 
where p.pid = w.pid 
and p.pid in (select hm1.eid
from hasManager hm1
where exists(select 1
from hasManager hm2
where hm1.eid = hm2.eid and
hm1.mid <> hm2.mid)); 

Step-2: translating IN into AND
select distinct p.pid
from person p, worksfor w, hasManager hm1 
where p.pid = w.pid 
and p.pid = hm1.eid 
and exists(select 1
from hasManager hm2
where hm1.eid = hm2.eid and
hm1.mid <> hm2.mid);

Step-3: Which can be translated into: 
select distinct p.pid from person p, worksFor w, hasManager hm1, hasManager hm2 where p.pid = w.pid 
and p.pid = hm1.eid and hm1.eid = hm2.eid and hm1.mid <> hm2.mid;



-- Connect to default database
\c postgres;

-- Drop database created for this assignment
DROP DATABASE mukulkajla;
