package com.office.actionform;

import org.apache.struts.action.ActionForm;

public class AdviceForm extends ActionForm {

	private int adviceid;
	private String sbranch;
	private String stime;
	private String sender;
	private String content;
	private String subject;
	
	public int getAdviceid() {
		return adviceid;
	}
	public void setAdviceid(int adviceid) {
		this.adviceid=adviceid;
	}

	public String getSbranch() {
		return sbranch;
	}
	public void setSbranch(String sbranch) {
		this.sbranch =sbranch;
	}

	public String getStime() {
		return stime;
	}
	public void setStime(String sdate) {
		this.stime = sdate;
	}

	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject =subject;
	}
	
	public void clear(){
		 adviceid=0;
		 sbranch="";
         stime="";
         sender="";
         content="";
         subject="";
	}
}