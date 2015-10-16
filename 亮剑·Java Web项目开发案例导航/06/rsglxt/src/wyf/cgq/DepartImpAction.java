package wyf.cgq;
import com.opensymphony.xwork2.*;
import java.util.*;
public class DepartImpAction
{
	private String departId;
	private int pageSpan=2;
	private int currenPage;
	private int totalPage;
	private int totalMessage;
	public void setPageSpan(int pageSpan)
	{
		this.pageSpan=pageSpan;
		ActionContext.getContext().getSession().put("pageSpan",pageSpan);
		this.setCurrenPage(1);
	}
	public int getPageSpan()
	{
		Object obj=ActionContext.getContext().getSession().get("pageSpan");
		if(obj!=null)
		{
			this.pageSpan=(Integer)obj;
		}
		return this.pageSpan;
	}
	public Map getSpanList()
	{
		Map map=new HashMap();
		map.put(1,"ÿҳ1��");
		map.put(2,"ÿҳ2��");
		map.put(5,"ÿҳ5��");
		map.put(10,"ÿҳ10��");
		map.put(15,"ÿҳ15��");
		return map;
	}
	public String getDepartId()
	{
		Object obj=ActionContext.getContext().getSession().get("departId");
		if(obj!=null)
		{
			this.departId=(String)obj;
		}
		return this.departId;
	}
	public void setDepartId(String departId)
	{
		this.departId=departId;
		ActionContext.getContext().getSession().put("departId",departId);
		ActionContext.getContext().getSession().put("currenPage",1);
		
	}
	

	public void setCurrenPage(int currenPage)
	{
		this.currenPage=currenPage;	
	}
	public int getCurrenPage()
	{
		return this.currenPage;
	}
	public List getImpList()
	{
		List list=ManageDB.getImpByDepartId(this.getDepartId(),this.getCurrenPage(),this.getPageSpan());
		return list;
	}
	public int getTotalMessage()
	{
		return ManageDB.getDepartTotalMessage(this.getDepartId());
	}
	public int getTotalPage()
	{
		int message=this.getTotalMessage();
		int span=this.getPageSpan();
		return message%span==0?(message/span):(message/span+1);
	}
	public String getDepartName()
	{
		String departName=ManageDB.getDepartNameById(this.getDepartId());
		return departName+"ְ���б�";
	}
	public String execute()
	{
		
		return "success";
	}
}