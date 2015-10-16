package com.office.actionform;

import org.apache.struts.action.ActionForm;
public class PcardForm extends ActionForm {
	private int pcardid;
	private String time;
	private String content;
	private String subject;
	private String author;
	public int getPcardid() {
		return pcardid;
	}
	public void setPcardid(int pcardid) {
		this.pcardid = pcardid;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
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
		this.subject = subject;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}	
	public void clear(){
		pcardid=0;
	    time="";
        content="";
        subject="";
        author="";
	}
}