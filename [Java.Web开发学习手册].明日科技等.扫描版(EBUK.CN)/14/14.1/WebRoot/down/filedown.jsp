<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.ResultSet" %>
<jsp:useBean id="mydb" class="com.fileUD.javabean.DB"/>
<%
  String errors=(String)request.getAttribute("errors");
  if(errors==null||errors.equals(""))
	  errors="<li>请选择要下载的文件！";
  String sql="select * from tb_file";
  ResultSet rs=mydb.Read(sql);  
%>
<html>
  <head>
    <title>文件下载</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
  </head>  
  <body>
    <center>
       <table border="1" height="100" width="350" bordercolor="gray" bordercolorlight="gray" bordercolordark="white" cellspacing="0" style="margin-top:100">
         <tr  height="25"><td align="center" colspan="3"><%=errors%></td></tr>
         <tr height="25">
            <td  bgcolor="lightgrey" align="center">文件名</td>
            <td  bgcolor="lightgrey" align="center">文件描述</td>
            <td  bgcolor="lightgrey" align="center">下载</td>
         </tr>
       <%
         if(rs.next()){
        	rs.previous();
        	while(rs.next()){
        		String filename=rs.getString("file_name");
        		String filesave=rs.getString("file_save");
        		String fileinfo=rs.getString("file_info");
       %>
         <tr>
           <td align="center" height="25"><%=filename%></td>
           <td align="center"><%=fileinfo%></td>
           <td align="center"><a href="dodown.jsp?downfile=<%=filesave%>">[下载]</a>
         </tr>
       <%
        	}
         }
         else{
             out.println("<tr><td align='center' colspan='3'>没有文件显示！</td></tr>");	 
         }
       %>
         <tr height="25"><td align="center" colspan="3"><a href="../up/fileup.jsp">[文件上传]</a></td></tr>
       </table>
    </center>
  </body>
</html>