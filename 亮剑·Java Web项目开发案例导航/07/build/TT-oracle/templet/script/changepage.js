function checkPage(temp){
	var page = document.all.page.value.trim();
	var reg = /^[1-9][0-9]*$/;
	if((reg.test(page.trim()))&&(page<=temp)){
		document.all.myform.submit();
	}
	else{
		alert("���벻�Ϸ�,����������!!!");
		return;
	}
}