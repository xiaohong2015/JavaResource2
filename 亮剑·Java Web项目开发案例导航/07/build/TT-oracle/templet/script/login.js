function loadImg(){
	var now = new Date().getTime();
	document.all.yzm.src="yzm.jsp?flag="+now;
}

function check(){
	var aname = document.all.aname.value.trim();
	var apwd = document.all.apwd.value.trim();
	var identify = document.all.identify.value.trim();
	if(aname==""){
		showErrMsg("�û�������Ϊ�գ�����","aname");
		return;
	}
	if(apwd==""){
		showErrMsg("���벻��Ϊ�գ�����","apwd");
		return;
	}
	if(identify==""){
		showErrMsg("��֤�벻��Ϊ�գ�����","identify");
		return;
	}
	document.mf_login.submit();
}