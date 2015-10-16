package com.actionForm;

import org.apache.struts.action.ActionForm;

//��������
public class ForceForm extends ActionForm {

    private int id=-1;
     private String content="";
     private String createTime="";
     private String title="";
     public String getContent() {
         return content;
     }

     public void setContent(String content) {
         this.content = content;
     }

     public void setTitle(String title) {
         this.title = title;
     }

     public void setCreateTime(String createTime) {
         this.createTime = createTime;
     }

  
   

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCreateTime() {
         return createTime;
     }

     public String getTitle() {
         return title;
     }

   

}
