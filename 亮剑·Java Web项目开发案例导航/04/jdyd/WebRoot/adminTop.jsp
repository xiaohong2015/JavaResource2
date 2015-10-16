<%@page contentType="text/html;charset=GBK"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="script/main.css"/>
		<script language="JavaScript" src="script/showMenu.js"></script>
	</head>
	<body>		
		<div style="width:100%;height:90;border:0px solid red;padding:0 0;margin-bottom:4px;">
		  	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		  		<tr>
		  			<td align="center" width="50">
		  				<img src="images/logo.gif" border="0" width="80" height="80">
		  			</td>
		  			<td width="290" valign="bottom">
		  				<font color="#C08B4B" size="10" face="����" >A10���ʾƵ�</font>  				
		  			</td>
		  			<td valign="bottom">
		  				<font color="#C08B4B" size="6" style="font-family:Courier;">----Ԥ���������Ļ�ӭ��</font>
		  			</td>
		  		</tr>
		  	</table>
		  	<ul>
				<li class="first">
					<h:outputLink value="adminIndex.jsp" rendered="true">
						<h:outputText value="��¼"/>
					</h:outputLink>
				</li>
				
				<li>
					<h:outputLink value="adminChangePwd.jsp" rendered="#{ALBean.aid!=null}">
						<h:outputText value="�޸�����"/>
					</h:outputLink>
				</li>
				
				<li>					
					<h:outputLink value="#" id="admin" onmouseover="showMenu('admin','AMENU')" 
						onmouseout="hideMenu('AMENU')" rendered="#{ALBean.aid!=null&&ALBean.super}">
						<h:outputText value="����Ա����"/>
					</h:outputLink>
				</li>
				
				<li>
					<h:form>
		                <h:commandLink action="#{GLBean.initialGroup}" rendered="#{ALBean.aid!=null&&ALBean.super}">
		                    <h:outputText value="�������"/>	                    	
		                </h:commandLink>
		            </h:form>
				</li>
				
				<li>					
					<h:outputLink value="#" id="resMenu" onmouseover="showMenu('resMenu','RMENU')" 
						onmouseout="hideMenu('RMENU')" rendered="#{ALBean.aid!=null&&ALBean.super}">
						<h:outputText value="��Դ����"/>
					</h:outputLink>
				</li>
				
				<li>
					<h:outputLink value="userManage.jsp" rendered="#{ALBean.aid!=null}">
						<h:outputText value="�û�����"/>
					</h:outputLink>
				</li>
				
				<li>					
					<h:outputLink value="orderManage.jsp" rendered="#{ALBean.aid!=null}">
						<h:outputText value="��������"/>
					</h:outputLink>
				</li>								
				
				<li>
					<h:form id="logout"><h:commandLink value="ע��" action="#{ALBean.adminLogout}" rendered="#{ALBean.aid!=null}">
					</h:commandLink></h:form>
				</li>
			</ul>
		</div>
		<!--����Ա���������˵�-->
		<div class="hidmenu" id="AMENU" style="position:absolute;visibility:hidden;" 
			 onmouseover="showMenu('admin','AMENU')" onmouseout="hideMenu('AMENU')">
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<h:outputLink value="addAdmin.jsp">
							<h:outputText value="��ӹ���Ա"/>
						</h:outputLink>
					</td>
				</tr>
				<tr>
					<td>
						<h:outputLink value="adminList.jsp">
							<h:outputText value="����Ա�б�"/>
						</h:outputLink>
					</td>
				</tr>
				<tr>
					<td>
						<h:outputLink value="resetAdminPwd.jsp">
							<h:outputText value="��������"/>
						</h:outputLink>
					</td>
				</tr>
			</table>
		</div>
		
		<!--��Դ���������˵�-->
		<div class="hidmenu" id="RMENU" style="position:absolute;visibility:hidden;" 
			 onmouseover="showMenu('resMenu','RMENU')" onmouseout="hideMenu('RMENU')">
			<table cellpadding="0" cellspacing="0">
				<tr>
					<h:form>
						<td>						
							<h:commandLink value="��Դ�б�" action="#{RMBean.toResPage}">
							</h:commandLink>						
						</td>
					</h:form>
				</tr>
				<tr>
					<td>
						<h:outputLink value="addRes.jsp">
							<h:outputText value="�����Դ"/>
						</h:outputLink>
					</td>
				</tr>			
			</table>
		</div>
		

	</body>
</html>