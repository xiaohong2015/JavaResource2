package wyf;

import java.util.*;
import javax.faces.model.*;

public class ResListBean extends FenYeBean{
	
	private int type;					//��Դ���Ĭ����ʾ�ͷ�	
	private boolean isOrder;			//��Դ�Ƿ�ɱ�Ԥ���ı�־λ
	private String rname;				//�鿴��Դ״̬����Դ��
	public String getTypeName(){
		sql = "select GName from group_info where GId="+this.getType();
		return dbu.getStringInfo(sql);
	}
	
	public void setType(int type){	//��ʾ�������
		this.type = type;
		this.setCurPage(1);			//���õ�ǰ��ʾ��һҳ
	}
	public int getType(){
		return this.type;			
	}
	public boolean getIsOrder(){		
		return this.isOrder;
	}
	public String getRname(){
		return this.rname;
	}
	
	public String toOrderPage(){
		sql = "select min(GId) from group_info";	//Ĭ����ʾ��һ���������Դ
		this.setType(Integer.parseInt(dbu.getStringInfo(sql)));		
		return "resList";							//������Դ�б�ҳ����ʾ
	}
	@Override
	public String getSql() {						//����������Ԥ����Դ��SQL���
		sql = "select RId,GId,RName,RSpec,RDetail,RPrice,RStatus from res_info where "+
			"RStatus='����' and RId not in(select RId from order_info where "+
			"OStatus='Ԥ����') and GId="+getType();
		return (this.sql);							//���ش���SQL���
	}
	
	public DataModel getResList() {					//��ʾ��¼����
		al = dbu.getResList(this.getSql(),this.getCurPage(),this.getSpan());
       	dm.setWrappedData(al);						//��������ģ��
       	return dm;									//��������ģ��
	}
	
	public DataModel getOrderList(){
		return this.dm;
	}
	
	public SelectItem[] getTypeList(){				//��Դ��������б��ѡ��
		return dbu.getResType();
	}
	
	public SelectItem[] getRidList(){				 //��Դ���������б��ѡ��
		SelectItem[] list=new SelectItem[al.size()]; //����SelectItem��������	
		for(int i=0;i<al.size();i++){
			ResItem ri = (ResItem)al.get(i);		//�õ�ResItem����
			int rid = Integer.valueOf(ri.getRid());	//��ResItem�����rid����ת����int��
			String rname = ri.getRname();			//�õ�ResItem��rname����ֵ
			list[i]=new SelectItem(rid,rname);		//����SelectItem����
		}
		return list;								//����SelectItem����
	}
	
	public String resStatus(){						//�鿴��Դ״̬
		ResItem ri = (ResItem)dm.getRowData();		//�õ�Ҫ�鿴��Դ״̬����Դ����
		this.rname = ri.getRname();					//����rname����ֵ
		sql = "select * from order_info where OStatus='Ԥ����' and RId="+ri.getRid();
		if(dbu.isExist(sql)){						//�������Դ��Ԥ���еĶ���
			this.isOrder = false;					//�����Դ�������¶���
		}
		else{
			this.isOrder = true;					//����Դ��Ԥ��
			sql = "select to_char(start_time,'yyyy-mm-dd') as st,"+
				"to_char(end_time,'yyyy-mm-dd') as end,OStatus as "+
				"status from order_info where end_time-start_time>=0"+
				" and RId="+ri.getRid();			//��������Դ�ѱ�Ԥ�������ڶ�			
			al = dbu.getResOrderList(sql);			//ִ�в�ѯ
			dm.setWrappedData(al);					//��������
		}
		return "success";
	}
}