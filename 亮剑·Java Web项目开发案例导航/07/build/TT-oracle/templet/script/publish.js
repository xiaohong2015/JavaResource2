function checkPublishMsg(){
	var mname = document.mf_publish.mname.value.trim();
	var mamount = document.mf_publish.mamount.value.trim();
	var mtickettime = document.mf_publish.mtickettime.value.trim();			//#����
	var mstart = document.mf_publish.mstart.value.trim();					//#��������
	var mend = document.mf_publish.mend.value.trim();						//Ŀ�ĳ���
	var mticketprice = document.mf_publish.mticketprice.value.trim();		//��Ʊ�۸�
	var mlinkman = document.mf_publish.mlinkman.value.trim();				//��ϵ��
	var mtel = document.mf_publish.mtel.value.trim();						//��ϵ�绰
	var mmsg = document.mf_publish.mmsg.value.trim();						//������Ϣ
	var identify = document.mf_publish.identify.value.trim();				//��֤��
	var pattern = /^\d{4}-((0?[1-9])|(1[0-2]))-((0?[1-9])|([1-2]\d)|(3[0-1]))$/;
	var pattern1 = /^\d+(\.\d+)?$/;
	var pattern2 = /^\d+(-\d+)?$/;
	var pattern3 = /^0|([1-9]\d*)$/;
	var pattern4 = /^[0-9a-zA-Z]{4}$/;
	if(mname==""){
		showErrMsg("���β���Ϊ�գ�","mname");
		return;
	}
	else if(mtickettime==""){
		showErrMsg("��Ʊ���ڲ���Ϊ�գ�","mtickettime");
		return;
	}
	else if(!pattern.test(mtickettime)){
		showErrMsg("���ڸ�ʽ����ȷ��","mtickettime");
		return;		
	}
	else if(mamount==""){
		showErrMsg("��������Ϊ�գ�","mamount");
		return;
	}
	else if(!pattern3.test(mamount)){
		showErrMsg("������ʽ���ԣ�","mamount")
		return;
	}
	else if(mstart==""){
		showErrMsg("�������в���Ϊ�գ�","mstart");
		return;
	}
	else if(mend==""){
		showErrMsg("Ŀ�ĳ��в���Ϊ�գ�","mend");
		return;
	}
	else if(mticketprice!=""&&!pattern1.test(mticketprice)){
		showErrMsg("��Ʊ�۸����ֻ��Ϊ���֡�","mticketprice");
		return;
	}
	else if(mlinkman==""){
		showErrMsg("��ϵ�˲���Ϊ�գ�","mlinkman");
		return;
	}
	else if(mtel==""){
		showErrMsg("��ϵ�绰����Ϊ�գ�","mtel");
		return;
	}
	else if(!pattern2.test(mtel)){
		showErrMsg("��ϵ�绰��ʽ���ԣ�","mtel");
		return;
	}
	else if(identify==""){
		showErrMsg("��֤��Ϊ�գ����������룡","identify");
		return;
	}
	else if(!pattern4.test(identify)){
		showErrMsg("��֤�����","identify");
		return;
	}
	document.mf_publish.submit();	
}