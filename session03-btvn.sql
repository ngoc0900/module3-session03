create database QuanLySinhVien;
use QuanLySinhVien;
create table Class(
classId int primary key auto_increment,
className varchar(50) not null unique,
startDate date,
status bit(1)
);
create table Student(
studentId int primary key auto_increment,
studentName varchar(50) not null unique,
address  varchar(100) not null,
phone int not null,
status bit(1),
classId int not null,
foreign key (classId) references Class(classId)
);
create table Subject(
subId int primary key auto_increment,
subName varchar(50) not null unique,
credit  float not null,
status bit(1)
);
create table Mark(
markId int primary key auto_increment,
sub_Id int not null,
foreign key (sub_Id) references Subject(subId),
student_id int not null,
foreign key (student_id) references Student(studentId),
mark float not null,
examTime time
);
insert into Class(className,startDate,status) values
('A1','2024-01-28',1),
('A2','2024-08-15',0),
('A3','2024-12-25',1);
insert into Student(studentName,address,phone,status,classId) values 
('Ngọc','HP',01234,1,1),
('Lan Anh','HD',09876,1,2),
('Hoàng','HP',04567,0,3);
insert into Subject(subName,credit,status) values 
('Toán',6,0),
('Văn',4,1),
('Anh',5,1);
insert into Mark(sub_Id,student_id,mark,examTime) values 
(1,3,7,'01:45'),
(2,2,8,'01:45'),
(3,1,9,'01:45');

select * from Student where studentName like 'h%';
select * from Class where month(startDate) = 12;
select * from Subject where credit between 3 and 5;
update Student set classId = 2 where studentName = 'Hoàng';
SELECT Student.studentName, Subject.subName AS subName, Mark.mark
FROM Mark
JOIN Student ON Mark.student_id = Student.studentId
JOIN Subject ON Mark.sub_Id = Subject.subId
ORDER BY Mark.mark DESC, Student.studentName ASC;


