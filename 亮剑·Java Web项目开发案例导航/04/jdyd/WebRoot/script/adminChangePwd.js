    	String.prototype.trim=function()
		{
		  return this.replace(/(^\s*)|(\s*$)/g,"");
		}
    	function checkAdminChangePwd(){
    	
    		var oldPwd = document.getElementById('adminChangePwd:oldPwd').value.trim();
    		var newPwd = document.getElementById('adminChangePwd:newPwd').value.trim();
    		var reNewPwd = document.getElementById('adminChangePwd:reNewPwd').value.trim();
			
			var reg = /^\w+$/;
			if(oldPwd.length<6||oldPwd==""){
				alert("�Բ��𣬾����벻��Ϊ�ղ����Ȳ���С��6��");
				return false;
			}
			if(!reg.test(oldPwd)){
				alert("�Բ��𣬾���������Ƿ��ַ���");
				return false;
			}
			
			if(newPwd.length<6||newPwd==""){
				alert("�Բ��������벻��Ϊ�ղ����Ȳ���С��6��");
				return false;
			}
			if(!reg.test(newPwd)){
				alert("�Բ�����������Ƿ��ַ���");
				return false;
			}
			
			if(reNewPwd.length<6||reNewPwd==""){
				alert("�Բ���ȷ�������벻��Ϊ�ղ����Ȳ���С��6��");
				return false;
			}
			if(!reg.test(reNewPwd)){
				alert("�Բ���ȷ������������Ƿ��ַ���");
				return false;
			}
			if(reNewPwd!=newPwd){
				alert("�����������벻һֱ����˶Ժ����롣");
				return false;
			}
			return true;
    	}