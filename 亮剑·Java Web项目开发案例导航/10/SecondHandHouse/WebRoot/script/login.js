function loadImg(){
	var now = new Date().getTime();
	document.getElementById('mf:yzm').src="yzm.jsp?flag="+now;
}

function check(){
	var uname = document.getElementById('mf:uname').value;
	var upwd = document.getElementById('mf:upwd').value;
	var uyzm = document.getElementById('mf:uyzm').value;
	if(uname.trim()==""){
		showErrMsg("�û�������Ϊ�գ�","mf:uname");
		return false;
	}
	if(upwd.trim()==""){
		showErrMsg("���벻��Ϊ�գ�","mf:upwd");
		return false;
	}
	if(uyzm.trim()==""){
		showErrMsg("��֤�벻��Ϊ�գ�","mf:uyzm");
		return false;
	}
	if(uyzm.length!=4){
		showErrMsg("��֤�����","mf:uyzm");
		return false;
	}
	return true;
}

function adminLogin() {
	var aname = document.getElementById("mf:aname").value;
	var apwd = document.getElementById("mf:apwd").value;
	var ayzm = document.getElementById("mf:ayzm").value;

	if(aname=="") {
		showErrMsg("�û�������Ϊ�գ�","mf:aname");
		return false;
	}
	if(apwd=="") {
		showErrMsg("���벻��Ϊ�գ�","mf:apwd");
		return false;
	}
	if(ayzm=="") {
		showErrMsg("��֤�벻��Ϊ�գ�","mf:ayzm");
		return false;
	}
	if(ayzm.length!=4) {
		showErrMsg("��֤�����","mf:ayzm");
		return false;
	}
	return true;
}



