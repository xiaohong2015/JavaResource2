package wyf.cgq;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.opensymphony.xwork2.validator.annotations.*;
public class AddExtraWorkAction  extends ActionSupport
{
	private String impId;
	private Date workTime;
	private String executes;
	private String result;
	private boolean read=true;
	@RequiredStringValidator(message="${getText(\"validate.impIdEM\")}",shortCircuit=true)
    @RegexFieldValidator(message="${getText(\"validate.impIdE\")}",
                        expression="[\\d]{6,10}",shortCircuit=true)
	public void setImpId(String impId)
	{
		this.impId=impId;
	}
	public String getImpId()
	{
		return this.impId;
	}
	@RequiredFieldValidator(message="${getText(\"validate.workTimeEM\")}",shortCircuit=true)
	public void setWorkTime(Date workTime)
	{
		this.workTime=workTime;
	}
	public Date getWorkTime()
	{
		return this.workTime;
	}
	@RequiredStringValidator(message="${getText(\"validate.workExecutesEM\")}",shortCircuit=true)
	public void setExecutes(String executes)
	{
		this.executes=executes;
	}
	
	public String getExecutes()
	{
		return this.executes;
	}
	public String getResult()
	{
		return this.result;
	}
	public boolean getRead()
	{
		return this.read;
	}
	public String execute()
	{
		this.read=false;
		boolean has=ManageDB.hasImpinwork(impId);
		String time=workTime.getYear()+1900+"-"+(workTime.getMonth()+1)+"-"+workTime.getDate();
		if(has==false)
		{
			this.result="����ְ������Ƿ���ȷ����";
		}
		else if(ManageDB.hasWorkRecord(impId,time))
		{
			this.result="�üӰ��¼�Ѿ�����";
		}
		else if(ManageDB.addWorkRecord(impId,time,executes))
		{
			this.result="��ӳɹ�";
		}
		else
		{
			this.result="���ʧ��";
		}
		return "success";
	}
}