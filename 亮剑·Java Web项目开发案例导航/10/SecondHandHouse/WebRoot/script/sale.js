function login() {
	var flag = document.getElementById("mf_login:flag").value.trim();
	if(flag=="false") {
		document.getElementById("mf_login:url").value="salepublish";
		document.getElementById("mf_login").submit();
		alert("�����ȵ�¼��");
		window.location.href="UserLogin.jsp";
	}
}

function check() {
	document.getElementById("mf_sale:msgtype").value="����";
	var location = document.getElementById("mf_sale:location").value.trim();
	var detail = document.getElementById("mf_sale:detail").value.trim();
	var longitude = document.getElementById("mf_sale:longitude").value.trim();
	var latitude = document.getElementById("mf_sale:latitude").value.trim();
	var price = document.getElementById("mf_sale:price").value.trim();
	var linkman = document.getElementById("mf_sale:linkman").value.trim();
	var address = document.getElementById("mf_sale:address").value.trim();
	var tel = document.getElementById("mf_sale:tel").value.trim();
	var email = document.getElementById("mf_sale:email").value.trim();
	var area = document.getElementById("mf_sale:area").value.trim();
	var reg_double = /^\d+(.\d+)?$/;
	var reg_int = /^\d+$/;
	var reg_email = /^\w+@\w+.\w+(.\w+)?$/;
	var reg_degree = /^-?\d+(.\d+)?$/;
	if(location=="") {
		showErrMsg("��Դ����λ�ò���Ϊ�գ�","mf_sale:location");
		return false;
	}
	else if(detail=="") {
		showErrMsg("���ݾ���λ�ò���Ϊ�գ�","mf_sale:detail");
		return false;
	}
	else if(longitude=="") {
		showErrMsg("���Ȳ���Ϊ��!","mf_sale:longitude");
		return false;
	}
	else if(!reg_degree.test(longitude)) {
		showErrMsg("���ȸ�ʽ����ȷ��","mf_sale:longitude");
		return false;
	}
	else if(latitude=="") {
		showErrMsg("γ�Ȳ���Ϊ�գ�","mf_sale:latitude");
		return false;
	}
	else if(!reg_degree.test(latitude)) {
		showErrMsg("γ�ȸ�ʽ����ȷ��","mf_sale:latitude");
		return false;
	}
	else if(area=="") {
		showErrMsg("�������Ϊ�գ�","mf_sale:area");
		return false;
	}
	else if(!reg_double.test(area)) {
		showErrMsg("�������ֻ��Ϊ���֣�","mf_sale:area");
		return false;
	}
	else if(price=="") {
		showErrMsg("�۸���Ϊ�գ�","mf_sale:price");
		return false;
	}
	else if(!reg_double.test(price)) {
		showErrMsg("�۸��ʽ����ȷ��","mf_sale:price");
		return false;
	}
	else if(linkman=="") {
		showErrMsg("��ϵ�˲���Ϊ�գ�","mf_sale:linkman");
		return false;
	}
	else if(address=="") {
		showErrMsg("��ϵ�˵�ַ����Ϊ�գ�","mf_sale:address");
		return false;
	}
	else if(tel=="") {
		showErrMsg("��ϵ�˵绰����Ϊ�գ�","mf_sale:tel");
		return false;
	}
	else if(email=="") {
		showErrMsg("E-mail����Ϊ�գ�","mf_sale:email");
		return false;
	}
	else if(!reg_email.test(email)) {
		showErrMsg("E-mail��ʽ����ȷ��","mf_sale:email");
		return false;
	}
	return true;
}



function qiuGouLogin() {
	var flag = document.getElementById("mf_login:flag").value.trim();
	if(flag=="false") {
		document.getElementById("mf_login:url").value="qiugoupublish";
		document.getElementById("mf_login").submit();
		alert("�����ȵ�¼��");
		window.location.href="UserLogin.jsp";
	}
}

function qiuGouCheck() {
	document.getElementById("mf_sale:msgtype").value="��";
	var location = document.getElementById("mf_sale:location").value.trim();
	var detail = document.getElementById("mf_sale:detail").value.trim();
	var price = document.getElementById("mf_sale:price").value.trim();
	var linkman = document.getElementById("mf_sale:linkman").value.trim();
	var address = document.getElementById("mf_sale:address").value.trim();
	var tel = document.getElementById("mf_sale:tel").value.trim();
	var email = document.getElementById("mf_sale:email").value.trim();
	var area = document.getElementById("mf_sale:area").value.trim();
	var reg_double = /^\d+(.\d+)?$/;
	var reg_int = /^\d+$/;
	var reg_email = /^\w+@\w+.\w+(.\w+)?$/;
	var reg_degree = /^-?\d+(.\d+)?$/;
	if(location=="") {
		showErrMsg("��Դ����λ�ò���Ϊ�գ�","mf_sale:location");
		return false;
	}
	else if(detail=="") {
		showErrMsg("���ݾ���λ�ò���Ϊ�գ�","mf_sale:detail");
		return false;
	}
	else if(area=="") {
		showErrMsg("�������Ϊ�գ�","mf_sale:area");
		return false;
	}
	else if(!reg_double.test(area)) {
		showErrMsg("�������ֻ��Ϊ���֣�","mf_sale:area");
		return false;
	}
	else if(price=="") {
		showErrMsg("�۸���Ϊ�գ�","mf_sale:price");
		return false;
	}
	else if(!reg_double.test(price)) {
		showErrMsg("�۸��ʽ����ȷ��","mf_sale:price");
		return false;
	}
	else if(linkman=="") {
		showErrMsg("��ϵ�˲���Ϊ�գ�","mf_sale:linkman");
		return false;
	}
	else if(address=="") {
		showErrMsg("��ϵ�˵�ַ����Ϊ�գ�","mf_sale:address");
		return false;
	}
	else if(tel=="") {
		showErrMsg("��ϵ�˵绰����Ϊ�գ�","mf_sale:tel");
		return false;
	}
	else if(email=="") {
		showErrMsg("E-mail����Ϊ�գ�","mf_sale:email");
		return false;
	}
	else if(!reg_email.test(email)) {
		showErrMsg("E-mail��ʽ����ȷ��","mf_sale:email");
		return false;
	}
	return true;
}






