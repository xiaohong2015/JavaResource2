package com.actionForm;

import javax.servlet.http.*;

import org.apache.struts.action.*;
//����Ա
public class ManagerForm extends ActionForm {
    private String account="";
    private String name="";
    private String password="";
    private int id=-1;
    private int manager=0;


    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setManager(int manager) {
        this.manager = manager;
    }


    public String getName() {
        return name;
    }

    public String getPassword() {
        return password;
    }

    public int getId() {
        return id;
    }

    public int getManager() {
        return manager;
    }

  
}
