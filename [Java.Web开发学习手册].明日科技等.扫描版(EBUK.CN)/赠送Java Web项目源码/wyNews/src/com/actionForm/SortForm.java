package com.actionForm;

import org.apache.struts.action.*;


public class SortForm extends ActionForm {
    private String bigSort="";//���������
     private int id=-1;//�Զ����
     private String smallSort="";//С�������
    private String createTime="";        //����ʱ��

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
