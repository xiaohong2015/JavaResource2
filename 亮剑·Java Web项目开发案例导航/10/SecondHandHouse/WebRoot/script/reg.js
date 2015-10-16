function check() {
	var uname = document.getElementById("mf_reg:uname").value.trim();
	var firstPwd = document.getElementById("mf_reg:firstPwd").value.trim();
	var secondPwd = document.getElementById("mf_reg:secondPwd").value.trim();
	var uemail = document.getElementById("mf_reg:uemail").value.trim();
	var reg = /^\w+@\w+.\w+(.\w+)?$/;
	if(uname=="") {
		showErrMsg("�û�������Ϊ�գ�","mf_reg:uname");
		return false;
	}
	else if(firstPwd=="") {
		showErrMsg("���벻��Ϊ�գ�","mf_reg:firstPwd");
		return false;
	}
	else if(firstPwd.length<6) {
		showErrMsg("���볤�Ȳ���С��6��","mf_reg:firstPwd");
		return false;
	}
	else if(secondPwd=="") {
		showErrMsg("���벻��Ϊ�գ�","mf_reg:secondPwd");
		return false;
	}
	else if(secondPwd.length<6) {
		showErrMsg("���볤�Ȳ���С��6��","mf_reg:secondPwd");
		return false;
	}
	else if(firstPwd!=secondPwd) {
		showErrMsg("�����������벻һ�£�","mf_reg:firstPwd");
		return false;
	}
	else if(uemail=="") {
		showErrMsg("E-mail����Ϊ�գ�","mf_reg:uemail");
		return false;
	}
	else if(!reg.test(uemail)) {
		showErrMsg("E-mail��ʽ����ȷ��","mf_reg:uemail");
		return false;
	}
	else {
		return true;
	}
}