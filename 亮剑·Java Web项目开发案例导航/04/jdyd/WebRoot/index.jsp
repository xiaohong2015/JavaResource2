<%@page contentType="text/html;charset=GBK"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:view> 
 <html>
  <head>
    <title>A10�Ƶ�Ԥ�����Ļ�ӭ��</title>
    <link rel="stylesheet" type="text/css" href="script/main.css"/>
  </head>
  <body>
  	<div class="MainBox">
	  	<%@ include file="top.jsp" %>
	  	<span style="margin-left:5px;">
	  		<h:outputText value="��ҳ >> " rendered="#{UserLogin.uname!=null}"></h:outputText>
	  		<h:outputText value="#{UserLogin.message}" rendered="#{UserLogin.uname!=null}"></h:outputText>
	  	</span>
	  	<div style="font-size:13px;word-break: break-all;line-height:24px;padding:15px;8px;">
							<img border="0" src="images/index.jpg" hspace="10"style="margin-right: 4px" align="left" width="300" height="200">

								 &nbsp;&nbsp;&nbsp;&nbsp; A10�Ƶ���A10���ʷ�չ���޹�˾Ͷ��4.5��Ԫ�������Ǽ���׼�˽���ռ�����58Ķ��
								 ��¥��20�㣨����һ�㣩���ܽ������6��O��������¥4.5��O,ӵ�пͷ���508�䣨�ף���
								 18�׺��������׷��Ͱ�����ͳ�׷����䱸�ж�������յ����ߵ���ԡϵͳ���������ǵ���Ƶ����
								 ���ֵ��ӡ�����ɡ����䡢���ӱ����䡢���ʻ�����������������Ƶ�������Ի����вм���ʿ
								 ר�ÿͷ�����ͥ�÷��Լ����˷���<br/>								
								  &nbsp;&nbsp;&nbsp;&nbsp;�����лա������桢��������Ȳ�ϵ������48��������᣻
								  ��¥����������Ʒ��������ʳ����¥���������ͬʱ����600�˴�����᣻�Ƶ����д��Ͷ�
								  ������6��������ÿ�����ǧ�˴��ͻ��飬С�ͻ�����9�����Ӽ���6��������������ʩ�ߵ���
								  ���㲻ͬ���ͻ�������󣬾���ǧ�˲���������ĽӴ����������򳡡���Ӿ�ء�������
								  SPA�����Ȱɡ������ҡ����ֲ�����������KTV���ᡢ������������ʩһӦ��ȫ��
								<br/>
								&nbsp;&nbsp;&nbsp;&nbsp;A10�Ƶ�ȫ��Ա�����߳�Ϊ���ṩ������ܰ�Ŀͷ�����ζ�ɿڵĲ��ȣ��ִ���ݵ���ʩ��
								���ƾ����ķ������������ж����ڼ����ʰ��ݡ����ǽ�Ϊ�����������иŬ����Ը�������������A10��



						</div>
  	</div>
  	</body>
 </html>
 </f:view>