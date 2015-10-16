<%@ page contentType="text/html; charset=GBK" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>人力资源管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="css/css.css" rel="stylesheet" type="text/css">
</head>
<script src="Js/js.js"></script>
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
<table width="94%"  border="0" align="center" cellpadding="0" cellspacing="1" bordercolor="#FFFFFF" bordercolorlight="#CCCCCC" bordercolordark="#FFFFFF" bgcolor="#97B150" >
  <tr>
    <td height="22" colspan="4" align="center" bgcolor="#97B150" class="word_yellow">-添加培训计划-</td>
  </tr>
  <form name="educateForm" method="post" action="modifyeducate.do?action=addeducate" onSubmit="return educateValidate();">
  <tr align="center">
    <td width="30%" height="27" bgcolor="#E8FEA9" >培训名称：</td>
    <td width="29%" height="22" align="left" bgcolor="#E8FEA9" ><input name="name" type="text" class="input"></td>
    <td width="18%" bgcolor="#E8FEA9" >培训目的：</td>
    <td width="23%" align="left" bgcolor="#E8FEA9" ><input type="text" name="purpose" class="input"></td>
  </tr>
  <tr align="center">
    <td width="30%" height="27" bgcolor="#E8FEA9" >培训开始时间：</td>
    <td height="22" align="left" bgcolor="#E8FEA9" ><input type="text" name="begintime" class="input"></td>
    <td height="22" bgcolor="#E8FEA9" >培训结束时间：</td>
    <td height="22" align="left" bgcolor="#E8FEA9" ><input type="text" name="endtime" class="input"></td>
  </tr>
  <tr align="center">
    <td width="30%" height="27" bgcolor="#E8FEA9" >讲师：</td>
    <td height="22" align="left" bgcolor="#E8FEA9" ><input type="text" name="teacher" class="input"></td>
    <td height="22" bgcolor="#E8FEA9" >培训人员：</td>
    <td height="22" align="left" bgcolor="#E8FEA9" ><input type="text" name="student" class="input"></td>
  </tr>
  <tr>
    <td width="30%" height="22" align="center" bgcolor="#E8FEA9" >培训材料：</td>
    <td height="22" colspan="3" align="left" bgcolor="#E8FEA9" ><textarea name="datum" cols="50" rows="6" class="input"></textarea></td>
  </tr>
  <tr>
    <td height="27" colspan="4" align="center" bgcolor="#E8FEA9" ><input name="Submit" type="submit" class="button" value="提交">
      &nbsp;&nbsp;
      <input name="Submit2" type="reset" class="button" value="重置"></td>
  </tr>
  </form>
</table>		
		
<!-------------->		</td>
      </tr>
    </table>
    <jsp:include page="copyright.html"/></td>
  </tr>
</table>

</body>
</html>
