package wyf;

public class AdminChangePwdBean extends BaseBean{
	private String oldPwd;
	private String newPwd;
	private String reNewPwd;
	private AdminLogBean alb;
	
	public void setAlb(AdminLogBean alb) {	//����ע�뷽��
		this.alb = alb;
	}
	public String getOldPwd() {
		return oldPwd;
	}
	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}
	public String getNewPwd() {
		return newPwd;
	}
	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}
	public String getReNewPwd() {
		return reNewPwd;
	}
	public void setReNewPwd(String reNewPwd) {
		this.reNewPwd = reNewPwd;
	}
	
	public void changePwd(){
		String sql = "select 1 from admin_info where AId="+alb.getAid()+
			" and APwd='"+this.oldPwd+"'";		//��֤����Ա�����������ȷ�Ե�SQL���
		if(dbu.isExist(sql)){					//�����޸�����
			if(newPwd.equals(reNewPwd)){
				sql = "update admin_info set APwd='"+this.newPwd+"' where "+
					"AId="+alb.getAid();
				if(dbu.update(sql)){
					message = "�����޸ĳɹ����´������������½";
				}
				else{
					message = "δ֪���������޸�ʧ��";
				}
			}
			else{
				message = "�����������벻��ͬ���޸�ʧ��";
			}
		}
		else{
			message = "��������������޸�ʧ��";
		}
	}
}
