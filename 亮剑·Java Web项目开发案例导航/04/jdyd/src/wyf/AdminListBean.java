package wyf;

import java.util.*;
import javax.faces.model.*;

public class AdminListBean extends FenYeBean{
	
	@Override
	public String getSql() {					//�õ����ڷ�ҳ��SQL���
		sql = "select AId,AName,ALevel from admin_info";
		return (this.sql);						//����SQL���
	}
	
	public DataModel getAdminList() {			//��ʾ��¼����
		al = dbu.getAdminList(this.getSql(),this.getCurPage(),this.getSpan());
       	dm.setWrappedData(al);					//ִ�в�ѯ���������� 
       	return dm;								//������ʾ����
	}
	
	public void delete(){										//ɾ������Ա�Ķ���
		Admin_Item ai = (Admin_Item)dm.getRowData();			//�õ�Ҫɾ������Ա����
		sql = "delete form admin_info where AId="+ai.getAid();	//���SQL���
		dbu.update(sql);										//ִ�и���
	}
}