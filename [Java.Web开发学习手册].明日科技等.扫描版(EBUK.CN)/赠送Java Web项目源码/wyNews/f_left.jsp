<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean id="objectDao2" scope="request" class="com.dao.ObjectDao"/>

<table width="100" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><img src="images/f_left11.jpg" width="214" height="56"></td>
        </tr>
</table>
      <table width="214" border="0" cellpadding="0" cellspacing="0" background="images/f_left12.jpg">
        <tr>
          <td>
		<form name="form" method="post" action="newsAction.do?method=front_queryKeyNewsAction" onsubmit="return checkEmpty(form)">
		  <table width="208" align="center">  
            <tr>
              <td width="46" height="20"><div align="right">关键字</div></td>
              <td colspan="2">
                <input name="key" type="text" size="20" title="请输入新闻的关键字">
              </td>
            </tr>
            <tr>
              <td height="20">&nbsp;</td>
              <td width="75">&nbsp;		      </td>
              <td width="71"><input type="image" name="Submit" src="images/search.gif" class="button"></td>
            </tr>
          </table>
		 </form>
		  </td>
        </tr>
      </table>
      <table width="214" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><img src="images/f_left13.jpg" width="214" height="13"></td>
        </tr>
      </table>
      
      <br>
        <table width="213" height="206" border="0" cellpadding="0" cellspacing="0" background="images/f_left2.jpg">
        <tr>
          <td valign="top"><table width="189" align="center">
            <tr>
              <td height="39">&nbsp;</td>
            </tr>
          </table>
            <table width="196" height="153" align="center">
              <tr>
                <td width="142">
				
				
	<marquee direction="up" height="142" width="196" onmouseout="this.start()"
             onmouseover="this.stop()" scrollAmount="1" scrollDelay="1" class="linkBlack">
	<%
	    String hql1="from AfficheForm order by id desc";
	   java.util.List afficheList=objectDao2.queryList(hql1);
       for(int affiche=0;affiche<afficheList.size();affiche++){
       com.actionForm.AfficheForm afficheForm=(com.actionForm.AfficheForm)afficheList.get(affiche);
        
       
       %>
	<%=afficheForm.getContent()%><br>（<%=afficheForm.getCreateTime()%>）<br><br><br>
	<%}%>
	</marquee>

				</td>
              </tr>
            </table></td>
        </tr>
      </table>
	  	<br>
        <table width="213" height="246" border="0" cellpadding="0" cellspacing="0" background="images/f_left3.jpg">
        <tr>
          <td width="195" height="0" align="center" valign="top"><br><br><br><br>
		  
		  
		  
          <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
            <%
            String hql2="from ForceForm order by id desc"; 
            java.util.List listForce=objectDao2.queryList(hql2);
            int number=4;
            if(listForce.size()<4){
            	number=listForce.size();
            }
            for(int i =0;i<number;i++){
            	com.actionForm.ForceForm forceForm=(com.actionForm.ForceForm)listForce.get(i);
            %>
            <tr>
              <td width="11%" height="19"></td>
              <td width="89%"><a href="forceAction.do?method=queryForceOneAction&id=<%=forceForm.getId()%>" class="a6"><%=forceForm.getTitle()%></a></td>
            </tr>
            <tr>
              <td height="19" align="right"></td>
              <td align="right" bgcolor="#E9D6CF"><font color="#A2522D"><%=forceForm.getCreateTime()%></font></td>
            </tr>
            <%}%>
          </table>  
		  
		  
		  
		  <br>
		                      &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="forceAction.do?method=queryForceAction">MORE...</a></td>
        </tr>
      </table>
	  	<br>
        <table border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="179" height="0"><img src="images/f_left4.jpg" width="213" height="175"></td>
        </tr>
</table>
	  


