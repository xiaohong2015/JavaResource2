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
		http_request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		var formData ="";
		var elem = "";
		for(var i=0;i<form1.elements.length;i++){
			element = form1.elements[i];
			if(formData != ''){
				formData += '&';
			}
			formData += element.name+"="+element.value;
		}
        http_request.send(formData);
    }
    function getResult() {
        if (http_request.readyState == 4) {     // �ж�����״̬
            if (http_request.status == 200) {     // ����ɹ�����ʼ�����ؽ��
                deal(http_request.responseText);      //����deal()���������ؽ��
            } else {     //����ҳ���д���
                alert("���������ҳ���д���");
            }
        }
    }
	function deal(result){
			if(result=="err"){
				alert("������Ļ�Ա���ƻ�����������������룡");
			}else{
				login.innerHTML=result;
			}
	}

	//����֤
	function checkU(myform){
	if(myform.username.value==""){
		alert("�������Ա��!");myform.username.focus();return false;
	}
	if(myform.PWD.value==""){
		alert("����������!");myform.PWD.focus();return false;
	}
	createRequest("loginservlet");
	}