package com.actionForm;

import org.apache.struts.action.*;
public class AfficheForm extends ActionForm {
    private int id=-1;
    private String content="";
    private String createTime="";
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getCreateTime() {
        return createTime;
    }
    public int getId() {
        return id;
    }
}
