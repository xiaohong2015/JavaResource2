package wyf;

public class AddAdminBean extends BaseBean{
	private String aname;
	private String pwd;
	private String rePwd;
	public String getAname() {				//aname���Ե�getter����
		return aname;
	}
	public void setAname(String aname) {	//aname���Ե�setter����
		this.aname = aname;
	}
	public String getPwd() {				//pwd���Ե�setter����
		return pwd;
	}
	public void setPwd(String pwd) {		//pwd���Ե�getter����
		this.pwd = pwd;
	}
	public String getRePwd() {				//rePwd���Ե�getter����
		return rePwd;
	}
	public void setRePwd(String rePwd) {	//rePwd��setter����
		this.rePwd = rePwd;
	}
	
	public void addAdmin(){
		if(pwd.equals(rePwd)){					//����������������һ��
			String sql = "select 1 from admin_info where AName='"+this.aname+"'";
			if(dbu.isExist(sql)){				//�ù���Ա���Ѿ�����
				message = "�ù���Ա���Ѿ����ڣ����ʧ��";
			}
			else{								
				sql = "insert into admin_info(AName,APwd) values('"+this.aname+
					"','"+this.pwd+"')";					//�����¹���Ա��SQL���			
				if(dbu.update(sql)){						//��ӳɹ�
					message = "����Ա��ӳɹ�";				//��ӳɹ�����ʾ��Ϣ
				}
				else{
					message = "δ֪�������ʧ��";			//���ʧ�ܵ���ʾ��Ϣ
				}	
			}
		}
		else{
			message = "�����������벻һ�£���ӹ���Աʧ��";	//�����������벻һ�µ���ʾ��Ϣ
		}
	}
}
