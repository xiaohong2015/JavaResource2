package wyf;

public class BaseBean{
	protected DBUtil dbu;					//����DBUtil��������
	protected String message;				//���û�����ʾ��Ϣ
	
	public void setDbu(DBUtil dbu){			//dbu���Ե�setter����
		this.dbu = dbu;						//����dbu���Ե�ֵ
	}
	
	public void setMessage(String message){	//message���Ե�setter����
		this.message = message;				//����message����ֵ
	}	
	public String getMessage(){				//message���Ե�getter����
		return this.message;				//����message����ֵ
	}
}