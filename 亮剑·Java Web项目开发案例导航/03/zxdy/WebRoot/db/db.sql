#�û���ɫ�����
/*create table DY_User_Group
(
	UGID int auto_increment,	#����ID
	UGDetail varchar(50),			#��������
	Primary key(GID)					#����	
)engine innodb;*/
#�û���ɫ��
create table DY_User
(
	UID int auto_increment,														#ͷ��ID
	UName varchar(20) unique not null,								#�û���	
	UPwd varchar(20) not null,												#����
	UGender char(2) default '��',																	#�Ա� �� orŮ
	UEmail varchar(40),																#����
	URole int default 0, 															#�Ƿ��ǹ���Ա 0-ѧ�� 1-��ʦ 2-��̨����Ա
	UHead varchar(50) default 'UserHead/no_head.gif',	#�û�ͼ��URL
	URegDate date, 																		#�û�ע������
	ULastLogin datetime,															#����½����
	ULastEmit datetime, 															#��󷢱�����
	UPermit int default 1, 														#Ȩ�� 1-�ɷ��� 0-���ɷ���
	Primary key(UID)																	#����
)engine innodb;
#�γ̱�
create table DY_Topic_Group
(
	TGID int auto_increment,				#�γ�ID
	TGName varchar(50) not null,		#�γ�����
	TDetail varchar(200) not null,	#�γ�����
	Primary key(TGID)								#����
)engine innodb
auto_increment=10000;
#�����
create table DY_Topic
(
	TID int auto_increment,						#��������
	UID int,													#������-���
	TGID int,													#�����������
	TTitle varchar(200) not null,			#�������
	TContent text not null,						#��������
	TDate datetime not null,					#����ʱ��
	TReadCount int default 0,					#�Ķ�����
	Primary key(TID),									#����
	Foreign key(UID)references DY_User(UID) on delete cascade,
	Foreign key(TGID)references DY_Topic_Group(TGID) on delete cascade
)engine innodb;
#������
create table DY_Revert
(
	RID int auto_increment,				#��������
	TID int,											#���ظ����������
	UID int,											#��Ӧ�û�������
	RTitle varchar(200),					#����С����
	RContent text not null,				#��������
	RDate datetime not null,			#����ʱ��
	Primary key(RID),							#����
	Foreign key(TID)references DY_Topic(TID) on delete cascade,
	Foreign key(UID)references DY_User(UID) on delete cascade
)engine innodb;
#��ϵ��
create table DY_TU
(
	TUID int auto_increment,				#��ϵ������
	UID int,												#ѧ��ID
	TGID int,												#�γ�ID
	Primary key(TUID),
	Foreign key(UID)references DY_User(UID) on delete cascade,
	Foreign key(TGID)references DY_Topic_Group(TGID) on delete cascade
)engine innodb;
#�����
create table DY_Apply
(
	AID int auto_increment,						#������ID
	UID int,													#������ID
	TGID int,													#������ε�ID
	AReason varchar(200) not null,		#����ԭ��
	AFlag int default 0,							#�����Ƿ���0δ���� 1�Ѿ�����
	AStatus char(10) default '������',#����Ĵ�����
	Primary key(AID),
	Foreign key(UID)references DY_User(UID) on delete cascade,
	Foreign key(TGID)references DY_Topic_Group(TGID) on delete cascade
)engine innodb;


#�����û�
insert into DY_User(UName,UPwd,UGender,UEmail,URegDate) values('xyz','123456','��','asdf@163.com',now());
insert into DY_User(UName,UPwd,UGender,UEmail,URegDate) values('zrk','123456','��','asdf@163.com',now());
insert into DY_User(UName,UPwd,UGender,UEmail,URegDate) values('xzh','123456','Ů','wereq@163.com',now());
insert into DY_User(UName,UPwd,UGender,UEmail,URegDate) values('wyf','123456','��','wereq@163.com',now());


#�½��γ�
insert into DY_Topic_Group(TGName,TDetail) values('Java������','��������Զ�����ѧԺ');
insert into DY_Topic_Group(TGName,TDetail) values('���ݿ�ϵͳ����','��������Զ�����ѧԺ');
insert into DY_Topic_Group(TGName,TDetail) values('C���Գ������','��������Զ�����ѧԺ');
insert into DY_Topic_Group(TGName,TDetail) values('�ߵ���ѧ','��ѧԺ');
insert into DY_Topic_Group(TGName,TDetail) values('���Դ���','��ѧԺ');
insert into DY_Topic_Group(TGName,TDetail) values('�Զ�����ԭ��','��еѧԺ');
insert into DY_Topic_Group(TGName,TDetail) values('��ѧӢ��1','�����ѧԺ');
insert into DY_Topic_Group(TGName,TDetail) values('�˳�ѧ','���ù���ѧԺ');
insert into DY_Topic_Group(TGName,TDetail) values('xxx','xxxx');

#�����û�Ȩ�޺�ѡ��γ�
update DY_User set URole=1 where UName='zrk';		#����zrkΪ��ʦ
insert into DY_TU(UID,TGID) values (2,10000);
insert into DY_TU(UID,TGID) values (2,10001);
insert into DY_TU(UID,TGID) values (2,10002);		#����zrkΪ�����ſε���ʦ
insert into DY_TU(UID,TGID) values (1,10001);
insert into DY_TU(UID,TGID) values (1,10003);
insert into DY_TU(UID,TGID) values (1,10005);		#����1��ѧ���Ŀγ�

#�������
insert into DY_Topic(UID,TGID,TTitle,TContent,TReadCount,TDate) values(1,10001,'Integer���һ��С���� ==�Ƚ�','Integer�ڵ�ֵ�Ĵ�С��Byte��Χ��ʱ��==�ȽϷ���true ���Ƿ�Χ֮�ⷵ��false 
����Ϊʲô�أ�Ϊʲô���������� ',20,now());
insert into DY_Topic(UID,TGID,TTitle,TContent,TReadCount,TDate) values(1,10001,'����ѧϰ���ssh','ѧϰstruts spring hibernate ��˳����ssh��  ˳������ҵ�����Ƽ�������',15,now());
insert into DY_Topic(UID,TGID,TTitle,TContent,TReadCount,TDate) values(2,10003,'C++������Ӧ����ô��ѧϰ��','������Ƽ�����C++���飬���ҽ�Щѧϰ����лл',12,now());
insert into DY_Topic(UID,TGID,TTitle,TContent,TReadCount,TDate) values(2,10001,'����','���Բ��Բ��Բ��Բ��Բ��Բ��Բ��Բ���',12,now());
insert into DY_Topic(UID,TGID,TTitle,TContent,TReadCount,TDate) values(1,10001,'JAVA������Ӧ����ô��ѧϰ��','������Ƽ�����JAVA���飬���ҽ�Щѧϰ����лл',12,now());
insert into DY_Topic(UID,TGID,TTitle,TContent,TReadCount,TDate) values(1,10002,'���һ��SQL��ôд����','���SQL���Ѱ���Ӧ����ôѧ��',12,now());
insert into DY_Topic(UID,TGID,TTitle,TContent,TReadCount,TDate) values(1,10002,'����71','���Բ��Բ��Բ��Բ��Բ��Բ��Բ��Բ���7',12,now());
insert into DY_Topic(UID,TGID,TTitle,TContent,TReadCount,TDate) values(1,10001,'����81','���Բ��Բ��Բ��Բ��Բ��Բ��Բ��Բ���8',12,now());
insert into DY_Topic(UID,TGID,TTitle,TContent,TReadCount,TDate) values(1,10002,'����91','���Բ��Բ��Բ��Բ��Բ��Բ��Բ��Բ���9',12,now());
insert into DY_Topic(UID,TGID,TTitle,TContent,TReadCount,TDate) values(1,10001,'����101','���Բ��Բ��Բ��Բ��Բ��Բ��Բ��Բ���10',12,now());
insert into DY_Topic(UID,TGID,TTitle,TContent,TReadCount,TDate) values(1,10002,'����111','���Բ��Բ��Բ��Բ��Բ��Բ��Բ��Բ���11',12,now());
insert into DY_Topic(UID,TGID,TTitle,TContent,TReadCount,TDate) values(1,10001,'����121','���Բ��Բ��Բ��Բ��Բ��Բ��Բ��Բ���12',12,now());
#�ظ�����
insert into DY_Revert(TID,UID,RTitle,RContent,RDate) values(2,3,'','���飬����������',now());
insert into DY_Revert(TID,UID,RTitle,RContent,RDate) values(1,3,'','��˵�°汾��JAVA ���Զ�����BYTE��Χ�ڵ�ֵ.',now());
insert into DY_Revert(TID,UID,RTitle,RContent,RDate) values(1,3,'','¥�������𣿿��Բο�Java���Դ����',now());
insert into DY_Revert(TID,UID,RTitle,RContent,RDate) values(1,3,'','лл���ָ��',now());
insert into DY_Revert(TID,UID,RTitle,RContent,RDate) values(3,3,'','����ѧϰ��ר���о��Ļ��ͺ�ѧ',now());



