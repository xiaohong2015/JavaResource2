------------------------------insert  userinfo start--------------------------------

insert into userinfo(uname,upwd) values('zrk','860607');
insert into userinfo(uname,upwd) values('wyf','123456');

------------------------------insert  userinfo end--------------------------------

------------------------------insert  typeinfo start--------------------------------

insert into typeinfo(tname) values('������');
insert into typeinfo(tname) values('�յ�����');
insert into typeinfo(tname) values('�յ��տ�');
insert into typeinfo(tname) values('�յ��ؿ�');
insert into typeinfo(tname) values('�տ�');

------------------------------insert  typeinfo end--------------------------------


------------------------------insert  stationinfo start--------------------------------

insert into stationinfo(sname) values('����');
insert into stationinfo(sname) values('���');
insert into stationinfo(sname) values('��ɽ');
insert into stationinfo(sname) values('�ȷ�');
insert into stationinfo(sname) values('����');
insert into stationinfo(sname) values('����');
insert into stationinfo(sname) values('����');
insert into stationinfo(sname) values('������');
insert into stationinfo(sname) values('ʯ��ׯ');
insert into stationinfo(sname) values('ɽ����');
insert into stationinfo(sname) values('����');
insert into stationinfo(sname) values('����');
insert into stationinfo(sname) values('��ƽ');
insert into stationinfo(sname) values('����');
insert into stationinfo(sname) values('������');
insert into stationinfo(sname) values('�ض�');
insert into stationinfo(sname) values('����');
insert into stationinfo(sname) values('����');
insert into stationinfo(sname) values('̩��');
insert into stationinfo(sname) values('�������');

insert into stationinfo(sname) values('��Ϫ');
insert into stationinfo(sname) values('��˳�');
insert into stationinfo(sname) values('����');

insert into stationinfo(sname) values('������');
insert into stationinfo(sname) values('����');

insert into stationinfo(sname) values('����');
insert into stationinfo(sname) values('�߱���');
insert into stationinfo(sname) values('���');
insert into stationinfo(sname) values('���');
insert into stationinfo(sname) values('�ػʵ�');


------------------------------insert  stationinfo end--------------------------------

------------------------------insert  traininfo start--------------------------------

insert into traininfo(tname,tstartid,tendid,ttypeid) values
(
	'K39',
	(select sid from stationinfo where sname='����'),
	(select sid from stationinfo where sname='�������'),
	(select tid from typeinfo where tname='�յ�����')
);
insert into traininfo(tname,tstartid,tendid,ttypeid) values
(
	'4424',
	(select sid from stationinfo where sname='ʯ��ׯ'),
	(select sid from stationinfo where sname='��ɽ'),
	(select tid from typeinfo where tname='�տ�')
);

insert into traininfo(tname,tstartid,tendid,ttypeid) values
(
	'K27',
	(select sid from stationinfo where sname='����'),
	(select sid from stationinfo where sname='����'),
	(select tid from typeinfo where tname='�յ�����')
);

insert into traininfo(tname,tstartid,tendid,ttypeid) values
(
	'D574',
	(select sid from stationinfo where sname='ʯ��ׯ'),
	(select sid from stationinfo where sname='������'),
	(select tid from typeinfo where tname='������')
);

insert into traininfo(tname,tstartid,tendid,ttypeid) values
(
	'T582',
	(select sid from stationinfo where sname='ʯ��ׯ'),
	(select sid from stationinfo where sname='�ػʵ�'),
	(select tid from typeinfo where tname='�յ��ؿ�')
);


------------------------------insert  traininfo end--------------------------------

insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='K39'),
	(select sid from stationinfo where sname='����'),
	null,
	to_date('22:56','hh24:mi'),
	1
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='K39'),
	(select sid from stationinfo where sname='���'),
	to_date('0:29','hh24:mi'),
	to_date('0:37','hh24:mi'),
	2
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='K39'),
	(select sid from stationinfo where sname='��ɽ'),
	to_date('01:48','hh24:mi'),
	to_date('01:50','hh24:mi'),
	3
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='K39'),
	(select sid from stationinfo where sname='ɽ����'),
	to_date('03:48','hh24:mi'),
	to_date('03:56','hh24:mi'),
	4
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='K39'),
	(select sid from stationinfo where sname='����'),
	to_date('05:54','hh24:mi'),
	to_date('05:59','hh24:mi'),
	5
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='K39'),
	(select sid from stationinfo where sname='����'),
	to_date('08:35','hh24:mi'),
	to_date('08:50','hh24:mi'),
	6
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='K39'),
	(select sid from stationinfo where sname='��ƽ'),
	to_date('10:47','hh24:mi'),
	to_date('10:49','hh24:mi'),
	7
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='K39'),
	(select sid from stationinfo where sname='����'),
	to_date('12:03','hh24:mi'),
	to_date('12:10','hh24:mi'),
	8
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='K39'),
	(select sid from stationinfo where sname='������'),
	to_date('14:45','hh24:mi'),
	to_date('15:05','hh24:mi'),
	9
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='K39'),
	(select sid from stationinfo where sname='�ض�'),
	to_date('15:47','hh24:mi'),
	to_date('15:49','hh24:mi'),
	10
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='K39'),
	(select sid from stationinfo where sname='����'),
	to_date('16:33','hh24:mi'),
	to_date('16:35','hh24:mi'),
	11
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='K39'),
	(select sid from stationinfo where sname='����'),
	to_date('16:58','hh24:mi'),
	to_date('17:03','hh24:mi'),
	12
);

insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='K39'),
	(select sid from stationinfo where sname='̩��'),
	to_date('17:37','hh24:mi'),
	to_date('17:41','hh24:mi'),
	13
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='K39'),
	(select sid from stationinfo where sname='�������'),
	to_date('18:33','hh24:mi'),
	null,
	14
);

insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='K27'),
	(select sid from stationinfo where sname='����'),
	null,
	to_date('17:30','hh24:mi'),
	1
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='K27'),
	(select sid from stationinfo where sname='���'),
	to_date('19:03','hh24:mi'),
	to_date('19:11','hh24:mi'),
	2
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='K27'),
	(select sid from stationinfo where sname='��ɽ'),
	to_date('20:22','hh24:mi'),
	to_date('20:25','hh24:mi'),
	3
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='K27'),
	(select sid from stationinfo where sname='������'),
	to_date('21:50','hh24:mi'),
	to_date('21:52','hh24:mi'),
	4
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='K27'),
	(select sid from stationinfo where sname='ɽ����'),
	to_date('22:29','hh24:mi'),
	to_date('22:40','hh24:mi'),
	5
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='K27'),
	(select sid from stationinfo where sname='����'),
	to_date('00:38','hh24:mi'),
	to_date('00:51','hh24:mi'),
	6
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='K27'),
	(select sid from stationinfo where sname='����'),
	to_date('03:25','hh24:mi'),
	to_date('03:40','hh24:mi'),
	7
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='K27'),
	(select sid from stationinfo where sname='��Ϫ'),
	to_date('04:46','hh24:mi'),
	to_date('04:49','hh24:mi'),
	8
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='K27'),
	(select sid from stationinfo where sname='��˳�'),
	to_date('06:28','hh24:mi'),
	to_date('06:30','hh24:mi'),
	9
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='K27'),
	(select sid from stationinfo where sname='����'),
	to_date('07:17','hh24:mi'),
	null,
	10
);

insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='D574'),
	(select sid from stationinfo where sname='ʯ��ׯ'),
	null,
	to_date('06:35','hh24:mi'),
	1
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='D574'),
	(select sid from stationinfo where sname='����'),
	to_date('07:27','hh24:mi'),
	to_date('07:28','hh24:mi'),
	2
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='D574'),
	(select sid from stationinfo where sname='������'),
	to_date('08:33','hh24:mi'),
	null,
	3
);


insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='T582'),
	(select sid from stationinfo where sname='ʯ��ׯ'),
	null,
	to_date('07:33','hh24:mi'),
	1
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='T582'),
	(select sid from stationinfo where sname='����'),
	to_date('08:11','hh24:mi'),
	to_date('08:15','hh24:mi'),
	2
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='T582'),
	(select sid from stationinfo where sname='����'),
	to_date('08:47','hh24:mi'),
	to_date('08:51','hh24:mi'),
	3
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='T582'),
	(select sid from stationinfo where sname='�߱���'),
	to_date('09:22','hh24:mi'),
	to_date('09:24','hh24:mi'),
	4
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='T582'),
	(select sid from stationinfo where sname='������'),
	to_date('10:22','hh24:mi'),
	to_date('10:35','hh24:mi'),
	5
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='T582'),
	(select sid from stationinfo where sname='�ȷ�'),
	to_date('11:12','hh24:mi'),
	to_date('11:27','hh24:mi'),
	6
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='T582'),
	(select sid from stationinfo where sname='���'),
	to_date('11:46','hh24:mi'),
	to_date('12:11','hh24:mi'),
	7
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='T582'),
	(select sid from stationinfo where sname='���'),
	to_date('12:34','hh24:mi'),
	to_date('12:40','hh24:mi'),
	8
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='T582'),
	(select sid from stationinfo where sname='����'),
	to_date('13:07','hh24:mi'),
	to_date('13:09','hh24:mi'),
	9
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='T582'),
	(select sid from stationinfo where sname='��ɽ'),
	to_date('13:56','hh24:mi'),
	to_date('14:05','hh24:mi'),
	10
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='T582'),
	(select sid from stationinfo where sname='����'),
	to_date('15:03','hh24:mi'),
	to_date('15:05','hh24:mi'),
	11
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='T582'),
	(select sid from stationinfo where sname='������'),
	to_date('15:22','hh24:mi'),
	to_date('15:24','hh24:mi'),
	12
);
insert into relationinfo(tid,sid,rarrive,rstart,rsequence) values
(
	(select tid from traininfo where tname='T582'),
	(select sid from stationinfo where sname='�ػʵ�'),
	to_date('15:42','hh24:mi'),
	null,
	13
);
------------------------------------------------------
insert into admininfo(aname,apwd,alevel) values('zrk','860607','����');
insert into admininfo(aname,apwd) values('Tom','123456');















