function isLogin() {
	var flag = document.getElementById("mf_login:flag").value.trim();
	if(flag=="false") {
		document.getElementById("mf_login:url").value="questioninfo";
		document.getElementById("mf_login").submit();
		alert("�����ȵ�¼��");
		window.location.href="UserLogin.jsp";
	}
}

function checkQuestion() {
	var title = document.getElementById("mf_question:title").value.trim();
	var content = document.getElementById("mf_question:content").value.trim();
	if(title=="") {
		showErrMsg("���ⲻ��Ϊ�գ�","mf_question:title");
		return false;
	}
	else if(content=="") {
		showErrMsg("���ݲ���Ϊ�գ�","mf_question:content");
		return false;
	}
	else {
		return true;
	}
}