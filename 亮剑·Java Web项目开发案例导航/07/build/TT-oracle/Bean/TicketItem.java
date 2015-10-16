package wyf.zrk;

import java.io.Serializable;
import java.util.*;

public class TicketItem implements Serializable{
	private String tname;			//������
	private String tstart;			//����վ
	private String tend;			//Ŀ��վ
	private String tdate;			//��Ʊ����
	private int tamount;			//��Ʊ����
	private String linkman;			//��ϵ��
	private String address;			//��ϵ�˵�ַ
	private String tel;				//��ϵ�绰
	
	public TicketItem(){}
	
	public TicketItem(String tname,String tstart,String tend,String tdate){
		this.tname = tname;
		this.tstart = tstart;
		this.tend = tend;
		this.tdate = tdate;
	}
	
	public String getTname(){
		return this.tname;
	}
	
	public void setTname(String tname){
		this.tname = tname;
	}
	
	public String getTstart(){
		return this.tstart;
	}
	
	public void setTstart(String tstart){
		this.tstart = tstart;
	}
	
	public String getTend(){
		return this.tend;
	}
	
	public void setTend(String tend){
		this.tend = tend;
	}
	
	public String getTdate(){
		return this.tdate;
	}
	
	public void setTdate(String tdate){
		this.tdate = tdate;
	}
	
	public int getTamount(){
		return this.tamount;
	}
	
	public void setTamount(int tamount){
		this.tamount = tamount;
	}
	
	public String getLinkman(){
		return this.linkman;
	}
	
	public void setLinkman(String linkman){
		this.linkman = linkman;
	}
	
	public String getTel(){
		return this.tel;
	}
	
	public void setTel(String tel){
		this.tel = tel;
	}
	
	public String getAddress(){
		return this.address;
	}
	
	public void setAddress(String address){
		this.address = address;
	}
	
	
	@Override
	public String toString(){
		return this.tname+"\t"+this.tstart+"\t"+this.tend+"\t"+this.tdate+"\t"+this.tamount+
			this.linkman+"\t"+this.address+"\t"+this.tel;
	}
	
}