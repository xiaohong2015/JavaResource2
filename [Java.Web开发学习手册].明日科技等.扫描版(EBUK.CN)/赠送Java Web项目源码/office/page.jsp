<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ taglib uri="struts-html" prefix="html" %>
<%@ taglib uri="struts-bean" prefix="bean" %>
<%@ taglib uri="struts-logic" prefix="logic" %>
<%   
   String pagepath=(String)session.getAttribute("pagepath");
   if(pagepath==null)
    	 pagepath="";
   String strnumper=(String)session.getAttribute("numper");
   if(strnumper==null||strnumper.equals(""))
	   strnumper="0";
   String strnumrs=(String)session.getAttribute("numrs");
   if(strnumrs==null||strnumrs.equals(""))
    	 strnumrs="0";
   String strcurpage=(String)session.getAttribute("currentpage");
   if(strcurpage==null||strcurpage.equals(""))
	   strcurpage="0";
   String strnumpages=(String)session.getAttribute("numpages");
   if(strnumpages==null||strnumpages.equals(""))
	   strnumpages="0";
   int numpages=Integer.parseInt(strnumpages);
   int currentpage=Integer.parseInt(strcurpage);
%>
<html>
	<head><title>Page</title></head>
	<body>
		<center>
 		<table width="90%"  border="0" cellpadding="0" cellspacing="0">
        	<tr>
          		<td width="65%">
          			ÿҳ��ʾ:<b><%=strnumper%></b> ����¼!
              		��:<b><%=strnumrs%></b> ����¼!
              		��:<b><%=strnumpages%></b> ҳ!
              		��ǰҳ:<b><%=strcurpage%></b> ҳ!
          		</td>
          		<td height="25" align="right" valign="middle">
            		<%if(currentpage>1){%>
                		<a href="<%=request.getContextPath()%><%=pagepath%>?page=1">[��һҳ]</a>
                		<a href="<%=request.getContextPath()%><%=pagepath%>?page=<%=currentpage-1%>">��һҳ</a>
		            <%}
		              if(currentpage<numpages){
            		%>
                		<a href="<%=request.getContextPath()%><%=pagepath%>?page=<%=currentpage+1%>">��һҳ</a>
                		<a href="<%=request.getContextPath()%><%=pagepath%>?page=<%=numpages%>">[���һҳ]</a>
            		<%}%>
          		</td>
        	</tr>
      	</table>
	</center>
	</body>
</html>
