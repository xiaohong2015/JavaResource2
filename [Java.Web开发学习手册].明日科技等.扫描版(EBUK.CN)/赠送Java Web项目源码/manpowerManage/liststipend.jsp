<%@ page contentType="text/html; charset=GBK" language="java" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.bOS.bPRO_PersonManage.en.Stipend"%>
<%@ page import="com.bOS.bUtil.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>������Դ����ϵͳ</title>
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
    <td height="22" colspan="11" align="center" class="word_yellow">-н���б�-</td>
  </tr>
  <tr class="tdhui">
    <td height="22" align="center" bgcolor="#E8FFA7" >Ա������</td>
    <td height="22" align="center" bgcolor="#E8FFA7" >����н��</td>
    <td height="22" align="center" bgcolor="#E8FFA7" >����</td>
    <td height="22" align="center" bgcolor="#E8FFA7" >����</td>
    <td height="22" align="center" bgcolor="#E8FFA7" >ȫ�ڽ�</td>
    <td height="22" align="center" bgcolor="#E8FFA7" >��˰</td>
    <td height="22" align="center" bgcolor="#E8FFA7" >���ⲹ��</td>
    <td height="22" align="center" bgcolor="#E8FFA7" >����</td>
    <td height="22" align="center" bgcolor="#E8FFA7" >����ʱ��</td>
    <td height="22" align="center" bgcolor="#E8FFA7" >�ܼ�</td>
    <td height="22" align="center" bgcolor="#E8FFA7" >ִ�в���</td>
  </tr>
  <% List list=(List)request.getAttribute("list");
  	 if(list!=null&&list.size()>0){
	    Iterator it = list.iterator();
           while (it.hasNext()) {
                    Stipend j = (Stipend) it.next();

  %>
  <tr>
    <td height="22" align="center" bgcolor="#FFFFFF" ><%=j.getName()%></td>
    <td height="22" align="center" bgcolor="#FFFFFF" ><%=j.getBasic()%></td>
    <td height="22" align="center" bgcolor="#FFFFFF" ><%=j.getEat()%></td>
    <td height="22" align="center" bgcolor="#FFFFFF" ><%=j.getHouse()%></td>
    <td height="22" align="center" bgcolor="#FFFFFF" ><%=j.getDuty()%></td>
    <td height="22" align="center" bgcolor="#FFFFFF" ><%=j.getScot()%></td>
    <td height="22" align="center" bgcolor="#FFFFFF" ><%=j.getOther()%></td>
    <td height="22" align="center" bgcolor="#FFFFFF" ><%=j.getPunishment()%></td>
    <td height="22" align="center" bgcolor="#FFFFFF" ><%=StringUtil.notNull(DateUtil.parseToString(j.getGranttime(),DateUtil.yyyyMMdd))%>&nbsp;</td>
    <td height="22" align="center" bgcolor="#FFFFFF" ><%=j.getTotalize()%></td>
    <td height="22" align="center" bgcolor="#FFFFFF" ><a href="updatestipend.do?action=detailstipend&id=<%=j.getId()%>">�޸�</a>&nbsp;&nbsp;<a href="modifystipend.do?action=deletestipend&id=<%=j.getId()%>">ɾ��</a></td>
  </tr>
  <%		}
   }else{
  %>
  <tr>
    <td height="22" colspan="11" align="center" bgcolor="#E8FFA7" >�Բ���û�����н����Ϣ������</td>
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
