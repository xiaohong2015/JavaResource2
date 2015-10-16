package wyf;

import java.util.*;
import javax.faces.model.*;

public class AdminOrderBean extends BaseBean{
	private List_Item li;								//�鿴��������Ķ�����������
	private Vector al;									//��Ŷ����������ݵ�����
	private DataModel dm=new ListDataModel();			//����ListDataModel����
	public void setLi(List_Item li){
		this.li = li;									//���ö�������ֵ
	}
	public String getOrderId(){
		return this.li.getOId();						//�õ�������ŵķ���
	}
	
	public void setStatus(String status){
		li.setOStatus(status);							//����״̬��setter����
	}
	public String getStatus(){
		return li.getOStatus();							//����״̬��getter����
	}
	
	public void setDetail(String detail){
		li.setODetail(detail);							//����������setter����
	}
	public String getDetail(){
		return li.getODetail();							//����������getter����
	}
	
	
	public DataModel getOrderDetail(){					//�õ���������ķ���
		String sql = "select ORId,b.RId,b.rname,GName,b.st,b.end,b.status from group_info gi,"+
			"(select ORId,a.RId,ri.rname,ri.GId,a.st,a.end,a.status from res_info ri,("+
			"select ORId,RId,to_char(Start_Time,'yyyy-mm-dd') st,"+
			"to_char(End_Time,'yyyy-mm-dd') end,OStatus status from order_info "+
			"where OId="+li.getOId()+")a where a.RId=ri.RId)b where gi.GId=b.GId ";
		al = dbu.getOrderDetail(sql);					//ִ�в�ѯ�õ���������
		dm.setWrappedData(al);							//��������
		return dm;										//��������ģ��
	}
	
	public void deal(){									//�������ķ���
		Vector<String> SQL = new Vector<String>();
		String sql = "update order_info set OStatus='"+this.getStatus()+"' where OId="+li.getOId();	
		SQL.add(sql);									//��SQL�����ӵ�����
		sql = "update order_list set OStatus='"+this.getStatus()+"',ODetail='"+this.getDetail()+
			"' where OId="+li.getOId();
		SQL.add(sql);									//��SQL�����ӵ�����
		if(dbu.update(SQL)){
			message = "��������ɹ�";					//��������ɹ���ʾ��Ϣ
		}
		else{
			message = "δ֪���󣬶�������ʧ��";			//����ʧ����ʾ��Ϣ
		}
	}
	
	public int getSize(){								//���ض��������¼�����ķ���
		this.getOrderDetail();							//���ø��¶������鷽��
		return al.size();								//���ؼ�¼����
	}
}