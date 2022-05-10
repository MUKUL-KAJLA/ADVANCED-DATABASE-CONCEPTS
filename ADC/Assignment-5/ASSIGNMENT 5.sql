-- Script for Assignment 5

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
/*Explain how triggers can be used to implement the 
Primary key Constraint, with an example.*/

CREATE OR REPLACE FUNCTION PRIMARY_KEY_CONS() 
RETURNS TRIGGER AS 
$$ 
BEGIN 
IF NEW.PID IN (SELECT PID FROM PERSON) THEN 
RAISE EXCEPTION 'THIS PID ALREADY EXISTS' ;
END IF;
IF NEW.PID IS NULL THEN 
RAISE EXCEPTION 'PID CANNOT BE NULL';
END IF;
RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER INSERT_INTO_PERSON 
BEFORE INSERT ON PERSON 
FOR EACH ROW 
EXECUTE PROCEDURE PRIMARY_KEY_CONS();

\qecho 'Problem 2'
/*Explain how triggers can be used to implement the 
Foreign key Constraint, with an example.*/

CREATE OR REPLACE FUNCTION FOREIGN_KEY_CONS() 
RETURNS TRIGGER AS 
$$
BEGIN
IF NEW.PID NOT IN (SELECT PID FROM PERSON) THEN 
RAISE EXCEPTION 'PID IS A FOREIGN KEY & THIS KEY IS NOT PRESENT IN PERSON' ;
END IF;
RETURN OLD;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER INSERT_WORKSFOR 
BEFORE DELETE ON WORKSFOR
FOR EACH ROW 
EXECUTE PROCEDURE FOREIGN_KEY_CONS();

\qecho 'Problem 3'
/*Consider two relations R(A:integer,B:integer) and S(B:integer)
and a view with the following definition:*/

select distinct r.A
from R r, S s
where r.A > 10 and r.B = s.B;

/*Suppose we want to maintain this view as a materialized
view called V(A:integer) upon the insertion of tuples in R
and in S. (You do not have to consider deletions in this question.)

Define SQL insert triggers and their associated trigger functions
on the relations R and S that implement this materialized view.
Write your trigger functions in the language ‘plpgsql.’

Make sure that your trigger functions act in an incremental way
and that no duplicates appear in the materialized view.*/


--TEST YOUR TRIGGERS ACROSS THE BELOW RECORDS.

/* -----------*/

CREATE TABLE IF NOT EXISTS R(A INT, B INT);
CREATE TABLE IF NOT EXISTS S(B INT);
CREATE TABLE IF NOT EXISTS V(A INT);


/* -----------*/
--Create TRIGGERS Insert_R and Insert_S
/* -----------*/

CREATE TABLE IF NOT EXISTS R(A INT, B INT);
CREATE TABLE IF NOT EXISTS S(B INT);
CREATE TABLE IF NOT EXISTS V(A INT);

CREATE OR REPLACE FUNCTION INS_INTO_R() 
RETURNS TRIGGER AS 
$$ 
BEGIN 
INSERT INTO V (SELECT a FROM R WHERE a>10 
			  AND b IN (SELECT b FROM S) 
			  AND a NOT IN (SELECT a FROM V));
RETURN NULL;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER INSERT_R 
AFTER INSERT ON R 
FOR EACH ROW 
EXECUTE PROCEDURE INS_INTO_R();


CREATE OR REPLACE FUNCTION INS_INTO_S() 
RETURNS TRIGGER AS 
$$ 
BEGIN 
INSERT INTO V (SELECT a FROM R WHERE b IN (SELECT b FROM S) 
			  AND a>10 
			  AND a NOT IN (SELECT a FROM V));
RETURN NULL;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER INSERT_S 
AFTER INSERT ON S 
FOR EACH ROW 
EXECUTE PROCEDURE INS_INTO_S();

-------INSERTION----------

INSERT INTO R VALUES(15,35);
INSERT INTO S VALUES(35);
SELECT * FROM V;


INSERT INTO R VALUES(4,12);
INSERT INTO S VALUES(12);
SELECT * FROM V;

INSERT INTO R VALUES(26,13);
INSERT INTO S VALUES(11);
SELECT * FROM V;


INSERT INTO R VALUES(101,106);
INSERT INTO S VALUES(106);
SELECT * FROM V;


DROP TABLE IF EXISTS R;
DROP TABLE IF EXISTS S;
DROP TABLE IF EXISTS V;

/* -----------*/



\qecho 'Problem 4'
/*Consider applying the following constraint over the relation
personSkill. ”Each skill of a person who works for Google
should also be the skill of the person who works for Apple”.
Write a trigger that maintains the constraint when inserting
new pairs of (pid,skill) into the personSkill relation.(You
can ignore the constraint restriction to hold upon the al-
ready existing previous records).*/


/* SECTION Q4 BEGIN */

/* -----------*/

CREATE OR REPLACE FUNCTION MATCHING_SKILLS()
RETURNS TRIGGER AS 
$$
BEGIN
IF NEW.CNAME='Apple' THEN 
INSERT INTO PERSONSKILL   
(SELECT NEW.PID,Q.SKILL FROM (SELECT DISTINCT PS.SKILL FROM PERSONSKILL PS, WORKSFOR W WHERE PS.PID=W.PID AND W.CNAME='Google')Q
WHERE (NEW.PID,Q.SKILL) NOT IN (SELECT PID,SKILL FROM PERSONSKILL));
END IF;
RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER MATCH_SKILL 
AFTER INSERT ON WORKSFOR 
FOR EACH ROW 
EXECUTE PROCEDURE MATCHING_SKILLS();


/* NEW RECORDS TO BE INSERTED*/


INSERT INTO Person VALUES
    (2001,'Kevin','Cupertino');
INSERT INTO worksFor VALUES
    (2001,'Apple', 65000);

INSERT INTO Person VALUES
    (2002,'Julia', 'Cupertino');
INSERT INTO worksFor VALUES
	(2002,'Google', 45000);
INSERT INTO SKILL VALUES('Devops');	
INSERT INTO personSkill VALUES
	(2002,'Devops');
     
INSERT INTO Person VALUES
    (2003,'Dora', 'Seattle');
INSERT INTO worksFor VALUES	 
	(2003,'Google', 55000);
INSERT INTO SKILL VALUES('Cloud');
INSERT INTO personSkill VALUES
	(2003,'Cloud');

INSERT INTO Person VALUES
     (2004,'Peter', 'Seattle');
INSERT INTO worksFor VALUES	 
	 (2004,'Apple', 55000);
INSERT INTO SKILL VALUES('Design');
INSERT INTO personSkill VALUES
	 (2004,'Design');


INSERT INTO Person VALUES
    (2005,'Alex','Cupertino');
INSERT INTO worksFor VALUES
    (2005,'Apple', 65000);

/* -----------*/



/* TEST YOUR RESULTS*/

SELECT * FROM PERSONSKILL WHERE PID = 2001;
SELECT * FROM PERSONSKILL WHERE PID = 2002;
SELECT * FROM PERSONSKILL WHERE PID = 2003;
SELECT * FROM PERSONSKILL WHERE PID = 2004;
SELECT * FROM PERSONSKILL WHERE PID = 2005;

/* -----------*/

/* RETAINING THE ORIGINAL DATA*/

DELETE FROM PERSONSKILL PS WHERE PS.PID IN (2002,2003,2004);
DELETE FROM SKILL S WHERE S.SKILL IN ('Devops','Cloud','Design');
DELETE FROM WORKSFOR W WHERE W.PID IN (2001,2002,2003,2004,2005);
DELETE FROM PERSON P WHERE P.PID IN (2001,2002,2003,2004,2005);

/* SECTION Q4 END */



\qecho 'Problem 5'

/* SECTION Q5 BEGIN */

CREATE TABLE KNOWS_COPY AS SELECT * FROM KNOWS;

CREATE OR REPLACE FUNCTION RETAIN_DATA(P INT, C TEXT)
RETURNS VOID AS $$
	BEGIN
        UPDATE WORKSFOR SET CNAME = C
          WHERE WORKSFOR.PID = P;
		
		TRUNCATE TABLE KNOWS;
		INSERT INTO KNOWS SELECT * FROM KNOWS_COPY;
    END;
$$ LANGUAGE plpgsql;

/* TRIGGER */
CREATE OR REPLACE FUNCTION UPDATION_TRIGGER()
RETURNS TRIGGER AS 
$$
BEGIN
INSERT INTO KNOWS 
(SELECT DISTINCT NEW.PID,Q.MID FROM (SELECT HM.MID FROM HASMANAGER HM, WORKSFOR W WHERE HM.MID=W.PID AND W.CNAME=NEW.CNAME) Q
WHERE (NEW.PID,Q.MID) NOT IN (SELECT PID1, PID2 FROM KNOWS));
RETURN NULL;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER UPDATE_KNOWS 
BEFORE UPDATE ON WORKSFOR 
FOR EACH ROW 
EXECUTE PROCEDURE UPDATION_TRIGGER();

/*    */

UPDATE WORKSFOR SET CNAME='Apple' WHERE WORKSFOR.PID = 1005;

/* Check your trigger and return the results*/

/* retaining the data */
SELECT * FROM RETAIN_DATA(1005,'Google');


UPDATE WORKSFOR SET CNAME='Google' WHERE WORKSFOR.PID = 1012;

/* Check your trigger and return the results*/

/* retaining the data */
SELECT * FROM RETAIN_DATA(1012,'Apple');


DROP TABLE KNOWS_COPY;


/* SECTION Q5 END */

\qecho 'Problem 6'
/*Find the pid and name of each person who knows all the
persons who (a) live in Bloomington, (b) make at least
55000, and (c) have at least one skill.*/

SELECT DISTINCT K.PID1, P.PNAME FROM PERSON P, KNOWS K WHERE K.PID1=P.PID AND 
K.PID2 IN (SELECT P.PID FROM PERSON P WHERE P.CITY='Bloomington' 
		   INTERSECT 
		   SELECT W.PID FROM WORKSFOR W WHERE W.SALARY>=55000
		   INTERSECT 
		   SELECT DISTINCT PS.PID FROM PERSONSKILL PS
		  );


\qecho 'Problem 7'
/*Find the cname of each company who only employs man-
agers who make more than 50000.
Make the following three queries using the COUNT func-
tion: (Show the venn diagrams with conditions in pdf file)*/

CREATE VIEW MANAGER_SALARY AS 
SELECT C.CNAME FROM COMPANY C, WORKSFOR W, HASMANAGER HM  
WHERE C.CNAME=W.CNAME AND W.PID=HM.MID GROUP BY C.CNAME HAVING MIN(W.SALARY)<=50000

SELECT C.CNAME FROM COMPANY C EXCEPT SELECT MS.CNAME FROM MANAGER_SALARY MS;

\qecho 'Problem 8'
/*Find the pid and name of each person who knows at least
3 people who each have at most 2 managers.*/

CREATE VIEW KNOWS_PEOPLE AS 
SELECT DISTINCT P.PID, P.PNAME, COUNT(K.PID2) FROM PERSON P, KNOWS K WHERE P.PID=K.PID1 
GROUP BY P.PID HAVING COUNT(K.PID2)>=3 ORDER BY 1;

SELECT KP.PID, KP.PNAME FROM KNOWS_PEOPLE KP 
EXCEPT
SELECT DISTINCT P.PID, P.PNAME FROM PERSON P, KNOWS K, HASMANAGER HM 
WHERE P.PID=K.PID1 AND K.PID2=HM.EID GROUP BY P.PID HAVING COUNT(HM.MID)<=2 ORDER BY 1;

\qecho 'Problem 9'
/*Find the cname of each company that employs an even
number of persons who have at least 2 skills*/

CREATE VIEW ATLEAST_TWO_SKILLS AS 
SELECT PS.PID, W.CNAME, COUNT(PS.SKILL) FROM WORKSFOR W, PERSONSKILL PS 
WHERE W.PID=PS.PID GROUP BY PS.PID, W.CNAME HAVING COUNT(PS.SKILL)>=2 ORDER BY PS.PID;

SELECT C.CNAME FROM COMPANY C 
EXCEPT 
SELECT DISTINCT ATS.CNAME FROM ATLEAST_TWO_SKILLS ATS GROUP BY ATS.CNAME HAVING COUNT(ATS.PID)%2!=0;


\qecho 'Problem 10'
/*Find the pairs (p1, p2) of different person pids such that
the person with pid p1 and the person with pid p2 have the
same number of skills.*/

CREATE VIEW P_SKILL AS 
SELECT PS.PID, COUNT(PS.SKILL) AS NO_OF_SKILLS FROM PERSONSKILL PS GROUP BY PS.PID;

SELECT PSK1.PID, PSK2.PID, PSK1.NO_OF_SKILLS FROM P_SKILL PSK1, P_SKILL PSK2 
WHERE PSK1.PID!=PSK2.PID AND PSK1.NO_OF_SKILLS = PSK2.NO_OF_SKILLS;

-- Connect to default database
\c postgres

-- Drop database created for this assignment
DROP DATABASE mukulkajla;





