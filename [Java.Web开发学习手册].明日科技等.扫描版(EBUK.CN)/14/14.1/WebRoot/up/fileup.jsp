<%@ page contentType="text/html;charset=gb2312"%>
<%
   String errors=(String)request.getAttribute("errors");
   if(errors==null||errors.equals(""))
	   errors="<li>请选择要上传的文件！</li>";
%>
<html>
  <head>
    <title>文件上传</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
  </head>  
  <body>
    <center>
      <form action="doup.jsp" method="POST" enctype="multipart/form-data">
       <table border="1" height="100" width="350" bordercolor="gray" bordercolorlight="gray" bordercolordark="white" cellspacing="0" style="margin-top:100">
         <tr bgcolor="lightgrey" height="25"><td align="center" colspan="3"><%=errors%></td></tr>
      <% for(int i=1;i<3;i++){ %>
         <tr>
            <td  align="right" rowspan="2" width="20%">文件<%=i%>：</td>
            <td align="center" colspan="2"><input type="file" name="file<%=i%>" size="35"></td>
         </tr>
         <tr>
            <td bgcolor="lightgrey" align="right" width="25%">文件描述：</td>
            <td align="center"><input type="text" name="info<%=i%>" size="33" maxlength="20"></td>
         </tr>         
      <% } %>
         <tr bgcolor="lightgrey">
           <td align="right" colspan="3">
             <input type="submit" value="上传">
             <input type="reset" value="重置">
             <a href="../down/filedown.jsp">[文件下载]</a>
           </td>
         </tr>
       </table>
      </form>
    </center>
  </body>
</html>