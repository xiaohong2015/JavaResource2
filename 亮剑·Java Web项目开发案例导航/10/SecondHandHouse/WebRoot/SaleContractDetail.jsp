<%@ page contentType="text/html;charset=gbk" %>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<f:view>
	<html>
		<head>
			<title>���ַ���������ͬ</title>
			<link href="css/index.css" rel="stylesheet" type="text/css" />
			<link type="text/css" rel="stylesheet" href="css/admin.css"/>
			<script type="text/JavaScript" src="script/index.js"></script>
			<script type="text/javascript" src="script/general.js"></script>
		</head>
		<body>
			<div id="wrapper">
				<h:graphicImage value="images/logo_pic.gif"/>
				<%@ include file="AdminMenu.jsp" %>
				<p style="text-align:left;padding-top:10px;">&nbsp;&nbsp;
					<h:outputText value="��ǰλ�ã�"/>
					<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/Index.jsp">
						<h:outputText value="��ҳ" />
					</h:outputLink>
					<h:outputText value=">>���ַ���������ͬ" />
				</p>
				
				<div style="width:90%;background-color:#FFFFFF;padding:40px;margin:20px;font-size:14px;text-align:left;">
					<b style="text-align:center;font-size:18px;"><center>���ַ���������ͬ</center></b>
					<p>��������Ƽ׷�����<h:outputText value="#{SaleContractDetailBean.first}" style="width:80px;"/>���֤�ţ�<h:outputText value="#{SaleContractDetailBean.firstCardId}" style="width:80px;"/></p>
					<p>�򷽣�����ҷ�����<h:outputText value="#{SaleContractDetailBean.second}" style="width:80px;"/>���֤�ţ�<h:outputText value="#{SaleContractDetailBean.secondCardId}" style="width:80px;"/></p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ݡ��л����񹲺͹����ú�ͬ���������л����񹲺͹����з��ز��������������йط��ɡ�����֮�涨���ס���˫����ƽ�ȡ���Ը��Э��һ�µĻ����ϣ����ҷ���׷����򷿲�ǩ������ͬ�����ʹ�ͬ����ִ�С� 
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>��һ��</b>&nbsp;&nbsp;&nbsp;
						�ҷ�ͬ�⹺��׷�ӵ�е�������<h:outputText value="#{SaleContractDetailBean.location}"/>ӵ�еķ���סլ���������Ϊ<h:outputText value="#{SaleContractDetailBean.area}"/>ƽ���ס���������ط���Ȩ֤�ڡ������ţ���
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>�ڶ���</b>&nbsp;&nbsp;&nbsp;
						���������Ľ��׼۸�Ϊ��<h:outputText value="#{SaleContractDetailBean.price}"/>��Ԫ������ͬǩ��֮�գ��ҷ���׷�֧�������<h:outputText value="#{SaleContractDetailBean.price}"/>Ԫ������Ϊ��������
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>������</b>&nbsp;&nbsp;&nbsp;&nbsp;����ʱ����취
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����˫��ͬ����һ���Ը��ʽ�����Լ���ڷ��ز��������Ľɽ�˰�ѵ���֧���׸�������������ʰ��Ԫ�����׷���ʣ�෿���ڲ�Ȩ������ϵ��ո����׷���		
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>������</b>&nbsp;&nbsp;&nbsp;&nbsp;�׷�Ӧ���յ��ҷ�ȫ���֮����30���ڽ����׵ķ���ȫ���������ҷ�ʹ�ã���Ӧ�ڽ������ս����ַ��ý��塣	
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>������</b>&nbsp;&nbsp;&nbsp;&nbsp;
						˰�ѷֵ� ����˫��Ӧ���ع��ҷ��ز����ߡ����棬�����涨���ɰ����ز���������������ɵ�˰�ѡ���˫��Э�̣�����˰���ɼ׷��е����н�Ѽ������Ȩ�����������ɼ׷��е���
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>������</b>&nbsp;&nbsp;&nbsp;&nbsp;
						ΥԼ���� �ס���˫����ͬǩ�������ҷ���;ΥԼ��Ӧ����֪ͨ�׷����׷�Ӧ��7���ڽ��ҷ����Ѹ������Ϣ���������ҷ��������������׷����С����׷���;ΥԼ��Ӧ����֪ͨ�ҷ�������ΥԼ֮����7����Ӧ���ҷ����������˫�����Ѹ�������ҷ���
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>������</b>&nbsp;&nbsp;&nbsp;&nbsp;����ͬ����
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����׷������ˣ�<h:outputText value="#{SaleContractDetailBean.first}"/>��
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����ҷ������ˣ�<h:outputText value="#{SaleContractDetailBean.second}"/>��
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>�ڰ���</b>&nbsp;&nbsp;&nbsp;
						����ͬ�����֤�������ҹ�֤������ɽ�й�֤����֤��
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>�ھ���</b>&nbsp;&nbsp;&nbsp;
						����ͬһʽ �ݡ��׷���Ȩ��һ�ݣ��׷�ί�д�����һ�ݣ��ҷ�һ��,��ɽ�з��ز���������һ�ݡ���ɽ�й�֤����һ�ݡ�
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>��ʮ��</b>
						&nbsp;&nbsp;&nbsp;����ͬ��������Ľ����ʽ������Լ�����з��������飬˫����ͨ��Э�̡����Ϸ�ʽ�����
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>��ʮһ��</b>&nbsp;&nbsp;&nbsp;
						����ͬδ�����ˣ�����˫��������Լ�����䲹��Լ����˫��ǩ���뱾��ͬͬ�߷���Ч����
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>��ʮ����</b>&nbsp;&nbsp;&nbsp;&nbsp;˫��Լ�����������
					</p><br/>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������(�׷�)��<h:outputText value="#{SaleContractDetailBean.first}" style="width:80px;"/>����(�ҷ�)��<h:outputText value="#{SaleContractDetailBean.second}" style="width:80px;"/>
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���֤���룺<h:outputText value="#{SaleContractDetailBean.firstCardId}"/>���֤���룺<h:outputText value="#{SaleContractDetailBean.secondCardId}"/>
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�绰��<h:outputText value="#{SaleContractDetailBean.firstTel}" style="width:120px;"/>�绰��<h:outputText value="#{SaleContractDetailBean.secondTel}"/>
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������(�׷�)��<h:outputText value="#{SaleContractDetailBean.firstAgent}" style="width:80px;"/>������(�ҷ�)��<h:outputText value="#{SaleContractDetailBean.secondAgent}" style="width:80px;"/>
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��֤����Ѹ�ݶ��ַ����׹�˾
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ǩԼʱ�䣺<h:outputText value="#{SaleContractDetailBean.signTime}"><f:convertDateTime pattern="yyyy��MM��dd��"/></h:outputText>
					</p>
				</div>
			
			
			</div>
		</body>
	</html>
</f:view>