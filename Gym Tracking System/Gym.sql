

-- ************** GYM MANAGEMENT TRACKING DATABASE SYSTEM *****************

------------------- Table GYM ------------------------
--#1
CREATE TABLE gym (
gym_id int NOT NULL PRIMARY KEY,
gym_name varchar(500) NOT NULL,
gym_description varchar(2000) DEFAULT NULL,
gym_address varchar(50) NOT NULL,
gym_contact varchar(50) NOT NULL
);
INSERT ALL
INTO gym VALUES(100, 'Sweat Out Gym', 'Progress is progress, no matter how small', '4545 St. Claire', '748-931-327')
INTO gym VALUES(101, 'GoodLife Fitness', ' we�ve launched the Best Gyms awards program: to highlight excellence in Canadian fitness and provide guidance on how you can find the best gym for you needs.', 'Woodhill centre', '667-800-327')
INTO gym VALUES(102, 'Cardio Workout', 'has plenty of cardio and strength machines, free weights, group classes, and a lot of amenities.', '343 Derry Road', '462-912-748')
INTO gym VALUES(103, 'Yoga Wellness Concord', 'Wellness is our Goal', '1750 Steels Avenue', '873-973-125')
INTO gym VALUES(104, 'Fit Factory Fitness', 'Fitness shop & gym with 2 training rooms, 300+ monthly classes & state-of-the-art training studio.', 'Dundas Drive', '+1 993156327')
INTO gym VALUES(105, 'Dwell Gym', 'Completely private, individual change rooms and showers and provide towel service', 'Carlingview drive', '242-932-667')
INTO gym VALUES(106, 'GoGo muscle training', 'We train our clients one-on-one with the latest and greatest Electric Muscle Stimulation technology, resulting in track-proven efficiency and result. ', '78 McNaughton', '679-312-6672')
INTO gym VALUES(107, 'Pure Fitness Training Studio', 'At PURE Fitness Health and Training Studio, we believe that balance in both training and life provides not only your best results, but ensures one is enjoying life to its fullest.', 'Ripon Street', '456-123-098')
INTO gym VALUES(108, '24 Hour Fitness', ' Our sparkling clean gyms are waiting for you, with thousands of square feet of premium strength and cardio equipment, turf zones, lap pools, steam rooms and more', '5785 Marigold shore', '371-983-323')
INTO gym VALUES(109, 'Planet Fitness', 'You�ll soon find a Well Health Safety Seal on the front door of every Planet Fitness club. Backed by science and evaluated by third-party experts, this seal means you can run, curl, lift, squat, press, walk and gym confidently in the Clean Thumb Club', '5785 Jetliner Ave.', '432-643-323')
SELECT * FROM dual;

--STORED PROCEDURE FOR GYM TABLE
--INSERT DATA
create or replace PROCEDURE spGymInsert (gymID IN INTEGER, gymName IN STRING, gymDesc IN STRING, gymAddress IN STRING, gymContact IN STRING, result out string)
AS
BEGIN
INSERT INTO gym (gym_id,gym_name,gym_description, gym_address, gym_contact)
VALUES (444, 'Fit4Less', 'Every BODY Happy', '7205 Goreway Drive', '678-045-432');
result := SQL%rowcount;
dbms_output.put_line('There were a total of ' || result || ' rows inserted');
EXCEPTION
WHEN OTHERS
 THEN
 DBMS_OUTPUT.PUT_LINE ('Error!');
END;

--UPDATE PROCEDURE
create or replace PROCEDURE spGymUpdate (gymID IN INTEGER, gymName IN STRING, gymDesc IN STRING, gymAddress IN STRING, gymContact IN STRING, result out string)
as
BEGIN
UPDATE gym
SET gym_name='UPDATE your BODY'
WHERE
gym_id=444;
result := SQL%rowcount;
dbms_output.put_line(result || ' rows updated');
EXCEPTION
WHEN OTHERS
 THEN
 DBMS_OUTPUT.PUT_LINE ('Error!');
END;

--DELETE PROCEDURE 
create or replace PROCEDURE spGymDelete (gymID IN INTEGER, result out integer)
as
BEGIN
DELETE FROM gym
WHERE
gym_id=111;
result := SQL%rowcount;
dbms_output.put_line(result || ' rows deleted');
EXCEPTION
WHEN OTHERS
 THEN
 DBMS_OUTPUT.PUT_LINE ('Error!');
END;

--SELECT PROCEDURE -- GYM TABLE
set serveroutput on; 
DECLARE
gymID NUMBER := 102;
gymName varchar(500);
gymDescription varchar(2000);
gymAddress varchar(50);
gymContact varchar(50);
BEGIN
 SELECT gym_name,gym_description, gym_address, gym_contact
INTO gymName, gymDescription, gymAddress, gymContact
 FROM gym
 WHERE gym_id = gymID;
  DBMS_OUTPUT.PUT_LINE ('GYM ID: ' || gymID);
 DBMS_OUTPUT.PUT_LINE ('GYM Name: ' || gymName);
 DBMS_OUTPUT.PUT_LINE ('GYM DESCRIPTION: ' || gymDescription);
 DBMS_OUTPUT.PUT_LINE ('GYM ADDRESS: ' || gymAddress);
 DBMS_OUTPUT.PUT_LINE ('GYM CONTACT: ' || gymContact);
END;

------------------- Table TRAINERS ------------------------
--#2
CREATE TABLE trainers (
tr_id int NOT NULL ,
gym_id int NOT NULL,
tr_fname varchar(100) NOT NULL,
tr_lname varchar(100) NOT NULL,
tr_age int NOT NULL,
tr_gender varchar(50) NOT NULL,
tr_phonenum int NOT NULL,
tr_address varchar(200) NOT NULL,
tr_email varchar(200) NOT NULL,
PRIMARY KEY (tr_id),
FOREIGN KEY (gym_id) REFERENCES gym (gym_id)
);

INSERT ALL
INTO trainers VALUES(1, 100, 'Inosh' , 'Nihan', 26, 'Male',6471234567,'1/2 castle avenue warden ','inoshnihan@gmail.com')
INTO trainers VALUES(2, 106, 'Azam' , 'Jazeel', 30, 'Male',6472484567,'2/2 brampton road calgary','azamjazeel042@gmail.com')
INTO trainers VALUES(3, 103, 'Pooja' , 'Hedge', 28, 'Female',4161200567,'3/2 markham road northyork','poojhed90@gmail.com')
INTO trainers VALUES(4, 100, 'Shruthi' , 'Vigneshwaran', 23, 'Female',6474434567,' 8 nations midland avenue brampton','shru1998@gmail.com')
INTO trainers VALUES(5, 106, 'Samantha' , 'Prabhu', 25, 'Female',6455434567,' 8/1 midland avenue brampton','samantharud2@gmail.com')
INTO trainers VALUES(6, 103, 'Arya' , 'Mahaan', 32, 'Male',6455224567,' 6459 Holmberg Street calgary','arya22@gmail.com')
INTO trainers VALUES(7, 103, 'Surya' , 'Faizal', 35, 'Male',6245224567,' 6227 Glacier Hill Street Ottawa','suryafaiz1@gmail.com')
SELECT * FROM dual;

--insert procedure
create or replace PROCEDURE spTrainersInsert (tid in INTEGER,gymID in integer, trFname in string, trLname in string, trAge in string, trGender in string, trPhoneNo in string, trAddress in string, trEmail in string, result out string) as 
BEGIN 
INSERT INTO trainers (tr_id, gym_id, tr_fname, tr_lname,tr_age, tr_gender, tr_phonenum, tr_address, tr_email) 
VALUES (18,106,'Riya','Manoj', 24, 'Female',6478403948, '6/1 milner avenue alberta','riyamano982@yahoo.com'); 
result := SQL%rowcount; 
dbms_output.put_line(' There were a total of ' || result || ' rows inserted.');
EXCEPTION
WHEN OTHERS
 THEN
 DBMS_OUTPUT.PUT_LINE ('Error!');
 END;
 
 --update trainers procedure
 Create 
or replace PROCEDURE spTrainersUpdate (tid in INTEGER, trEmail in string, result out string) 
as BEGIN 
UPDATE 
  trainers 
SET 
  tr_email = 'riyaman001@hotmail.com' 
WHERE 
  tr_id = 18;
result := SQL % rowcount;
dbms_output.put_line('There were a total of ' || result || ' rows updated');
EXCEPTION
WHEN OTHERS
 THEN
 DBMS_OUTPUT.PUT_LINE ('Error!');
END;

--delete trainers procedure
create or replace PROCEDURE spTrainersDelete (tid in INTEGER, result out string) as 
BEGIN 
DELETE FROM trainers 
WHERE 
  tr_id=18;
result := SQL % rowcount;
dbms_output.put_line('There were a total of ' || result || ' rows deleted'); 
EXCEPTION
WHEN OTHERS
 THEN
 DBMS_OUTPUT.PUT_LINE ('Error!');
END; 

------------------- Table EQUIPMENTS ------------------------
--#3
CREATE TABLE EQUIPMENTS (
equip_id INT PRIMARY KEY,
gym_id INT NOT NULL,
equip_name VARCHAR(20) NOT NULL,
equip_type VARCHAR(20) NOT NULL,
equip_desc VARCHAR(200) NOT NULL,
FOREIGN KEY (gym_id) REFERENCES gym(gym_id)
);

INSERT INTO EQUIPMENTS VALUES(20,101,'BENCH','WEIGHT','It is used for performing weight training exercise');
INSERT INTO EQUIPMENTS VALUES(21,102,'DUMBELL','WEIGHT','It is used for performing weight training exercise');
INSERT INTO EQUIPMENTS VALUES(22,103,'TREADMILL','CARDIO','It is used for performing warmm-up/training exercise');
INSERT INTO EQUIPMENTS VALUES(23,104,'FITNESS BALL','CARDIO','It is used for performing bicep curls,dead bugs exercise');
INSERT INTO EQUIPMENTS VALUES(24,105,'BICYCLE','WEIGHT','It is used for performing warm-up/training exercise');
INSERT INTO EQUIPMENTS VALUES(25,106,'WEIGHT PLATES','WEIGHT','It is used for performing weight lifting training exercise');
INSERT INTO EQUIPMENTS VALUES(26,107,'JUMP ROPES','WEIGHT','It is used for performing warm-up/training exercise');

-- insert
create or replace PROCEDURE spEquipmentsInsert (equipID IN INTEGER,result out string)
AS
BEGIN
INSERT INTO equipments (equip_id,gym_id,equip_name, equip_type, equip_desc)
VALUES(203,107,'BENCH','WEIGHT','It is used for performing weight training exercise');
result := SQL%rowcount;
dbms_output.put_line('There were a total of ' || result || ' rows inserted');
EXCEPTION
WHEN OTHERS
 THEN
 DBMS_OUTPUT.PUT_LINE ('Error!');
END;

--update
create or replace PROCEDURE spEquipmentsUpdate (equipID in INTEGER, result out string)
as
BEGIN
UPDATE equipments
SET equip_type='CARDIO'
WHERE
equip_id=203;
result := SQL%rowcount;
dbms_output.put_line(result || ' rows updated');
EXCEPTION
WHEN OTHERS
 THEN
 DBMS_OUTPUT.PUT_LINE ('Error!');
END;

--delete
create or replace PROCEDURE spEquipmentsDelete (equipID in INTEGER, result out string)
as
BEGIN
DELETE FROM equipments
WHERE
equip_id=203;
result := SQL%rowcount;
dbms_output.put_line(result || ' rows deleted');
EXCEPTION
WHEN OTHERS
 THEN
 DBMS_OUTPUT.PUT_LINE ('Error!');
END;

--select 
DECLARE
equipID NUMBER := 20;
gymID NUMBER;
equipName varchar(20);
equipType varchar(50);
equipDescription varchar(500);
BEGIN
 SELECT equip_id,gym_id, equip_name, equip_type,equip_desc 
INTO equipID, gymID, equipName, equipType, equipDescription
 FROM equipments
 WHERE equip_id = equipID;
  DBMS_OUTPUT.PUT_LINE ('EQUIPMENT ID: ' || equipID);
  DBMS_OUTPUT.PUT_LINE ('GYM ID: ' || gymID);
  DBMS_OUTPUT.PUT_LINE ('EQUIPMENT Name: ' || equipName);
  DBMS_OUTPUT.PUT_LINE ('EQUIPMENT TYPE: ' || equipType);
  DBMS_OUTPUT.PUT_LINE ('EQUIPMENT DESCRIPTION: ' || equipDescription);
END;

