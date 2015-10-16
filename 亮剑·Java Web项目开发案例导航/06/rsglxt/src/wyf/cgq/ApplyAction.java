package wyf.cgq;
import java.util.*;
import com.opensymphony.xwork2.*;
import com.opensymphony.xwork2.validator.annotations.*;
public class ApplyAction extends ActionSupport
{
	private String impId;
	private String startTime;
	private String endTime;
	private String execute;
	private String result="";
	@RequiredStringValidator(message="${getText(\"validate.startTimeEM\")}",shortCircuit=true)
	public void setStartTime(String startTime)
	{
		this.startTime=startTime;	
	}
	@RequiredStringValidator(message="${getText(\"validate.endTimeEM\")}",shortCircuit=true)
	public void setEndTime(String endTime)
	{
		this.endTime=endTime;
	}
	public String getStartTime()
	{
		return this.startTime;
	}
	public String getEndTime()
	{
		return this.endTime;
	}
	@RequiredStringValidator(message="${getText(\"validate.workExecutesEM\")}",shortCircuit=true)
	public void setExecute(String execute)
	{
		this.execute=execute;
	}
	public String getExecute()
	{
		return this.execute;
	}
	public String getResult()
	{
		String s=this.result;
		this.result="";
		return s;
	}
	public String execute()
	{
		Date now=new Date();
		String[] starts=this.startTime.split("-");
		Date start=new Date(Integer.parseInt(starts[0])-1900,Integer.parseInt(starts[1])-1,Integer.parseInt(starts[2]));
		String[] ends=this.endTime.split("-");
		Date end=new Date(Integer.parseInt(ends[0])-1900,Integer.parseInt(ends[1])-1,Integer.parseInt(ends[2]));
		if(start.after(end))
		{
			this.result="���뷢��ʧ�ܣ���ʼʱ��������ֹʱ��";
			System.out.println(result);
			return "success";
		}
		System.out.println(start.before(now)+"=="+start.after(now)+"==="+now+"=="+start);
		if(start.before(now))
		{
			this.result="��ʼʱ��Ӧ���ڽ����Ժ�";
			System.out.println(result);
			return "success";
		}
		this.impId=(String)(ActionContext.getContext().getSession().get("user"));
		int i=ManageDB.newApply(this.startTime,this.endTime,this.execute,this.impId);
		if(i==1)
		{
			this.result="�����ѷ���";
		}
		else
		{
			this.result="���뷢��ʧ��";
		}
		
		
		return "success";
	}
}