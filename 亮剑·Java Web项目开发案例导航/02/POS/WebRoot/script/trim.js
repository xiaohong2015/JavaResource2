//ΪString��ע��Trim����
String.prototype.trim = function()
{
return this.replace(/(^\s*)|(\s*$)/g, "");
}
function delete_sure(url){
	if(confirm("ȷ��Ҫɾ����?")){
		document.location.href=url;
	}
}