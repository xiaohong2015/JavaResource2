<%@ page contentType="text/html;charset=gbk" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<f:view>
	<html>
		<head>
			<title>���ɷ���֪ʶ��ѯ</title>
			<link type="text/css" rel="stylesheet" href="css/index.css"/>
			<link type="text/css" rel="stylesheet" href="css/tip.css" />
			<script type="text/javascript" src="script/index.js"></script>
			<script type="text/javascript" src="script/general.js"></script>
		</head>
		<body>
			<div id="wrapper">
				<h:graphicImage value="/images/logo_pic.gif" />
				<%@ include file="Menu.jsp" %>
				<p style="text-align:left;padding-top:10px;">
					<h:outputText value=" ��ǰλ�ã�"/>
					<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/Index.jsp">
						<h:outputText value="��ҳ" />
					</h:outputLink>
					<h:outputText value=">>���ɷ����ѯ" />
				</p><br/>
				<div style="text-align:left;padding:10px;">					
				<p>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���л����񹲺͹����з��ز�����������ʮ�������з��ز�������ת�ã�
					<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��һ���Գ��÷�ʽȡ������ʹ��Ȩ�ģ������ϱ�������ʮ�����涨�������ģ�
					<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������˾�����غ��������������ö���������������������ʽ���Ʒ��ز�Ȩ���ģ�
					<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����������ջ�����ʹ��Ȩ�ģ�
					<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ģ����з��ز���δ����������������ͬ��ģ�
					<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���壩Ȩ��������ģ�
					<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������δ�����Ǽ���ȡȨ��֤��ģ�
					<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ߣ����ɡ���������涨��ֹת�õ��������Ρ�
					<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����з��ز�ת�ù���涨�����������з��ز�����ת�ã�
					<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��һ���Գ��÷�ʽȡ������ʹ��Ȩ�������ϱ��涨��ʮ���涨�������ģ�
					<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������˾�����غ��������������ö���������������������ʽ���Ʒ��ز�Ȩ���ģ�
					<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����������ջ�����ʹ��Ȩ�ģ�
					<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ģ����з��ز���δ����������������ͬ��ģ�
					<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���壩Ȩ��������ģ�
					<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������δ�����Ǽ���ȡȨ��֤��ģ�
					<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ߣ����ɡ���������涨��ֹת�õ��������Ρ�
					<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���������ز�ת�ã�Ӧ���������г������
					<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��һ�����ز�ת�õ�����ǩ������ת�ú�ͬ��
					<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���������ز�ת�õ������ڷ��ز�ת�ú�ͬǩ����30���ڳַ��ز�Ȩ��֤�顢�����˵ĺϷ�֤����ת�ú�ͬ���й��ļ��򷿵ز����ڵصķ��ز�������������룬���걨�ɽ��۸�
					<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���������ز������Ŷ��ṩ���й��ļ�������飬����15���������Ƿ��������������𸴣�
					<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ģ����ز������ź�ʵ�걨�ĳɽ��۸񣬲�������Ҫ��ת�õķ��ز������ֳ��鿱��������
					<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���壩���ز�ת�õ����˰��չ涨�����й�˰�ѣ�
					<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���������ز������ź˷���������
				</p>									
				</div>
				<div style="padding:30px;">
					<ul style="text-align:left;">
						<li>
							<h:outputLink value="#">
								<h:outputText value="�� ���ڸ���ס��ת��Ӫҵ˰���ߵ�֪ͨ"/>
							</h:outputLink>					
						</li>
						<li>
							<h:outputLink value="#">
								<h:outputText value="�� ����Ժ�칫��ת�����貿���ڽ�һ���������ٷ��ز�..."/>
							</h:outputLink>
						</li>
						<li>
							<h:outputLink value="#">
								<h:outputText value="�� ����Ժ���ڷ��ز������������˰�������֪ͨ"/>
							</h:outputLink>
						</li>
						<li>
							<h:outputLink value="#">
								<h:outputText value="�� ���ڼ�ǿ���ز��۸���ؼӿ�ס���������� "/>
							</h:outputLink>
						</li>
						<li>
							<h:outputLink value="#">
								<h:outputText value="�� ����Ժ���ڴٽ����ز��г�����������չ��֪ͨ"/>
							</h:outputLink>
						</li>
						<li>
							<h:outputLink value="#">
								<h:outputText value="�� Ӫҵ˰���⽫�������ַ��������µ�����"/>
							</h:outputLink>
						</li>
						<li>
							<h:outputLink value="#">
								<h:outputText value=""/>
							</h:outputLink>
						</li>
					</ul>
				</div>

				
			</div>
		</body>
	</html>
</f:view>