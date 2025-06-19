
create database cinema;
use cinema;
create table customer(
customerID int(25)not null,
phoneNo int(13),
email varchar(200) unique, -- add unique or not 
FName varchar(20),
LName varchar(20),
DOB date,
constraint customerID_PK primary key(customerID)
);
insert into cinema.customer values 
(223211251,543341810,'Kawla@gamil.com','Khawla','Al-Hamid','2002-02-20');

insert into cinema.customer values 
(224211256,563841826,'Ahmed66@gmail.com','Ahmed','Al-Gahazali','2000-11-01');
insert into cinema.customer values
(225211257,513831835,'Yaser@gmail.com','Yaser','Farouk','1998-05-18');
insert into cinema.customer values
(226211258,510831854,'Jana@gmail.com','Jana','Rashid','2004-09-19');
insert into cinema.customer values
(227211259,519831863,'Hasnaa@gmail.com','Hasnaa','Al-Alshaykh','1990-10-19');

use cinema;
create table theater(
theaterID int(20) not null,
TName varchar(20),
cityName varchar(50),
streetNo varchar(50),
seat int (50),
constraint TheaterID_PK primary key(theaterID)
);
insert into theater values 
(101,'VOX CINEMAS','Jeddah','King Abdul Aziz Rd, 21146,',11),
(102,'VOX CINEMAS','Riyadh','As Suwaidi Al Am, 12791',20),
(103,'VOX CINEMAS','Jeddah','Al Awwal Rd,22338',22),
(104,'VOX CINEMAS','Jeddah',' Abdullah Souliman street,21146',24),
(105,'VOX CINEMAS','Riyadh','King Fahd, 12272',15);

use cinema;
create table ticket(
ticketID int(200) not null,
customerID int(11),
constraint ticket_PK primary key(ticketID),
CONSTRAINT ticket_FK1 FOREIGN KEY (customerID) REFERENCES customer(customerID) ON DELETE CASCADE
);
insert into ticket values  -- must have the same values customerID
(11,223211251),
(12,224211256),
(13,225211257),
(14,226211258),
(15,227211259);

create table snack(-- More Info  
snackName varchar(200) not null,-- i donot know pk or not 
price int(100),
customerID int(11),
constraint snack_Name primary key(snackName),
CONSTRAINT snack_FK1 FOREIGN KEY (customerID) REFERENCES customer(customerID) ON DELETE CASCADE);
insert into snack values -- the values must have the same
('Popcorn',30,223211251),
('Nachos',48,224211256),
('Pringles',20,225211257),
('Hotdog',32,226211258),
('Dinamit sharmab',35,227211259);

use cinema;
create table movieShow(
showtTime varchar (30) not null,
movieID int(200), 
constraint movieShow_PK1 primary key(showtTime),
CONSTRAINT movieShow_FK1 FOREIGN KEY (movieID) REFERENCES movie(movieID) ON DELETE CASCADE
);
insert into cinema.movieShow values 
('10:45PM',110),
('9:15PM',111),
('2:00AM',112),
('4:00PM',113),
('3:55AM',114);

use cinema;
create table movie(
movieID int (30),
duration int(200), 
MLanguage varchar(50),
Gener varchar(50),
MName varchar(50),
constraint movie_PK1 primary key(movieID)
);
insert into cinema.movie values 
(110,104,'English','Drama','The Teachers’Lounge'),
(111,98,'English ','Comidy','Next Goal Wins'),
(112,108,'English','Thriller','Sunrise'),
(113,100,'English','History','Society of the Snow'),
(114,160,'English','animation','Migration');

use cinema;
create table offers(
theaterID int (30),
movieID int(200), 
CONSTRAINT offers_FK1 FOREIGN KEY (theaterID) REFERENCES theater(theaterID) ON DELETE CASCADE,
CONSTRAINT offers_FK2 FOREIGN KEY (movieID) REFERENCES movie(movieID) ON DELETE CASCADE
);
insert into cinema.offers values 
(101,110),
(102,111),
(103,112),
(104,113),
(105,114);

use cinema;
create table has(
theaterID int(20),
movieID int (30),
ticketID int(200),
CONSTRAINT has_FK1 FOREIGN KEY (ticketID) REFERENCES ticket(ticketID) ON DELETE CASCADE,
CONSTRAINT has_FK2 FOREIGN KEY (theaterID) REFERENCES theater(theaterID) ON DELETE CASCADE,
CONSTRAINT has_FK3 FOREIGN KEY (movieID) REFERENCES movie(movieID) ON DELETE CASCADE
); insert into cinema.has values
(101,110,11),
(102,111,12),
(103,112,13),
(104,113,14),
(105,114,15);

