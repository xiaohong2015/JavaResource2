drop table AdminInfo;
drop table ProviderBackDetail;
drop table ProviderBack;
drop table ConsumerBackDetail;
drop table ConsumerBack;
drop table SellDetail;
drop table SellInfo;
drop table StockDetail;
drop table StockInfo;
drop table GoodsInfo;
drop table GoodsClassInfo;
drop table ProviderInfo;
drop table ConsumerInfo;

create table ConsumerInfo
(
	Cid varchar(20) primary key,
	Cname varchar(50) not null,
	Clinkman varchar(50) not null,
	Caddress varchar(50) not null,
	Ctel varchar(20) not null,
	Cemail varchar(50) default '����',
	Cremark varchar(100) default '����'
)engine innodb;


insert into consumerinfo values('10001','�洨ó��','������','��ɽ','1234567','ligong@sina.com','����');
insert into consumerinfo values('10002','��ɽ����','������','����','2134567','hebei@sina.com','����');
insert into consumerinfo values('10003','������','������','��ɽ','1234567','heut@sina.com','���޻�');
insert into consumerinfo values('10004','��ɽ�Ƽ�','������','��ɽ','1234567','heut@sina.com','����');
insert into consumerinfo values('10005','�ӱ�ó��','������','��ɽ','1234567','heut@sina.com','����');






create table ProviderInfo
(
	Pid varchar(20) primary key,
	Pname varchar(50) not null,
	Plinkman varchar(50) not null,
	Paddress varchar(50) not null,
	Ptel varchar(20) not null,
	Pemail varchar(50),
	Premark varchar(100)
)engine innodb;


insert into ProviderInfo values('10001','�ӱ�����','������','��ɽ','1234567','ligong@sina.com','����');
insert into ProviderInfo values('10002','��ɽ����','������','����','2134567','hebei@sina.com','����');
insert into ProviderInfo values('10003','��������','������','��ɽ','1234567','heut@sina.com','����');
insert into ProviderInfo values('10004','��ɽ���Գ�','������','��ɽ','1234567','heut@sina.com','����');
insert into ProviderInfo values('10005','�ӱ����Գ�','������','��ɽ','1234567','heut@sina.com','����');




create table GoodsClassInfo
(
	GCid varchar(20) primary key,
	GCname varchar(50) not null
)engine innodb;

insert into GoodsClassInfo values('10001','ˮ��');
insert into GoodsClassInfo values('10002','����');
insert into GoodsClassInfo values('10003','�ֻ�');
insert into GoodsClassInfo values('10004','����');
create table GoodsInfo
(
	Gid varchar(20) primary key,
	Gname varchar(50) not null,
	GCid varchar(20),
	Gamount int not null,
	Gunit varchar(10) not null,
	Gpin double not null,
	Gpout double not null,
	Foreign key(GCid) references GoodsClassInfo(GCid) on delete cascade
)engine innodb;

insert into GoodsInfo values('10001','ƻ��','10001',20,'��',10,20);
insert into GoodsInfo values('10002','��','10001',20,'��',10,20);
insert into GoodsInfo values('10003','����','10001',20,'��',10,20);
insert into GoodsInfo values('10004','����','10001',20,'��',10,20);
insert into GoodsInfo values('10005','�㽹','10001',20,'��',10,20);
insert into GoodsInfo values('10006','����ʼǱ�5000','10002',20,'̨',10,20);
insert into GoodsInfo values('10007','ƻ���ʼǱ�4100','10002',20,'̨',10,20);
insert into GoodsInfo values('10008','���ձʼǱ�3240','10002',20,'̨',10,20);
insert into GoodsInfo values('10009','�����ֻ�M630','10003',20,'̨',10,20);
insert into GoodsInfo values('10010','ŵ����5200','10003',20,'̨',10,20);
insert into GoodsInfo values('10011','����1100','10003',20,'̨',10,20);
insert into GoodsInfo values('10012','������ӻ�','10004',20,'̨',10,20);
insert into GoodsInfo values('10013','TCL���ӻ�','10004',20,'̨',10,20);

create table StockInfo
(
	Sid varchar(20) primary key,
	Pid varchar(20),
	Sdate Date,
	Sbuyer varchar(50),
	Stotalprice double not null,
	Foreign key(Pid) references ProviderInfo(Pid) on delete cascade
)engine innodb;



create table StockDetail
(
	SDid varchar(20) primary key,
	Sid varchar(20),
	Gid varchar(20),
	SDamount int not null,
	SDprice double,
	SDtotalprice double,
	Foreign key(Sid) references StockInfo(Sid) on delete cascade,
	Foreign key(Gid) references GoodsInfo(Gid) on delete cascade
)engine innodb;

create table SellInfo
(
	Eid varchar(20) primary key,
	Cid varchar(20),
	Edate Date,
	Eseller varchar(50),
	Etotalprice double not null,
	Foreign key(Cid) references ConsumerInfo(Cid) on delete cascade
)engine innodb;

create table SellDetail
(
	EDid varchar(20) primary key,
	Eid varchar(20),
	Gid varchar(20),
	EDamount int not null,
	EDprice double,
	EDtotalprice double,
	Foreign key(Eid) references SellInfo(Eid) on delete cascade,
	Foreign key(Gid) references GoodsInfo(Gid) on delete cascade
)engine innodb;



create table ConsumerBack
(
	CBid varchar(20) primary key,
	Cid varchar(20),
	Eid varchar(20),
	CBdate date,
	Foreign key(Cid) references ConsumerInfo(Cid) on delete cascade,
	Foreign key(Eid) references SellInfo(Eid) on delete cascade
)engine innodb;




create table ConsumerBackDetail
(
	CBDid varchar(20) primary key,
	CBid varchar(20),
	Gid varchar(20),
	CBDamount int not null,
	CBDprice double,
	CBDtotalprice double,
	Foreign key(CBid) references ConsumerBack(CBid) on delete cascade,
	Foreign key(Gid) references GoodsInfo(Gid) on delete cascade	
)engine innodb;

create table ProviderBack
(
	PBid varchar(20) primary key,
	Pid varchar(20),
	Sid varchar(20),
	PBdate date,
	Foreign key(Pid) references ProviderInfo(Pid) on delete cascade,
	Foreign key(Sid) references StockInfo(Sid) on delete cascade
)engine innodb;


create table ProviderBackDetail
(
	PBDid varchar(20),
	PBid varchar(20),
	Gid varchar(20),
	PBDamount int not null,
	PBDprice double,
	PBDtotalprice double,
	Foreign key(PBid) references ProviderBack(PBid) on delete cascade,
	Foreign key(Gid) references GoodsInfo(Gid) on delete cascade		
)engine innodb;

create table AdminInfo
(
	Aid varchar(20) primary key,
	Aname varchar(50) not null,
	Apwd varchar(20) not null,
	Alevel varchar(20) default '��ͨ'
);



insert into AdminInfo values('10001','zrk','12345','����');
insert into AdminInfo values('10002','cgq','12345','��ͨ');
insert into AdminInfo values('10003','hxl','12345','��ͨ');
