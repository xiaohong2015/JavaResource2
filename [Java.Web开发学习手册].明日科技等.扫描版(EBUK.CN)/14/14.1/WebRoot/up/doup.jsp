<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="com.jspsmart.upload.File" %>
<%@ page import="com.jspsmart.upload.Files" %>
<jsp:useBean id="myup" class="com.jspsmart.upload.SmartUpload"/>
<jsp:useBean id="mydb" class="com.fileUD.javabean.DB"/>
<center>�����ϴ��ļ������Եȡ���</center>
<%
  String filedir="/file/";
  String errors="";
  String sql="";
  long maxsize=2*1024*1024;
  try{
	  myup.initialize(pageContext);
	  myup.setMaxFileSize(maxsize);
	  myup.upload();
	  Files files=myup.getFiles();
	  for(int i=0;i<files.getCount();i++){
		  File singlefile=files.getFile(i);
          if(!singlefile.isMissing()){
    		  String info=myup.getRequest().getParameter("info"+(i+1));
    		      if(info==null||info.equals(""))info="��������Ϣ��";
	    	  String type=singlefile.getContentType();
	    	  sql="insert into tb_file values('"+singlefile.getFileName()+"','','"+type+"','"+info+"')";	
    		  int num=mydb.CUD(sql);
    		  if(num<=0){
	    		  errors+="<li>�ļ�"+(i+1)+"�ϴ�ʧ�ܣ������Ƿ������˷Ƿ��ַ���</li>";
		      }
    		  else{
	    		  sql="select MAX(id) as maxid from tb_file";
		    	  java.sql.ResultSet rs=mydb.Read(sql);
			      String destname="";
    			  if(rs.next()){
    				  int maxid=rs.getInt("maxid");
	    			  destname=maxid+"."+singlefile.getFileExt();		    	  
	    			  sql="update tb_file set file_save='"+destname+"' where id="+maxid;
	    			  num=mydb.CUD(sql);
        			  if(num<=0){
        				  errors+="<li>�ļ�"+(i+1)+"�ϴ�ʧ�ܣ�</li>";
        			  }
        			  else{
    	    			  singlefile.saveAs(filedir+destname,File.SAVEAS_VIRTUAL);
	    	        	  errors+="<li>�ļ�"+(i+1)+"�ϴ��ɹ���</li>";        				  
        			  }
    			  }
    		  }			  
		  }		  
	  }
	  request.setAttribute("errors",errors);
  }catch(Exception e){
	  request.setAttribute("errors","�ļ��ϴ�ʧ�ܣ�");
	  e.printStackTrace();
  }
%>
<jsp:forward page="fileup.jsp"/>