drop sequence borrow_pk;
drop trigger borrow_list_pk;

drop sequence amercement_pk;
drop trigger amercement_pk;

drop sequence order_list_pk;
drop trigger order_list_pk;

drop table order_list;
drop table amercement;
drop table borrow_list;
drop table student;
drop table book;
drop table manage;

create table student
(
   StudentNO varchar(20) primary key,  	/*ѧ�ż���¼��*/
   Password varchar(20),    		/*����*/
   Name varchar(20),      		/*ѧ������*/
   Age int,        			/*ѧ������*/
   Gender varchar(2),      		/*ѧ���Ա�*/
   Class varchar(50),      		/*���ڰ༶*/
   Department varchar(50),    		/*����ϵ*/
   Permitted int      			/*����Ȩ�� 1:�н���Ȩ�� 0:û��Ȩ��*/
 );
create table book
(
   BookNO varchar(10) primary key,  	/*ͼ����*/
   BookName varchar(50),   		/*����*/
   Author varchar(50),    		/*����*/
   Publish varchar(50),   		/*������*/
   BookIsbn varchar(20),  		/*ISBN��*/
   BuyTime varchar(50),   		/*����ʱ��*/
   BookPrice number(5,2),    		/*ͼ��۸�*/
   BookStatus int default 0   		/*Borrowed 2:��ʧ  1:���  0:�ڿ⿼��2*/
);
create table borrow_list
(
  BorrowNO int,				/*�����������������*/
  StudentNO varchar(20),		/*ѧ�����*/
  BookNO varchar(10),			/*������*/
  StartTime varchar(20) not null,	/*��ʼʱ��*/
  End varchar(20) not null,		/*����ʱ��*/
  XuJie int default 0,			/*�Ƿ������־*/
  Deal int default 0,			/*0:δ�黹 1:�ѹ黹 2:��ʧ*/
  primary key(BorrowNO),		/*����*/
  Foreign key(StudentNO) references student(StudentNO) on delete cascade, 
  Foreign key(BookNO) references book(BookNO) on delete cascade
);

CREATE SEQUENCE borrow_pk START WITH 1 INCREMENT BY 1 MAXVALUE 1E30 NOCYCLE NOCACHE;   
CREATE TRIGGER borrow_list_pk
  BEFORE INSERT ON borrow_list   
  FOR EACH ROW
  BEGIN   
      select borrow_pk.nextval
      into :new.BorrowNO
      from dual;  
  END;
/
create table amercement			/*Ƿ���*/
(
  AmerceNO number,			/*��������*/
  BorrowNO number,			/*�����¼��Ӧ�Ľ����¼*/
  StudentNO varchar(20),		/*�����¼��Ӧ��ѧ��ѧ��*/
  Detail varchar(20) not null,		/*������Ŀ ����/����*/
  Mulct number(5,2) not null,		/*������*/
  Pay number(1) default 0,		/*�Ƿ����Ĭ��Ϊû�н���*/
  PayTime varchar(20),			/*����ʱ��*/
  primary key(AmerceNO),
  Foreign key(BorrowNO) references borrow_list(BorrowNO) on delete cascade,
  Foreign key(StudentNO) references student(StudentNO) on delete cascade
);
CREATE SEQUENCE amercement_pk START WITH 1 INCREMENT BY 1 MAXVALUE 1E30 NOCYCLE NOCACHE;   
CREATE TRIGGER amercement_pk
  BEFORE INSERT ON amercement   
  FOR EACH ROW
  BEGIN   
      select amercement_pk.nextval
      into :new.AmerceNO
      from dual;  
  END;  
/
create table order_list
(
  OrderNO number,
  StudentNO varchar(20),	/*ԤԼͼ���ѧ��ѧ��*/
  BookNO varchar(10),		/*��ԤԼͼ�����*/
  EndTime varchar(20),		/*ԤԼͼ���ֹ����*/
  primary key(OrderNO),
  Foreign key(StudentNO) references student(StudentNO) on delete cascade, 
  Foreign key(BookNO) references book(BookNO) on delete cascade  
); 
CREATE SEQUENCE order_list_pk START WITH 1 INCREMENT BY 1 MAXVALUE 1E30 NOCYCLE NOCACHE;   
CREATE TRIGGER order_list_pk
  BEFORE INSERT ON order_list   
  FOR EACH ROW
  BEGIN   
      select order_list_pk.nextval
      into :new.OrderNO
      from dual;  
  END;
/

create table manage
(
  ManageID varchar(20),			/*����Ա��¼��*/
  ManagePwd varchar(20) not null,	/*����Ա����*/
  ManageLevel number(1) default 0,	/*����Ա���� 1:��������Ա*/
  primary key(ManageID)
);




-------------------------------------------------------------


insert into manage values('wyf','123456',1);
insert into manage values('wyy','123456',0);
insert into manage values('zrk','123456',0);
insert into manage values('cgq','123456',0);
insert into manage values('hxl','123456',0);
insert into manage values('zrx','123456',0);
insert into manage values('xzh','123456',0);
insert into manage values('syb','123456',0);

insert into student values('200501','200501','����',20,'��','07�������3��','�ƿ�ѧԺ',1);
insert into student values('200502','200502','����',22,'��','05�����1��','��ͨѧԺ',1);
insert into student values('200503','200503','����',21,'��','06����е���1��','��еѧԺ',1);
insert into student values('200504','200504','�ܷ�',21,'Ů','06����ľ����2��','����ѧԺ',1);
insert into student values('200505','200505','��ϼ',20,'Ů','07����������1��','����ѧԺ',1);
insert into student values('200506','200506','�Ƽ�',22,'Ů','05�������1��','�ƿ�ѧԺ',1);
insert into student values('200507','200507','��ɺ',21,'Ů','06���Ǳ�1��','�ƿ�ѧԺ',1);
insert into student values('200508','200508','��ԭ',21,'��','07�����1��','����ѧԺ',1);

insert into book(BookNO,BookName,Author,Publish,BookIsbn,BuyTime,BookPrice) values('368779','ʹ��Ant����Java����','[��]Erik Hatcher Steve Lougharn','���ӹ�ҵ������','7121016834','2008-5-26',69.00);
insert into book(BookNO,BookName,Author,Publish,BookIsbn,BuyTime,BookPrice) values('454908','��ͨCSS+DIV��ҳ��ʽ�벼��','��˳����','�����ʵ������','9787115163042','2008-2-13',49.00);
insert into book(BookNO,BookName,Author,Publish,BookIsbn,BuyTime,BookPrice) values('487923','Visual C++���������','���������','�廪��ѧ������','9787302069140','2008-2-13',35.00);
insert into book(BookNO,BookName,Author,Publish,BookIsbn,BuyTime,BookPrice) values('358134','JavaSE6.0���ָ��','���Ƿ� �ͳ�����','�����ʵ������','9787115167408','2007-12-14','98.00');
insert into book(BookNO,BookName,Author,Publish,BookIsbn,BuyTime,BookPrice) values('123456','NetBeansȨ��ָ��','���� �Ѷ��� ��������','���ӹ�ҵ������','9787121063206','2007-11-14','75.00');
insert into book(BookNO,BookName,Author,Publish,BookIsbn,BuyTime,BookPrice) values('133456','Jsp2.0�����ֲ�','���Ͻ� �ֿ�˾����','���ӹ�ҵ������','9787505398245','2007-12-14','59.00');
insert into book(BookNO,BookName,Author,Publish,BookIsbn,BuyTime,BookPrice) values('233456','�����ģʽ','�̽� ��','�廪��ѧ������','9787302162063','2008-5-14','45.00');
insert into book(BookNO,BookName,Author,Publish,BookIsbn,BuyTime,BookPrice) values('333456','��¥��','��ѩ�� �߶�','�ӱ����������','9787806484852','2008-5-14','26.80');
insert into book(BookNO,BookName,Author,Publish,BookIsbn,BuyTime,BookPrice) values('351160','UNIX�����̳�','[��]Amir Afzal ��','���ӹ�ҵ������','9787121058981','2008-5-14','39.00');
insert into book(BookNO,BookName,Author,Publish,BookIsbn,BuyTime,BookPrice) values('543235','Spring2.0�����ֲ�','������ ��','���ӹ�ҵ������','9787121039850','2008-5-14','49.80');
insert into book(BookNO,BookName,Author,Publish,BookIsbn,BuyTime,BookPrice) values('463235','Struts2Ȩ��ָ��','��ձ���','���ӹ�ҵ������','9787121048531','2008-5-14','79.00');
insert into book(BookNO,BookName,Author,Publish,BookIsbn,BuyTime,BookPrice) values('643457','XMLʵ���̳�','������ȱ���','�廪��ѧ������','9787302154884','2008-5-14','39.00');
insert into book(BookNO,BookName,Author,Publish,BookIsbn,BuyTime,BookPrice) values('354770','��ͨJavaWeb����','���������','�����ʵ������','9787115155351','2008-6-14','59.00');
insert into book(BookNO,BookName,Author,Publish,BookIsbn,BuyTime,BookPrice) values('967564','���ݿ�ϵͳ����','��ʦ�� ��ɺ','�ߵȽ���������','9787040074949','2008-8-14','25.10');
insert into book(BookNO,BookName,Author,Publish,BookIsbn,BuyTime,BookPrice) values('876462','JAVA��������� ','������ ����','���ӹ�ҵ������','9787121025389','2008-7-14','65.80');
insert into book(BookNO,BookName,Author,Publish,BookIsbn,BuyTime,BookPrice) values('465127','Java����Ա���Ա���','ŷ���� ��÷ ��� ����','���ӹ�ҵ������','9787121045523','2008-7-14','46.00');
insert into book(BookNO,BookName,Author,Publish,BookIsbn,BuyTime,BookPrice) values('620928','Java��ģʽ(����) ','�ֺ� ����','���ӹ�ҵ������','9787505380004','2008-7-14','88.00');
insert into book(BookNO,BookName,Author,Publish,BookIsbn,BuyTime,BookPrice) values('217690','Effective Java���İ�','(��)����� �� �˰��� ��','��е��ҵ������','9787111113850','2008-9-14','39.00');
insert into book(BookNO,BookName,Author,Publish,BookIsbn,BuyTime,BookPrice) values('532870','Tomcat��Java Web�����������(����)','�����٣����� ����','���ӹ�ҵ������','9787505393929','2008-9-14','45.00');


insert into borrow_list (StudentNO,BookNO,StartTime,End)values('200501','368779','2008-9-26','2008-11-15');
insert into borrow_list (StudentNO,BookNO,StartTime,End)values('200501','454908','2008-9-1','2008-10-30');
insert into borrow_list (StudentNO,BookNO,StartTime,End)values('200501','487923','2008-9-1','2008-10-30');
insert into borrow_list (StudentNO,BookNO,StartTime,End)values('200501','333456','2008-7-1','2008-9-1');
insert into borrow_list(StudentNO,BookNO,StartTime,End)values('200501','351160','2008-10-1','2008-11-30');
update book set BookStatus=1 where BookNO='368779';
update book set BookStatus=1 where BookNO='454908';
update book set BookStatus=1 where BookNO='487923';
update book set BookStatus=1 where BookNO='358134';

insert into order_list(StudentNO,BookNO,EndTime)values ('200502','358134','2008-10-16');
insert into order_list(StudentNO,BookNO)values ('200502','333456');
update book set BookStatus=1 where BookName='��¥��';

insert into order_list(StudentNO,BookNO,EndTime)values ('200502','358134','2008-10-16');
insert into order_list(StudentNO,BookNO)values ('200502','333456');

commit;