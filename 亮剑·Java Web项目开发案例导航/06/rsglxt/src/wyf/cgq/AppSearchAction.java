package wyf.cgq;
import java.util.*;
import com.opensymphony.xwork2.*;
public class AppSearchAction
{
	private String impId;
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
		this.impId=(String)(ActionContext.getContext().getSession().get("user"));
		this.totalMessage=ManageDB.getPApplyTotal(impId);
		return this.totalMessage;
	}
	public int getMaxPage()
	{
		this.pageSpan=this.getPageSpan();
		this.totalMessage=this.getTotalMessage();
		this.maxPage=this.totalMessage%this.pageSpan==0?(this.totalMessage/this.pageSpan):(this.totalMessage/this.pageSpan+1);
		return this.maxPage;
	}
	public List getApplyList()
	{
		this.pageSpan=this.getPageSpan();
		this.impId=(String)(ActionContext.getContext().getSession().get("user"));
		List list=ManageDB.getPApplyList(impId,currenPage,pageSpan);
		return list;
	}
	public String execute()
	{
		return "success";
	}
}