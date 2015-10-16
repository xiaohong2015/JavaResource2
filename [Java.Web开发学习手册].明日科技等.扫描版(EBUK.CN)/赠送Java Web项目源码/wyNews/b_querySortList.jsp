<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:directive.page import="com.actionForm.NewsForm"/>
<jsp:directive.page import="com.actionForm.SortForm"/>
<link href="css/style.css" type="text/css" rel="stylesheet">
<script src="js/validate.JS" language="javascript" type="text/javascript"></script>
<%@ page import="java.util.List"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="objectDao" scope="request" class="com.dao.ObjectDao"/>
<title>��������̨-���Ź���</title>
</head>
<%
String sortNews=new String(request.getParameter("bigSort").getBytes("ISO8859_1"),"gb2312");
int pagesize=10;
List list=(List)request.getAttribute("list");
int number=list.size();
//������δ����Ǽ������ҳ��
int pageNumber=number;
if(pageNumber%pagesize==0){
pageNumber=pageNumber/pagesize;
}else{
pageNumber=pageNumber/pagesize+1;
}
//�����Ǽ��㵱ǰҳ��ҳ��
int count;
if(request.getParameter("count")==null){
count=0;
}else{
count=Integer.valueOf(request.getParameter("count"));
}
//������ʾ��������¼
int start=count*pagesize;//��ʼ����
int over=(count+1)*pagesize;//��������
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
    <td width="818" valign="top" background="images/b_right.jpg" align="center">
	<table width="680" height="65" border="0" align="center" cellpadding="0" cellspacing="0" background="images/b_place.jpg">
      <tr>
        <td valign="top"><table width="659">
          <tr>
            <td width="49" height="54" valign="bottom">&nbsp;</td>
            <td width="491" valign="bottom">��ǰλ�� &gt; ���Ź��� &gt; ����������</td>
            <td width="103" valign="bottom"><div align="right"><a href="newsAction.do?method=queryNewsListAction&bigSort=<%=sortNews%>">�������Ų鿴</a></div></td>
          </tr>
        </table></td>
      </tr>
    </table><br>
	<table width="643" height="24" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
      <tr>
        <td height="24"> &nbsp;&nbsp;&nbsp;<%=sortNews%>&nbsp;&nbsp;�������</td>
      </tr>
    </table>	
	<br>	  <table width="627" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#E8E6E7">
        <tr>
          <td width="85" height="27"><div align="center">�����</div></td>
          <td width="197"><div align="center">����</div></td>
          <td width="121"><div align="center">����ʱ��</div></td>
          <td width="132"><div align="center">����</div></td>
        </tr>
        <%

  for(int i=start;i<over;i++){
  SortForm form=(SortForm)list.get(i);
  %>
        <tr align="center" bgcolor="#FFFFFF">
          <td width="85" height="31"><%=i+1%></td>
          <td width="197"><%=form.getSmallSort()%></td>
          <td width="121"><%=form.getCreateTime()%></td>
          <td width="132"><a href="sortAction.do?method=deleteSortAction&id=<%=form.getId() %>&bigSort=<%=form.getBigSort()%>">ɾ��</a></td>
        </tr>
        <%}%>
      </table>

      <table width="594" border="0">
        <tr align="right">
          <td width="503">&nbsp;&nbsp;</td>
          <td width="104"> <a href="b_sortInsert.jsp?bigSort=<%=sortNews%>">������</a> </td>
        </tr>
      </table>
      <table width="58%" border="0" cellpadding="0" cellspacing="0">
        <tr align="center">
          <td width="523" height="37" >
            <%for(int i=0;i<pageNumber;i++){%>
            <%if(count==i){%>
            [<font color="#FF0000"><b><%=i+1%></b></font>]
            <%}else{%>
      [<a href="sortAction.do?method=selectSortAction&bigSort=<%=sortNews%>&count=<%=i%>"><b><%=i+1%></b></a>]
      <%}}%></td>
        </tr>
      </table>
	
	
	
	</td>
  </tr>
</table>
<jsp:include page="b_botton.jsp"/>
</body>
</html>
