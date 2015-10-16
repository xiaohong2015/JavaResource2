package wyf;
import java.util.*;
import javax.faces.context.*;
import org.springframework.jdbc.core.*;
public class RegBean extends BaseBean{
	private String uname;				//���ڷ�װ�û������ע���û���
	private String pwd;					//���ڷ�װ�û������ע������
	private String rePwd;				//���ڷ�װ�û������ȷ������
	private String gender;				//���ڷ�װ�û�������Ա�
	private String email;				//���ڷ�װ�û�����ĵ����ʼ���ַ
	private String phone;				//���ڷ�װ�û�����ĵ绰������Ϣ
	private String valCode;				//���ڴ洢�û��������֤��
	
	public void setUname(String uname){
		this.uname = uname;
	}
	public String getUname(){
		return this.uname;
	}	
	public void setPwd(String pwd){
		this.pwd = pwd;
	}
	public String getPwd(){
		return this.pwd;
	}	
	public void setRePwd(String rePwd){
		this.rePwd = rePwd;
	}
	public String getRePwd(){
		return this.rePwd;
	}
	public void setGender(String gender){
		this.gender = gender;
	}
	public String getGender(){
		return this.gender;
	}
	public void setEmail(String email){
		this.email = email;
	}
	public String getEmail(){
		return this.email;
	}
	public void setPhone(String phone){
		this.phone = phone;
	}
	public String getPhone(){
		return this.phone;
	}
	public void setValCode(String valCode){
		this.valCode = valCode.toUpperCase();
	}
	public String getValCode(){
		return this.valCode;
	}

	public String userReg(){
		FacesContext fc = FacesContext.getCurrentInstance();	//�õ�FacesContextʵ��
		ExternalContext ec = fc.getExternalContext();			//�õ�ExternalContextʵ��
		Map session = ec.getSessionMap();						//�õ�����HttpSession��Map ʵ��
		String code = (String)session.get("randNum");			//�õ�session�����֤��
		code = code.toUpperCase();								//����֤��ת�ɴ�д
		if(!code.equals(valCode)){								//�������ĺ�ϵͳ��������֤�벻һ��
			message = "��֤���������ע��ʧ��";				//��֤��������ʾ��Ϣ
			return "fail";										//����fail  
		}
		if(!rePwd.equals(pwd)){
			message = "�����������벻һ�£�ע��ʧ��";			  //�������벻һ�µ���ʾ��Ϣ
			return "fail";										//����fail  
		}
		String sql = "select uname from user_info where uname='"+uname+"'";		
		if(dbu.isExist(sql)){
			message = "�ܱ�Ǹ�����û����Ѿ�����ע��";			  //�û����Ѿ���ռ��
			return "fail";										//����fail  
		}
		sql = "insert into user_info(uname,upwd,ugender,uemail,uphone) values "+
			"('"+uname+"','"+pwd+"','"+gender+"','"+email+"','"+phone+"')";
		if(dbu.update(sql)){
			message = "��ϲ�����û���<"+uname+">ע��ɹ�";		//ע��ɹ���Ϣ
		}
		else{
			message = "δ֪����ע��ʧ��";						//ע��ʧ����Ϣ
		}
		return "success";
	}
}