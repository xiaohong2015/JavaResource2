
create database test;
use test;
drop table grade;
drop table teacheruser;
drop table stuuser;
drop table coursemsg;
drop table course;
drop table students;
drop table classes;
drop table depts;
drop table colleges;
create table colleges(
col_no char(2) primary key,col_name varchar(40) not null
);

create table depts(
dept_no char(4) primary key,col_no char(2) not null,dept_name varchar(40),
constraint depts_fk foreign key(col_no) references colleges(col_no)
);

create table classes(
class_no char(6) primary key,dept_no char(4) not null,col_no char(2),
class_name varchar(10) not null,
constraint classes_fk1 foreign key(dept_no) references depts(dept_no),
constraint classes_fk2 foreign key(col_no) references colleges(col_no)
);

create table students(
stu_no char(12) primary key,stu_name varchar(30) not null,stu_gender char(2) 
check(stu_gender='Ů' or stu_gender='��'),stu_birthday datetime,
nativeplace varchar(80),col_no char(2) not null,dept_no char(4) not null,
class_no char(6) not null,mianmao varchar(10),cometime datetime not null,
constraint stu_fk1 foreign key(class_no) references classes(class_no),
constraint stu_fk2 foreign key(dept_no) references depts(dept_no),
constraint stu_fk3 foreign key(col_no) references colleges(col_no)
);

create table course(
cou_no char(6) primary key,cou_name varchar(40) not null,xuefen numeric(3,1) not null,
col_no char(2) not null,dept_no char(4) not null,
constraint cou_fk1 foreign key(dept_no) references depts(dept_no),
constraint cou_fk2 foreign key(col_no) references colleges(col_no)
);

create table coursemsg(
cou_no char(6),cou_day char(1),cou_time char(1),teacher varchar(30) not null,
onchosing char(1) default '0',
constraint coumsg_fk1 foreign key(cou_no) references course(cou_no),
constraint coumsg_key primary key(cou_no,cou_day,cou_time)
);

create table grade(
stu_no char(12),cou_no char(6),score numeric(4,1) default 0,isdual numeric(1) default 0,
constraint grade_fk1 foreign key(cou_no) references course(cou_no),
constraint grade_fk2 foreign key(stu_no) references students(stu_no),
constraint grade_key primary key(stu_no,cou_no)
);

create table teacheruser(
uid char(6) primary key,
pwd char(12) not null,
col_no char(2) not null,
constraint user_fk1 foreign key(col_no) references colleges(col_no)
);

create table stuuser(
stu_no char(12) primary key,
pwd char(12) not null,
constraint user_fk2 foreign key(stu_no) references students(stu_no)
);

insert into colleges values('01','��������Զ�����ѧԺ');
insert into colleges values('02','��е����ѧԺ');

insert into depts values('0101','01','�Զ���רҵ');
insert into depts values('0102','01','�Ǳ�רҵ');
insert into depts values('0103','01','�����רҵ');

insert into depts values('0201','02','��е���רҵ');
insert into depts values('0202','02','��ҵ����רҵ');
insert into depts values('0203','02','��е����רҵ');

insert into classes values('010101','0101','01','һ��');
insert into classes values('010102','0101','01','����');
insert into classes values('010201','0102','01','һ��');
insert into classes values('010202','0102','01','����');
insert into classes values('010301','0103','01','һ��');
insert into classes values('010302','0103','01','����');
insert into classes values('010303','0103','01','����');

insert into classes values('020101','0201','01','һ��');
insert into classes values('020102','0201','01','����');
insert into classes values('020201','0202','01','һ��');
insert into classes values('020202','0202','01','����');
insert into classes values('020301','0203','01','һ��');
insert into classes values('020302','0203','01','����');
insert into classes values('020303','0203','01','����');


insert into students values('200501030318','����','��','1986-11-1','�ӱ�ʡ������','01','0103','010303','��Ա','2005-9-1');
insert into students values('200501030218','����','��','1986-12-10','�ӱ�ʡ��ɽ��','01','0103','010302','ѧ��','2005-9-1');
insert into students values('200501020319','����','��','1986-11-1','�ӱ�ʡʯ��ׯ��','01','0102','010303','ѧ��','2005-9-1');
insert into students values('200502020319','����','��','1986-11-1','�ӱ�ʡ������','02','0202','010303','ѧ��','2005-9-1');
insert into students values('200501030319','����','��','1986-11-1','�ӱ�ʡ������','02','0202','010303','ѧ��','2005-9-1');

insert into stuuser values('200501030318','200501030318');
insert into stuuser values('200501030218','200501030218');
insert into stuuser values('200501020319','200501020319');
insert into stuuser values('200502020319','200502020319');
insert into stuuser values('200501030319','200501030319');
insert into teacheruser values('wyf','123456','01');
insert into teacheruser values('cgq','123456','02');

insert into course values('010301','���������',2.5,'01','0103');
insert into course values('010302','���������',2,'01','0103');
insert into course values('010303','�������������',3.5,'01','0103');
insert into course values('010201','���ֵ�·',2.5,'01','0102');
insert into course values('010202','ģ���·',3.5,'01','0102');
insert into course values('010101','�Զ���ԭ��',3.5,'01','0101');

insert into course values('020101','��е��ͼ',3.5,'02','0201');
insert into course values('020201','��ҵ����ԭ��',3.5,'02','0202');
insert into course values('020301','��е�������',3.5,'02','0203');
insert into course values('020302','���켼��',3.5,'02','0203');

insert into coursemsg(cou_no,cou_day,cou_time,teacher) values('010101',1,2,'aaaa');
insert into coursemsg(cou_no,cou_day,cou_time,teacher) values('010303',3,3,'bbb');
insert into grade values('200501030318','010101',0,0);
insert into grade values('200501030318','010303',0,0);
insert into grade values('200501030218','010101',0,0);
