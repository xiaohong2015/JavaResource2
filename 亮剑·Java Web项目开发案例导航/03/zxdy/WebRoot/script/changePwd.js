var reg = /^\w+$/;
function checkOldPwd(){
	var oldPwd = document.all.oldPwd.value.trim();
	if(oldPwd==""){
		document.all.oldMsg.innerHTML="<img src='images/check_error.gif'/>�����벻��Ϊ�ա�";
		return false;
	}
	if(oldPwd.length<6){
		document.all.oldMsg.innerHTML="<img src='images/check_error.gif'/>�����볤��Ӧ����6��";
		return false;
	}
	if(!reg.test(oldPwd)){
		document.all.oldMsg.innerHTML="<img src='images/check_error.gif'/>�����뺬�зǷ��ַ���";
		return false;
	}
	document.all.oldMsg.innerHTML="<img src='images/check_right.gif'/>";
	return true;
}
function checkNewPwd(){
	var newPwd = document.all.newPwd.value.trim();
	if(newPwd==""){
		document.all.newMsg1.innerHTML="<img src='images/check_error.gif'/>�����벻��Ϊ�ա�";
		return false;
	}
	if(newPwd.length<6){
		document.all.newMsg1.innerHTML="<img src='images/check_error.gif'/>�����볤��Ӧ����6��";
		return false;
	}
	if(!reg.test(newPwd)){
		document.all.newMsg1.innerHTML="<img src='images/check_error.gif'/>�����뺬�зǷ��ַ���";
		return false;
	}
	document.all.newMsg1.innerHTML="<img src='images/check_right.gif'/>";
	return true;
}
function checkReNewPwd(){
	var reNewPwd = document.all.reNewPwd.value.trim();
	var newPwd = document.all.newPwd.value.trim();
	if(reNewPwd==""){
		document.all.newMsg2.innerHTML="<img src='images/check_error.gif'/>�����벻��Ϊ�ա�";
		return false;
	}
	if(reNewPwd.length<6){
		document.all.newMsg2.innerHTML="<img src='images/check_error.gif'/>�����볤��Ӧ����6��";
		return false;
	}
	if(!reg.test(reNewPwd)){
		document.all.newMsg2.innerHTML="<img src='images/check_error.gif'/>�����뺬�зǷ��ַ���";
		return false;
	}
	if(newPwd!=reNewPwd){
		document.all.newMsg2.innerHTML="<img src='images/check_error.gif'/>���������벻һ�¡�";
		return false;
	}
	document.all.newMsg2.innerHTML="<img src='images/check_right.gif'/>";
	return true;
}
function checkChangePwd(){
	if(checkOldPwd()&&checkReNewPwd()&&checkReNewPwd()){
		return true;
	}
	else{
		return false;
	}
}