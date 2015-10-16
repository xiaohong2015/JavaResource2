package com.actionForm;

import javax.servlet.http.*;

import org.apache.struts.action.*;

public class NewsForm extends ActionForm {
    private int id=-1;        
    private int sortId=-1;          
    private String content="";       
    private String createTime="";   
    private String bigSort="";     
    private String title="";      
    private String showNews="";
    public String getContent() {
        return content;
    }

    public String getShowNews()
        {
    	return showNews;
        }

    public void setShowNews(String showNews)
        {
    	this.showNews = showNews;
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

    public void setId(int id) {
        this.id = id;
    }

    public void setSortId(int sortId) {
        this.sortId = sortId;
    }

    public void setBigSort(String bigSort) {
        this.bigSort = bigSort;
    }

    public String getCreateTime() {
        return createTime;
    }


    public String getTitle() {
        return title;
    }

    public int getId() {
        return id;
    }

    public int getSortId() {
        return sortId;
    }

    public String getBigSort() {
        return bigSort;
    }

}
