function check(){
	var aname = document.all.aname.value.trim();
	var first = document.all.first.value.trim();
	var second = document.all.second.value.trim();
	
	if(aname==""){
		showErrMsg("�û�������Ϊ�գ�","aname");
		return;
	}
	if(first==""){
		showErrMsg("���벻��Ϊ�գ�","first");
		return;
	}
	if(second!=first){
		showErrMsg("�����������벻һ�£�","second");
		return;
	}
	document.mf_reset.submit();
}

function checkPwd(){

	var oldpwd = document.all.oldpwd.value.trim();
	var first = document.all.first.value.trim();
	var second = document.all.second.value.trim();
	
	if(oldpwd==""){
		showErrMsg("�û�������Ϊ�գ�","oldpwd");
		return;
	}
	if(first==""){
		showErrMsg("���벻��Ϊ�գ�","first");
		return;
	}
	if(second!=first){
		showErrMsg("�����������벻һ�£�","second");
		return;
	}
	document.mf_pwd.submit();
}

