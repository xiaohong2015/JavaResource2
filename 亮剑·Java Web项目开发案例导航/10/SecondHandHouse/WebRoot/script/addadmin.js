function checkAdmin() {
	var aname = document.getElementById("mf:aname").value.trim();
	var firstPwd = document.getElementById("mf:firstPwd").value.trim();
	var secondPwd = document.getElementById("mf:secondPwd").value.trim();

	if(aname=="") {
		showErrMsg("�û�������Ϊ�գ�","mf:aname");
		return false;
	}
	else if(firstPwd=="") {
		showErrMsg("���벻��Ϊ�գ�","mf:firstPwd");
		return false;
	}
	else if(firstPwd.length<6) {
		showErrMsg("���볤�Ȳ���С��6��","mf:firstPwd");
		return false;
	}
	else if(secondPwd=="") {
		showErrMsg("���벻��Ϊ�գ�","mf:secondPwd");
		return false;
	}
	else if(firstPwd!=secondPwd) {
		showErrMsg("�����������벻һ�£�","mf:firstPwd");
		return false;
	}
	return true;
}