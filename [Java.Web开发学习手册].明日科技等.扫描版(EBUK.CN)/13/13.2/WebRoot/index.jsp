<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<jsp:useBean id="date" class="com.mwq.tool.FormatDate"></jsp:useBean>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>ͨ��DriverManager���ṩ�ķ���������־���</title>
  </head>
  
  <link rel="stylesheet" href="css/style.css">
  
<body topmargin="0">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="11%"></td>
    <td width="78%"></td>
    <td width="11%"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td bgcolor="#CCFFFF"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="center"><font size="2"><b>ͨ��DriverManager���ṩ�ķ���������־���</b></font></td>
      </tr>
      <%
      String driverClass = "com.microsoft.jdbc.sqlserver.SQLServerDriver";
      Class.forName(driverClass);
      String url=request.getRealPath("");
      File file = new File(url+"/WEB-INF/logs/jdbcLog.txt");
      PrintWriter printWriter = new PrintWriter(file);
      DriverManager.setLogWriter(printWriter);
      DriverManager.println("��DriverManager��ע�����ݿ������ɹ���"+date.getFullDateAndTime());
      %>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="center"><table width="80%" border="0" cellspacing="0" cellpadding="4">
          <tr align="center">
            <td>
            <%
            FileInputStream inFile=new FileInputStream(file);
            int ch;
            StringBuilder sb=new StringBuilder();
            while((ch=inFile.read())>0){
            	sb.append((char)ch);
            }
            String content=new String(sb.toString().trim().getBytes("ISO8859-1"),"GB2312");
            out.print(content.replace("\n","<br>"));
            %>
            </td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
  
</html>
