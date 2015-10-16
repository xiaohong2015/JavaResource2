package wyf;
import java.util.*;
import javax.faces.context.*;
import org.springframework.jdbc.core.*;

public class UserLogBean extends BaseBean{
	private String uname;					//���ڷ�װ��¼�û���	
	private String pwd;						//���ڷ�װ��¼������
	private String valCode;					//���ڷ�װ��֤��
	private String usid;					//���ڷ�װ�û�ID
	private boolean target = false;			//��½��Ҫ��ת��ҳ���־λ
	public void setTarget(boolean target){
		this.target = target;
	}
	public boolean getTarget(){
		return this.target;
	}
	public void setUsid(String usid){
		this.usid = usid;
	}
	public String getUsid(){
		return this.usid;
	}
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
	
	public void setValCode(String valCode){
		this.valCode = valCode.toUpperCase();					//���õ�����֤��תΪ��д
	}
	public String getValCode(){
		return this.valCode;
	}
	
	public String loginUser(){
		FacesContext fc = FacesContext.getCurrentInstance();	//�õ�FacesContextʵ��
		ExternalContext ec = fc.getExternalContext();			//�õ�ExternalContextʵ��
		Map session = ec.getSessionMap();						//�õ�����HttpSession��Map ʵ��
		String code = (String)session.get("randNum");			//�õ�session�����֤��
		code = code.toUpperCase();								//����֤��ת�ɴ�д
		if(!code.equals(valCode)){								//�������ĺ�ϵͳ��������֤�벻һ��
			message = "��֤��������󣬵�½ʧ��";				//��֤��������ʾ��Ϣ
			return "fail";										//����fail  
		}
		String sql = "select usid from user_info where uname='"+uname+
			"' and upwd='"+pwd+"'";								//��֤�û����������Ƿ���ȷ��SQL���	
		String result = "fail";
		this.setUsid(dbu.getStringInfo(sql));					//��ѯ�õ��û�ID��ֵ��usid
		if(usid==null){
			message = "�ܱ�Ǹ���û��������벻ƥ�䣬��½ʧ��";	  //�û��������벻ƥ��
		}
		else{
			message = uname+"����ӭ���ĵ�����";				//��¼�ɹ�����ʾ��Ϣ
			if(this.target==false){
				result = "success";							//��¼�󷵻���ҳ��ͼ
			}
			else{
				result = "toOrder";							//���ص���ǰ������ͼ
			}
		}
		return result;										//���ؽ��
	}
	public String userLogout(){
		this.setUsid(null);			//����usidΪnullֵ
		this.setUname(null);		//����unameΪnullֵ
		this.setMessage(null);		//����messageΪnullֵ
		this.setTarget(false);		//����targetΪfalse
		return "userLogin";			//����userLogin��ͼ
	}
}