<%@ page contentType="text/html; charset=gb2312" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��ʾ������Ľ��</title>
</head>
<body>
<br>
<%

String sortNews=request.getParameter("bigSort");
if(request.getParameter("id")!=null){
    sortNews=new String(sortNews.getBytes("ISO8859_1"),"gb2312");
}
String result=(String)request.getAttribute("result");
%>
<script language='javascript'>alert('<%=result%>');window.location.href='sortAction.do?method=selectSortAction&bigSort=<%=sortNews%>';</script>
</body>
</html>

