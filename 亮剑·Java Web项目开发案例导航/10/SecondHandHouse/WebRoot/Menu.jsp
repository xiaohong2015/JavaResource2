<%@ page contentType="text/html;charset=gbk"
	import="javax.faces.application.*,javax.faces.component.*,javax.faces.context.*,javax.faces.validator.*"
 %>

<ul id="Nav">
	<li class="first">
		<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/Index.jsp">
			<h:outputText value="��ҳ" />
		</h:outputLink>
	</li>
	<li id="publishArea"
		onmouseover="JavaScript:showDiv('publishArea','popPublish');"
		onmouseout="JavaScript:hideDiv('popPublish');">
		<h:outputLink value="#">
			<h:outputText value="��Ϣ������"/>
		</h:outputLink>
	</li>
	<li id="contractArea"
		onmouseover="JavaScript:showDiv('contractArea','popContract');"
		onmouseout="JavaScript:hideDiv('popContract');">
		<h:outputLink value="#">
			<h:outputText value="��׼��ͬ��ѯ" />
		</h:outputLink>
	</li>
	<li>
		<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/LawInfo.jsp" >
			<h:outputText value="���ɷ����ѯ" />
		</h:outputLink>
	</li>
	<li>
		<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/QuestionInfo.jsp">
			<h:outputText value="������ѯ"/>
		</h:outputLink>
	</li>
	<li id="account"
		onmouseover="JavaScript:showDiv('account','popMenu');" 
		onmouseout="JavaScript:hideDiv('popMenu');">
		<h:outputLink value="#">
			<h:outputText value="�˺�ά��" />
		</h:outputLink>
	</li>
</ul>
<div id="popMenu"
		onmouseover="JavaScript:showDiv('account','popMenu');" 
		onmouseout="JavaScript:hideDiv('popMenu');"
		onclick="JavaScript:hideDiv('popMenu');">
	<h:panelGroup rendered="#{UserLoginBean.flag==false}">
		<li>
			<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/UserLogin.jsp" >
				<h:outputText value="��¼" />
			</h:outputLink>
		</li>
		<li>
			<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/Register.jsp">
				<h:outputText value="ע��" />
			</h:outputLink>
		</li>
	</h:panelGroup>
	<h:panelGroup rendered="#{UserLoginBean.flag==true}">
		<li>
			<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/ModifyUserPwd.jsp">
				<h:outputText value="�����޸�" />
			</h:outputLink>
		</li>
		<li>
			<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/LookUserInfo.jsp">
				<h:outputText value="���ϲ鿴" />
			</h:outputLink>
		</li>
		<li>
			<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/MyQiuZuInfo.jsp">
				<h:outputText value="������Ϣ" />
			</h:outputLink>
		</li>
		<li>
			<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/MyRentInfo.jsp">
				<h:outputText value="������Ϣ" />
			</h:outputLink>
		</li>
		<li>
			<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/MySaleInfo.jsp">
				<h:outputText value="������Ϣ" />
			</h:outputLink>
		</li>
		<li>
			<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/MyQiuGouInfo.jsp">
				<h:outputText value="����Ϣ" />
			</h:outputLink>
		</li>
		<li>
			<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/MyApplyInfo.jsp">
				<h:outputText value="�鿴ԤԼ" />
			</h:outputLink>
		</li>
		<li>
			<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/MyQuestion.jsp">
				<h:outputText value="�ҵ�����"/>
			</h:outputLink>
		</li>
		<li>
			<h:form>
				<h:commandLink value="ע��" action="#{IndexBean.logout}"/>
			</h:form>
		</li>
	</h:panelGroup>
</div>
<div id="popPublish"
		onmouseover="JavaScript:showDiv('publishArea','popPublish');"
		onmouseout="JavaScript:hideDiv('popPublish');"
		onclick="JavaScript:hideDiv('popPublish');">
	<li>
		<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/RentPublish.jsp">
			<h:outputText value="������Ϣ�Ǽ�"/>
		</h:outputLink>
	</li>
	<li>
		<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/QiuZuPublish.jsp">
			<h:outputText value="������Ϣ�Ǽ�"/>
		</h:outputLink>
	</li>
	<li>
		<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/QiuGouPublish.jsp">
			<h:outputText value="����Ϣ�Ǽ�"/>
		</h:outputLink>
	</li>
	<li>
		<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/SalePublish.jsp">
			<h:outputText value="������Ϣ�Ǽ�"/>
		</h:outputLink>	
	</li>
</div>

<div id="popContract"
		onmouseover="JavaScript:showDiv('contractArea','popContract');"
		onmouseout="JavaScript:hideDiv('popContract');"
		onclick="JavaScript:hideDiv('popContract');">
	<li>
		<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/RentContract.jsp">
			<h:outputText value="�������޺�ͬ����"/>
		</h:outputLink>
	</li>
	<li>
		<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/SaleContract.jsp">
			<h:outputText value="���ַ���������ͬ����"/>
		</h:outputLink>
	</li>
</div>