package wyf;

import java.util.*;
import javax.faces.model.*;

public class AddResBean extends BaseBean{
	private String rname;		//��Դ����
	private String gid;			//��Դ��������ID
	private String rspec;		//��Դ���
	private String rdetail;		//��Դ����
	private String rprice;		//�۸�
	private String rstatus;		//��Դ״̬
	
	public String getRname() {
		return rname;						//rname��getter����
	}
	public void setRname(String rname) {
		this.rname = rname;					//rname��setter����
	}
	public String getGid() {
		return gid;							//gid��getter����
	}
	public void setGid(String gid) {
		this.gid = gid;						//gid��setter����
	}
	public String getRspec() {
		return rspec;						//rspec��getter����
	}
	public void setRspec(String rspec) {
		this.rspec = rspec;					//rspec��setter����
	}
	public String getRdetail() {
		return rdetail;						//rdetail��getter����
	}
	public void setRdetail(String rdetail) {
		this.rdetail = rdetail;					//rdetail��setter����
	}
	public String getRprice() {
		return rprice;							//rprice��getter����
	}
	public void setRprice(String rprice) {
		this.rprice = rprice;					//rprice��setter����
	}
	public String getRstatus() {
		return rstatus;							//rstatus��getter����
	}
	public void setRstatus(String rstatus) {
		this.rstatus = rstatus;					//rstatus��setter����
	}
	
	
	public SelectItem[] getTypeList(){		
		return dbu.getResType();				//��Դ��������б��ѡ��
	}
	
	public void addRes(){
		String sql = "select 1 from res_info where RName='"+this.rname+"'";
		if(dbu.isExist(sql)){					//�ж���ӵ���Դ���Ƿ��Ѿ�����
			message = "����Դ�����Ѿ����ڣ����ʧ��";
		}
		else{									//�����������
			sql = "insert into res_info(GId,RName,RSpec,RDetail,RPrice) values("+this.gid+
				",'"+this.rname+"','"+this.rspec+"','"+this.rdetail+"',"+this.rprice+")";
			if(dbu.update(sql)){				//�������ݿ�
				message = "��ӳɹ�";			//��ӳɹ���ʾ��Ϣ
			}
			else{
				message = "δ֪�������ʧ��";	//���ʧ����ʾ��Ϣ
			}    
		}
	}
	
}
