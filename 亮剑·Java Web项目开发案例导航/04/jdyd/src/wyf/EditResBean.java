package wyf;

import javax.faces.model.*;

import java.util.*;
import java.sql.*;
import org.springframework.jdbc.support.*;
import org.springframework.jdbc.core.*;

public class EditResBean extends BaseBean{
	private ResItem ri;						//Ҫ�޸ı༭����Դ����
	public void setRi(ResItem ri){
		this.ri = ri;						//ri���Ե�setter����
	}
	
	public String getRname() {				//��Դ���Ƶ�getter����
		return ri.getRname();
	}
	public void setRname(String rname) {	//��Դ���Ƶ�setter����
		ri.setRname(rname);
	}
	public String getGid() {				//��Դ��ŵ�getter����
		return ri.getGid();
	}
	public void setGid(String gid) {		//��Դ��ŵ�setter����
		ri.setGid(gid);
	}
	public String getRspec() {				//��Դ����getter����
		return ri.getRspec();
	}
	public void setRspec(String rspec) {	//��Դ����setter����
		ri.setRspec(rspec);
	}
	public String getRdetail() {			//��Դ������getter����
		return ri.getRdetail();
	}
	public void setRdetail(String rdetail) {//��Դ������setter����
		ri.setRdetail(rdetail);
	}
	public String getRprice() {				//�۸��getter����
		return ri.getRprice();
	}
	public void setRprice(String rprice) {	//�۸��setter����
		ri.setRprice(rprice);
	}
	public String getRstatus() {			//״̬��getter����
		return ri.getRstatus();
	}
	public void setRstatus(String rstatus) {	//�۸��setter����
		ri.setRstatus(rstatus);
	}
	
	public SelectItem[] getTypeList(){		//��Դ��������б��ѡ��
		return dbu.getResType();
	}
	
	public void editRes(){					//�༭��Դ�ķ���
		String sql = "select 1 from res_info where RName='"+ri.getRname()+"' and "+
			"RID!="+ri.getRid();			//�鿴����Դ�Ĺ���������Ƿ��ѱ�ռ��
		if(dbu.isExist(sql)){
			message = "��Դ�����Ѿ����ڣ������±༭";	//��ռ�õ���ʾ��Ϣ
		}
		else{
			sql = "update res_info set RName='"+ri.getRname()+"',GId="+ri.getGid()+
				",RSpec='"+ri.getRspec()+"',RDetail='"+ri.getRdetail()+"',RPrice="+
				ri.getRprice()+",RStatus='"+ri.getRstatus()+"' where RId="+ri.getRid();
			if(dbu.update(sql)){
				message = "�༭����ɹ�";				//�������ݿ�ɹ�
			}
			else{
				message = "δ֪���󣬱���ʧ��";			//����ʧ��
			}
		}
	}
}