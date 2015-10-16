drop sequence info_pk;
drop trigger order_info_pk;
drop table order_info;

drop table order_list;

drop sequence res_pk;
drop trigger res_info_pk;
drop table res_info;

drop sequence group_pk;
drop trigger group_info_pk;
drop table group_info;

drop sequence user_pk;
drop trigger user_info_pk;
drop table user_info;


drop sequence admin_pk;
drop trigger admin_info_pk;
drop table admin_info;


create table user_info
(
	usid number,
	uname varchar(20) unique,
	upwd varchar(20) not null,
	ugender char(2) check(ugender='Ů' or ugender='��'),
	uemail varchar(40) not null,
	uphone varchar(15) not null,
	primary key(usid)
);
create sequence user_pk start with 101 increment by 1 maxvalue 1e30 nocycle nocache;   
create trigger user_info_pk
  before insert on user_info  
  for each row
  begin   
      select user_pk.nextval
      into :new.usid
      from dual;  
  END;
/
insert into user_info(uname,upwd,ugender,uemail,uphone) values('aaa','123123','��','fdsafd@163.com',1854364684351);
insert into user_info(uname,upwd,ugender,uemail,uphone) values('bbb','123123','��','fdsafd@163.com',1854364684351);
insert into user_info(uname,upwd,ugender,uemail,uphone) values('ccc','123123','��','fdsafd@163.com',1854364684351);
insert into user_info(uname,upwd,ugender,uemail,uphone) values('ddd','123123','��','fdsafd@163.com',1854364684351);
insert into user_info(uname,upwd,ugender,uemail,uphone) values('eee','123123','��','fdsafd@163.com',1854364684351);
insert into user_info(uname,upwd,ugender,uemail,uphone) values('fff','123123','��','fdsafd@163.com',1854364684351);
insert into user_info(uname,upwd,ugender,uemail,uphone) values('ggg','123123','��','fdsafd@163.com',1854364684351);


create table group_info
(
	GId number,
	GName varchar(20),
	primary key(GId)
);
create sequence group_pk start with 101 increment by 1 maxvalue 1e30 nocycle nocache;   
create trigger group_info_pk
  before insert on group_info  
  for each row
  begin   
      select group_pk.nextval
      into :new.GId
      from dual;  
  END;
/
insert into group_info(GId,GName) values(101,'�ͷ�');
insert into group_info(GId,GName) values(102,'������');



create table res_info
(
	RId number,
	GId number,
	RName varchar(20),
	RSpec varchar(20),
	RDetail varchar(200),
	RPrice number(8,2),
	RStatus varchar(4) default '����',
	primary key(RId),
	foreign key(GId)references group_info(GId)
);
create sequence res_pk start with 101 increment by 1 maxvalue 1e30 nocycle nocache;   
create trigger res_info_pk
  before insert on res_info  
  for each row
  begin   
      select res_pk.nextval
      into :new.RId
      from dual;  
  END;
/


create table order_list
(
	OId number primary key,								--�������
	usid number references user_info(usid),	--�����ύ��
	OTime date not null,						--�����ύʱ��
	OStatus varchar(10) default 'Ԥ����',	
	ODetail varchar(100) default '��'
);


create table order_info
(
  ORId number primary key,
  OId  number references order_list(OId),
  RId   number references res_info(RId),
  Start_Time date not null,
	End_Time date not null,
  OStatus varchar(10) default 'Ԥ����'
);
create sequence info_pk start with 101 increment by 1 maxvalue 1e30 nocycle nocache;   
create trigger order_info_pk
  before insert on order_info  
  for each row
  begin   
      select info_pk.nextval
      into :new.ORId
      from dual;  
  END;
/


create table admin_info
(
	AId	number primary key,
	AName varchar(40) not null unique,
	APwd varchar(40) not null,
	ALevel char(4) default '��ͨ' check(ALevel='����' or ALevel='��ͨ')
);
create sequence admin_pk start with 1 increment by 1 maxvalue 1e30 nocycle nocache;   
create trigger admin_info_pk
  before insert on admin_info
  for each row
  begin   
      select admin_pk.nextval
      into :new.AId
      from dual;  
  END;
/
insert into admin_info(AName,APwd,ALevel) values ('wyf','151515','����');
insert into admin_info(AName,APwd,ALevel) values ('wff','151515','��ͨ');
insert into admin_info(AName,APwd,ALevel) values ('add','151515','��ͨ');
insert into admin_info(AName,APwd,ALevel) values ('aad','151515','��ͨ');
insert into admin_info(AName,APwd,ALevel) values ('ada','151515','��ͨ');
insert into admin_info(AName,APwd,ALevel) values ('dad','151515','��ͨ');

insert into res_info(GId,RName,RSpec,RDetail,RPrice) values(101,'1001','���˼�','˵��˵��˵��˵��',50);
insert into res_info(GId,RName,RSpec,RDetail,RPrice) values(101,'1002','���˼�','˵��˵��˵��˵��',50);
insert into res_info(GId,RName,RSpec,RDetail,RPrice) values(101,'1003','���˼�','˵��˵��˵��˵��',50);
insert into res_info(GId,RName,RSpec,RDetail,RPrice) values(101,'1004','���˼�','˵��˵��˵��˵��',50);
insert into res_info(GId,RName,RSpec,RDetail,RPrice) values(101,'1005','���˼�','˵��˵��˵��˵��',50);
insert into res_info(GId,RName,RSpec,RDetail,RPrice) values(101,'1006','���˼�','˵��˵��˵��˵��',50);
insert into res_info(GId,RName,RSpec,RDetail,RPrice) values(101,'1007','���˼�','˵��˵��˵��˵��',50);
insert into res_info(GId,RName,RSpec,RDetail,RPrice) values(101,'1008','���˼�','˵��˵��˵��˵��',50);
insert into res_info(GId,RName,RSpec,RDetail,RPrice) values(101,'1009','���˼�','˵��˵��˵��˵��',50);
insert into res_info(GId,RName,RSpec,RDetail,RPrice) values(101,'2001','���˼�','˵��˵��˵��˵��',50);
insert into res_info(GId,RName,RSpec,RDetail,RPrice) values(101,'2002','���˼�','˵��˵��˵��˵��',50);

insert into res_info(GId,RName,RSpec,RDetail,RPrice) values(102,'һ�Ż�����','������30��','˵��˵��˵��˵��',50);
insert into res_info(GId,RName,RSpec,RDetail,RPrice) values(102,'���Ż�����','������30��','˵��˵��˵��˵��',50);
insert into res_info(GId,RName,RSpec,RDetail,RPrice) values(102,'���Ż�����','������30��','˵��˵��˵��˵��',50);
insert into res_info(GId,RName,RSpec,RDetail,RPrice) values(102,'�ĺŻ�����','������30��','˵��˵��˵��˵��',50);
insert into res_info(GId,RName,RSpec,RDetail,RPrice) values(102,'��Ż�����','������30��','˵��˵��˵��˵��',50);

commit;