String.prototype.trim=function()
{
  return this.replace(/(^\s*)|(\s*$)/g,"");
}
function checkResetPwd(){
	var aname = document.getElementById('resetPwd:aname').value.trim();
	var pwd = document.getElementById('resetPwd:pwd').value.trim();
	var rePwd = document.getElementById('resetPwd:rePwd').value.trim();
	var reg = /^\w+$/;
	if(aname==""){
		alert("����Ա������Ϊ��");
		return false;
	}
	if(aname.length<3){
		alert("����Ա�����Ȳ���С��3λ");
		return false;
	}
	if(pwd.length<6||pwd==""){
		alert("�Բ������벻��Ϊ�ղ����Ȳ���С��6��");
		return false;
	}
	if(!reg.test(pwd)){
		alert("�Բ�����������Ƿ��ַ���");
		return false;
	}
	
	
	if(rePwd.length<6||rePwd==""){
		alert("�Բ���ȷ�����벻��Ϊ�ղ����Ȳ���С��6��");
		return false;
	}
	if(!reg.test(rePwd)){
		alert("�Բ���ȷ����������Ƿ��ַ���");
		return false;
	}
	if(rePwd!=pwd){
		alert("�����������벻һֱ����˶Ժ����롣");
		return false;
	}
	return true;
}