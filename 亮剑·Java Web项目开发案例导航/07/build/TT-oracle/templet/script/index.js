function check(){
	var uname = document.mf_login.uname.value.trim();
	var upwd = document.mf_login.upwd.value.trim();
	if(uname==""){
		showErrMsg("�û�������Ϊ�գ�","uname");
		return;
	}
	if(upwd==""){
		showErrMsg("���벻��Ϊ�գ�","upwd");
		return;
	}
	document.mf_login.submit();
}

function zzcx(){
	var start = document.mf_zzcx.start.value.trim();
	var end = document.mf_zzcx.end.value.trim();
	if(start==""){
		showErrMsg("�������в���Ϊ�գ�","start");
		return;
	}
	if(end==""){
		showErrMsg("Ŀ�ĳ��в���Ϊ�գ�","end");
		return;
	}
	if(start==end){
		showErrMsg("�������к��յ���в�����ͬ��","start");
		return;
	}
	document.mf_zzcx.submit();
}

function czcx(){
	var station = document.mf_czcx.station.value.trim();
	if(station==""){
		showErrMsg("���鳵վ���Ʋ���Ϊ�գ�","station");
		return;
	}
	document.mf_czcx.submit();
}

function train_search(){
	var train = document.mf_cccx.train.value.trim();
	if(train==""){
		showErrMsg("���鳵�β���Ϊ�գ�","train");
		return;
	}
	document.mf_cccx.submit();
}
