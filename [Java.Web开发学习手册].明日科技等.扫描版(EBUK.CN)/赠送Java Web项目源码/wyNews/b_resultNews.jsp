<%@ page contentType="text/html; charset=gb2312" import="java.util.*,java.io.*"%>
<jsp:directive.page import="com.actionForm.NewsForm"/>
<jsp:directive.page import="com.tools.FileOperation"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��ʾ���Ź���Ľ��</title>
</head>
<body>
<br>
<%
String bigSort=null;
String result="�����ɹ�";
NewsForm newsForm=(NewsForm)request.getAttribute("newsForm");
if(request.getAttribute("result")==null){

try{
    //����Ĵ������滻������
    String title=newsForm.getTitle();
    String content=newsForm.getContent();
    String editer=newsForm.getCreateTime();
    String filePath = "";
    bigSort=newsForm.getBigSort();
    filePath = request.getRealPath("\\")+"template.htm";
    String templateContent="";
    FileInputStream fileinputstream = new FileInputStream(filePath);//��ȡģ���ļ�
    int lenght = fileinputstream.available();
    byte bytes[] = new byte[lenght];
    fileinputstream.read(bytes);
    fileinputstream.close();
    templateContent = new String(bytes);
    templateContent=templateContent.replaceAll("###title###",title);
    templateContent=templateContent.replaceAll("###content###",content);
    templateContent=templateContent.replaceAll("###createTime###",editer);//�滻��ģ������Ӧ�ĵط�
	//����Ĵ����Ǵ����µ�HTMLҳ������
    String filename=request.getRealPath("/newsContent");
    File file=new File(filename);
    if(!file.exists()){
	    file.mkdir();	  
    }     
    filename = filename+"\\"+newsForm.getShowNews();   
    FileOutputStream fileoutputstream = new FileOutputStream(filename);//�����ļ������
    byte tag_bytes[] = templateContent.getBytes();
    fileoutputstream.write(tag_bytes);
    fileoutputstream.close();   
   }
   catch(Exception e){
    out.print(e.toString());
   }
}else{   
    bigSort=request.getParameter("bigSort");
    bigSort=new String(bigSort.getBytes("ISO8859_1"),"gb2312");  
    result=(String)request.getAttribute("result");  
} %>

<script language='javascript'>alert('<%=result%>');window.location.href='newsAction.do?method=queryNewsListAction&bigSort=<%=bigSort%>';</script>






</body>
</html>

