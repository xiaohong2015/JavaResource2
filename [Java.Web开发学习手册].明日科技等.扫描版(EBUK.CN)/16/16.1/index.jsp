<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>�Ajax�������</title>
<script language="javascript">
    var http_request = false;
    function createRequest(url) {
        http_request = false;
        if (window.XMLHttpRequest) {     // Mozilla�����
            http_request = new XMLHttpRequest();
            if (http_request.overrideMimeType) {
                http_request.overrideMimeType('text/xml');     //����MIME���
            }
        } else if (window.ActiveXObject) {     // IE�����
            try {
                http_request = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {
                try {
                    http_request = new ActiveXObject("Microsoft.XMLHTTP");
               } catch (e) {}
            }
        }
        if (!http_request) {
            alert("���ܴ���XMLHttpRequest����ʵ����");
            return false;
        }
        http_request.onreadystatechange = getResult;     //���÷��ؽ��������
        http_request.open('POST', url, true);
        http_request.send();

    }
//���ؽ��������
    function getResult() {
        if (http_request.readyState == 4) {     // �ж�����״̬
            if (http_request.status == 200) {     // ����ɹ�����ʼ�����ؽ��
                alert(http_request.responseText);
            } else {     //����ҳ���д���
                alert("���������ҳ���д���");
            }
        }
    }
</script>
</head>
<body>
<a href="#" onClick="createRequest('goal.htm')">��ȡ����</a>
</body>
</html>