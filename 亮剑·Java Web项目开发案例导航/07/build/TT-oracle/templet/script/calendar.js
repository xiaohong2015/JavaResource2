  var   date   =   new   Date();   
  var   activeDate   =   new   Date();   
    
  var   tbl   =   window.document.createElement("<TABLE   style=\"background:white;border:1px   solid   black;width:100%;height:100%;font:9pt   arial;\"   cellspacing=0>");   
  var   tblhd   =   window.document.createElement("THEAD");   
  var   tblbd   =   window.document.createElement("TBODY");     
    
  var   anchorPriorYear   =   window.document.createElement("A");   
  anchorPriorYear.style.fontFamily   =   "webdings";     
  anchorPriorYear.style.color="white";   
  anchorPriorYear.style.cursor   =   "hand";   
  anchorPriorYear.innerText   =   "7";   
  anchorPriorYear.title   =   "��һ��";     
  var   anchorPriorMonth   =   window.document.createElement("A");     
  anchorPriorMonth.style.fontFamily   =   "webdings";     
  anchorPriorMonth.style.color="white";   
  anchorPriorMonth.style.cursor   =   "hand";     
  anchorPriorMonth.innerText   =   "3";     
  anchorPriorMonth.title   =   "��һ��";     
  var   anchorNextMonth   =   window.document.createElement("A");     
  anchorNextMonth.style.fontFamily   =   "webdings";     
  anchorNextMonth.style.cursor   =   "hand";     
  anchorNextMonth.style.color="white";     
  anchorNextMonth.innerText   =   "4";     
  anchorNextMonth.title   =   "��һ��";     
  var   anchorNextYear   =   window.document.createElement("A");     
  anchorNextYear.style.fontFamily   =   "webdings";     
  anchorNextYear.style.cursor   =   "hand";   
  anchorNextYear.style.color=   "white";   
  anchorNextYear.innerText   =   "8";   
  anchorNextYear.title   =   "��һ��";     
  var   anchorClose   =   window.document.createElement("A");     
  anchorClose.style.fontFamily   =   "webdings";     
  anchorClose.style.cursor   =   "hand";   
  anchorClose.style.color=   "white";   
  anchorClose.innerText   =   "r";   
  anchorClose.title   =   "�ر�";     
    
  var   ynm   =   window.document.createElement("FONT");   
  ynm.style.width   =   "60%";     
  ynm.style.fontWeight   =   "bold";     
    
  var   cpt   =   window.document.createElement("CAPTION");     
  tbl.appendChild(cpt);   
  tbl.appendChild(tblhd);   
  tbl.appendChild(tblbd);   
    
  var   fillInput;   
  var   calshow=false;   
    
  window.onload=function(){   
  	initcal();   
  }   
    
  function   initcal(){   
	  inithead();   
	  initbody();   
	  calendar.appendChild(tbl);   
	  fillCalendar(date);   
	  tblbd.attachEvent("onclick",selectDate);   
	  tblbd.attachEvent("onkeydown",moveDate);         
	  anchorPriorYear.attachEvent("onclick",goPriorYear);         
	  anchorPriorMonth.attachEvent("onclick",goPriorMonth);   
	  anchorNextMonth.attachEvent("onclick",goNextMonth);   
	  anchorNextYear.attachEvent("onclick",goNextYear);     
	  anchorClose.attachEvent("onclick",closeCalendar);     
	  calendar.stopBubble   =   true;   
	    
  }     
    
  function   inithead(){     
	  cpt.style.backgroundColor   =   "#003399";         
	  cpt.style.color   =   "white";   
	  cpt.style.textAlign   =   "center";   
	  cpt.appendChild(anchorPriorYear);   
	  cpt.appendChild(anchorPriorMonth);   
	  cpt.appendChild(ynm);   
	  cpt.appendChild(anchorNextMonth);   
	  cpt.appendChild(anchorNextYear);   
	  cpt.appendChild(anchorClose);   
	  var   row   =   tblhd.insertRow();   
	  row.align   =   "center";     
	  var   weekStr   =   new   Array("��","һ","��","��","��","��","��");   
	  for   (var   i=0;i<weekStr.length;i++){   
		  var   cell   =   row.insertCell();   
		  cell.innerText   =   weekStr[i];     
		  cell.style.borderBottom   =   "solid   1px";     
		  cell.style.cursor   =   "default";   
		  cell.align   =   "center";       
		  if(i==0||i==6)cell.style.color="red";   
	 }   
  }   
		    
	function   initbody(){   
		for   (var   i=0;i<6;i++){   
		  var   row   =   tblbd.insertRow();   
		  for   (var   j=0;j<7;j++){   
			  var   cell   =   row.insertCell();   
			  cell.innerHTML   =   "&nbsp;";   
			  cell.style.cursor   =   "hand";
			  cell.align   =   "center";     
		  }   
	  	}   
  	}   
    
  function   fillCalendar(adate){   
	  ynm.innerText   =   adate.getFullYear()   +   "��"   +   (adate.getMonth()   +   1)   +   "��";     
	  var   tempdate   =   new   Date();     
	  tempdate.setFullYear(adate.getFullYear(),adate.getMonth(),1);   
	  var   first   =   true;   
	  for   (var   i=0;i<tblbd.rows.length;i++){     
		  for   (var   j=0;j<tblbd.rows(i).cells.length;j++){   
			  var   cell   =   tblbd.rows(i).cells(j);   
			  cell.innerHTML   =   "&nbsp;";     
			  cell.bgcolor   =   "";   
			  cell.title   =   "";   
			  if(j==0||j==6)   cell.style.color="red";   
			  else   cell.style.color="black";   
			  cell.style.backgroundColor   =   "";     
			  if   (tempdate.getDay()   ==   j){     
				  if   (!first)   continue;     
					  cell.innerText   =   tempdate.getDate();   
					  var   today=new   Date();     
				  if   (tempdate.getDate()   ==   activeDate.getDate()){   
					  cell.setAttribute("active",true);   
					  hightLightDate(cell);
				  }   
				  tempdate.setFullYear(tempdate.getFullYear(),tempdate.getMonth(),tempdate.getDate()+1);   
				  first   =   tempdate.getDate()   >   1;   
			  }   
		  }   
	  }   
  }   
    
  function   hightLightDate(object){   
	  var   tds   =   tblbd.all.tags("TD");   
	  for   (var   i=0;i<tds.length;i++){   
		  if   (tds(i)   !=   object){   
			  tds(i).style.backgroundColor   =   tds(i).bgcolor;     
			  tds(i).style.color   =   tds(i).style.color   
		  }   
		  else{       
			  tds(i).style.backgroundColor   =   "red";     
			  tds(i).style.color   =   "white";     
		  }   
	  }   
  }   
    
  function   selectDate(){   
	  var   i   =   parseInt(window.event.srcElement.innerText);
	  var pattern = /^\d{4}-((0?[1-9])|(1[0-2]))-((0?[1-9])|([1-2]\d)|(3[0-1]))$/;
	  if   ((!isNaN(i))   &&   (i<3000)){
		  activeDate.setFullYear(date.getFullYear(),date.getMonth(),i);             
		  fillCalendar(activeDate);
	  }
	  var temp = activeDate.getFullYear()+'-'+(activeDate.getMonth()+1)+"-"+i
	  if(pattern.test(temp)){
		  fillInput.value=temp;
		  hiddenCal();	  
	  }
  }   
    
  function   moveDate(){   
	  var   k   =   window.event.keyCode;   
	  switch(k){   
	  case   37:activeDate.setFullYear(activeDate.getFullYear(),activeDate.getMonth(),activeDate.getDate()-1);     
	  break;   
	  case   38:activeDate.setFullYear(activeDate.getFullYear(),activeDate.getMonth(),activeDate.getDate()-7);     
	  break;   
	  case   39:activeDate.setFullYear(activeDate.getFullYear(),activeDate.getMonth(),activeDate.getDate()+1);   
	  break;   
	  case   40:activeDate.setFullYear(activeDate.getFullYear(),activeDate.getMonth(),activeDate.getDate()+7);   
	  break;   
	  }       
	  date.setFullYear(activeDate.getFullYear(),activeDate.getMonth(),activeDate.getDate());   
	  fillCalendar(date);   
	  fillInput.value=activeDate.getFullYear()+'-'+(activeDate.getMonth()+1)+"-"+activeDate.getDate();   
  }   
    
  function   goNextMonth(){   
	  date.setMonth(date.getMonth()+1,1);   
	  setActiveDate();   
	  fillCalendar(date);   
  }   
    
  function   goNextYear(){         
	  date.setFullYear(date.getFullYear()+1,date.getMonth(),1);   
	  setActiveDate();   
	  fillCalendar(date);   
  }   
    
  function   goPriorYear(){         
	  date.setFullYear(date.getFullYear()-1,date.getMonth(),1);         
	  setActiveDate();   
	  fillCalendar(date);   
  }   
    
  function   goPriorMonth(){   
	  date.setMonth(date.getMonth()-1,1);   
	  setActiveDate();   
	  fillCalendar(date);     
  }   
    
  function   setActiveDate(){   
	  var   i   =   activeDate.getDate();         
	  activeDate.setFullYear(date.getFullYear(),date.getMonth(),i);   
	  while   ((date.getMonth()   !=   activeDate.getMonth())||(date.getFullYear() != activeDate.getFullYear())){   
	  	activeDate.setFullYear(date.getFullYear(),date.getMonth(),i--);         
	  }   
	  fillCalendar(date);     
  }   
    
  function   showCalendar(id){  
     tfpos=getElementPos(id);
     xby=tfpos.y+tfpos.h-2;
     xbx=tfpos.x-1;
  
	  calendar.style.top=xby;
	  calendar.style.left=xbx;
	  calshow=true;   
	  fillInput=document.getElementById(id);
	  calendar.style.visibility="visible";
  }   
    
    
  function   hiddenCal(){
  	calendar.style.visibility="hidden"; 	 
  }   
    
  function   closeCalendar(){   
	  calshow=false;   
	  calendar.style.visibility="hidden";   
  }   