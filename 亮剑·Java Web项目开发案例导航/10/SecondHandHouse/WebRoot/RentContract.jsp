<%@ page contentType="text/html;charset=gbk" %>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:view>
	<html>
		<head>
			<title>�������޺�ͬ����</title>
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
					<h:outputText value=">>�������޺�ͬ����" />
				</p>
				<div style="width:90%;background-color:#FFFFFF;padding:40px;margin:20px;font-size:14px;text-align:left;">
					<b style="text-align:center;font-size:18px;"><center>�������޺�ͬ����</center></b>
					<p>���ⷿ��������</p>
					<p>���ⷽ��������</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ݡ��л����񹲺͹����ú�ͬ�������йع涨��
						Ϊ��ȷ���ⷽ����ⷽ��Ȩ�������ϵ����˫��Э��һ�£�ǩ������ͬ��
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>��һ��</b>&nbsp;&nbsp;&nbsp;
						�������䡢�������������������
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>�ڶ���</b>&nbsp;&nbsp;&nbsp;&nbsp;��������
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����ڹ�������������£����ⷽ�ӡ�������������¡������𽫳��ⷿ�ݽ������ⷽʹ�ã�����������������¡������ջء�
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����������������֮һ�ģ������˿�����ֹ��ͬ���ջط��ݣ�
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������������Խ�����ת�⡢ת�û�ת��ģ�
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������������ó��ⷿ�ݽ��зǷ�����𺦹�������ģ�
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������������Ƿ����ۼƴ�������µġ� 					
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���޺�ͬ������������ֹʱ��������˵���ȷʵ�޷��ҵ����ݣ�������Ӧ�������ӳ��������ޡ�
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ͬ����������ⷽ�Լ������ⷿ�ݵģ����ⷽ��������Ȩ��
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����ⷽ���ڲ���Ǩ�����ⷽ��Ȩ������Ժ���ߺ�����ִ�У����ⷽ���������ʧ�ɳ��ⷽ�����⳥��
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>������</b>&nbsp;&nbsp;&nbsp;&nbsp;�������Ľ�������
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ı�׼�ͽ������ޣ������ҡ��������Ĺ涨ִ�У������û��ͳһ�涨�ģ������ɳ��ⷽ�ͳ��ⷽЭ��ȷ��������������̧�ߣ���
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>������</b>&nbsp;&nbsp;&nbsp;&nbsp;�����ڼ䷿������
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ɷ����ǳ����˵����񡣳����˶Է��ݼ����豸Ӧÿ�������£����꣩�����顢����һ�Σ��Ա��ϳ����˾�ס��ȫ������ʹ�á�
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������ά�޷���ʱ��������Ӧ����Э������������ʩ������������ȷʵ�������ɣ���ͬ������Э�̺��ޣ���ʱ�����˸��������ɷ��ü����Գ�������ɳ����˷��ڳ�����
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>������</b>&nbsp;&nbsp;&nbsp;&nbsp;���ⷽ����ⷽ�ı��
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����������ⷽ����������Ȩת�Ƹ�������ʱ����ͬ���µķ��������߼�����Ч��
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���������˳������ݣ����ڣ�����ǰ֪ͨ�����ˡ���ͬ�������£������������ȹ���Ȩ��
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������������Ҫ������˻���ס��ʱ��Ӧ�������ó�����ͬ�⣻������Ӧ��֧�ֳ����˵ĺ���Ҫ��
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>������</b>&nbsp;&nbsp;&nbsp;&nbsp;ΥԼ����
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������ⷽδ��ǰ����ͬ����Ĺ涨������˽����Ϻ�Ҫ��ķ��ݵģ������⳥����Ԫ��
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������ⷽδ��ʱ�������ⷿ�ݹ�������ʹ�õģ����𳥸�ΥԼ�����Ԫ��
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������ⷽδ��ʱ����δ��Ҫ�����ɳ��ⷿ�ݵģ����𳥸�ΥԼ�����Ԫ���������ɳ��ⷽ��Ա�����ܵ��˺�������ܻٵģ������⳥��ʧ��
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������ⷽ���ڽ������ģ�����Ӧ��ʱ���������⣬Ӧ֧��ΥԼ�����Ԫ��
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������ⷽΥ����ͬ�����Խ����ⷿ��ת������ʹ�õģ�Ӧ֧��ΥԼ�����Ԫ���������ɳ��ⷿ�ݻٻ��ģ���Ӧ�����⳥��
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>������</b>&nbsp;&nbsp;&nbsp;&nbsp;��������
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������򲻿ɿ�����ԭ���»������ɳ��ⷽ��ʧ�ģ�˫�������е����Ρ�
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>�ڰ���</b>&nbsp;&nbsp;&nbsp;&nbsp;����Ľ����ʽ
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����ͬ���������緢�����飬˫��ӦЭ�̽����Э�̲���ʱ���κ�һ���������̾־��ú�ͬ�ٲ�ίԱ�����������ٲã�Ҳ����������Ժ���ߡ�
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>�ھ���</b>&nbsp;&nbsp;&nbsp;&nbsp;����Լ������
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>��ʮ��</b>
						&nbsp;&nbsp;&nbsp;����ͬδ�����ˣ�һ�ɰ����л����񹲺͹����ú�ͬ�������йع涨������ͬ˫����ͬЭ�̣���������涨������涨�뱾��ͬ����ͬ��Ч����
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����ͬ����Ҽʽ���ݣ����ⷽ�����ⷽ��ִҼ�ݣ���ͬ���������ݣ��͡���������λ������
					</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ⷽ�����£���&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ⷽ�����£���
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ַ��
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���������ˣ�ǩ������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���������ˣ�ǩ������
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ί�д����ˣ�ǩ������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ί�д����ˣ�ǩ������
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������У�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������У���
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������ʺţ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ʺţ�
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�绰��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�绰����
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ң�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ң���
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������룺&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������룺
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��������֤�����
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��������֤���أ��£���
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ǩԼ�ص㣺
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��Ч���ޣ�����������������¡�����
						<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ǩԼʱ�䣺&nbsp;&nbsp;&nbsp;��������������¡�����
					</p>
				</div>
			</div>	
		</body>
	</html>
</f:view>