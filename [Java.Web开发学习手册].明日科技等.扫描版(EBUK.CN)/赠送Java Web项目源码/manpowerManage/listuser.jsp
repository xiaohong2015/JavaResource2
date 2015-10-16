<%@ page contentType="text/html; charset=GBK" language="java" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.bOS.bPRO_PersonManage.en.Users"%>
<%@ page import="com.bOS.bUtil.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>人力资源管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="css/css.css" rel="stylesheet" type="text/css">
</head>

<body>
<jsp:include page="top.jsp"/>
<table width="1003" border="0" align="center" cellpadding="0" cellspacing="0" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF"  >
  <tr>
    <td width="191" height="497" rowspan="2" valign="top" >&nbsp;</td>
    <td width="772" height="48" valign="top">
		<jsp:include page="navigation.jsp"/>
	
	</td>
    <td width="40" rowspan="2" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td height="249" valign="top">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="431" valign="top" bgcolor="#C5DF7E">
<!------->		
		
   <br>
<table width="94%"  border="0" align="center" cellpadding="0" cellspacing="1" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#97B150" >
  <tr>
    <td height="22" colspan="7" align="center" ><strong class="word_yellow">-浏览员工信息-</strong></td>
  </tr>
  <tr class="tdhui">
    <td width="17%" height="22" align="center" bgcolor="#E8FFA7" >员工姓名</td>
    <td width="10%" height="22" align="center" bgcolor="#E8FFA7" >性别</td>
    <td width="16%" height="22" align="center" bgcolor="#E8FFA7" >出生日期</td>
    <td width="10%" height="22" align="center" bgcolor="#E8FFA7" >是否管理员</td>
    <td width="30%" height="22" align="center" bgcolor="#E8FFA7" >简介</td>
    <td width="17%" align="center" bgcolor="#E8FFA7" >执行操作</td>
  </tr>
  <% List list=(List)request.getAttribute("list");
  	 if(list!=null&&list.size()>0){
	    Iterator it = list.iterator();
           while (it.hasNext()) {
                    Users u = (Users) it.next();

  %>
  <tr>
    <td height="22" align="center" bgcolor="#FFFFFF" ><%=StringUtil.notNull(u.getUsername())%>&nbsp;</td>
    <td height="22" align="center" bgcolor="#FFFFFF" ><%=new Byte("1").equals(u.getSex())?"男":"女"%></td>
    <td height="22" align="center" bgcolor="#FFFFFF" ><%=StringUtil.notNull(DateUtil.parseToString(u.getBirthday(),DateUtil.yyyyMMdd))%>&nbsp;</td>
    <td height="22" align="center" bgcolor="#FFFFFF" ><%=new Byte("1").equals(u.getIsadmin())?"是":"否"%></td>
    <td height="22" align="center" bgcolor="#FFFFFF" ><%=StringUtil.notNull(u.getContent())%>&nbsp;</td>
    <td height="22" align="center" bgcolor="#FFFFFF" ><a href="selectuser.do?action=selectuser&id=<%=u.getId()%>">修改</a>&nbsp;&nbsp;<a href="modifyuser.do?action=deleteuser&id=<%=u.getId()%>">删除</a></td>
  </tr>
  <%		}
   }else{
  %>
  <tr>
    <td height="22" colspan="7" align="center" bgcolor="#E8FFA7" >对不起，没有添加员工信息！！！</td>
  </tr>
  <%}%>
</table>		
		
<!-------------->		</td>
      </tr>
    </table>
    <jsp:include page="copyright.html"/></td>
  </tr>
</table>
</body>
</html>
