<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<link href="css/style.css" type="text/css" rel="stylesheet">
<script src="js/validate.JS" language="javascript" type="text/javascript"></script>
<%@ page import="java.util.List"%>
<%@ page import="com.actionForm.ForceForm"%>
<%@ taglib prefix="logic" uri="/WEB-INF/struts-logic.tld"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��������̨-���㵼������</title>
</head>
<%

List list=(List)request.getAttribute("list");
int number=list.size();
//������δ����Ǽ������ҳ��
int pageNumber=number;
if(pageNumber%10==0){
pageNumber=pageNumber/10;
}else{
pageNumber=pageNumber/10+1;
}
//�����Ǽ��㵱ǰҳ��ҳ��
int count;
if(request.getParameter("count")==null){
count=0;
}else{
count=Integer.valueOf(request.getParameter("count"));
}
//������ʾ��������¼
int start=count*10;//��ʼ����
int over=(count+1)*10;//��������
int lastCount=number-over;//��ʣ��������¼
 if(lastCount<=0){
  over=number;
  }
%>
<body onLoad="clockon(bgclock);">
<jsp:include page="b_top.jsp"/>

<table width="918" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="100" align="right" valign="top" bgcolor="#FFFFFF">
<jsp:include page="b_left.jsp"/>
	</td>
    <td width="818" valign="top" background="images/b_right.jpg"><div align="center">
		<table width="680" height="65" border="0" align="center" cellpadding="0" cellspacing="0" background="images/b_place.jpg">
      <tr>
        <td valign="top"><table width="519">
          <tr>
            <td width="50" height="54" valign="bottom">&nbsp;</td>
            <td width="457" valign="bottom">��ǰλ�� &gt; ���㵼������</td>
          </tr>
        </table></td>
      </tr>
    </table><br>
	<table width="643" height="24" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
      <tr>
        <td height="24"> &nbsp;&nbsp;&nbsp;���㵼���鿴</td>
      </tr>
    </table><br>	
	
	
	
	
	
	
	
	<table width="500" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#E8E6E7">
      <tr>
        <td width="77" height="27"><div align="center">���</div></td>
        <td width="218"><div align="center">����������Ŀ</div></td>
        <td width="101"><div align="center">����ʱ��</div></td>
        <td width="94"><div align="center">����</div></td>
      </tr>
	     <%
  for(int i=start;i<over;i++){
  ForceForm form=(ForceForm)list.get(i);
  %>
      <tr bgcolor="#FFFFFF">
        <td width="77" height="31"><div align="center"><%=i+1%></div></td>
        <td width="218">&nbsp;&nbsp;<a href="forceAction.do?method=selectOneForceAction&id=<%=form.getId()%>"><%=form.getTitle()%></a></td>
        <td width="101"><div align="center"><%=form.getCreateTime()%></div></td>
        <td width="94"><div align="center"><a href="forceAction.do?method=queryForceFormAction&id=<%=form.getId()%>">�޸�</a>&nbsp;&nbsp;<a href="forceAction.do?method=deleteForceAction&id=<%=form.getId()%>">ɾ��</a></div></td>
      </tr>
	  <%}%>
    </table>

	<table width="500" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="27"><div align="right"><a href="b_forceInsert.jsp">�����������</a>&nbsp;</div></td>
      </tr>
    </table>
	<table width="433" border="0" cellpadding="0" cellspacing="0">
      <tr align="center">
        <td width="578" height="37" >
          <%for(int i=0;i<pageNumber;i++){%>
          <%if(count==i){%>
          [<font color="#FF0000"><b><%=i+1%></b></font>]
          <%}else{%>
      [<a href="forceAction.do?method=selectForceAction&count=<%=i%>"><b><%=i+1%></b></a>]
      <%}}%></td>
      </tr>
    </table>
	
	
	
	
	
	
	
	
	
	
	
		</div></td>
  </tr>
</table>
<jsp:include page="b_botton.jsp"/>
</body>
</html>
