String.prototype.trim=function()
{
  return this.replace(/(^\s*)|(\s*$)/g,"");
}

function checkEditRes(){
		var rname = document.getElementById('editRes:rname').value.trim();
		var rspec = document.getElementById('editRes:rspec').value.trim();
		var rprice = document.getElementById('editRes:rprice').value.trim();
		var rdetail = document.getElementById('editRes:rdetail').value.trim();
		
		if(rname==""){
				alert("��Դ���Ʋ���Ϊ��");
				return false;
		}
		if(rspec==""){
				alert("��Դ��񲻵�Ϊ��");
				return false;
		}
		if(rprice==""){
				alert("��Դ�۸񲻵�Ϊ��");
				return false;
		}
		var reg = /^\d+(\.\d+)?$/;
		if(!reg.test(rprice)){
			alert("��Դ�۸��ʽ����");
			return false;
		}
		
		if(rdetail==""){
			alert("��������Ϊ��");
			return false;
		}
		
		
		return true;
}