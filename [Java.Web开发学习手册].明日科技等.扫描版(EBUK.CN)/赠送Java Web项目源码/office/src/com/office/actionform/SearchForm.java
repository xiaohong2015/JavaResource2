package com.office.actionform;

import org.apache.struts.action.ActionForm;

public class SearchForm extends ActionForm {
	private String subsql;
	private String subsqlvalue;
	
	public SearchForm(){}

	public void setSubsql(String subsql){
		this.subsql=subsql;
	}
	public void setSubsqlvalue(String subsqlvalue){
		this.subsqlvalue=subsqlvalue;
	}
	public String getSubsql(){
		return subsql;
	}
	public String getSubsqlvalue(){
		return subsqlvalue;
	}
	public void clear(){
		subsql="";
		subsqlvalue="";
	}
	
}
