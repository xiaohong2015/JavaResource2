function modifyAdminPwd() {
	var oldPwd = document.getElementById("mf:oldPwd").value.trim();
	var firstPwd = document.getElementById("mf:firstPwd").value.trim();
	var secondPwd = document.getElementById("mf:secondPwd").value.trim();
	if(oldPwd=="") {
		showErrMsg("�ɿ����Ϊ�գ�","mf:oldPwd");
		return false;
	}
	if(firstPwd=="") {
		showErrMsg("�¿����Ϊ�գ�","mf:firstPwd");
		return false;
	}
	if(firstPwd.length<6) {
		showErrMsg("�����볤�Ȳ�������6λ��","mf:firstPwd");
	}
	if(secondPwd=="") {
		showErrMsg("�¿����Ϊ�գ�","mf:secondPwd");
		return false;
	}
	if(firstPwd!=secondPwd) {
		showErrMsg("�����������벻һ�£�","mf:firstPwd");
		return false;
	}
	return true;
}