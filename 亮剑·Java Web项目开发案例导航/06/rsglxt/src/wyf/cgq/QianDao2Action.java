package wyf.cgq;
import java.util.*;
import com.opensymphony.xwork2.*;
public class QianDao2Action extends QianDaoAction
{
	public String impId;
	private String result="";
	private boolean read=true;
	public void setImpId(String impId)
	{
		this.impId=impId;
	}
	public boolean getRead()
	{
		return this.read;
	}
	public String getResult()
	{
		this.read=true;
		return this.result;
		
	}
	public String execute()
	{
		Date opDate=(Date)(ActionContext.getContext().getSession().get("opdate"));
		String date=opDate.getYear()+1900+"-"+(opDate.getMonth()+1)+"-"+opDate.getDate();
		int i=ManageDB.qianDao(impId,date);
		if(i==0)
		{
			this.result="����ְ�����Ƿ���ȷ";
			this.read=false;
		}
		else if(i==1)
		{
			this.result="��ְ���������״̬";
			this.read=false;
		}
		return "success";
	}
}