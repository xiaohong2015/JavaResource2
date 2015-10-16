package com.office.tools;

import com.office.actionform.LogonForm;

public class CheckUserAble {
  private static boolean allow=false;
  
  public static boolean check(LogonForm logonuser){
	  int able=logonuser.getUserable();
	  if(able!=0)
		  allow=true;
	  else
		  allow=false;
	  return allow;
  }
	
  public static boolean check1(LogonForm logonuser){
	  int able=logonuser.getUserable();
	  if(able!=1)
		  allow=true;
	  else
		  allow=false;
	 
	  return allow;
  }
}
