<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="com.jspsmart.upload.File" %>
<%@ page import="com.jspsmart.upload.Files" %>
<jsp:useBean id="myup" class="com.jspsmart.upload.SmartUpload"/>
<jsp:useBean id="mydb" class="com.fileUD.javabean.DB"/>
<center>正在上传文件，请稍等……</center>
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
    		      if(info==null||info.equals(""))info="无描述信息！";
	    	  String type=singlefile.getContentType();
	    	  sql="insert into tb_file values('"+singlefile.getFileName()+"','','"+type+"','"+info+"')";	
    		  int num=mydb.CUD(sql);
    		  if(num<=0){
	    		  errors+="<li>文件"+(i+1)+"上传失败：请检查是否输入了非法字符！</li>";
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
        				  errors+="<li>文件"+(i+1)+"上传失败！</li>";
        			  }
        			  else{
    	    			  singlefile.saveAs(filedir+destname,File.SAVEAS_VIRTUAL);
	    	        	  errors+="<li>文件"+(i+1)+"上传成功！</li>";        				  
        			  }
    			  }
    		  }			  
		  }		  
	  }
	  request.setAttribute("errors",errors);
  }catch(Exception e){
	  request.setAttribute("errors","文件上传失败！");
	  e.printStackTrace();
  }
%>
<jsp:forward page="fileup.jsp"/>