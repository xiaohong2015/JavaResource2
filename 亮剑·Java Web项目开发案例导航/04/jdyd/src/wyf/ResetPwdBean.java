package wyf;

public class ResetPwdBean extends BaseBean {
	private String aname;						//Ҫ��������Ĺ���Ա��
	private String newPwd;						//���ú������
	private String reNewPwd;					//ȷ����������
	public String getAname() {					//aname��getter����
		return aname;
	}
	public void setAname(String aname) {		//aname��setter����
		this.aname = aname;
	}
	public String getNewPwd() {					//newPwd��getter����
		return newPwd;
	}
	public void setNewPwd(String newPwd) {		//newPwd��setter����
		this.newPwd = newPwd;
	}
	public String getReNewPwd() {				//reNewPwd��getter����
		return reNewPwd;
	}
	public void setReNewPwd(String reNewPwd) {	//reNewPwd��setter����
		this.reNewPwd = reNewPwd;
	}
	
	public void reset(){
		if(newPwd.equals(reNewPwd)){					//���ж��������������Ƿ���ͬ
			String sql = "select 1 from admin_info where AName='"+aname+"'";
			if(dbu.isExist(sql)){						//����ù���Ա������
				sql = "update admin_info set APwd='"+newPwd+"' where AName='"+aname+"'";
				if(dbu.update(sql)){					//ִ�и���
					message = "�������óɹ�";			//���óɹ���ʾ��Ϣ
				}
				else{
					message  = "δ֪��������ʧ��";	//ʧ����ʾ��Ϣ
				}
			}
			else{
				message = "�ù���Ա��������";			//����Ա�����������ʾ��Ϣ
			}
		}
		else{
			message = "�����������벻һ�£�����ʧ��";	//�������벻һ��ʱ����ʾ
		}
	}
}
