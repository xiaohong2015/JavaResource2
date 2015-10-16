function check() {
	document.getElementById("mf_rent:msgtype").value = "����";
	var location = document.getElementById("mf_rent:location").value.trim();
	var detail = document.getElementById("mf_rent:detail").value.trim();
	var longitude = document.getElementById("mf_rent:longitude").value.trim();
	var latitude = document.getElementById("mf_rent:latitude").value.trim();
	var lease = document.getElementById("mf_rent:lease").value.trim();
	var price = document.getElementById("mf_rent:price").value.trim();
	var linkman = document.getElementById("mf_rent:linkman").value.trim();
	var address = document.getElementById("mf_rent:address").value.trim();
	var tel = document.getElementById("mf_rent:tel").value.trim();
	var email = document.getElementById("mf_rent:email").value.trim();
	var area = document.getElementById("mf_rent:area").value.trim();
	var reg_double = /^\d+(.\d+)?$/;
	var reg_int = /^\d+$/;
	var reg_email = /^\w+@\w+.\w+(.\w+)?$/;
	var reg_degree = /^-?\d+(.\d+)?$/;
	if(location=="") {
		showErrMsg("��Դ����λ�ò���Ϊ�գ�","mf_rent:location");
		return false;
	}
	else if(detail=="") {
		showErrMsg("���ݾ���λ�ò���Ϊ�գ�","mf_rent:detail");
		return false;
	}
	else if(longitude=="") {
		showErrMsg("���Ȳ���Ϊ��!","mf_rent:longitude");
		return false;
	}
	else if(!reg_degree.test(longitude)) {
		showErrMsg("���ȸ�ʽ����ȷ��","mf_rent:longitude");
		return false;
	}
	else if(latitude=="") {
		showErrMsg("γ�Ȳ���Ϊ�գ�","mf_rent:latitude");
		return false;
	}
	else if(!reg_degree.test(latitude)) {
		showErrMsg("γ�ȸ�ʽ����ȷ��","mf_rent:latitude");
		return false;
	}
	else if(area=="") {
		showErrMsg("�������Ϊ�գ�","mf_rent:area");
		return false;
	}
	else if(!reg_double.test(area)) {
		showErrMsg("�������ֻ��Ϊ���֣�","mf_rent:area");
		return false;
	}
	else if(lease=="") {
		showErrMsg("���ڲ���Ϊ�գ�","mf_rent:lease");
		return false;
	}
	else if(!reg_int.test(lease)) {
		showErrMsg("����ֻ��Ϊ������","mf_rent:lease");
		return false;
	}
	else if(price=="") {
		showErrMsg("�۸���Ϊ�գ�","mf_rent:price");
		return false;
	}
	else if(!reg_double.test(price)) {
		showErrMsg("�۸��ʽ����ȷ��","mf_rent:price");
		return false;
	}
	else if(linkman=="") {
		showErrMsg("��ϵ�˲���Ϊ�գ�","mf_rent:linkman");
		return false;
	}
	else if(address=="") {
		showErrMsg("��ϵ�˵�ַ����Ϊ�գ�","mf_rent:address");
		return false;
	}
	else if(tel=="") {
		showErrMsg("��ϵ�˵绰����Ϊ�գ�","mf_rent:tel");
		return false;
	}
	else if(email=="") {
		showErrMsg("E-mail����Ϊ�գ�","mf_rent:email");
		return false;
	}
	else if(!reg_email.test(email)) {
		showErrMsg("E-mail��ʽ����ȷ��","mf_rent:email");
		return false;
	}
	return true;
}

function login() {
	var flag = document.getElementById("mf_login:flag").value;
	if(flag=="false") {
		document.getElementById("mf_login:url").value="rentpublish";
		document.getElementById("mf_login").submit();
		alert("�����ȵ�¼��");
		window.location.href="UserLogin.jsp";
	}
}


function qiuZuCheck() {
	document.getElementById("mf_rent:msgtype").value = "����";
	var location = document.getElementById("mf_rent:location").value.trim();
	var detail = document.getElementById("mf_rent:detail").value.trim();
	var lease = document.getElementById("mf_rent:lease").value.trim();
	var price = document.getElementById("mf_rent:price").value.trim();
	var linkman = document.getElementById("mf_rent:linkman").value.trim();
	var address = document.getElementById("mf_rent:address").value.trim();
	var tel = document.getElementById("mf_rent:tel").value.trim();
	var email = document.getElementById("mf_rent:email").value.trim();
	var area = document.getElementById("mf_rent:area").value.trim();
	var reg_double = /^\d+(.\d+)?$/;
	var reg_int = /^\d+$/;
	var reg_email = /^\w+@\w+.\w+(.\w+)?$/;
	var reg_degree = /^-?\d+(.\d+)?$/;
	if(location=="") {
		showErrMsg("��Դ����λ�ò���Ϊ�գ�","mf_rent:location");
		return false;
	}
	else if(detail=="") {
		showErrMsg("���ݾ���λ�ò���Ϊ�գ�","mf_rent:detail");
		return false;
	}
	else if(area=="") {
		showErrMsg("�������Ϊ�գ�","mf_rent:area");
		return false;
	}
	else if(!reg_double.test(area)) {
		showErrMsg("�������ֻ��Ϊ���֣�","mf_rent:area");
		return false;
	}
	else if(lease=="") {
		showErrMsg("���ڲ���Ϊ�գ�","mf_rent:lease");
		return false;
	}
	else if(!reg_int.test(lease)) {
		showErrMsg("����ֻ��Ϊ������","mf_rent:lease");
		return false;
	}
	else if(price=="") {
		showErrMsg("�۸���Ϊ�գ�","mf_rent:price");
		return false;
	}
	else if(!reg_double.test(price)) {
		showErrMsg("�۸��ʽ����ȷ��","mf_rent:price");
		return false;
	}
	else if(linkman=="") {
		showErrMsg("��ϵ�˲���Ϊ�գ�","mf_rent:linkman");
		return false;
	}
	else if(address=="") {
		showErrMsg("��ϵ�˵�ַ����Ϊ�գ�","mf_rent:address");
		return false;
	}
	else if(tel=="") {
		showErrMsg("��ϵ�˵绰����Ϊ�գ�","mf_rent:tel");
		return false;
	}
	else if(email=="") {
		showErrMsg("E-mail����Ϊ�գ�","mf_rent:email");
		return false;
	}
	else if(!reg_email.test(email)) {
		showErrMsg("E-mail��ʽ����ȷ��","mf_rent:email");
		return false;
	}
	return true;
}

function qiuZuLogin() {
	var flag = document.getElementById("mf_login:flag").value;
	if(flag=="false") {
		document.getElementById("mf_login:url").value="qiuzupublish";
		document.getElementById("mf_login").submit();
		alert("�����ȵ�¼��");
		window.location.href="UserLogin.jsp";
	}
}