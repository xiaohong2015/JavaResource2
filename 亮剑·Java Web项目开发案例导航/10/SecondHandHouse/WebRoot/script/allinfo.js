function checkPage() {
	var total = document.getElementById("mf:totalPage").value.trim();
	var page = document.getElementById("mf:page").value.trim();
	var reg = /^[1-9]\d*$/;
	if(page=="") {
		showErrMsg("Ҫ��תҳ�治��Ϊ�գ�","mf:page");
		return false;
	}
	else if(!reg.test(page)) {
		showErrMsg("ҳ�����벻�Ϸ���","mf:page");
		return false;
	}
	else if(page>total) {
		showErrMsg("ҳ�����벻�Ϸ���","mf:page");
		return false;
	}
	return true;
}

function clearPage() {
	document.getElementById("mf:page").value = "";
}