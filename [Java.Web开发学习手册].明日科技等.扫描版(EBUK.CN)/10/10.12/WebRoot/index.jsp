<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>使用过滤器进行网站流量统计纪录</title>
</head>

<body>
<div align="center">

  <table width="339" height="102" border="0" cellpadding="0" cellspacing="0" background="image/background.jpg">
    <tr align="center">
      <td ><%=request.getAttribute("flux")%>次</td>
    </tr>
  </table>
  <br>

</div>
</body>
</html>
