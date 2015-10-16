package com.office.actionform;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

public class FileForm extends ActionForm {
	private int fileid;
	private FormFile upfile;
	private String delete;
	private String fileinfo;
	private String fileuper;
	private String filename;
	private String fileuptime;
	private String filesize;

	public int getFileid() {
		return fileid;
	}

	public void setFileid(int fileid) {
		
		this.fileid = fileid;
	}
	
	public FormFile getUpfile() {
		return upfile;
	}

	public void setUpfile(FormFile upfile){
		this.upfile=upfile;
	}

	public String getDelete(){
		return delete;
	}
	public void setDelete(String delete){
		this.delete=delete;
	}

	public String getFileinfo() {
		return fileinfo;
	}

	public void setFileinfo(String fileinfo) {
		this.fileinfo = fileinfo;
	}

	public String getFileuper() {
		return fileuper;
	}

	public void setFileuper(String fileuper) {
		this.fileuper = fileuper;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFileuptime() {
		return fileuptime;
	}

	public void setFileuptime(String filedate) {
		this.fileuptime = filedate;
	}

	public String getFilesize() {
		return filesize;
	}

	public void setFilesize(String filesize) {
		this.filesize = filesize;
	}
	
	public void clear(){
	  fileid=0;
	  upfile=null;
	  delete="";
	  fileinfo="";
	  fileuper=""; 
      filename="";
      fileuptime="";
	  filesize="";
	}
}