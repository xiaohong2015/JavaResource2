String.prototype.trim=function()
{
  return this.replace(/(^\s*)|(\s*$)/g,"");
}
function reloadImage(){/*���¼�����֤��ͼƬ*/
  	document.all.pic.src='yzm.jsp?'+Math.random();
}