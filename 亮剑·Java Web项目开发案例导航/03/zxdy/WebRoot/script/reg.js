function checkValCode(){/*��֤��֤���Ƿ���4Ϊ���ֺ���ĸ�����*/
	var reg = /^\w+$/;
	var code = document.all.valcode.value.trim();
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
var xmlHttp;
var result = false;
function checkUid(){/*��֤�û���*/		  		
	var uname = document.all.uname.value.trim();
	if(uname.length<3){
		document.all.unameMsg.innerHTML="<img src='images/check_error.gif'/>"+
					"�Բ�����������û�������С��3���ַ�, ������һ���ϳ����û�����";
		return false;
	}
	else{
			document.all.unameMsg.innerHTML="<img src='images/load.gif'/>Loading...";
			if(window.ActiveXObject){//����xmlHttpRequest����
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			else if(window.XMLHttpRequest){
				xmlHttp = new XMLHttpRequest();
			}
			var uri = "UUAction.action?uname="+uname;
			uri = encodeURI(uri);//��������Ҫת����
  		uri = encodeURI(uri);//��������Ҫת����
			xmlHttp.open("POST",uri,true);
			xmlHttp.onreadystatechange = function(){
				if(xmlHttp.readyState==4)
	      {
	         if(xmlHttp.status==200)
	         {
		         	var flag = xmlHttp.responseText;
	            if(flag.trim()=="true")
	            {
								document.all.unameMsg.innerHTML="<img src='images/check_error.gif'/>"+
													"�Բ�����������û���<font color='black'>��"+uname+"��"+
													"</font>�Ѿ�����ע��, ������һ���µ��û�����";
								result = false;
	            }
	            else
	            {
	            	document.all.unameMsg.innerHTML="<img src='images/check_right.gif'/>";
	            	result = true;
	            }
	         }
	      }
			}
			xmlHttp.send(null);
    }
}
/*function handleResponse(){
	 if(xmlHttp.readyState==4)
      {
         if(xmlHttp.status==200)
         {
         	var flag = xmlHttp.responseText;
            if(flag.trim()!="ok")
            {
							document.all.unameMsg.innerHTML="<img src='images/check_error.gif'/>"+
												"�Բ�����������û����Ѿ�����ע��, ������һ���µ��û�����";
							result = false;
            }
            else
            {
            	document.all.unameMsg.innerHTML="<img src='images/check_right.gif'/>";
            	result = true;
            }
         }
      }
}*/
function checkPwd(){/*��֤����*/
	var reg = /^\w+$/;
	var pwd = document.all.pwd.value.trim();
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
	var pwd = document.all.pwd.value.trim();
	var pwd2 = document.all.pwd2.value.trim();
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
	var email = document.all.email.value.trim();
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
function checkReg(){/*ע���ύ��ʱ*/
	if(!checkValCode()){
		showMsg("��֤�����������˶����롣","valcode");	
		return false;	
	}
	if(!result){
		showMsg("�û���������Ҫ����˶����롣","uname");	
		return false;	
	}
	if(!checkPwd()){
		showMsg("���벻����Ҫ����˶����롣","pwd");
		return false;
	}
	if(!checkPwd2()){
		showMsg("���벻����Ҫ����˶����롣","pwd2");
		return false;
	}
	if(!checkEmail()){
		showMsg("�����ʼ���ʽ���ԣ���˶����롣","email");
		return false;
	}
	document.all.button.disabled=true;
	return true;
}