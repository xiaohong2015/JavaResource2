<%@ page contentType="text/html;charset=gbk" 
	import="wyf.zrk.DButil"
%>
<html>
  <head>
    <title>ʾ��</title>
    <link rel=stylesheet href="css/style.css" type="text/css">
  </head>
  <body bgcolor="#EBF5FD">
    <jsp:useBean id="userBean" class="wyf.zrk.UserBean" scope="session"/>
    <center><br/><br/><br/><br/>
      <table width="80%" height="60%">
      	<tr align="center" height="100">
      	  <td><div class="block">
      	    <img src="img/spzl.gif" onmouseover="border='1'" onmouseout="border='0'"/><p/>
      	    <a href="ManageServlet?action=search&key=&type=goodsinfo" 
      	    			target="mainFrame"><font>��Ʒ����</font></a>
      	  </div></td>
      	  <td><div class="block">
      	    <img src="img/splb.gif" onmouseover="border='1'" onmouseout="border='0'"/><p/>
      	    <a href="ManageServlet?action=search&key=&type=goodsclassinfo" 
      	    			target="mainFrame"><font>��Ʒ���</font></a>
      	  </div></td>
      	  <td><div class="block">
      	    <img src="img/khzl.gif" onmouseover="border='1'" onmouseout="border='0'"/><p/>
      	    <a href="ManageServlet?action=search&key=&type=consumerinfo"
      	    			target="mainFrame"><font>�ͻ�����</font></a>
      	  </div></td>
      	  <td><div class="block">
      	    <img src="img/gyszl.gif" onmouseover="border='1'" onmouseout="border='0'"/><p/>
      	    <a href="ManageServlet?action=search&key=&type=providerinfo"
      	    			target="mainFrame"><font>��Ӧ������</font></a>
      	  </div></td>
      	</tr>
      	<tr align="center" height="100">
      	  <td><div class="block">
      	    <img src="img/cgxx.gif" onmouseover="border='1'" onmouseout="border='0'"/><p/>
      	    <a href="ManageServlet?action=search&key=&type=stockinfo"
      	    			target="mainFrame"><font>�ɹ���Ϣ</font></a>
      	  </div></td>
      	  <td><div class="block">
      	    <img src="img/cgth.gif" onmouseover="border='1'" onmouseout="border='0'"/><p/>
      	    <a href="ManageServlet?action=search&key=&type=providerback"
      	    			target="mainFrame"><font>�ɹ��˻�</font></a>
      	  </div></td>
      	  <td><div class="block">
      	    <img src="img/xsxx.gif" onmouseover="border='1'" onmouseout="border='0'"/><p/>
      	    <a href="ManageServlet?action=search&key=&type=sellinfo"
      	    			target="mainFrame"><font>������Ϣ</font></a>
      	  </div></td>
      	  <td><div class="block">
      	    <img src="img/xsth.gif" onmouseover="border='1'" onmouseout="border='0'"/><p/>
      	    <a href="ManageServlet?action=search&key=&type=consumerback"
      	    			target="mainFrame"><font>�����˻�</font></a>
      	  </div></td>      	
      	</tr>
      	<tr align="center" height="100">
      	  <td><div class="block">
      	    <img src="img/kctj.gif" onmouseover="border='1'" onmouseout="border='0'"/><p/>
      	    <a href="statistic.jsp"><font>���ͳ��</font></a>
      	  </div></td>
      	  <td><div class="block">
      	    <img src="img/xtwh.gif" onmouseover="border='1'" onmouseout="border='0'"/><p/>
      	    <a href="ManageServlet?action=search&key=&type=admininfo"
      	    			target="mainFrame"><font>ϵͳά��</font></a>
      	  </div></td>
      	</tr>
      </table>
    </center>
  </body>
</html>