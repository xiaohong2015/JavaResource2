package com.office.tools;

import java.util.*;
import javax.servlet.*;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;

public class ManagerTrace implements javax.servlet.http.HttpSessionBindingListener {
  private String id;
  private Vector vc=new Vector();

  public ManagerTrace() {
    id = "";
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getId() {
    return this.id;
  }
  
  public Vector getVc(){
	  return this.vc;
  }

  public void valueBound(HttpSessionBindingEvent arg0) {
	  HttpSession session=arg0.getSession();
	  ServletContext sct=session.getServletContext();
	  vc=(Vector)sct.getAttribute("userlist");
	  if(vc==null||vc.size()==0){
		  vc=new Vector();
		  vc.add(id);
	  }
	  else{
		  if(!vc.contains(id)){
			 vc.add(id);
		  }		  
	  }
	  sct.setAttribute("userlist",vc);
	  System.out.println(this.id+":"+Change.datetostr(new Date())+" ����!");

  }

  public void valueUnbound(HttpSessionBindingEvent arg0) {
    if (id !=null||id!="") {
    	HttpSession session=arg0.getSession();
    	ServletContext sct=session.getServletContext();
    	vc=(Vector)sct.getAttribute("userlist");
    	if(vc!=null||vc.size()!=0)
    		vc.removeElement(id);
        sct.setAttribute("userlist",vc);
        System.out.println(this.id+":"+Change.datetostr(new Date())+" ����!");
    }
  }
}
