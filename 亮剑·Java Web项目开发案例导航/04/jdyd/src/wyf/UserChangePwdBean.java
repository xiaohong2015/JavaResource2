package wyf;

public class UserChangePwdBean extends BaseBean{
	private String oldPwd;		//��¼�û������������
	private String newPwd;		//��¼�û������������
	private String reNewPwd;	//��¼�û������ȷ��������
	private UserLogBean ulb;	//��¼�û���½��Ϣ��Bean����
	
	public void setUlb(UserLogBean ulb){
		this.ulb = ulb;			//����ulb����ע���setter����
	}

	public void setOldPwd(String oldPwd){
		this.oldPwd = oldPwd;
	}
	public String getOldPwd(){
		return this.oldPwd;
	}
	
	public void setNewPwd(String newPwd){
		this.newPwd = newPwd;
	}
	public String getNewPwd(){
		return this.newPwd;
	}
	
	public void setReNewPwd(String reNewPwd){
		this.reNewPwd = reNewPwd;
	}
	public String getReNewPwd(){
		return this.reNewPwd;
	}
	
	public String changePwd(){
		if(!newPwd.equals(reNewPwd)){
			return "fail";						//��������������벻һ��ʱ
		}
		if(ulb.getUname()==null){
			return "userLogin";					//�û���½��ʱ����û�е�½
		}
		String sql = "select 1 from user_info where uname='"+ulb.getUname()+
			"' and upwd='"+oldPwd+"'";			// �鿴����������Ƿ�ƥ���SQL���
		if(dbu.isExist(sql)){					//��������������ȷ
			sql = "update user_info set upwd='"+newPwd+"' where uname='"+ulb.getUname()+"'";//�����û������SQL���
			if(dbu.update(sql)){
				message = "�����޸ĳɹ�����һ�������������½";	//�޸ĳɹ���ʾ��Ϣ
			}
			else{
				message = "δ֪�����޸�ʧ��";					//�޸�ʧ����ʾ��Ϣ
			}
		}
		else{
			message = "��������������޸�ʧ��";				//�������޸���������
		}
		return "success";
	}
}