package wyf;

import java.util.*;
import javax.faces.model.*;

public class UserListBean extends FenYeBean{
	
	private String uname = "";				//���������û����û���
	
	public void setUname(String uname){		//uname��setter����
		this.uname = uname;
	}
	public String getUname(){				//uname��getter����
		return this.uname;
	}
	
	@Override
	public String getSql() {				//�����û���SQL���
		sql = "select usid,uname,ugender,uemail,uphone from user_info where "+
			"uname like '%"+this.uname+"%'";
		return (this.sql);					//�����SQL���
	}
	
	public DataModel getUserList() {		//��ʾ��¼����
		al = dbu.getUserList(this.getSql(),this.getCurPage(),this.getSpan());
       	dm.setWrappedData(al);				//������ʾ����ģ��
       	return dm;							//������ʵ����
	}
	
	public void delete(){							//ɾ���û��Ĳ���
		User_Item ui = (User_Item)dm.getRowData();	//�õ�Ҫɾ���û�����
		sql = "delete from user_info where usid="+ui.getUsid();
		dbu.update(sql);							//�������ݿ�
	}
	
}