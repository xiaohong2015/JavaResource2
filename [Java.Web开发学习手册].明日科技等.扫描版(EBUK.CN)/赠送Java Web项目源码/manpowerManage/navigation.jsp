<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<script language="javascript">
function change(img,subMenu,path,type){
	img.src="images/"+path+".GIF";
	if(subMenu!=null){
		if(type==0){
			subMenu.style.display="none";
		}else{
			subMenu.style.display="";
		}
	}
}
</script>
	<div style="position:absolute">	
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td onMouseOver="change(ImgUser,NUser,'NUser_r',1)" onMouseOut="change(ImgUser,NUser,'NUser_b',0)"><a href="#"><img id="ImgUser" src="images/NUser_b.GIF" width="106" height="48" border="0"></a><div id="NUser" style="background-color:#F3FFD5; border:#75A102 1px solid; width:200px; position:absolute; display:none; left:1px; top: 34px;">
		
          <table width="100%" border="0" height="35px" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center"><a href="user.do?action=listuser">���Ա����Ϣ</a>&nbsp;&nbsp;<a href="adduser.do">�����Ա��</a></td>
  </tr>
</table></div></td>
        <td onMouseOver="change(ImgJob,NJob,'NJob_r',1)" onMouseOut="change(ImgJob,NJob,'NJob_b',0)"><a href="#"><img id="ImgJob" src="images/NJob_b.GIF" width="110" height="48" border="0"></a><div id="NJob" style="background-color:#F3FFD5; border:#75A102 1px solid; width:230px; position:absolute; left:110px; display:none; top: 34px;">
          <table width="100%" border="0" height="35px" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center"><a href="job.do?action=listjob">���ӦƸ��Ϣ</a>&nbsp;<a href="addjob.do">���ӦƸ��Ϣ&nbsp;</a><a href="job.do?action=listjob&isstock=yes">����˲ſ�</a></td>
  </tr>
</table>
        </div></td>
        <td onMouseOver="change(ImgEducate,NEducate,'NEducate_r',1)" onMouseOut="change(ImgEducate,NEducate,'NEducate_b',0)"><a href="#"><img id="ImgEducate" src="images/NEducate_b.GIF" width="111" height="48" border="0"></a><div id="NEducate" style="background-color:#F3FFD5; border:#75A102 1px solid; width:240px; position:absolute; display:none;left:222px;  top: 34px;">
          <table width="100%" border="0" height="35px" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center"><a href="educate.do?action=listeducate">�����ѵ�ƻ�</a><a href="addeducate.do">&nbsp;�����ѵ�ƻ�</a><a href="educate.do?action=listeducate&educate=1">&nbsp;�鿴��ѵ�ܽ�</a></td>
  </tr>
</table>
        </div></td>
        <td onMouseOver="change(ImgInstitution,NInstitution,'NInstitution_r',1)" onMouseOut="change(ImgInstitution,NInstitution,'NInstitution_b',0)"><a href="#"><img id="ImgInstitution" src="images/NInstitution_b.GIF" width="110" height="48" border="0"></a><div id="NInstitution" style="background-color:#F3FFD5; border:#75A102 1px solid; width:180px; position:absolute; display:none; left:332px;  top: 34px;">
          <table width="100%" border="0" height="35px" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center"><a href="institution.do?action=listinstitution">��������ƶ� &nbsp;</a><a href="addinstitution.do">��ӽ����ƶ�</a></td>
  </tr>
</table>
        </div></td>
        <td onMouseOver="change(ImgStipend,NStipend,'NStipend_r',1)" onMouseOut="change(ImgStipend,NStipend,'NStipend_b',0)"><a href="#"><img id="ImgStipend" src="images/NStipend_b.GIF" width="110" height="48" border="0"></a><div id="NStipend" style="background-color:#F3FFD5; border:#75A102 1px solid; width:180px; position:absolute; display:none;left:446px;  top: 34px;">
          <table width="100%" border="0" height="35px" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center"><a href="stipend.do?action=liststipend">���н���б�</a><a href="addstipend.do"> &nbsp;���н������</a></td>
  </tr>
</table>
        </div></td>
        <td><a href="logout.jsp"><img src="images/NExit_b.GIF" width="98" height="48" border="0" onMouseOver="change(this,null,'NExit_r',1)" onMouseOut="change(this,null,'NExit_b',0)"></a></td>
        <td><img src="images/NNull.GIF" width="130" height="48"></td>
      </tr>
    </table>

</div>	