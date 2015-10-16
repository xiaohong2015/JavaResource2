package wyf;
import java.util.*;
import javax.faces.event.*;
import javax.faces.model.*;
public class MyOrderBean extends FenYeBean{
	private UserLogBean ulb;		//�û���¼Bean����
	private List_Item li;			//Ҫ�鿴��������Ķ�������
	public void setUlb(UserLogBean ulb){
		this.ulb = ulb;				//ulb��setter����
	}
	public String getOrderId(){
		return this.li.getOId();	//���ز鿴����Ķ���ID
	}
	@Override
	public String getSql(){
		sql = "select uname,OId,to_char(OTime,'yyyy-mm-dd') otime,OStatus,ODetail"+
			" from order_list,user_info where order_list.usid="+ulb.getUsid()+
			" and user_info.usid=order_list.usid";		//������½�û�������SQL���
		return (this.sql);								//���ظ�SQL���
	}
	
	public DataModel getMyOrderList() {					//�����ҵĶ�����ʾ����
		al = dbu.getOrderList(this.getSql(),this.getCurPage(),this.getSpan());
       	dm.setWrappedData(al);							//��������ģ��
       	return dm;										//��������ģ��
	}
	
	public DataModel getOrderDetail(){					//���ض����������ʾ����
		sql = "select ORId,b.RId,b.rname,GName,b.st,b.end,b.status from group_info gi,"+
			"(select ORId,a.RId,ri.rname,ri.GId,a.st,a.end,a.status from res_info ri,("+
			"select ORId,RId,to_char(Start_Time,'yyyy-mm-dd') st,"+
			"to_char(End_Time,'yyyy-mm-dd') end,OStatus status from order_info "+
			"where OId="+li.getOId()+")a where a.RId=ri.RId)b where gi.GId=b.GId ";
		al = dbu.getOrderDetail(sql);					//ִ�в�ѯ�õ�������������
		dm.setWrappedData(al);							//��������ģ��
		return dm;										//������ʾ����
	}
	public String detail(){					//�û�����鿴��������
		li = ((List_Item)dm.getRowData());	//�õ��鿴����Ķ�������
		this.getOrderDetail();				//����getOrderDetail����
		return "success";					//����success
	}
	
	public void cancle(){							//ȡ�������ķ���
		li = (List_Item)dm.getRowData();			//�õ�ȡ���Ķ�������
		Vector<String> SQL = new Vector<String>();	//����SQL����
		sql = "delete from order_info where OId="+li.getOId();
		SQL.add(sql);								//��sql�����ӽ�����
		sql = "delete from order_list where OId="+li.getOId();
		SQL.add(sql);								//��sql�����ӽ�����
		dbu.update(SQL);							//ִ�и���
	}
	
	public void delete(){
		Info_Item ii = (Info_Item)dm.getRowData();	//�õ�ȡ���Ķ�������
		sql = "delete from order_info where ORId="+ii.getOrid();
		dbu.update(sql);							//ִ�и���
		sql = "select * from order_info where OId="+li.getOId();//�鿴�ö����Ƿ��м�¼
		if(!dbu.isExist(sql)){
			al.removeAllElements();
			sql = "delete from order_list where OId="+li.getOId();
			dbu.update(sql);						//ɾ���������иö����ļ�¼			
		}
	}
}