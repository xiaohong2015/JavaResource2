package wyf.cgq;
import com.opensymphony.xwork2.*;
public class ChangePwdAction
{
	private String oldpwd;
	private String newpwd;
	private String renewpwd;
	private String result="";
	public String getResult()
	{
		return this.result;
	}
	public void setOldpwd(String oldpwd)
	{
		this.oldpwd=oldpwd;
	}
	public void setNewpwd(String newpwd)
	{
		this.newpwd=newpwd;
	}
	public void setRenewpwd(String renewpwd)
	{
		this.renewpwd=renewpwd;
	}
	public String execute()
	{
		String impId=(String)(ActionContext.getContext().getSession().get("user"));
		if(!newpwd.equals(renewpwd))
		{
			this.result="��������������벻��ͬ";
			return "success";
		}
		else
		{
			int i=ManageDB.changePwd(impId,oldpwd,newpwd);
			if(i==0)
			{
				this.result="����������ľ������Ƿ���ȷ";
			}
			else
			{
				this.result="�޸ĳɹ�";
			}
		}
		return "success";
	}
}