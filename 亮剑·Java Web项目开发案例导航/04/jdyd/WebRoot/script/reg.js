String.prototype.trim=function()
{
  return this.replace(/(^\s*)|(\s*$)/g,"");
}
function reloadImage(){/*���¼�����֤��ͼƬ*/
  	document.getElementById("regform:pic").src='../yzm.jsp?'+Math.random();
}
function checkValCode(){/*��֤��֤���Ƿ���4Ϊ���ֺ���ĸ�����*/
	var reg = /^\w+$/;
	var code = document.getElementById("regform:yzm").value.trim();
	if(code==""){
		document.all.codeMsg.innerHTML="<img src='images/check_error.gif'/>��֤�벻��Ϊ�ա�";
		return false;
	}
	if(code.length!=4){
		document.all.codeMsg.innerHTML="<img src='images/check_error.gif'/>��֤�볤�Ȳ���ȷ��";
		return false;
	}
	if(!reg.test(code)){
		document.all.codeMsg.innerHTML="<img src='images/check_error.gif'/>��������ȷ����֤�롣";
		return false;
	}
	return true;
}

function checkUname(){/*��֤�û���*/		  		
	var uname = document.getElementById('regform:uname').value.trim();
	if(uname.length<3){
		document.all.unameMsg.innerHTML="<img src='images/check_error.gif'/>"+
					"�Բ�����������û�������С��3���ַ�, ������һ���ϳ����û�����";
		return false;
	}
	document.all.unameMsg.innerHTML="<img src='images/check_right.gif'/>";
	return true;
}

function checkPwd(){/*��֤����*/
	var reg = /^\w+$/;
	var pwd = document.getElementById('regform:pwd').value.trim();
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

function checkPwd2(){/*��֤ȷ�������Ƿ���ȷ*/
	var reg = /^\w+$/;
	var pwd = document.getElementById('regform:pwd').value.trim();
	var pwd2 = document.getElementById('regform:rePwd').value.trim();
	if(pwd2.length<6||pwd2==""){
		document.all.pwdMsg2.innerHTML="<img src='images/check_error.gif'/>"+
										"�Բ������벻��Ϊ�ղ����Ȳ���С��6��";
		return false;
	}
	if(!reg.test(pwd2)){
		document.all.pwdMsg2.innerHTML="<img src='images/check_error.gif'/>"+
												 "�Բ�����������Ƿ��ַ���";
		return false;
	}
	if(pwd!=pwd2){
		document.all.pwdMsg2.innerHTML="<img src='images/check_error.gif'/>"+
											"�����������벻һֱ����˶Ժ����롣";
		return false;
	}
	document.all.pwdMsg2.innerHTML="<img src='images/check_right.gif'/>";
	return true;
}

function checkEmail(){/*��֤email��ַ*/
	var reg2 = /^([0-9a-zA-Z]+[_.0-9a-zA-Z]+)@([a-zA-Z0-9]+[.])+([a-zA-Z]{2,3})$/;
	var email = document.getElementById('regform:email').value.trim();
	if(email==""){
		document.all.emailMsg.innerHTML="<img src='images/check_error.gif'/>"+
													"���䲻��Ϊ�գ���������д��";
		return false;
	}
	if(!reg2.test(email)){
		document.all.emailMsg.innerHTML="<img src='images/check_error.gif'/>"+
													"�����ַ��Ч����������д��";
		return false;
	}
	document.all.emailMsg.innerHTML="<img src='images/check_right.gif'/>";
	return true;
}

function checkPhone(){
	var reg = /\d/;
	var phone = document.getElementById('regform:phone').value.trim();
	if(phone==""){
		document.all.phoneMsg.innerHTML="<img src='images/check_error.gif'/>"+
													"�绰����Ϊ�գ���������д��";
		 return false;
	}
	if(phone.length<11){
		document.all.phoneMsg.innerHTML="<img src='images/check_error.gif'/>"+
													"�绰���볤�Ȳ���ȷ����������д��";
		return false;													
	}
	if(!reg.test(phone)){
		document.all.phoneMsg.innerHTML="<img src='images/check_error.gif'/>"+
													"�绰�����ʽ���ԣ���������д��";
		return false;
	}
	document.all.phoneMsg.innerHTML="<img src='images/check_right.gif'/>";
	return true;
}

function checkReg(){/*ע���ύ��ʱ*/
	if(!checkValCode()){
		showMsg("��֤�����������˶����롣","regform:yzm");	
		return false;	
	}
	if(!checkUname){
		showMsg("�û���������Ҫ����˶����롣","regform:uname");	
		return false;	
	}
	if(!checkPwd()){
		showMsg("���벻����Ҫ����˶����롣","regform:pwd");
		return false;
	}
	if(!checkPwd2()){
		showMsg("���벻����Ҫ����˶����롣","regform:rePwd");
		return false;
	}
	if(!checkEmail()){
		showMsg("�����ʼ���ʽ���ԣ���˶����롣","regform:email");
		return false;
	}
	if(!checkPhone()){
		showMsg("�绰�����ʽ���ԣ���˶����롣","regform:phone");
		return false;
	}
	return true;
} 