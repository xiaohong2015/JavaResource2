package wyf;

import java.util.*;
import javax.faces.model.*;

public class OrderListBean extends FenYeBean{
	private AdminOrderBean aob;					//���������̨Bean����
	private String oid = "";					//��װ����������ID
	public void setOid(String oid){
		this.oid = oid;							//����ID��setter����
	}
	public String getOid(){
		return this.oid;						//����ID��getter����
	}
	
	public void setAob(AdminOrderBean aob){
		this.aob = aob;							//aob��setter����
	}	
	
	@Override
	public String getSql() {					//��������������¼��SQL���
		sql = "select uname,OId,to_char(OTime,'yyyy-mm-dd') otime,OStatus,ODetail"+
			" from order_list,user_info where user_info.usid=order_list.usid and OId "+
			"like '%"+this.oid+"%'";			//����������¼��SQL���
		return (this.sql);
	}
	
	public DataModel getOrderList() {					//��ʾ��¼����
		al = dbu.getOrderList(this.getSql(),this.getCurPage(),this.getSpan());
       	dm.setWrappedData(al);							//��������ģ�� 
       	return dm;										//������ʾ����
	}

	public String detail(){								//��������
		this.aob.setLi((List_Item)dm.getRowData());		//���ö����������õ�AdminOrderBean������
		return "success";								//����success
	}
}