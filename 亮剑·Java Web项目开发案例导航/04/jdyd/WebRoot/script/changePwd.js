String.prototype.trim=function()
{
  return this.replace(/(^\s*)|(\s*$)/g,"");
}
function checkOldPwd(){/*��֤����*/
	var reg = /^\w+$/;
	var pwd = document.getElementById('changePwd:oldPwd').value.trim();
	if(pwd.length<6||pwd==""){
		document.all.pwdMsg.innerHTML="<img src='images/check_error.gif'/>"+
																"�Բ������벻��Ϊ�ղ����Ȳ���С��6��";
		return false;
	}
	if(!reg.test(pwd)){
		document.all.pwdMsg.innerHTML="<img src='images/check_error.gif'/>"+
												  									"�Բ�����������Ƿ��ַ���";
		return false;
	}
	document.all.pwdMsg.innerHTML="<img src='images/check_right.gif'/>";
	return true;
}
function checkNewPwd(){/*��֤����*/
	var reg = /^\w+$/;
	var pwd = document.getElementById('changePwd:newPwd').value.trim();
	if(pwd.length<6||pwd==""){
		document.all.pwdMsg2.innerHTML="<img src='images/check_error.gif'/>"+
																"�Բ������벻��Ϊ�ղ����Ȳ���С��6��";
		return false;
	}
	if(!reg.test(pwd)){
		document.all.pwdMsg2.innerHTML="<img src='images/check_error.gif'/>"+
												  									"�Բ�����������Ƿ��ַ���";
		return false;
	}
	document.all.pwdMsg2.innerHTML="<img src='images/check_right.gif'/>";
	return true;
}

function checkReNewPwd(){/*��֤ȷ�������Ƿ���ȷ*/
	var reg = /^\w+$/;
	var pwd = document.getElementById('changePwd:newPwd').value.trim();
	var pwd2 = document.getElementById('changePwd:reNewPwd').value.trim();
	if(pwd2.length<6||pwd2==""){
		document.all.pwdMsg3.innerHTML="<img src='images/check_error.gif'/>"+
										"�Բ������벻��Ϊ�ղ����Ȳ���С��6��";
		return false;
	}
	if(!reg.test(pwd2)){
		document.all.pwdMsg3.innerHTML="<img src='images/check_error.gif'/>"+
												 "�Բ�����������Ƿ��ַ���";
		return false;
	}
	if(pwd!=pwd2){
		document.all.pwdMsg3.innerHTML="<img src='images/check_error.gif'/>"+
											"�����������벻һֱ����˶Ժ����롣";
		return false;
	}
	document.all.pwdMsg3.innerHTML="<img src='images/check_right.gif'/>";
	return true;
}

function checkPwd(){
	if(!checkOldPwd()){
		showMsg("���������벻��ȷ������������","changePwd:oldPwd");
		return false;
	}
	if(!checkNewPwd()){
		showMsg("���������벻��ȷ������������","changePwd:newPwd");
		return false;
	}
	if(!checkReNewPwd()){
		showMsg("ȷ���������벻��ȷ������������","changePwd:reNewPwd");
		return false;
	}
	return true;
}

