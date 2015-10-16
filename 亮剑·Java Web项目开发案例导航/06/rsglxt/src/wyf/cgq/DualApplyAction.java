package wyf.cgq;
import com.opensymphony.xwork2.*;
import java.util.*;
public class DualApplyAction
{
	private String departId="0000";
	private int holsState;
	private List applyList;
	private int currenPage=1;
	private int maxPage;
	private int totalMessage;
	private int pageSpan=5;
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
	public void setCurrenPage(int currenPage)
	{
		this.currenPage=currenPage;
	}
	public int getCurrenPage()
	{
		
		return this.currenPage;
	}
	public int getTotalMessage()
	{
		this.totalMessage=ManageDB.getApplyTotalMessage(this.getDepartId(),this.getHolsState());
		return totalMessage;
	}
	public int getMaxPage()
	{
		this.pageSpan=this.getPageSpan();
		this.totalMessage=ManageDB.getApplyTotalMessage(this.getDepartId(),this.getHolsState());
		this.maxPage=totalMessage%this.pageSpan==0?(this.totalMessage/this.pageSpan):(this.totalMessage/this.pageSpan+1);
		return this.maxPage;
	}
	public void setDepartId(String departId)
	{
		this.departId=departId;
		ActionContext.getContext().getSession().put("departId",departId);
	
	}
	public String getDepartId()
	{
		Object obj=ActionContext.getContext().getSession().get("departId");
		if(obj!=null)
		{
			this.departId=(String)departId;
		}
		return this.departId;
	}
	public void setHolsState(int holsState)
	{
		this.holsState=holsState;
		ActionContext.getContext().getSession().put("holsState",holsState);
		this.currenPage=1;
	}
	public int getHolsState()
	{
		Object obj=ActionContext.getContext().getSession().get("holsState");
		if(obj!=null)
		{
			this.holsState=(Integer)obj;
		}
		return this.holsState;
	}
	public Map getDepartList()
	{
		Map map=ManageDB.getDepartList();
		map.put("0000","ȫ��");
		return map;
	}
	public Map getStateList()
	{
		Map map=new HashMap();
		map.put(0,"δ����");
		map.put(1,"ͬ��");
		map.put(2,"����");
		map.put(3,"�ܾ�");
		return map;
		
	}
	public List getApplyList()
	{
		this.pageSpan=this.getPageSpan();
		applyList=ManageDB.getApplyList(this.getDepartId(),this.getHolsState(),this.currenPage,this.pageSpan);
		return applyList;
	}
	public String execute()
	{
		return "success";
	}
}