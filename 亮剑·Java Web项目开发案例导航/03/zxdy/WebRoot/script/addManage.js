function checkAddManage(){
	var name = document.all.uname.value.trim();
	var pwda = document.all.pwda.value.trim();
	var pwdb = document.all.pwdb.value.trim();
	if(name==""){
		document.all.MsgUname.innerHTML="<img src='images/check_error.gif'/>����Ա������Ϊ��"
		return false;
	}
	if(name.length<3){
		document.all.MsgUname.innerHTML="<img src='images/check_error.gif'/>"+"����Ա�����Ȳ���С��3���ַ�";
		return false;
	}
	if(pwda.length<6){
		document.all.MsgPwda.innerHTML="<img src='images/check_error.gif'/>"+"���볤�Ȳ���С��6���ַ�";
		return false;
	}
	if(pwda!=pwdb){
		document.all.MsgPwdb.innerHTML="<img src='images/check_error.gif'/>"+"�����������벻���";
		return false;
	}
	return true;
}