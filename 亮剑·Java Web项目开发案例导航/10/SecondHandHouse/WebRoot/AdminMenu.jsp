<%@ page contentType="text/html;charset=gbk"
	import="javax.faces.application.*,javax.faces.component.*,javax.faces.context.*,javax.faces.validator.*"
 %>
 
 <ul id="Nav">
	<li class="first">
		<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/AdminIndex.jsp">
			<h:outputText value="��ҳ" />
		</h:outputLink>
	</li>
	<li id="adminManage"
		onmouseover="JavaScript:showDiv('adminManage','popAdminManage');" 
		onmouseout="JavaScript:hideDiv('popAdminManage');">
		<h:outputLink value="#">
			<h:outputText value="����Ա����" />
		</h:outputLink>
	</li>
	<li id="customer"
		onmouseover="JavaScript:showDiv('customer','popCustomer');" 
		onmouseout="JavaScript:hideDiv('popCustomer');">
		<h:outputLink value="#">
			<h:outputText value="�ظ��ͻ�"/>
		</h:outputLink>
	</li>
	<li id="contract"
	 	onmouseover="JavaScript:showDiv('contract','popAdminContract');" 
	 	onmouseout="JavaScript:hideDiv('popAdminContract');">
		<h:outputLink value="#">
			<h:outputText value="��ͬ����"/>
		</h:outputLink>
	</li>
	<li>
		<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/ModifyAdminPwd.jsp">
			<h:outputText value="�޸�����"/>
		</h:outputLink>
	</li>
	<li>
		<h:form>
			<h:commandLink value="ע��" action="#{AdminLoginBean.adminLogout}"/>
		</h:form>
	</li>
</ul>
 
<div id="popCustomer"
		onmouseover="JavaScript:showDiv('customer','popCustomer');" 
		onmouseout="JavaScript:hideDiv('popCustomer');"
		onclick="JavaScript:hideDiv('popCustomer');">
	<li>
		<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/LookAllQuestion.jsp">
			<h:outputText value="�ظ��ͻ�����"/>
		</h:outputLink>
	</li>
	<li>
		<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/LookUserApply.jsp" title="�Ƿ�����ͻ��鿴ĳ��Դ�ľ�����Ϣ">
			<h:outputText value="���ÿͻ�Ȩ��"/>
		</h:outputLink>
	</li>
</div>

<div id="popAdminManage"
		onmouseover="JavaScript:showDiv('adminManage','popAdminManage');" 
		onmouseout="JavaScript:hideDiv('popAdminManage');"
		onclick="JavaScript:hideDiv('popAdminManage');">
	<h:panelGroup rendered="#{AdminLoginBean.level}">
	<li>
		<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/AddAdmin.jsp">
			<h:outputText value="��ӹ���Ա"/>
		</h:outputLink>
	</li>
	<li>
		<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/LookAdmin.jsp">
			<h:outputText value="�鿴����Ա"/>
		</h:outputLink>
	</li>
	<li>
		<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/ResetPwd.jsp">
			<h:outputText value="��������"/>
		</h:outputLink>
	</li>
	</h:panelGroup>
	<h:panelGroup rendered="#{!AdminLoginBean.level}">
	<li>
		<h:outputText value="�޴�Ȩ��"/>
	</li>
	</h:panelGroup>
</div>
<div id="popAdminContract"
		onmouseover="JavaScript:showDiv('contract','popAdminContract');" 
		onmouseout="JavaScript:hideDiv('popAdminContract');"
		onclick="JavaScript:hideDiv('popAdminContract');">
	<li>
		<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/RentContractInfo.jsp">
			<h:outputText value="�������޺�ͬ"/>
		</h:outputLink>
	</li>
	<li>
		<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/SaleContractInfo.jsp">
			<h:outputText value="����������ͬ"/>
		</h:outputLink>
	</li>
	<li>
		<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/LookRentContract.jsp">
			<h:outputText value="�鿴���޺�ͬ"/>
		</h:outputLink>
	</li>
	<li>
		<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/LookSaleContract.jsp">
			<h:outputText value="�鿴���ۺ�ͬ"/>
		</h:outputLink>
	</li>
</div>



