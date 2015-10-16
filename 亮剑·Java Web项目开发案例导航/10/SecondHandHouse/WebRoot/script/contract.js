function checkRentContract() {
	var first = document.getElementById("mf:first").value.trim();
	var second = document.getElementById("mf:second").value.trim();
	var beginTime = document.getElementById("mf:beginTime").value.trim();
	var endTime = document.getElementById("mf:endTime").value.trim();
	var price = document.getElementById("mf:price").value.trim();
	var firstTel = document.getElementById("mf:firstTel").value.trim();
	var secondTel = document.getElementById("mf:secondTel").value.trim();
	var address = document.getElementById("mf:address").value.trim();
	var pattern = /^\d{4}-((0?[1-9])|(1[0-2]))-((0?[1-9])|([1-2]\d)|(3[0-1]))$/;
	var doublePat = /^\d+(.\d+)?$/;
	var telPat = /^(\d{4}-)?\d+$/;

	if(first=="") {
		showErrMsg("���޷�����Ϊ�գ�","mf:first");
		return false;
	}
	else if(second=="") {
		showErrMsg("���ⷽ����Ϊ�գ�","mf:second");
		return false;
	}
	else if(beginTime=="") {
		showErrMsg("��ʼ���ڲ���Ϊ�գ�","mf:beginTime");
		return false;
	}
	else if(!pattern.test(beginTime)) {
		showErrMsg("���ڸ�ʽӦΪyyyy-mm-dd��","mf:beginTime");
		return false;
	}
	else if(endTime=="") {
		showErrMsg("��ֹ���ڲ���Ϊ�գ�","mf:endTime");
		return false;
	}
	else if(!pattern.test(endTime)) {
		showErrMsg("���ڸ�ʽӦΪyyyy-mm-dd��","mf:endTime");
		return false;
	}
	else if(price=="") {
		showErrMsg("�۸���Ϊ�գ�","mf:price");
		return false;
	}
	else if(!doublePat.test(price)) {
		showErrMsg("�۸�ֻ��Ϊ���֣�","mf:price");
		return false;
	}
	else if(firstTel=="") {
		showErrMsg("���޷��绰����Ϊ�գ�","mf:firstTel");
		return false;
	}
	else if(!telPat.test(firstTel)) {
		showErrMsg("���޷��绰��ʽ���ԣ�","mf:firstTel");
		return false;
	}
	else if(secondTel=="") {
		showErrMsg("���ⷽ�绰����Ϊ�գ�","mf:secondTel");
		return false;
	}
	else if(!telPat.test(secondTel)) {
		showErrMsg("���ⷽ�绰��ʽ���ԣ�","mf:secondTel");
		return false;
	}
	else if(address=="") {
		showErrMsg("��ַ����Ϊ�գ�","mf:address");
		return false;
	}
	else {
		return true;
	}
}

function checkSaleContract() {
	var first = document.getElementById("mf:first").value.trim();
	var second = document.getElementById("mf:second").value.trim();
	var firstcardid = document.getElementById("mf:firstcardid").value.trim();
	var secondcardid = document.getElementById("mf:secondcardid").value.trim();
	var location = document.getElementById("mf:location").value.trim();
	var houseprice = document.getElementById("mf:houseprice").value.trim();
	var housearea = document.getElementById("mf:housearea").value.trim();
	var firsttel = document.getElementById("mf:firsttel").value.trim();
	var secondtel = document.getElementById("mf:secondtel").value.trim();
	var cardPat = /^\d{18}$/;
	var doublePat = /^\d+(.\d+)?$/;
	var telPat = /^(\d{4}-)?\d+$/;
	if(first=="") {
		showErrMsg("���۷�����Ϊ�գ�","mf:first");
		return false;
	}
	else if(second=="") {
		showErrMsg("�󹺷�����Ϊ�գ�","mf:second");
		return false;
	}
	else if(firstcardid=="") {
		showErrMsg("���۷����֤�Ų���Ϊ�գ�","mf:firstcardid");
		return false;
	}
	else if(!cardPat.test(firstcardid)) {
		showErrMsg("���۷����֤��ʽ����","mf:firstcardid");
		return false;
	}
	else if(secondcardid=="") {
		showErrMsg("�󹺷����֤�Ų���Ϊ�գ�","mf:secondcardid");
		return false;
	}
	else if(!cardPat.test(secondcardid)) {
		showErrMsg("�󹺷����֤��ʽ����","mf:secondcardid");
		return false;
	}
	else if(location=="") {
		showErrMsg("��Դλ�ò���Ϊ�գ�","mf:location");
		return false;
	}
	else if(housearea=="") {
		showErrMsg("�����������Ϊ�գ�","mf:housearea");
		return false;
	}
	else if(!doublePat.test(housearea)) {
		showErrMsg("�������ֻ��Ϊ���֣�","mf:housearea");
		return false;
	}
	else if(houseprice=="") {
		showErrMsg("���ݼ۸���Ϊ�գ�","mf:houseprice");
		return false;
	}
	else if(!doublePat.test(houseprice)) {
		showErrMsg("���ݼ۸�ֻ��Ϊ���֣�","mf:houseprice");
		return false;
	}
	else if(firsttel=="") {
		showErrMsg("���۷��绰����Ϊ�գ�","mf:firsttel");
		return false;
	}
	else if(!telPat.test(firsttel)) {
		showErrMsg("���۷��绰��ʽ���ԣ�","mf:firsttel");
		return false;
	}
	else if(secondtel=="") {
		showErrMsg("�󹺷��绰���ܲ��գ�","mf:secondtel");
		return false;
	}
	else if(!telPat.test(secondtel)) {
		showErrMsg("�󹺷��绰��ʽ���ԣ�","mf:secondtel");
		return false;
	}
	else {
		return true;
	}
}
