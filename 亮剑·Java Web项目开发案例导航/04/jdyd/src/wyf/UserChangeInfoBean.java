package wyf;


public class UserChangeInfoBean extends BaseBean{    
    private UserLogBean ulb;	//��¼�û���½��Ϣ��Bean����
	private User_Item ui;
	public void setUlb(UserLogBean ulb){
		this.ulb = ulb;			//����ulb����ע���setter����
	}
    public void setGender(String gender){
		ui.setUgender(gender);
	}
	public String getGender(){
		return ui.getUgender();
	}
	public void setEmail(String email){
		ui.setUemail(email);
	}
	public String getEmail(){
		return ui.getUemail();
	}
	public void setPhone(String phone){
		ui.setUphone(phone);
	}
	public String getPhone(){
		return ui.getUphone();
	}
	
	public String initial(){				//��ʼ���û�����				
    	if(ulb.getUname()==null){			
    		return "userLogin";				//�û���½��ʱ����û�е�½
    	}
    	else{
    		String sql = "select usid,uname,ugender,uemail,uphone from user_info "+
    			"where uname='"+ulb.getUname()+"'";					//�õ��û����ϵ�SQL���
    		this.ui = (User_Item)dbu.getUserList(sql,1,1).get(0);	//�����õ��û�����
    	}
    	return "goChangeInfo";										//�����޸�����ҳ����ͼ
    }
    public String changeInfo(){
    	if(ulb.getUname()==null){
    		return "userLogin";					//�û���½��ʱ����û�е�½
    	}
    	else{
    		String sql = "update user_info set ugender='"+ui.getUgender()+"',"+
    			"uemail='"+ui.getUemail()+"',uphone='"+ui.getUphone()+"' where usid="+ulb.getUsid();
    		if(dbu.update(sql)){					//�����û��޸ĺ������
    			message = "�����Ѿ�����";			//���ϱ���ɹ���Ϣ
    		}
    		else{
    			message = "δ֪�����޸�ʧ��";		//����ʧ����Ϣ
    		}
    	}
    	return "success";							//����success
    }
}