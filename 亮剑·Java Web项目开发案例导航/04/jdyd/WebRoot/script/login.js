String.prototype.trim=function()
{
  return this.replace(/(^\s*)|(\s*$)/g,"");
}
function reloadImage(){/*���¼�����֤��ͼƬ*/
  	document.getElementById("loginform:pic").src='../yzm.jsp?'+Math.random();
}
function checkLogin(){/*��֤��֤���Ƿ���4Ϊ���ֺ���ĸ�����*/
	var reg = /^\w+$/;
	var code = document.getElementById("loginform:yzm").value.trim();
	if(code==""){
		showMsg("��֤�벻��Ϊ�ա�","loginform:yzm");	
		return false;
	}
	if(code.length!=4){
		showMsg("��֤�볤�Ȳ���ȷ��","loginform:yzm");	
		return false;
	}	
	if(!reg.test(code)){
		showMsg("��������ȷ����֤�롣","loginform:yzm");	
		return false;
	}
	
	var uname = document.getElementById("loginform:uname").value.trim();
	if(uname==""){
		showMsg("�û�������Ϊ�ա�","loginform:uname");	
		return false;
	}
	if(uname.length<3){
		showMsg("�û������Ȳ���С��3��","loginform:uname");	
		return false;
	}
	var pwd = document.getElementById("loginform:pwd").value.trim();
	if(pwd==""){
		showMsg("���벻��Ϊ�ա�","loginform:pwd");	
		return false;
	}
	if(pwd.length<6){
		showMsg("���볤�Ȳ���С��6��","loginform:pwd");	
		return false;
	}
	return true;
}