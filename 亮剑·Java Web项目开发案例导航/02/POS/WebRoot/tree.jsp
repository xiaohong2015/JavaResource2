<%@ page contentType="text/html;charset=gbk"  %>
<html>
  <head>
    <title>�����б�</title>
    <link rel=stylesheet href="css/style.css" type="text/css">
    <script language="JavaScript">
      function check(root,list)
      {
		if(list.style.display=="none")
		{
		  list.style.display="block";
		  root.innerHTML="<img border='0' src='img/pkg-open.gif'/>";
		}
		else
		{
		  list.style.display="none";
		  root.innerHTML="<img border='0' src='img/pkg-closed.gif'/>";
		}
      }
    </script>
  </head>
  <body bgcolor="#EBF5FD">
    <jsp:useBean id="userBean" class="wyf.zrk.UserBean" scope="session"/>
    <table border="0">
      <tr><td>
       	<a id="A" href="#" onclick="check(document.all.A,document.all.AA)"><img border="0" src="img/pkg-open.gif"/></a><a href="#"><font>POS��Ϣ����ϵͳ</font></a>
      </td></tr>
      <tr><td>        
        <table id="AA" border="0" style="display:black">
          <tr><td>
          	&nbsp;&nbsp;
            <a id="B" href="#" onclick="check(document.all.B,document.all.BB)"><img border="0" src="img/pkg-open.gif"/></a><a href="#"><font>������Ϣ</font></a>
          </td></tr>
          <tr><td>
          	<table id="BB" border="0" style="display:black">
          	  <tr><td>
          	  &nbsp;&nbsp;&nbsp;&nbsp;
          	  <img border="0" src="img/fav.gif"/><a href="ManageServlet?action=search&key=&type=goodsinfo" target="mainFrame"><font>��Ʒ����</font></a>
          	  </td></tr>
          	  <tr><td>
          	  &nbsp;&nbsp;&nbsp;&nbsp;
          	  <img border="0" src="img/fav.gif"/><a href="ManageServlet?action=search&key=&type=goodsclassinfo" target="mainFrame"><font>��Ʒ���</font></a>
          	  </td></tr>
          	  <tr><td>
          	  &nbsp;&nbsp;&nbsp;&nbsp;
          	  <img border="0" src="img/fav.gif"/><a href="ManageServlet?action=search&key=&type=consumerinfo" target="mainFrame"><font>�ͻ�����</font></a>
          	  </td></tr>
          	  <tr><td>
          	  &nbsp;&nbsp;&nbsp;&nbsp;
          	  <img border="0" src="img/fav.gif"/><a href="ManageServlet?action=search&key=&type=providerinfo" target="mainFrame"><font>��Ӧ������</font></a>
          	  </td></tr>
          	</table>
          </td></tr>
          <tr><td>
          	&nbsp;&nbsp;
            <a id="C" href="#" onclick="check(document.all.C,document.all.CC)"><img border="0" src="img/pkg-open.gif"/></a><a href="#"><font>ҵ����</font></a>
          </td></tr>
          <tr><td>
            <table id="CC" border="0" style="display:black">
          	  <tr><td>
          	  &nbsp;&nbsp;&nbsp;&nbsp;
          	  <a id="E" href="#" onclick="check(document.all.E,document.all.EE)"><img border="0" src="img/pkg-open.gif"/></a><a href="#"><font>��Ʒ�ɹ�</font></a>
          	  </td></tr>
          	  <tr><td>
          	    <table id="EE" border="0" style="display:black">
          	  	  <tr><td>
          	  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          	  		<img border="0" src="img/fav.gif"/><a href="ManageServlet?action=search&key=&type=stockinfo" target="mainFrame"><font>�ɹ���Ϣ</font></a>
          	  	  </td></tr> 
           	  	  <tr><td>
          	  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          	  		<img border="0" src="img/fav.gif"/><a href="ManageServlet?action=search&key=&type=providerback" target="mainFrame"><font>�ɹ��˻�</font></a>
          	  	  </td></tr> 	  
          	    </table>
          	  </td></tr>
          	  <tr><td>
          	  &nbsp;&nbsp;&nbsp;&nbsp;
          	  <a id="F" href="#" onclick="check(document.all.F,document.all.FF)"><img border="0" src="img/pkg-open.gif"/></a><a href="#"><font>��Ʒ����</font></a>
          	  </td></tr>
          	  <tr><td>
          	    <table id="FF" border="0" style="display:black">
          	  	  <tr><td>
          	  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          	  		<img border="0" src="img/fav.gif"/><a href="ManageServlet?action=search&key=&type=sellinfo" target="mainFrame"><font>������Ϣ</font></a>
          	  	  </td></tr> 
           	  	  <tr><td>
          	  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          	  		<img border="0" src="img/fav.gif"/><a href="ManageServlet?action=search&key=&type=consumerback" target="mainFrame"><font>�����˻�</font></a>
          	  	  </td></tr>   	  	  
          	    </table>          	  
          	  </td></tr>
            </table>
          </td></tr>
          <tr><td>
          	&nbsp;&nbsp;
            <a id="D" href="#" onclick="check(document.all.D,document.all.DD)"><img border="0" src="img/pkg-open.gif"/></a><a href="#"><font>ҵ��ͳ��</font></a>
          </td></tr>
          <tr><td>
            <table id="DD" border="0" style="display:black">
          	  <tr><td>
          	  &nbsp;&nbsp;&nbsp;&nbsp;
          	  <img border="0" src="img/fav.gif"/><a href="statistic.jsp" target="mainFrame"><font>���ͳ��</font></a>
          	  </td></tr>
            </table>
          </td></tr>
          <tr><td>
            <table border="0">
              <tr><td>
                &nbsp;&nbsp;&nbsp;&nbsp; 
            	<img border="0" src="img/fav.gif"/><a href="ManageServlet?action=search&key=&type=admininfo" target="mainFrame"><font>ϵͳά��</font></a>
              </td></tr>
            </table>
          </td></tr>
        </table>
      </td></tr>
    </table>
  </body>
</html>