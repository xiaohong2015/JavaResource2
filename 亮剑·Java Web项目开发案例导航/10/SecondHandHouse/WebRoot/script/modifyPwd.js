function check() {
	var oldPwd = document.getElementById("mf:oldPwd").value;
	var firstPwd = document.getElementById("mf:firstPwd").value;
	var secondPwd = document.getElementById("mf:secondPwd").value;
	if(oldPwd.trim()=="") {
		showErrMsg("�ɿ����Ϊ�գ�","mf:oldPwd");
		return false;
	}
	if(firstPwd.trim()=="") {
		showErrMsg("�¿����Ϊ�գ�","mf:firstPwd");
		return false;
	}
	if(secondPwd.trim()=="") {
		showErrMsg("�¿����Ϊ�գ�","mf:secondPwd");
		return false;
	}
	if(firstPwd.trim()!=secondPwd.trim()) {
		showErrMsg("�������벻һ�£�","mf:firstPwd");
		return false;
	}
	return true;
}