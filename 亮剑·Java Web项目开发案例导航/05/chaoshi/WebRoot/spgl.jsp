<%@ page contentType="text/html;charset=gbk"  %>
<%@ page import="java.util.*,wyf.hxl.DB,wyf.hxl.ManageBean"%>
<jsp:useBean id="spSearch" class="wyf.hxl.ManageBean" scope="session"/>
<html>
  <head>
    <title>�����б�</title>
    <link rel=stylesheet href="script/style.css" type="text/css">
    <script language="JavaScript">
      function check(root,list)
      {
		if(list.style.display=="none")
		{
		  list.style.display="block";
		  root.innerHTML="<img border='0' src='img/-.png'/>";
		}
		else
		{
		  list.style.display="none";
		  root.innerHTML="<img border='0' src='img/+.png'/>";
		}
      }
    </script>
  </head>
  <body style="background:url('img/top/bg.gif')">
    <% 
      String chaoji=(String)session.getAttribute("chaoji");    
      System.out.println("cj"+chaoji+"|"+session.getId());
    %>
    
    <table border="0">
      <tr><td>
       	<a id="A" href="#" onclick="check(document.all.A,document.all.AA)"><img border="0" 
       	src="img/-.png"/></a><a href="#"><font>��̨����</font></a>
      </td></tr>
      <tr><td>        
        <table id="AA" border="0" style="display:black">
          <tr><td>
          	&nbsp;&nbsp;
            <a id="B" href="#" onclick="check(document.all.B,document.all.BB)"><img border="0" 
            src="img/-.png"/></a><a href="#"><font>����Ա����</font></a>
          </td></tr>
          <tr><td>
          	<table id="BB" border="0" style="display:black">
			  <%
          	  if(chaoji!=null)
          	  {
          	  %>
	          	  <tr><td>
	          	  &nbsp;&nbsp;&nbsp;&nbsp;
	          	  <img border="0" src="img/fav.gif"/><a href="manzc.jsp" 
	          	  target="mainFrame"><font>����Ա���</font></a>
	          	  </td></tr> 
	          	  <tr><td>
	          	  &nbsp;&nbsp;&nbsp;&nbsp;
	          	  <img border="0" src="img/fav.gif"/><a href="mandelete.jsp" 
	          	  target="mainFrame"><font>����Աɾ��</font></a>
	          	  </td></tr>
          	  <%         	  
          	  }
          	  %>
          	  <tr><td>
          	  &nbsp;&nbsp;&nbsp;&nbsp;
          	  <img border="0" src="img/fav.gif"/><a href="mansearch.jsp" 
          	  target="mainFrame"><font>����Ա��Ϣ</font></a>
          	  </td></tr>  	  
              <tr><td>
          	  &nbsp;&nbsp;&nbsp;&nbsp;
          	  <img border="0" src="img/fav.gif"/><a href="manchangepw.jsp" 
          	  target="mainFrame"><font>�����޸�</font></a>
          	  </td></tr>
          	</table>
          </td></tr>
          <tr><td>
          	&nbsp;&nbsp;
            <a id="C" href="#" onclick="check(document.all.C,document.all.EE)"><img border="0" 
             src="img/-.png"/></a><a href="#"><font>��Ʒ����</font></a>
          </td></tr>
          <tr><td>
      	    <table id="EE" border="0" style="display:black">
      	   	  <tr><td>
      	  		&nbsp;&nbsp;&nbsp;&nbsp;
      	  		<img border="0" src="img/fav.gif"/><a href="goodsmanage.jsp" target="mainFrame"><font>��Ʒ���</font></a>
      	  	  </td></tr>
      	  	  <tr><td>
      	  		&nbsp;&nbsp;&nbsp;&nbsp;
      	  		<img border="0" src="img/fav.gif"/><a href="goodsmd.jsp" 
      	    	target="mainFrame"><font>��Ʒɾ���޸�</font></a>
      	  	  </td></tr> 
       	  	  </table>	  
          	  </td></tr>
         <tr><td>
          	&nbsp;&nbsp;
          	<a id="F" href="#" onclick="check(document.all.F,document.all.FF)"><img border="0" 
             src="img/-.png"/></a><a href="#"><font>��������</font></a>
          </td></tr>
          <tr><td>
      	    <table id="FF" border="0" style="display:black">
      	   	  <tr><td>
      	  		&nbsp;&nbsp;&nbsp;&nbsp;
      	  		<img border="0" src="img/fav.gif"/>
      	  		<a href="ManageServlet?action=ordergl&pxfs=asc" target="mainFrame"><font>ȫ�������б�</font></a>
      	  	  </td></tr>
      	  	  <tr><td>
      	  		&nbsp;&nbsp;&nbsp;&nbsp;
      	  		<img border="0" src="img/fav.gif"/>
      	  		<a href="ManageServlet?action=orderyfs&pxfs=asc" target="mainFrame"><font>�ѷ��Ͷ���</font></a>
      	  	  </td></tr> 
       	  	  <tr><td>
      	  		&nbsp;&nbsp;&nbsp;&nbsp;
      	  		<img border="0" src="img/fav.gif"/>
      	  		<a href="ManageServlet?action=orderwfs&pxfs=asc" target="mainFrame"><font>δ���Ͷ���</font></a>
      	  	  </td></tr> </table>	  
          	  </td></tr>	  		
          	 <tr><td>
          	&nbsp;&nbsp;
            <a id="D" href="#" onclick="check(document.all.D,document.all.DD)"><img border="0" 
             src="img/fav.gif"/></a><a href="ManageServlet?action=logout" target="_top"><font>ע��</font></a>
          </td></tr>
          <tr><td>
      	    <table id="DD" border="0" style="display:black">
      	   	  <tr><td>
      	  			  
          	  </td></tr> </table> </td></tr>	  		
        </table>
      </td></tr>
    </table>
  </body>
</html>