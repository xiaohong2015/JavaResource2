<%@ page contentType="text/html;charset=gbk" %>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<f:view>
	<html>
		<head>
			<title>���ַ���������ͬ����</title>
			<link href="css/index.css" rel="stylesheet" type="text/css" />
			<script type="text/JavaScript" src="script/index.js"></script>
			<script type="text/javascript" src="script/general.js"></script>
		</head>
		<body>
			<div id="wrapper">
				<h:graphicImage value="images/logo_pic.gif"/>
				<%@ include file="Menu.jsp" %>
				<p style="text-align:left;padding-top:10px;">
					<h:outputText value="  ��ǰλ�ã�"/>
					<h:outputLink value="#{facesContext.externalContext.requestContextPath}/faces/Index.jsp">
						<h:outputText value="��ҳ" />
					</h:outputLink>
					<h:outputText value=">>���ַ���������ͬ����" />
				</p>
				<div style="width:90%;background-color:#FFFFFF;padding:40px;margin:20px;font-size:14px;text-align:left;">
					<b style="text-align:center;font-size:18px;"><center>���ַ���������ͬ����</center></b>
					<p>��������Ƽ׷�����������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���֤�ţ�������������������������������������</p>
					<p>�򷽣�����ҷ�����������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���֤�ţ�������������������������������������</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ݡ��л����񹲺͹����ú�ͬ���������л����񹲺͹����з��ز��������������йط��ɡ�����֮�涨���ס���˫����ƽ�ȡ���Ը��Э��һ�µĻ����ϣ����ҷ���׷����򷿲�ǩ������ͬ�����ʹ�ͬ����ִ�С� 
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>��һ��</b>&nbsp;&nbsp;&nbsp;
						�ҷ�ͬ�⹺��׷�ӵ�е������ڡ������С�������������ӵ�еķ���סլ���������Ϊ������ƽ���ס���������ط���Ȩ֤�ڡ������ţ���
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>�ڶ���</b>&nbsp;&nbsp;&nbsp;
						���������Ľ��׼۸�Ϊ�����ۣ�����ҡ�����Ԫ/ƽ���ף��ܼۣ�����ҡ�����Ԫ������д�����ۡ�ʰ�����Ǫ���ۡ�ʰ��Ԫ����������ͬǩ��֮�գ��ҷ���׷�֧������ҡ�������������Ԫ������Ϊ��������
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>������</b>&nbsp;&nbsp;&nbsp;&nbsp;����ʱ����취
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��������˫��ͬ�������а��ҷ�ʽ�����Լ���ڷ��ز��������Ľɽ�˰�ѵ���֧���׸������������ҡ�ʰ�����Ǫ���ۡ�ʰ��Ԫ�����׷���ʣ�෿������ҡ�����������Ԫ���������а��ң�������ʵ�����������ǰ�������ȣ��ҷ�Ӧ�ڽɽ�˰�ѵ��ս����һ��֧�����׷������������зſ�ո����׷���
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2������˫��ͬ����һ���Ը��ʽ�����Լ���ڷ��ز��������Ľɽ�˰�ѵ���֧���׸������������ҡ�ʰ�����Ǫ���ۡ�ʰ��Ԫ�����׷���ʣ�෿������ҡ�����������Ԫ���ڲ�Ȩ������ϵ��ո����׷���		
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>������</b>&nbsp;&nbsp;&nbsp;&nbsp;�׷�Ӧ���յ��ҷ�ȫ���֮������������ڽ����׵ķ���ȫ���������ҷ�ʹ�ã���Ӧ�ڽ������ս��������ȷ��ý��塣	
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>������</b>&nbsp;&nbsp;&nbsp;&nbsp;
						˰�ѷֵ� ����˫��Ӧ���ع��ҷ��ز����ߡ����棬�����涨���ɰ����ز���������������ɵ�˰�ѡ���˫��Э�̣�����˰���ɡ����е����н�Ѽ������Ȩ�����������ɡ����е���
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>������</b>&nbsp;&nbsp;&nbsp;&nbsp;
						ΥԼ���� �ס���˫����ͬǩ�������ҷ���;ΥԼ��Ӧ����֪ͨ�׷����׷�Ӧ�ڡ��������ڽ��ҷ����Ѹ������Ϣ���������ҷ��������������׷����С����׷���;ΥԼ��Ӧ����֪ͨ�ҷ�������ΥԼ֮�������������Ӧ���ҷ����������˫�����Ѹ�������ҷ���
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>������</b>&nbsp;&nbsp;&nbsp;&nbsp;����ͬ����
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����׷��ǡ��������������ˣ�ί�д����ˡ��������׷������ˡ�
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����ҷ��ǡ��������������ǡ�������
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>�ڰ���</b>&nbsp;&nbsp;&nbsp;
						����ͬ�������֤�������ҹ�֤���ء�������֤����֤��
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>�ھ���</b>&nbsp;&nbsp;&nbsp;
						����ͬһʽ �ݡ��׷���Ȩ��һ�ݣ��׷�ί�д�����һ�ݣ��ҷ�һ��,��ɽ�з��ز���������һ�ݡ���������֤����һ�ݡ�
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>��ʮ��</b>
						&nbsp;&nbsp;&nbsp;����ͬ��������Ľ����ʽ������Լ�����з��������飬˫����ͨ��Э�̡����Ϸ�ʽ�����
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>��ʮһ��</b>&nbsp;&nbsp;&nbsp;
						����ͬδ�����ˣ�����˫��������Լ�����䲹��Լ����˫��ǩ���뱾��ͬͬ�߷���Ч����
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>��ʮ����</b>&nbsp;&nbsp;&nbsp;&nbsp;˫��Լ�����������
					</p><br/>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������(�׷�)��������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����(�ҷ�)��������
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���֤���룺��������������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���֤���룺��������������
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ַ����������������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ַ����������������
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ʱࣺ��������������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ʱࣺ��������������
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�绰����������������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�绰����������������
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������(�׷�)��������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������(�ҷ�)��������
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���֤���룺��������������&nbsp;&nbsp;&nbsp;&nbsp;���֤���룺��������������
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��֤����������
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��֤���أ�������
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ַ����������������
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ʱࣺ��������������
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�绰����������������
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���˴���������
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����������
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����ˣ�������
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ǩԼʱ�䣺&nbsp;&nbsp;&nbsp;��������������¡�����
					</p>
				</div>
			
			
			</div>
		</body>
	</html>
</f:view>