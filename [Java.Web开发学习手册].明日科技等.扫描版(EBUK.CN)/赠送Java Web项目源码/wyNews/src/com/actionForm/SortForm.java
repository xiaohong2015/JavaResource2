package com.actionForm;

import org.apache.struts.action.*;


public class SortForm extends ActionForm {
    private String bigSort="";//大类别名称
     private int id=-1;//自动编号
     private String smallSort="";//小类别名称
    private String createTime="";        //创建时间

    public SortForm(){}
     public String getBigSort() {
         return bigSort;
     }

     public void setBigSort(String bigSort) {
         this.bigSort = bigSort;
     }

     public void setSmallSort(String smallSort) {
         this.smallSort = smallSort;
     }

     public void setId(int id) {
         this.id = id;
     }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }


    public int getId() {
         return id;
     }

     public String getSmallSort() {
         return smallSort;
     }

    public String getCreateTime() {
        return createTime;
    }


}
