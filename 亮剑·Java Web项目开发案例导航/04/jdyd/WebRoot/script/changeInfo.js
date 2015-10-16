String.prototype.trim=function()
{
  return this.replace(/(^\s*)|(\s*$)/g,"");
}

function checkEmail(){/*��֤email��ַ*/
	var reg2 = /^([0-9a-zA-Z]+[_.0-9a-zA-Z]+)@([a-zA-Z0-9]+[.])+([a-zA-Z]{2,3})$/;
	var email = document.getElementById('changeInfo:email').value.trim();
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
	var phone = document.getElementById('changeInfo:phone').value.trim();
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

function checkInfo(){/*�޸������ύ��ʱ*/
	if(!checkEmail()){
		showMsg("�����ʼ���ʽ���ԣ���˶����롣","changeInfo:email");
		return false;
	}
	if(!checkPhone()){
		showMsg("�绰�����ʽ���ԣ���˶����롣","changeInfo:phone");
		return false;
	}
	return true;
} 