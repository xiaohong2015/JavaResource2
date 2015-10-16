function checkInfo(){
	var start = document.mf_book.tstart.value.trim();
	var end = document.mf_book.tend.value.trim();
	//var pattern = /^\d{4}-((0?[1-9])|(1[0-2]))-((0?[1-9])|([1-2]\d)|(3[0-1]))$/;
	if(start==""){
		showErrMsg("�������в���Ϊ�գ�","tstart");
		return;
	}
	if(end==""){
		showErrMsg("Ŀ�ĳ��в���Ϊ�գ�","tend");
		return;
	}
	if(start==end){
		showErrMsg("�������к��յ���в�����ͬ��","tstart");
		return;
	}
	document.mf_book.submit();
	
}

function checkMsg(){
	var tname = document.mf_train.tname.value.trim();
	if(tname==""){
		showErrMsg("���θ��Ʋ���Ϊ�գ�","tname");
		return;
	}
	document.mf_train.submit();
}

function check(){
	var linkman = document.all.linkman.value.trim();
	var tamount = document.all.tamount.value.trim();
	var tdate = document.all.tdate.value.trim();
	var address = document.all.address.value.trim();
	var tel = document.all.tel.value.trim();
	var pattern = /^[1-9]\d*$/;
	var pattern1 = /^\d{4}-((0?[1-9])|(1[0-2]))-((0?[1-9])|([1-2]\d)|(3[0-1]))$/;
	if(linkman==""){
		showErrMsg("��ϵ�˲���Ϊ�գ�","linkman");
		return;
	}
	if(tamount==""){
		showErrMsg("��Ʊ��������Ϊ�գ�","tamount");
		return;
	}
	if(!pattern.test(tamount)){
		showErrMsg("����ֻ��Ϊ���֣��Ҳ���Ϊ0��","tamount");
		return;
	}
	if(tdate==""){
		showErrMsg("��Ʊ���ڲ���Ϊ�գ�","tdate");
		return;
	}
	if(!pattern1.test(tdate)){
		showErrMsg("��Ʊ���ڸ�ʽ����<YYYY-MM-DD>","tdate");
		return;
	}
	if(address==""){
		showErrMsg("��ϵ�˵�ַ����Ϊ�գ�","address");
		return;
	}
	if(tel==""){
		showErrMsg("��ϵ�绰����Ϊ�գ�","tel");
		return;
	}
	document.mf_msg.submit();
}

function modify(){
	var linkman = document.all.linkman.value.trim();
	var tamount = document.all.tamount.value.trim();
	var tdate = document.all.tdate.value.trim();
	var address = document.all.address.value.trim();
	var tel = document.all.tel.value.trim();
	var pattern = /^[1-9]\d*$/;
	var pattern1 = /^\d{4}-((0?[1-9])|(1[0-2]))-((0?[1-9])|([1-2]\d)|(3[0-1]))$/;
	if(linkman==""){
		showErrMsg("��ϵ�˲���Ϊ�գ�","linkman");
		return;
	}
	if(tamount==""){
		showErrMsg("��Ʊ��������Ϊ�գ�","tamount");
		return;
	}
	if(!pattern.test(tamount)){
		showErrMsg("����ֻ��Ϊ���֣��Ҳ���Ϊ0��","tamount");
		return;
	}
	if(tdate==""){
		showErrMsg("��Ʊ���ڲ���Ϊ�գ�","tdate");
		return;
	}
	if(!pattern1.test(tdate)){
		showErrMsg("��Ʊ���ڸ�ʽ����<YYYY-MM-DD>","tdate");
		return;
	}
	if(address==""){
		showErrMsg("��ϵ�˵�ַ����Ϊ�գ�","address");
		return;
	}
	if(tel==""){
		showErrMsg("��ϵ�绰����Ϊ�գ�","tel");
		return;
	}
	document.mf_mod.submit();

}

