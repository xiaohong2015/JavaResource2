<%@ page contentType="text/html;charset=gb2312"%>
<jsp:useBean id="mydown" class="com.jspsmart.upload.SmartUpload"/>
<%
  String downfile="/file/"+request.getParameter("downfile");
  try{
      response.reset();
	  out.clear();
	  out = pageContext.pushBody();
      mydown.initialize(pageContext);
      mydown.setContentDisposition(null);
      mydown.downloadFile(downfile);
  }catch(Exception e){
	  String errors="<li>�ļ�����ʧ�ܣ�����ѡ����ļ��Ƿ���ڣ�</li>";
      request.setAttribute("errors",errors);
      RequestDispatcher rd=request.getRequestDispatcher("filedown.jsp");
      rd.forward(request,response);
  }
%>
