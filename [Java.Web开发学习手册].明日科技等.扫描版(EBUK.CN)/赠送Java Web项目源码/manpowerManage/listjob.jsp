<%@ page contentType="text/html; charset=GBK" language="java" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.bOS.bPRO_PersonManage.en.Job"%>
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
    <td height="22" colspan="7" align="center" class="word_yellow">-�˲���Ϣ-</td>
  </tr>
  <tr class="tdhui">
    <td height="22" align="center" bgcolor="#E8FFA7" >����</td>
    <td height="22" align="center" bgcolor="#E8FFA7" >�Ա�</td>
    <td height="22" align="center" bgcolor="#E8FFA7" >����</td>
    <td height="22" align="center" bgcolor="#E8FFA7" >ְλ</td>
    <td height="22" align="center" bgcolor="#E8FFA7" >��ѧרҵ</td>
    <td height="22" align="center" bgcolor="#E8FFA7" >��������</td>
    <td height="22" align="center" bgcolor="#E8FFA7" >ִ�в���</td>
  </tr>
  <% List list=(List)request.getAttribute("list");
  	 if(list!=null&&list.size()>0){
	    Iterator it = list.iterator();
           while (it.hasNext()) {
                    Job j = (Job) it.next();

  %>
  <tr>
    <td height="22" align="center" bgcolor="#FFFFFF" ><%=j.getName()%></td>
    <td height="22" align="center" bgcolor="#FFFFFF" ><%=new Byte("1").equals(j.getSex())?"��":"Ů"%></td>
    <td height="22" align="center" bgcolor="#FFFFFF" ><%=j.getAge()%></td>
    <td height="22" align="center" bgcolor="#FFFFFF" ><%=j.getJob()%></td>
    <td height="22" align="center" bgcolor="#FFFFFF" ><%=j.getSpecialty()%></td>
    <td height="22" align="center" bgcolor="#FFFFFF" ><%=j.getExperience()%></td>
    <td height="22" align="center" bgcolor="#FFFFFF" ><a href="detailjob.do?action=detailjob&id=<%=j.getId()%>">��ϸ</a>&nbsp;&nbsp;<a href="modifyjob.do?action=deletejob&id=<%=j.getId()%>">ɾ��</a>
	<%if(j.getIsstock()!=null&&j.getIsstock().intValue()==0){%>
		&nbsp;&nbsp;<a href="modifyjob.do?action=updatejob&id=<%=j.getId()%>&isstock=1">���</a></td>
	<%}%>
  </tr>
  <%		}
   }else{
  %>
  <tr>
    <td height="22" colspan="7" align="center" bgcolor="#E8FFA7" >�Բ���û����Ϣ������</td>
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
