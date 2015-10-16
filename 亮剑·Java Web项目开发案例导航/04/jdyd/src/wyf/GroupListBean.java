package wyf;

import java.util.*;
import javax.faces.model.*;

public class GroupListBean extends BaseBean{
	
	private DataModel dm=new ListDataModel();
    private Vector al = new Vector();			//��ʾ��¼�ļ���
    private String sql;							//����SQL�������
    private String gname;						//��ӵķ�������
    public String getGname(){					//gname��getter����		
    	return this.gname;	
    }	
    public void setGname(String gname){			//gname��getter����
    	this.gname = gname;
    }
	public DataModel getGroupList() {			//��ʾ��¼����
       	return dm;
	}
	
	public String initialGroup(){
		sql = "select GId,GName from group_info";		//���������SQL���
		al = dbu.getGroupList(sql);						//ִ�������õ�����
       	dm.setWrappedData(al);							//��������ģ��
       	return "groupManage";							//���ط������ҳ����ͼ
	}
	
	public void addGroup(){								
		sql = "select 1 from group_info where GName='"+gname+"'";
		if(dbu.isExist(sql)){							//�÷������Ѿ�����
			message = "�÷������Ѿ����ڣ����ʧ��";		//���ʧ����Ϣ
		}
		else{											//�����������
			sql = "insert into group_info(GName) values('"+gname+"')";
			if(dbu.update(sql)){						//ִ�и���
				message = "����<"+gname+">��ӳɹ�";	//��ӳɹ�
			}
			else{
				message = "δ֪�������ʧ��";			//���ʧ����ʾ��Ϣ
			}
		}
		this.initialGroup();				//���·�����ʾ������ģ��
	}
	
	public void delete(){							//ɾ������ķ���
		GroupItem gi = (GroupItem)dm.getRowData();	//�õ�Ҫɾ��������ж���		
		Vector<String> SQL = new Vector<String>();	
		sql = "delete from res_info where GId="+gi.getGid();
		SQL.add(sql);
		sql = "delete from group_info where GId="+gi.getGid();
		SQL.add(sql);
		if(dbu.update(SQL)){						//���ݿ���³ɹ�
			al.remove(gi);							//����ҳ������
			message = "����<"+gi.getGname()+">ɾ���ɹ�";
		}
		else{
			message = "�÷��鲻��ɾ��";				//����ɾ����ʾ��Ϣ
		}
	}
	public int getSize(){							//���ط����¼����
		return al.size();
	}
}			