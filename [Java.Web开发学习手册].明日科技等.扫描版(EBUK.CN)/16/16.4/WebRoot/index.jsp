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
<title>���������б�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
</head>
<script language="javascript">
var http_request = false;
function createRequest(url) {
	//��ʼ�����󲢷���XMLHttpRequest����
	http_request = false;
	if (window.XMLHttpRequest) { // Mozilla��������IE����������
		http_request = new XMLHttpRequest();
		if (http_request.overrideMimeType) {
			http_request.overrideMimeType("text/xml");
		}
	} else if (window.ActiveXObject) { // IE�����
		try {
			http_request = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				http_request = new ActiveXObject("Microsoft.XMLHTTP");

		   } catch (e) {}
		}
	}
	if (!http_request) {
		alert("���ܴ���XMLHTTPʵ��!");
		return false;
	}
	http_request.onreadystatechange = alertContents;    //ָ����Ӧ����
	//����HTTP����
	http_request.open("GET", url, true);
	http_request.send(null);
}
function alertContents() {    //������������ص���Ϣ
	if (http_request.readyState == 4) {
		if (http_request.status == 200) {
			subType.innerHTML=http_request.responseText;
		} else {
			alert('�������ҳ�淢�ִ���');
		}
	}

}
</script>
<script language="javascript">
function F_super(val){
	createRequest("selSubType.jsp?superID="+val);  //ʵ�ּ��������б�
}
</script>
<script language="javascript">
function mycheck(){
	if (form1.goodsName.value==""){
		alert("��������Ʒ���ƣ�");form1.goodsName.focus();return;
	}
	if (form1.picture.value==""){
		alert("������ͼƬ�ļ���·����");form1.picture.focus();return;
	}
	if (form1.price.value==""){
		alert("��������Ʒ�Ķ��ۣ�");form1.price.focus();return;
	}
	if (isNaN(form1.price.value)){
		alert("������Ķ��۴������������룡");form1.price.value="";form1.price.focus();return;
	}	
	if (form1.introduce.value==""){
		alert("��������Ʒ��飡");form1.introduce.focus();return;
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
          <td width="14%" height="27">&nbsp;��Ʒ���ƣ�</td>
          <td height="27" colspan="3">&nbsp;
              <input name="goodsName" type="text" class="Sytle_text" id="bookID2" size="50">
            &nbsp;&nbsp; </td>
        </tr>
        <tr>
          <td height="27">&nbsp;�������ࣺ</td>
          <td width="31%" height="27">&nbsp;
              <select name="supertype" class="textarea" id="supertype" onChange="F_super(this.value)">
                <%rs_super.first();
					  do{
						  superID=rs_super.getInt(1);
						  superName=rs_super.getString(2);
					  %>
                <option value="<%=superID%>"<%if(superID==P_superID){out.println(" selected");/*ע��˴��ķֺ�*/}%>><%=superName%></option>
                <%}while(rs_super.next());%>
            </select></td>
          <td width="13%" height="27">&nbsp;����С�ࣺ</td>
          <td width="42%" height="27" id="subType">&nbsp;</td>
        </tr>
        <tr>
          <td height="41">&nbsp;ͼƬ�ļ���</td>
          <td height="41">&nbsp;
              <input name="picture" type="text" class="Style_upload" id="picture">
          </td>
          <td height="41">&nbsp;�������ۣ�</td>
          <td height="41">&nbsp;
              <input name="price" type="text" class="Sytle_text" id="price">
            (Ԫ)</td>
        </tr>
        <tr>
          <td height="103">&nbsp;��Ʒ��飺</td>
          <td colspan="3"><span class="style5">&nbsp; </span>
              <textarea name="introduce" cols="60" rows="5" class="textarea" id="introduce"></textarea></td>
        </tr>
        <tr>
          <td height="28" colspan="4" align="center"><input name="Button" type="button" class="btn_grey" value="����" onClick="mycheck()">
            &nbsp;
            <input name="Submit2" type="reset" class="btn_grey" value="����">
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
        <td height="13" colspan="3" align="center">Go�������̳ǿͻ��������ߣ�0431-84978981��84978982 ���棺0431-84972266</td>
        <td width="141">&nbsp;</td>
      </tr>
      <tr>
        <td height="15" colspan="2">&nbsp;</td>
        <td width="464" valign="bottom" align="center"> CopyRight &copy; 2007 www.mingrisoft.com ����ʡ���տƼ����޹�˾</td>
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
        <td align="center">��վ��ʹ��IE6.0�����ϰ汾 1024*768Ϊ�����ʾЧ��</td>
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
