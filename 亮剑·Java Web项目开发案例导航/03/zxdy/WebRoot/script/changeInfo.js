	function checkChangeInFo(){
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
	if(!checkPath()){							//��֤�ļ���ʽ�Ƿ���ȷ
		return false;
	}
	return true;
	}
	function checkPath(){
		var path = document.all.pic.value.trim();
		var length = path.length;					//�õ��ϴ��ļ����ַ�������
	var begin = path.lastIndexOf(".");			//�õ��ļ���׺��.����ʼ�±�
	type = path.substring(begin,length);		//�����Լ����ļ���
	type = type.toUpperCase();
	var reg = /^.JPG|.GIF|.BMP|.PNG|.JPEG$/;//�����ϴ����ļ���ʽ
	if(path==""){
		return true;
	}
	if(!reg.test(type)){
		document.all.picMsg.innerHTML="<img src='images/check_error.gif'/>"+
													"�ļ���ʽӦΪ[jpg,jpeg,gif,png,bmp]�е�һ��";
		return false;
	}
	document.all.picMsg.innerHTML="";
	return true;															
	}