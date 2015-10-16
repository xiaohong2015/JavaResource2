    var http_request = false;
    function createRequest(url) {
        http_request = false;
        if (window.XMLHttpRequest) {     // Mozilla浏览器
            http_request = new XMLHttpRequest();
            if (http_request.overrideMimeType) {
                http_request.overrideMimeType('text/xml');     //设置MIME类别
            }
        } else if (window.ActiveXObject) {     // IE浏览器
            try {
                http_request = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {
                try {
                    http_request = new ActiveXObject("Microsoft.XMLHTTP");
               } catch (e) {}
            }
        }
        if (!http_request) {
            alert("不能创建XMLHttpRequest对象实例！");
            return false;
        }
        http_request.onreadystatechange = getResult;     //调用返回结果处理函数
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
        if (http_request.readyState == 4) {     // 判断请求状态
            if (http_request.status == 200) {     // 请求成功，开始处理返回结果
                deal(http_request.responseText);      //调用deal()方法处理返回结果
            } else {     //请求页面有错误
                alert("您所请求的页面有错误！");
            }
        }
    }
	function deal(result){
			if(result=="err"){
				alert("您输入的会员名称或密码错误，请重新输入！");
			}else{
				login.innerHTML=result;
			}
	}

	//表单验证
	function checkU(myform){
	if(myform.username.value==""){
		alert("请输入会员名!");myform.username.focus();return false;
	}
	if(myform.PWD.value==""){
		alert("请输入密码!");myform.PWD.focus();return false;
	}
	createRequest("loginservlet");
	}