<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<link href="css/style.css" type="text/css" rel="stylesheet">
<script src="js/validate.JS" language="javascript" type="text/javascript"></script>

<%@ page import="java.util.List"%>
<%@ page import="com.actionForm.ManagerForm"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新闻网后台-用户管理</title>
</head>
<%
List<ManagerForm> list=(List<ManagerForm>)request.getAttribute("list");
int number=list.size();
//以下这段代码是计算多少页数
int pageNumber=number;
if(pageNumber%10==0){
pageNumber=pageNumber/10;
}else{
pageNumber=pageNumber/10+1;
}
//以下是计算当前页的页数
int count;
if(request.getParameter("count")==null){
count=0;
}else{
count=Integer.valueOf(request.getParameter("count"));
}
//以下显示多少条纪录
int start=count*10;//开始条数
int over=(count+1)*10;//结束条数
int lastCount=number-over;//还剩多少条记录
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
        <td valign="top"><table width="519">
          <tr>
            <td width="50" height="54" valign="bottom">&nbsp;</td>
            <td width="457" valign="bottom">当前位置 &gt; 用户管理</td>
          </tr>
        </table></td>
      </tr>
    </table><br>
	<table width="643" height="24" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
      <tr>
        <td height="24"> &nbsp;&nbsp;&nbsp;用户查看</td>
      </tr>
    </table>	
<br>
	<table width="415" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#E8E6E7">
      <tr bgcolor="#E8E6E7">
        <td height="23"><div align="center">用户号</div></td>
        <td><div align="center">姓名</div></td>
        <td><div align="center">操作</div></td>
      </tr>
<%
  for(int i=start;i<over;i++){
  ManagerForm form=list.get(i);
 %>
     <tr align="center" bgcolor="#FFFFFF">
        <td height="29"><%=form.getAccount()%></td>
        <td><%=form.getName()%></td>
        <td>
        <%if(form.getManager()!=1){%>
        <a href="managerAction.do?method=deleteManagerAction&account=<%=form.getAccount()%>">删除</a>
        <%}else{out.print("&nbsp;");}%>
        </td>
      </tr><%}%>
    </table>
	<table  border="0" cellpadding="0" cellspacing="0">
      <tr align="center">
        <td width="578" height="37" >
          <%for(int i=0;i<pageNumber;i++){%>
          <%if(count==i){%>
      [<font color="#FF0000"><b><%=i+1%></b></font>]
      <%}else{%>
      [<a href="managerAction.do?method=selectManagerAction&count=<%=i%>"><b><%=i+1%></b></a>]
      <%}}%></td>
      </tr>
    </table>

	</td>
  </tr>
</table>
<jsp:include page="b_botton.jsp"/>
</body>
</html>
