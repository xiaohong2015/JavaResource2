package com.tools;
import java.text.DateFormat;
import java.util.Date;
public class TimeShow {
    
     public static String cuttentMonthDate() {
    	 Date date = new Date();
 		DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.LONG);
 		return dateFormat.format(date);
     }
     
     public static String autoNumber(){
	 Date date= new Date();
	 String autonumber=String.valueOf(date.getTime());
	 return autonumber+".html";
     }
     
     
}
