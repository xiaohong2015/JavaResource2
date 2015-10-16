<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.ConnDB"%>
<%
ConnDB conn=new ConnDB();
ResultSet rs_super=conn.executeQuery("select ID,superType from V_type group by ID,superType");
int superID=-1;
int P_superID=-1;
String superName="";
if(rs_super.next()){
	superID=rs_super.getInt(1);
}
%>
<html>
<head>
<title>级联下拉列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
</head>
<script language="javascript">
var http_request = false;
function createRequest(url) {
	//初始化对象并发出XMLHttpRequest请求
	http_request = false;
	if (window.XMLHttpRequest) { // Mozilla或其他除IE以外的浏览器
		http_request = new XMLHttpRequest();
		if (http_request.overrideMimeType) {
			http_request.overrideMimeType("text/xml");
		}
	} else if (window.ActiveXObject) { // IE浏览器
		try {
			http_request = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				http_request = new ActiveXObject("Microsoft.XMLHTTP");

		   } catch (e) {}
		}
	}
	if (!http_request) {
		alert("不能创建XMLHTTP实例!");
		return false;
	}
	http_request.onreadystatechange = alertContents;    //指定响应方法
	//发出HTTP请求
	http_request.open("GET", url, true);
	http_request.send(null);
}
function alertContents() {    //处理服务器返回的信息
	if (http_request.readyState == 4) {
		if (http_request.status == 200) {
			subType.innerHTML=http_request.responseText;
		} else {
			alert('您请求的页面发现错误');
		}
	}

}
</script>
<script language="javascript">
function F_super(val){
	createRequest("selSubType.jsp?superID="+val);  //实现级联下拉列表
}
</script>
<script language="javascript">
function mycheck(){
	if (form1.goodsName.value==""){
		alert("请输入商品名称！");form1.goodsName.focus();return;
	}
	if (form1.picture.value==""){
		alert("请输入图片文件的路径！");form1.picture.focus();return;
	}
	if (form1.price.value==""){
		alert("请输入商品的定价！");form1.price.focus();return;
	}
	if (isNaN(form1.price.value)){
		alert("您输入的定价错误，请重新输入！");form1.price.value="";form1.price.focus();return;
	}	
	if (form1.introduce.value==""){
		alert("请输入商品简介！");form1.introduce.focus();return;
	}	
	form1.submit();	
}
</script>
<body>
<table width="777" height="192"  border="0" align="center" cellpadding="0" cellspacing="0" background="images/bg.jpg" class="tableBorder">
<tr>
  <td>
<table width="777" height="115"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td bgcolor="#CCCCCC" height="6px"></td>
      </tr>
    </table>
      <table width="100%" height="200"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="175" valign="top">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="777"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="182" height="282" valign="top">&nbsp;</td>
    <td align="center" valign="top">
      <table width="96%"  border="0" align="center" cellpadding="-2" cellspacing="-2" bordercolordark="#FFFFFF">
	  <form action="" method="post" name="form1">
        <tr>
          <td width="14%" height="27">&nbsp;商品名称：</td>
          <td height="27" colspan="3">&nbsp;
              <input name="goodsName" type="text" class="Sytle_text" id="bookID2" size="50">
            &nbsp;&nbsp; </td>
        </tr>
        <tr>
          <td height="27">&nbsp;所属大类：</td>
          <td width="31%" height="27">&nbsp;
              <select name="supertype" class="textarea" id="supertype" onChange="F_super(this.value)">
                <%rs_super.first();
					  do{
						  superID=rs_super.getInt(1);
						  superName=rs_super.getString(2);
					  %>
                <option value="<%=superID%>"<%if(superID==P_superID){out.println(" selected");/*注意此处的分号*/}%>><%=superName%></option>
                <%}while(rs_super.next());%>
            </select></td>
          <td width="13%" height="27">&nbsp;所属小类：</td>
          <td width="42%" height="27" id="subType">&nbsp;</td>
        </tr>
        <tr>
          <td height="41">&nbsp;图片文件：</td>
          <td height="41">&nbsp;
              <input name="picture" type="text" class="Style_upload" id="picture">
          </td>
          <td height="41">&nbsp;定　　价：</td>
          <td height="41">&nbsp;
              <input name="price" type="text" class="Sytle_text" id="price">
            (元)</td>
        </tr>
        <tr>
          <td height="103">&nbsp;商品简介：</td>
          <td colspan="3"><span class="style5">&nbsp; </span>
              <textarea name="introduce" cols="60" rows="5" class="textarea" id="introduce"></textarea></td>
        </tr>
        <tr>
          <td height="28" colspan="4" align="center"><input name="Button" type="button" class="btn_grey" value="保存" onClick="mycheck()">
            &nbsp;
            <input name="Submit2" type="reset" class="btn_grey" value="重置">
            &nbsp;</td>
        </tr>
		</form>
      </table>
    
      <table width="100%" height="46"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td background="images/manage_06.gif">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="777"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="54" align="center"><table width="100%" height="74"  border="0" align="center" cellpadding="-2" cellspacing="-2">
      <tr>
        <td height="9" colspan="5"><div align="center">
          <hr width="100%" size="1">
          </div></td>
        </tr>
      <tr>
        <td width="124" height="13">&nbsp;</td>
        <td height="13" colspan="3" align="center">Go购电子商城客户服务热线：0431-84978981，84978982 传真：0431-84972266</td>
        <td width="141">&nbsp;</td>
      </tr>
      <tr>
        <td height="15" colspan="2">&nbsp;</td>
        <td width="464" valign="bottom" align="center"> CopyRight &copy; 2007 www.mingrisoft.com 吉林省明日科技有限公司</td>
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
        <td align="center">本站请使用IE6.0或以上版本 1024*768为最佳显示效果</td>
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr bgcolor="#cccccc">
        <td height="8" colspan="2"></td>
        <td height="8" align="center"></td>
        <td height="8" colspan="2"></td>
      </tr>
    </table></td>
  </tr>
</table>
</td>
</tr>
</table>
<script language="javascript">
F_super(form1.supertype.value);
</script>
</body>
</html>
