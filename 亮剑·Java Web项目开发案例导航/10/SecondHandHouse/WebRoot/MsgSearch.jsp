<%@ page contentType="text/html;charset=gbk" %>
<div class="Menubox">  
<ul>  
   <li id="tab1" onclick="changeTab(1,4)" class="hover">����</li>  
   <li id="tab2" onclick="changeTab(2,4)">����</li>
   <li id="tab3" onclick="changeTab(3,4)">����</li>
   <li id="tab4" onclick="changeTab(4,4)">��</li>
</ul>  
</div>  
<div class="Contentbox">  
	<div id="con1" >
   		<h:form id="mf_chuzu">
   			<h:selectOneMenu id="chuzu_location" value="#{MsgSearchBean.location}">
   				<f:selectItems value="#{MsgSearchBean.houseLocation}" />
   			</h:selectOneMenu>
   			&nbsp;
   			<h:selectOneMenu id="chuzu_type" value="#{MsgSearchBean.type}">
   				<f:selectItems value="#{MsgSearchBean.houseType}" />
   			</h:selectOneMenu>
   			&nbsp;
   			<h:selectOneMenu id="chuzu_size" value="#{MsgSearchBean.size}">
   				<f:selectItems value="#{MsgSearchBean.houseSize}" />
   			</h:selectOneMenu>
   			&nbsp;
   			<h:selectOneMenu id="chuzu_area" value="#{MsgSearchBean.area}">
   				<f:selectItems value="#{MsgSearchBean.houseArea}" />
   			</h:selectOneMenu>
   			&nbsp;
   			<h:selectOneMenu id="chuzu_price" value="#{MsgSearchBean.price}">
   				<f:selectItems value="#{MsgSearchBean.monthPrice}" />
   			</h:selectOneMenu>
   			&nbsp;
   			<h:commandButton value="����" action="#{MsgSearchBean.chuZuSearch}"/>
   		</h:form>
   	</div>  
   	<div id="con2" style="display:none">
		<h:form id="mf_qiuzu">
		<h:selectOneMenu id="chuzu_location" value="#{MsgSearchBean.location}">
			<f:selectItems value="#{MsgSearchBean.houseLocation}" />
		</h:selectOneMenu>
		&nbsp;
		<h:selectOneMenu id="chuzu_type" value="#{MsgSearchBean.type}">
			<f:selectItems value="#{MsgSearchBean.houseType}" />
		</h:selectOneMenu>
		&nbsp;
		<h:selectOneMenu id="chuzu_size" value="#{MsgSearchBean.size}">
			<f:selectItems value="#{MsgSearchBean.houseSize}" />
		</h:selectOneMenu>
		&nbsp;
		<h:selectOneMenu id="chuzu_area" value="#{MsgSearchBean.area}">
			<f:selectItems value="#{MsgSearchBean.houseArea}" />
		</h:selectOneMenu>
		&nbsp;
		<h:selectOneMenu id="chuzu_price" value="#{MsgSearchBean.price}">
			<f:selectItems value="#{MsgSearchBean.monthPrice}" />
		</h:selectOneMenu>
		&nbsp;
		<h:commandButton value="����" action="#{MsgSearchBean.qiuZuSearch}"/>
		</h:form> 
   	</div>  
   	<div id="con3" style="display:none">
		<h:form id="mf_chushou">
		<h:selectOneMenu id="chuzu_location" value="#{MsgSearchBean.location}">
			<f:selectItems value="#{MsgSearchBean.houseLocation}" />
		</h:selectOneMenu>
		&nbsp;
		<h:selectOneMenu id="chuzu_type" value="#{MsgSearchBean.type}">
			<f:selectItems value="#{MsgSearchBean.houseType}" />
		</h:selectOneMenu>
		&nbsp;
		<h:selectOneMenu id="chuzu_size" value="#{MsgSearchBean.size}">
			<f:selectItems value="#{MsgSearchBean.houseSize}" />
		</h:selectOneMenu>
		&nbsp;
		<h:selectOneMenu id="chuzu_area" value="#{MsgSearchBean.area}">
			<f:selectItems value="#{MsgSearchBean.houseArea}" />
		</h:selectOneMenu>
		&nbsp;
		<h:selectOneMenu id="chuzu_price" value="#{MsgSearchBean.price}">
			<f:selectItems value="#{MsgSearchBean.housePrice}" />
		</h:selectOneMenu>
		&nbsp;
		<h:commandButton value="����" action="#{MsgSearchBean.chuShouSearch}"/>
		</h:form> 
   	</div>  
   	<div id="con4" style="display:none">
		<h:form id="mf_qiugou">
		<h:selectOneMenu id="chuzu_location" value="#{MsgSearchBean.location}">
			<f:selectItems value="#{MsgSearchBean.houseLocation}" />
		</h:selectOneMenu>
		&nbsp;
		<h:selectOneMenu id="chuzu_type" value="#{MsgSearchBean.type}">
			<f:selectItems value="#{MsgSearchBean.houseType}" />
		</h:selectOneMenu>
		&nbsp;
		<h:selectOneMenu id="chuzu_size" value="#{MsgSearchBean.size}">
			<f:selectItems value="#{MsgSearchBean.houseSize}" />
		</h:selectOneMenu>
		&nbsp;
		<h:selectOneMenu id="chuzu_area" value="#{MsgSearchBean.area}">
			<f:selectItems value="#{MsgSearchBean.houseArea}" />
		</h:selectOneMenu>
		&nbsp;
		<h:selectOneMenu id="chuzu_price" value="#{MsgSearchBean.price}">
			<f:selectItems value="#{MsgSearchBean.housePrice}" />
		</h:selectOneMenu>
		&nbsp;
		<h:commandButton value="����" action="#{MsgSearchBean.qiuGouSearch}"/>
		</h:form> 
   	</div>  
</div>  