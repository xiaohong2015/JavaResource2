	var isIE=navigator.appName=="Microsoft Internet Explorer";
	var isList=false;
	var id = "start";
   function processKey(e) 
   {         
     if (isIE) {
      	var ieKey=event.keyCode; var nKey=0;
     }
     else {
     	var nKey=e.which; 
     	var ieKey=0;
     }   
     if(ieKey==38||nKey==38)
     {//�������ϼ�
        if(isList)
        {
           document.all.citylist.focus();
           document.all.citylist0.click();
           
        }
     }
     else if(ieKey==40||nKey==40)
     {//�������¼�
        if(isList)
        {
           document.all.citylist.focus();
           document.all.citylist0.click();
        }
     }
     else
     {           
       showCity();
     }
     
  }
  function selectCity(){
  	document.getElementById(id).value=document.all.citylist.value;
  	document.getElementById(id).focus();
  	document.all.city.style.visibility="hidden";
  	isList=false;
  }
  function showCity(){
    tfpos = getElementPos(id);
	var cityname = ["����","���","�Ϻ�","����","����","������","����","�������","��ľ˹","����","����","��ƽ","ͨ��","����","����","��ɽ","��˳","��Ϫ","����","����","Ӫ��","����","����","����","��ʯ��","ʯ��ׯ","��ɽ","����","�ػʵ�","����","�żҿ�","�ȷ�","����","��ˮ","��̨","����","�ൺ","�ĳ�","�ɶ�","������","����","����","��ͷ","�׳�","�˴���","������","�׺�","����","����","��ͷ","��ˮ","̩ɽ","��³��","��ɽ","̫ԭ","̩��","ͼ��"];
	var alias = ["bj","tj","sh","cq","xz","heb","dq","qqhe","jms","cc","jl","sp","th","sy","dl","as","fs","bx","dd","jz","yk","fx","ly","tl","dsq","sjz","ts","hd","qhd","bd","zjk","lf","cz","hs","xt","jn","qd","lc","cd","bjx","bj","bb","bt","bc","bdl","bdh","bh","bh","bz","bt","ts","ts","tlf","ts","ty","tz","tm"];
	var pattern = "regexp=/^"+document.getElementById(id).value.toLowerCase()+"/";
	eval(pattern);
	var temp = "<form><select id=\"citylist\" size=\"10\"  style=\"width:"+tfpos.w+"\" ondblclick=\"JavaScript:selectCity()\" >";
	var str = "";
	var length = alias.length;
	var j=0;
	for(var i=0;i<length;i++){
		if(regexp.test(alias[i])){
			str += "<OPTION id=\"citylist"+j+"\" value=\""+cityname[i]+"\">"+cityname[i]+"</OPTION>";
			j++;
		}
	}
	if(str.length!=0){
		str = str+"</select></form>"
		document.all.city.innerHTML = temp+str;
		document.all.city.style.visibility="visible";
		document.all.city.style.left = tfpos.x-1;
		document.all.city.style.top = tfpos.y+tfpos.h-2;
		document.all.citylist.onkeyup = keyReturnCityList;
		isList=true;
	}
	else{
		document.all.city.innerHTML = "";
	}
  }
  function setId(kjid){
  	id = kjid;
  }
  
function keyReturnCityList(e){//�ж�citylist���Ƿ��»س���
 if (isIE) {
    var ieKey=event.keyCode; var nKey=0;
 } 
 else{
   var nKey=e.which; 
   var ieKey=0;
 }   
 if(ieKey==13||nKey==13){//���»س���
   document.all.city.style.visibility="hidden";
   document.getElementById(id).focus();
   isList=false;
   document.getElementById(id).value=document.all.citylist.value;
 }  
 else if((ieKey!=40&&ieKey!=38&&ieKey!=39&&ieKey!=37)&&(nKey!=40&&nKey!=38&&nKey!=39&&nKey!=37)){//���ǰ����������Ҽ�
    document.getElementById(id).value+=String.fromCharCode((isIE)?ieKey:nKey).toLowerCase();
    document.getElementById(id).focus();   
    showCity();    
 }
} 