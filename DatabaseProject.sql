create database InteractiveRooms;
use InteractiveRooms;

create table Manager (
mangerId numeric(10) not null,
mang_firstName varchar(10) not null,
mang_middleName varchar(10) not null,
mang_lastName varchar(10) not null,
email varchar(25),
maangerPassword varchar(10) not null,
primary key (mangerId));

create table InteractiveRooms (
RoomId numeric(10) not null,
SectionName1 varchar(35) ,
SectionName2 varchar(35) ,
SectionName3 varchar(35) ,
SectionCapacity1 numeric(5) ,
SectionCapacity2 numeric(5) ,
SectionCapacity3 numeric(5) ,
RoomCapacity numeric(5) ,
ManagerId numeric(10),
primary key (RoomId) 
);


create table InteractiveRoomName  (
roomname_NUM numeric(10) not null,
room_Id numeric(10),
RoomName varchar(35) not null,
primary key (roomname_NUM));


create table Users (
userId numeric(10) not null,
user_firstName varchar(10) not null,
user_middleName varchar(10) not null,
user_lastName varchar(10) not null,
email varchar(25),
userPassword varchar(10),
Birthdate date,
primary key(userId));


create table UserJob (
user_Id  numeric(10) not null,
jobTitle varchar(25) not null,
primary key(user_Id));


create table Appointment(
appointmentId numeric(10), 
appointmentDate date  not null,
userId numeric(10),
primary key(appointmentId));

create table Timeslot (
SlotNumber numeric(10) not null,
Hours time not null,
appointment_Id numeric(10) ,
Booking_status boolean default false,
primary key(SlotNumber));


create table creatAppointment (
appointNumb serial NOT NULL,
appointment_Id numeric(10),
room_Id numeric(10),
primary key(appointNumb)
);

alter table InteractiveRooms
add constraint Fk_Mid
foreign key (managerID) references Manager (mangerId) on delete set null;

alter table InteractiveRoomName
add constraint roomid
foreign key (room_Id) references InteractiveRooms(RoomId) on delete set null;


alter table UserJob
add constraint Fk_useId
foreign key (user_Id ) references Users(userId);

alter table Timeslot 
add constraint Fk_timeS
foreign key (appointment_Id)  references Appointment (appointmentId) on delete CASCADE;

alter table creatAppointment 
add constraint Fk_app
foreign key (Appointment_Id)  references Appointment (appointmentId) on delete set null;

alter table creatAppointment 
add constraint Fk_ap
foreign key (room_Id)  references InteractiveRooms (roomId) on delete set null;



insert into Manager
values (394,'Ahmed','saleh','Alghazwi','ASA@hotmail.com', 'Was20021@e');

insert into Manager
values (390,'sara','mohamed','Alahmed','SMA@hotmail.com', 'Awal13@');

insert into Manager
values (400,'zahra','ali','Alahmed','ZAA@hotmail.com', 'IT0j#AIDr$');

insert into Manager
values (408,'hassan','bader','Aljaber','SMA@hotmail.com', 'E[qkvB9s8i');

insert into Manager
values (409,'Alwaleed','Ahmad','Alnaser','ALa@hotmail.com', '1ArViPCRba');

insert into Manager
values (410,'Ammar','Fahaad','alnasser','am@hotmail.com', 'oyQ75EdVwO');

insert into Manager
values (411,'Aseel','Jarrah','Alwahd','aseel190@hotmail.com', 'mZE7qACOBq');

select*from Manager;

insert into InteractiveRooms
values (90,'Groups','discussion',null,20,80,null,100,394);

insert into InteractiveRooms
values (1234,'Play roles',null,null,37,null,null,37,400);

insert into InteractiveRooms
values (8851,'discussion','Read','Write',32,20,20,72,390);

insert into InteractiveRooms
values (91,'Creativity',null,null,24,61,null,85,394);

insert into InteractiveRooms
values (92,'research','Reports',null,24,50,null,74,400);

insert into InteractiveRooms
values (99,'Activity','Play rols ','Song',24,44,27,145,400);

select*from  InteractiveRooms;

insert into Users
values (2200003816,'hawra','ameen','hulili','Hah@hotmail.com', 'X2hnyaWDpW' , '2001-5-2');

insert into Users
values (2200003814,'fatima','hassan','ghazwi','fati@hotmail.com', 'OtcW2RtM6X' , '2007-4-3');

insert into Users
values (2200003810,'hana','ahmeed','alshedi','Han@hotmail.com','AVaX0a8rAJ' , '2003-10-1');

insert into Users
values (2200003811,'layla','mohamed','albandri','Luayla19@hotmail.com','d7zIZmnI5j' , '1999-12-4');

insert into Users
values (2200003812,'lama','mohamed','alroished','Luammoh@hotmail.com','NBWk4V1F1A' , '1998-9-10');

insert into Users
values (2100003813,'Lamia','mohamed','alfrihi','Lummoh@hotmail.com','twqApi8q7u' , '2001-1-1');

select*from Users;


insert into Appointment
values(6767,'2022-6-9',056);

insert into Appointment
values(8676,'2022-9-5',056);

insert into Appointment
values(1000,'2022-2-3',056);

insert into Appointment
values(5333,'2022-1-2',056);

insert into Appointment
values(0032,'2022-6-10',056);

insert into Appointment
values(9990,'2022-6-12',056);

select*from Appointment;

insert into Timeslot 
values(1,'7:00',9990,false);
insert into Timeslot 
values(2,'9:00',6767,false);
insert into Timeslot 
values(9,'10:00',8676,false);
insert into Timeslot 
values(8,'2:00',1000,false);
insert into Timeslot 
values(6,'4:00',0032,false);

select*from Timeslot;

insert into UserJob 
values(2200003816,'teacher');

insert into UserJob 
values(2200003814,'Supervisor');

insert into  UserJob 
values(2200003810,'teacher');

insert into UserJob 
values(2200003811,'proffessor');

insert into UserJob 
values(2200003812,'teacher');

insert into UserJob 
values(2100003813,'teacher');

select*from UserJob;


insert into InteractiveRoomName
values(1,91,'Creativity hall ');

insert into InteractiveRoomName
values(2,92,'scientific research hall');

insert into InteractiveRoomName
values(3,99,'meetings hall');

insert into InteractiveRoomName
values(4,1234,'smart hall');

insert into  InteractiveRoomName
values(5,99,'Meeting hall');

insert into InteractiveRoomName
values(6,92,' groups hall');

select*from InteractiveRoomName;

insert into creatAppointment (appointment_Id , room_Id)
values(8676,90);

insert into creatAppointment (appointment_Id , room_Id)
values(5333,1234);

insert into creatAppointment (appointment_Id , room_Id)
values(9990,8851);

 insert into creatAppointment (appointment_Id , room_Id)
values(0032, 92);

insert into creatAppointment (appointment_Id , room_Id)
values(1000,99);

insert into creatAppointment (appointment_Id,room_Id)
values(6767,99);

select*from creatAppointment;


select  userId, user_firstName from Users
Union 
select user_Id ,jobTitle from UserJob;


select  appointmentId,room_Id , userId, appointmentDate
from  creatAppointment 
inner join 
Appointment
on appointmentId = appointment_Id
order by appointmentId ;

select distinct userId
from Appintment;

select sum(Hours)
from Timeslot;

select min(Hours)
from Timeslot;

select * from Appointment 
where appointment in ( '2022-6-9' ,  '2022-9-5');

select * from Timeslot 
where Hours between '7:00' and '10:00';

select RoomId, SectionName1, SectionName2, SectionName3,
isnull(SectionName2) 
from InteractiveRooms;

select * from Users where user_firstName like 'l%';
select * from Users where user_firstName not like 'l%';

SELECT mang_firstName, mang_middleName FROM Manager
WHERE mangerId > (SELECT MIN(roomCapacity) 
		FROM InteractiveRooms);
        
SELECT COUNT(roomId) as rooms,roomCapacity
FROM InteractiveRooms
GROUP BY roomCapacity;

SELECT COUNT(roomId) as rooms,roomCapacity
FROM InteractiveRooms
GROUP BY roomCapacity
HAVING COUNT(roomId)<90;

select roomId,sectionName1,sum(roomCapacity*4) from InteractiveRooms
group by roomId;

CREATE INDEX Users_idx
  ON Users (email);
  
    DELIMITER //
  create procedure display_managers() 
  begin 
   select *from Manager; 
  end//
  DELIMITER ;
call display_managers();


delimiter |
CREATE TRIGGER testref BEFORE INSERT ON Manager
  FOR EACH ROW
  BEGIN
    INSERT INTO Manager SET mang_firstName = NEW.mang_firstName;
  END;
|
delimiter ;


CREATE assertion  Assertcapacity  CHECK (   
  NOT EXISTS ( SELECT mang_firstName FROM Manager
               WHERE mangerId>390));



