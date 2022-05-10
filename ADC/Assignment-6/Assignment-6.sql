-- Script for Assignment 6

-- Creating database with full name

CREATE DATABASE mukulkajla;

-- Connecting to database 
\c mukulkajla

-- Relation schemas and instances for assignment 5

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


-- Add element to set
create or replace function add_element(x anyelement, A anyarray) 
returns anyarray as
$$
   select bag_to_set(x || A);
$$ language sql;


-- Add element to set
create or replace function remove_element(x anyelement, A anyarray) 
returns anyarray as
$$
   select array_remove(A, x);
$$ language sql;


-- Make singleton  x --->  {x}

create or replace function make_singleton(x anyelement) 
returns anyarray as
$$
   select add_element(x,'{}');
$$ language sql;


-- Choose some element from set A
create or replace function choose_element(A anyarray) 
returns anyelement as
$$
   select x 
   from (select UNNEST(A) as x) q
   order by random();
$$ language sql;


-- Bag operations

-- Bag union 
create or replace function bag_union(A anyarray, B anyarray) 
returns anyarray as
$$
   select A || B;
$$ language sql;

-- bag To set
create or replace function bag_to_set(A anyarray)
returns anyarray as
$$
   select array(select distinct unnest(A) order   by 1);
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


-- Set Operations: union, intersection, difference

-- Set union $A \cup B$:
create or replace function setunion(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) union select unnest(B) order by 1);
$$ language sql;

-- Set intersection $A\cap B$:
create or replace function setintersection(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) intersect select unnest(B) order by 1);
$$ language sql;

-- Set difference $A-B$:
create or replace function setdifference(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) except select unnest(B) order by 1);
$$ language sql;


-- Set Predicates: set membership, subset, superset, overlap, disjoint

-- Set membership $x \in A$:
create or replace function isIn(x anyelement, A anyarray) 
returns boolean as
$$
   select x = SOME(A);
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

-- Complex-object views on the Person, Company, companyLocation,
-- worksFor, Skill, personSkill, and Knows database

-- Define the view {\tt companyHasEmployees(cname,employees)} which
-- associates with each company, identified by a cname, the set of
-- pids of persons who work for that company. 

create or replace view companyHasEmployees as
   select cname, array(select pid 
                       from   worksfor w
                       where  w.cname = c.cname order by 1) as employees
   from   company c order by 1;


-- Define a view {\tt cityHasCompanies(city,companies)} which associates
-- with each city the set of cnames of companies who are located in that
-- city. 

create or replace view cityHasCompanies as
   select city, array_agg(cname order by 1) as companies
   from   companyLocation 
   group by city order by 1;




-- Define a view {\tt companyLocations(cname,locations)} which associates
-- with each company, identified by a cname, the set of cities in which
-- that company is located.  

create or replace view companyHasLocations     as
   select cname, array(select city 
                       from   companyLocation cc
                       where  c.cname = cc.cname order by 1) as locations
   from   company c
   order by 1;



-- Define a view {\tt knowsPersons(pid,persons)} which associates with each
-- person, identified by a pid, the set of pids of persons he or she
-- knows.

create or replace view knowsPersons as
   select p.pid, array(select k.pid2 
                       from   knows k
                       where  k.pid1 = p.pid order by pid2) as persons
   from   person p
   order by 1;




-- The view {\tt isKnownByPersons(pid,persons)} which associates with
-- each person, identified by a pid, the set of pids of persons who know
-- that person.  Observe that there may be persons who are not known by
-- any one.

create or replace view isKnownByPersons as
   select distinct p.pid, array(select k.pid1 
                                from   knows k
                                where  k.pid2 = p.pid order by pid1) as persons
   from   person p
   order by 1;


-- Define a view {\tt personHasSkills(pid,skills)} which associates with
-- each person, identified by a pid, his or her set of job skills.
-- Observe that a person may not have any job skills.  (Test your view.)

create or replace view personHasSkills  as
   select distinct p.pid, array(select s.skill
                                from   personSkill s
                                where  s.pid = p.pid order by 1) as skills
   from   person p order by 1;





-- Define a view {\tt skillOfPersons(skills,persons)} which associates
-- with each job skill the set of pids of persons who have that job
-- skill.  Observe that there may be job skills that are not job skills
-- of any person.  (Test your view.)

create or replace view  skillOfPersons as
    select js.skill, array(select ps.pid
                           from   personSkill ps
                           where  ps.skill = js.skill order by 1) as persons
    from   Skill js order by 1;


-- Problem 1

\qecho 'Problem 1' 
-- Find the pid and name of each person $p$ along with the set of pids
-- of persons who (1) know $p$ and (2) who have the AI skill but not
-- the Programming  and Networks skill.

WITH KNOWNBYIND AS (SELECT IKBP.PID, UNNEST(IKBP.PERSONS) AS KB_PID FROM ISKNOWNBYPERSONS IKBP)
SELECT P.PID, P.PNAME, ARRAY(SELECT KBI.KB_PID FROM KNOWNBYIND KBI, PERSONHASSKILLS PHS 
							 WHERE KBI.KB_PID = PHS.PID AND KBI.PID=P.PID 
							 AND IS_IN('AI', PHS.SKILLS) 
							AND (IS_NOT_IN('Programming',PHS.SKILLS) 
							 OR IS_NOT_IN('Networks',PHS.SKILLS)) ) AS PERSONS FROM PERSON P;
	

\qecho 'Problem 2' 
-- Find each (c, p) pair where c is the cname of a company and p is the
-- pid of a person who works for that company and who is known by
-- everyone who works for that company.

SELECT DISTINCT W.CNAME, W.PID FROM WORKSFOR W, COMPANYHASEMPLOYEES CHE, ISKNOWNBYPERSONS IKBP 
WHERE W.PID=IKBP.PID AND W.CNAME=CHE.CNAME AND 
SUBSET(REMOVE_ELEMENT(W.PID,CHE.EMPLOYEES),IKBP.PERSONS);

\qecho 'Problem 3'  

-- Find the pid and name of each person who has all the skills of the
-- combined set of job skills of the lowest paid persons who work for
-- Google.

WITH GOOGLESKILLS AS (SELECT PHS.SKILLS, PHS.PID FROM PERSONHASSKILLS PHS 
					  WHERE PHS.PID=(SELECT W.PID FROM WORKSFOR W, WORKSFOR W1 WHERE W.CNAME='Google' AND W1.CNAME='Google' 
					  AND W.PID<>W1.PID AND W.SALARY<W1.SALARY))
SELECT P.PID, P.PNAME FROM PERSON P, PERSONHASSKILLS PHS, GOOGLESKILLS GS   
WHERE P.PID=PHS.PID AND SUBSET(GS.SKILLS,PHS.SKILLS);


\qecho 'Problem 4'
--  Find the following set of sets \[\{S \mid S \subseteq \text{Skill}
-- \land |S| \leq 2\}.\] I.e., this is the set consisting of each set of job skills whose size (cardinality) is at most 2.

SELECT '{}'::TEXT[] AS SKILLS 
UNION
SELECT MAKE_SINGLETON(SKILL) FROM SKILL 
UNION 
SELECT DISTINCT SET_UNION(MAKE_SINGLETON(SK1.SKILL),MAKE_SINGLETON(SK2.SKILL)) 
					 AS SKILL_SETS FROM SKILL SK1,SKILL SK2 WHERE SK1.SKILL!=SK2.SKILL;
				

\qecho 'Problem 5' 
-- Let  \[\mathcal{S} = \{S \mid S \subseteq \text{Skill} \land |S| \leq 3\}.\]
--  Find the following set of sets
--  \[\{X \mid X \subseteq \mathcal{S} \land |X| \leq 2\}.\]

CREATE TYPE SKILLTYPE AS (SKILL TEXT)
CREATE TYPE SKILLTYPESET AS (SKILLS SKILLTYPE [])

WITH MAKE_SETS AS (SELECT (MAKE_SINGLETON(ROW('{}')::SKILLTYPE)) AS SKILLS_DISPLAY FROM SKILL 
UNION
SELECT MAKE_SINGLETON(ROW(SKILL)::SKILLTYPE) FROM SKILL 
UNION 
SELECT DISTINCT SET_UNION(MAKE_SINGLETON(ROW(SK1.SKILL)::SKILLTYPE),MAKE_SINGLETON(ROW(SK2.SKILL)::SKILLTYPE)) 
					 AS SKILLS FROM SKILL SK1,SKILL SK2 WHERE SK1.SKILL!=SK2.SKILL 
UNION 
SELECT DISTINCT SET_UNION(MAKE_SINGLETON(ROW(SK3.SKILL)::SKILLTYPE),SET_UNION(MAKE_SINGLETON(ROW(SK1.SKILL)::SKILLTYPE),MAKE_SINGLETON(ROW(SK2.SKILL)::SKILLTYPE))) 
					 AS SKILLS FROM SKILL SK1,SKILL SK2, SKILL SK3 WHERE SK1.SKILL!=SK2.SKILL AND SK2.SKILL!=SK3.SKILL AND SK1.SKILL!=SK3.SKILL )
					 
SELECT '{}'
UNION 
SELECT MAKE_SINGLETON(ROW(MS.SKILLS_DISPLAY)::SKILLTYPESET) FROM MAKE_SETS MS
UNION 
SELECT SET_UNION(MAKE_SINGLETON(ROW(MS1.SKILLS_DISPLAY)::SKILLTYPESET),MAKE_SINGLETON(ROW(MS2.SKILLS_DISPLAY)::SKILLTYPESET))
FROM MAKE_SETS MS1, MAKE_SETS MS2 WHERE ROW(MS1.SKILLS_DISPLAY)!=ROW(MS2.SKILLS_DISPLAY);


 \qecho 'Problem 6' 
-- Let $A$ and $B$ be sets such that $A\cup B\neq\emptyset$.  The
-- \emph{Jaccard index} $J(A,B)$ is defined as the quantity \[
-- \frac{|A\cap B|}{|A \cup B|}.\] The Jaccard index is a frequently used
-- measure to determine the similarity between two sets.  Note that if
-- $A\cap B=\emptyset$ then $J(A,B) = 0$, and if $A = B$ then $J(A,B) =
-- 1$.

-- Let $t$ be a number called a \emph{threshold}.  We assume that $t$ is
-- a {\tt float} in the range $[0,1]$.

-- Write a function {\tt JaccardSimilar(t float)} that returns the set of
-- unordered pairs $\{s_1,s_2\}$ of different skills such that the set of
-- persons who have skill $s_1$ and the set of persons who have skill
-- $s_2$ have a Jaccard index of at least {\tt t}.

CREATE OR REPLACE FUNCTION JACCARDSIMILAR(T FLOAT)
RETURNS TABLE (PAIR TEXT[]) AS 
$$
	SELECT DISTINCT SET_UNION(MAKE_SINGLETON(SOP1.SKILL), MAKE_SINGLETON(SOP2.SKILL)) FROM SKILLOFPERSONS SOP1, SKILLOFPERSONS SOP2 
		 WHERE SOP1.SKILL!=SOP2.SKILL AND  
		 CARDINALITY(SET_INTERSECTION(SOP1.PERSONS,SOP2.PERSONS))::FLOAT/CARDINALITY(SET_UNION(SOP1.PERSONS,SOP2.PERSONS))::FLOAT>=T;
$$
LANGUAGE SQL;

-- Test your function {\tt JaccardSimilar} for the following values for
-- $t$: $0$, $0.25$, $0.5$, $0.75$, and $1$.

SELECT * FROM JACCARDSIMILAR(0);
SELECT * FROM JACCARDSIMILAR(0.25);
SELECT * FROM JACCARDSIMILAR(0.5);
SELECT * FROM JACCARDSIMILAR(0.75);
SELECT * FROM JACCARDSIMILAR(1);

-- Consider the lecture on Nested and Semi-structured Data models.  In
-- that lecture, we considered the {\tt studentGrades} nested relation
-- and we constructed it using a PostgreSQL query starting from the {\tt
-- Enroll} relation.

CREATE TABLE student (sid TEXT, sname TEXT, major TEXT, byear INT);
INSERT INTO student VALUES
('s100', 'Eric'  , 'CS'     , 1988),
('s101', 'Nick'  , 'Math'   , 1991),
('s102', 'Chris' , 'Biology', 1977),
('s103', 'Dinska', 'CS'     , 1978),
('s104', 'Zanna' , 'Math'   , 2001),
('s105', 'Vince' , 'CS'     , 2001);

CREATE TABLE course (cno TEXT, cname TEXT, dept TEXT);
INSERT INTO course VALUES
('c200', 'PL'      , 'CS'),
('c201', 'Calculus', 'Math'),
('c202', 'Dbs'     , 'CS'),
('c301', 'AI'      , 'CS'),
('c302', 'Logic'   , 'Philosophy');

CREATE TABLE enroll (sid TEXT, cno TEXT, grade TEXT);
insert into enroll values 
     ('s100','c200', 'A'),
     ('s100','c201', 'B'),
     ('s100','c202', 'A'),
     ('s101','c200', 'B'),
     ('s101','c201', 'A'),
     ('s102','c200', 'B'),
     ('s103','c201', 'A'),
     ('s101','c202', 'A'),
     ('s101','c301', 'C'),
     ('s101','c302', 'A'),
     ('s102','c202', 'A'),
     ('s102','c301', 'B'),
     ('s102','c302', 'A'),
     ('s104','c201', 'D');



\qecho 'Problem 7'

-- Write a PostgreSQL view {\tt courseGrades} that creates the nested
-- relation of type \[{\tt (cno, gradeInfo\{(grade, students
-- \{(sid)\})\})}\] This view should compute for each course, the grade
-- information of the students enrolled in this course.  In particular,
-- for each course and for each grade, this relation stores in a set the
-- students who obtained that grade in that course.

-- Test your view.

CREATE TYPE STUD_TYPE AS (SID TEXT);
CREATE TYPE GRADE_STUDENTS AS (GRADES TEXT, STUDENTS STUD_TYPE[]);

CREATE TABLE COURSEGRADES (CNO TEXT, GRADEINFO GRADE_STUDENTS[]);

INSERT INTO COURSEGRADES 
WITH E AS (SELECT CNO, GRADE, ARRAY_AGG(ROW(SID)::STUD_TYPE) AS STUDS FROM ENROLL E GROUP BY (CNO,GRADE)), 
F AS (SELECT CNO, ARRAY_AGG(ROW(GRADE,STUDS)::GRADE_STUDENTS) AS GRADEINFO FROM E GROUP BY (CNO))
SELECT CNO, GRADEINFO FROM F;

SELECT * FROM COURSEGRADES;

\qecho 'Problem 8'
--  Starting from the {\tt courseGrades} view in Problem (7) solve the following
-- queries:
-- \\Find each cno c where c is a course in which all students received the same grade.

SELECT CG.CNO FROM COURSEGRADES CG, UNNEST(CG.GRADEINFO)CGI 
GROUP BY CG.CNO HAVING COUNT(CGI.GRADES)=1; 

\qecho 'Problem 9'
-- Write a PostgreSQL view jcourseGrades that creates a semi-structured
-- database which stores jsonb objects whose structure conforms with the
-- structure of tuples as described for the courseGrades in Problem (a).
-- Test your view.

CREATE OR REPLACE VIEW JCOURSEGRADES AS(
  WITH E AS
       (SELECT CNO, GRADE, ARRAY_TO_JSON(ARRAY_AGG(JSON_BUILD_OBJECT('SID', SID))) AS STUDENTS
        FROM ENROLL
        GROUP BY (CNO, GRADE)),
       F AS
       (SELECT JSON_BUILD_OBJECT(
               'CNO', CNO,
               'GRADEINFO', ARRAY_TO_JSON(ARRAY_AGG(JSON_BUILD_OBJECT('GRADE', GRADE,
                                                                      'STUDENTS', STUDENTS)))) as COURSEINFO 
          FROM E
         GROUP BY CNO)
SELECT * FROM F);

SELECT COURSEINFO FROM JCOURSEGRADES JCG;

\qecho 'Problem 10'
-- Starting from the jcourseGrades view in Problem (c) solve the following
-- queries. Note that the output of each of these queries is a nested relation.
-- \\(i) Find each pair (c, s) where c is the cno of a course and s is the sid of
-- a student who received an ‘A’ in course c. The type of your
-- answer relation should be (cno:text, sid:text).

SELECT CG.CNO, UNNEST(CGI.STUDENTS) AS SID FROM COURSEGRADES CG, UNNEST(CG.GRADEINFO)CGI 
WHERE CGI.GRADES='A' ORDER BY CG.CNO;

\c postgres

drop database mukulkajla;

