package wyf;

import java.util.*;
import javax.faces.model.*;

public class ResManageBean extends FenYeBean{
	
	private int type;
	private String rname;		//�鿴��Դ״̬����Դ��
	private EditResBean erb;	//Ҫ�޸ĵ���Դ����
	private boolean flag;		//�Ƿ�������־
	 
	public void setErb(EditResBean erb){
		this.erb = erb;			//����ע�뷽��
	}
	public void setType(int type){
		this.flag = false;		//������ʾ�������
		this.type = type;		//������ʾ����
		this.setCurPage(1);		//���õ�ǰ��ʾ��һҳ
		this.getResList();		//��������ģ��
	}
	public int getType(){
		return this.type;		//type��getter����
	}
	public String getRname(){	//rname��getter����
		return this.rname;
	}
	public void setRname(String rname){
		this.rname = rname;			//rname��setter����
	}
	public String toResPage(){			//����Դ�б�ҳ��ķ���
		sql = "select min(GId) from group_info";
		this.setType(Integer.parseInt(dbu.getStringInfo(sql)));
		return "resManage";
	}
	
	@Override
	public String getSql() {			//����������ʾ��¼��SQL���
		sql = "select RId,GId,RName,RSpec,RDetail,RPrice,RStatus from res_info where "+
			"GId="+getType();			//��ͨ��ʾ
		if(this.flag){									//������Դ
			sql = "select RId,GId,RName,RSpec,RDetail,RPrice,RStatus from res_info where "+
			"RName like '%"+this.rname+"%'";	//������SQL���
		}
		return (this.sql);				//����SQL���
	}
	
	public DataModel getResList() {					//��ʾ��¼����
		al = dbu.getResList(this.getSql(),this.getCurPage(),this.getSpan());
       	dm.setWrappedData(al);
       	return dm;
	}
	
	public DataModel getOrderList(){
		return this.dm;
	}
	
	public SelectItem[] getTypeList(){				//��Դ��������б��ѡ��
		return dbu.getResType();
	}
	
	public String resStatus(){						//�鿴��Դ״̬
		ResItem ri = (ResItem)dm.getRowData();		//�õ�Ҫ�鿴��Դ״̬����Դ����
		this.rname = ri.getRname();					//����rname����ֵ
		sql = "select to_char(start_time,'yyyy-mm-dd') as st,"+
			"to_char(end_time,'yyyy-mm-dd') as end,OStatus as "+
			"status from order_info where end_time-start_time>=0"+
			" and RId="+ri.getRid();			//��������Դ�ѱ�Ԥ�������ڶ�
		al = dbu.getResOrderList(sql);			//ִ�в�ѯ
		dm.setWrappedData(al);					//��������
		return "resStatus";
	}
	
	public void delete(){
		ResItem ri = (ResItem)dm.getRowData();		//�õ�Ҫ�鿴��Դ״̬����Դ����
		sql = "delete from res_info where RId="+ri.getRid();
		dbu.update(sql);
	}
	
	public String edit(){
		ResItem ri = (ResItem)dm.getRowData();		//�õ�Ҫ�鿴��Դ״̬����Դ����
		erb.setRi(ri);								//����erb����Դ��������ֵ
		return "success";
	}
	
	public void search(){				//�����ķ���
		this.flag = true;				//��������־λΪtrue
		this.getResList();				//������ʾģ��
	}
}