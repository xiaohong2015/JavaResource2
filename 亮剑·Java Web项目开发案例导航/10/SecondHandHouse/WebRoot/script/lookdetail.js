function checkRent() {
	var linkman = document.getElementById("mf_lookdetail:linkman").value.trim();
	var tel = document.getElementById("mf_lookdetail:tel").value.trim();
	var email = document.getElementById("mf_lookdetail:email").value.trim();
	var reg = /^\w+@\w+.\w+(.\w+)?$/;
	if(linkman=="") {
		showErrMsg("��ϵ�˲���Ϊ�գ�","mf_lookdetail:linkman");
		return false;
	}
	else if(tel=="") {
		showErrMsg("��ϵ�绰����Ϊ�գ�","mf_lookdetail:tel");
		return false;
	}
	else if(email=="") {
		showErrMsg("E-mail����Ϊ�գ�","mf_lookdetail:email");
		return false;
	}
	else if(!reg.test(email)) {
		showErrMsg("E-mail��ʽ����ȷ��","mf_lookdetail:email");
		return false;
	}
	return true;
}