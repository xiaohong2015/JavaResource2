	String.prototype.trim=function()
{
  return this.replace(/(^\s*)|(\s*$)/g,"");
}
function reloadImage(){/*���¼�����֤��ͼƬ*/
  	document.getElementById("adminLogin:pic").src='../yzm.jsp?'+Math.random();
}
	function checkAdminLogin(){
	
		var code = document.getElementById('adminLogin:yzm').value.trim();
		var aname = document.getElementById('adminLogin:aname').value.trim();
		var pwd = document.getElementById('adminLogin:apwd').value.trim();
	
	var reg = /^\w+$/;	
	if(code==""){
		alert("��֤�벻��Ϊ�ա�");
		return false;
	}
	if(code.length!=4){
		alert("��֤�볤�Ȳ���ȷ��");
		return false;
	}
	if(!reg.test(code)){
		alert("��������ȷ����֤�롣");
		return false;
	}
	
	if(aname==""){
		alert("�û�������Ϊ�ա�");	
		return false;
	}
	
	
	if(pwd.length<6||pwd==""){		
		"�Բ������벻��Ϊ�ղ����Ȳ���С��6��";
		return false;
	}
	if(!reg.test(pwd)){
		alert("�Բ�����������Ƿ��ַ���");
		return false;
	}
		return true;
	}