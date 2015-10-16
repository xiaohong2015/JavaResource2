package com.office.dao;

import java.sql.ResultSet;
import com.office.dao.Content;
public class Page {
	private  ResultSet rs=null;
	private  int num_rs=0;
	private  int num_per=Content.NUM_PER;
	private  int num_pages=0;
	private  int current_page=1;
	
	public Page(ResultSet rs,int current_page){
	    this.rs=rs;
		setNumrs(rs);                //设置总记录数
	       System.out.println("Page:总记录数:"+getNumrs());
		setNumPages();               //设置总页数
		   System.out.println("Page:总页数:"+getNumPages());
		setCurrentPage(current_page);//设置当前页数
	       System.out.println("Page:当前页数:"+getCurrentPage());
	}
	
	public  void setCurrentPage(int current_page){
		if(current_page<=0)
			current_page=1;
		if(current_page>getNumPages())
			current_page=getNumPages();
		this.current_page=current_page;
	}
    public  int getCurrentPage(){
		
		return this.current_page;
	}
    
    
    public  void setNumPages(){
    	this.num_pages=((num_rs%num_per==0)?(num_rs/num_per):(num_rs/num_per)+1);
    }
    public  int getNumPages(){
		return this.num_pages; 
	}
    
    
    public  void setNumrs(ResultSet rs){
		try{
		  rs.last();
		  this.num_rs=rs.getRow();
		}
		catch(Exception e){e.printStackTrace();}
	}
	public  int getNumrs(){
		return this.num_rs;
	}
	
	
	public ResultSet getRs(){
		int rspos=(this.current_page-1)*this.num_per+1;
		try{
		    this.rs.absolute(rspos);
		    this.rs.previous();
		}
		catch(Exception e){e.printStackTrace();}
	    return this.rs;
	}
	
	public int getNumper(){
		return this.num_per;
	}
}
