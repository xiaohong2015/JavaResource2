package com.action;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForward;
import com.actionForm.NewsForm;
import org.apache.struts.actions.DispatchAction;

import com.dao.ObjectDao;

import com.tools.TimeShow;

import java.io.UnsupportedEncodingException;
import java.util.List;

public class NewsAction extends DispatchAction
    {

	
	private ObjectDao<NewsForm> objectDao = null;
	
	// 后台：按新闻大类别的名称查询信息的Action
	public ActionForward queryNewsListAction(ActionMapping mapping,
		ActionForm form, HttpServletRequest request,
		HttpServletResponse response)
		throws UnsupportedEncodingException
	    {
		objectDao = new ObjectDao<NewsForm>();
		String bigSort = request.getParameter("bigSort");
		bigSort = new String(bigSort.getBytes("ISO8859_1"), "gb2312");
		String hql = "from NewsForm where bigSort='" + bigSort
			+ "' order by id desc";
		List list = objectDao.queryList(hql);
		request.setAttribute("list", list);
		return mapping.findForward("selectAllNews");
	    }
	
	// 后台：新闻添加的Action
	public ActionForward insertNewsAction(ActionMapping mapping,
		ActionForm form, HttpServletRequest request,
		HttpServletResponse response)
		throws UnsupportedEncodingException
	    {
		objectDao = new ObjectDao<NewsForm>();
		NewsForm newsForm = (NewsForm) form;
		newsForm.setShowNews(com.tools.TimeShow.autoNumber());
		objectDao.saveT(newsForm);
		request.setAttribute("newsForm", newsForm);
		return mapping.findForward("resultNewsAction");
	    }
	
	// 后台： 对新闻的详细查询，转向修改页面Action
	public ActionForward selectOneNewsAction(ActionMapping mapping,
		ActionForm form, HttpServletRequest request,
		HttpServletResponse response)
		throws UnsupportedEncodingException
	    {
		objectDao = new ObjectDao<NewsForm>();
		int id = Integer.parseInt(request.getParameter("id"));
		String hql = "from NewsForm where id=" + id + "";
		NewsForm newsForm = objectDao.queryFrom(hql);
		request.setAttribute("form", newsForm);
		return mapping.findForward("selectOneNewsAction");
	    }
	
	// 后台：对新闻的修改Action
	public ActionForward updateNewsAction(ActionMapping mapping,
		ActionForm form, HttpServletRequest request,
		HttpServletResponse response)
		throws UnsupportedEncodingException
	    {
		NewsForm newsForm = (NewsForm) form;
		objectDao = new ObjectDao<NewsForm>();
		String hql = "from NewsForm where id=" + newsForm.getId() + "";
		NewsForm nform = objectDao.queryFrom(hql);
		String filename = request.getRealPath("newsContent\\"
			+ nform.getShowNews());
		com.tools.FileOperation.deleteFile(filename);
		/** ************************************** */
		newsForm.setShowNews(com.tools.TimeShow.autoNumber());
		objectDao.updateT(newsForm);
		request.setAttribute("newsForm", newsForm);
		return mapping.findForward("resultNewsAction");
	    }
	
	// 后台：对新闻的删除Action
	public ActionForward deleteNewsAction(ActionMapping mapping,
		ActionForm form, HttpServletRequest request,
		HttpServletResponse response)
		throws UnsupportedEncodingException
	    {
		objectDao = new ObjectDao<NewsForm>();
		int id = Integer.parseInt(request.getParameter("id"));
		String hql = "from NewsForm where id=" + id + "";
		NewsForm newsForm = objectDao.queryFrom(hql);
		objectDao.deleteT(newsForm);
		request.setAttribute("result", "新闻删除成功");
		String filename = request.getRealPath("newsContent\\"
			+ newsForm.getShowNews());
		com.tools.FileOperation.deleteFile(filename);
		return mapping.findForward("resultNewsAction");
	    }
	
	// 后台：对新闻的详细查询
	public ActionForward queryNewsFormAction(ActionMapping mapping,
		ActionForm form, HttpServletRequest request,
		HttpServletResponse response)
		throws UnsupportedEncodingException
	    {
		objectDao = new ObjectDao<NewsForm>();
		int id = Integer.parseInt(request.getParameter("id"));
		String hql = "from NewsForm where id=" + id + "";
		NewsForm newsForm = objectDao.queryFrom(hql);
		request.setAttribute("form", newsForm);
		return mapping.findForward("queryNewsFormAction");
	    }
	
	// 前台：对新闻的查看
	public ActionForward front_queryNewsAction(ActionMapping mapping,
		ActionForm form, HttpServletRequest request,
		HttpServletResponse response)
		throws UnsupportedEncodingException
	    {
		objectDao = new ObjectDao<NewsForm>();
		String hql = "";
		String sign = request.getParameter("sign");
		sign = new String(sign.getBytes("ISO8859_1"), "gb2312");
		hql = "from NewsForm where bigSort =  '" + sign + "'"; // 设置新闻类别的HQL语句
		if (sign.equals("今日新闻")) // 对今日新闻的查询
		    {
			TimeShow timeShow = new TimeShow();
			String currtime = timeShow.cuttentMonthDate();
			hql = "from NewsForm where createTime =  '" + currtime
				+ "'";
		    }
		List list = objectDao.queryList(hql);
		request.setAttribute("list", list);
		return mapping.findForward("front_queryNewsAction");
	    }
	
	// 前台：对新闻关键字的查询
	public ActionForward front_queryKeyNewsAction(ActionMapping mapping,
		ActionForm form, HttpServletRequest request,
		HttpServletResponse response)
		throws UnsupportedEncodingException
	    {
		objectDao = new ObjectDao<NewsForm>();
		String key = request.getParameter("key").trim();		
		String hql = "from NewsForm where (title like '%" + key
			+ "%') or (content like '%" + key + "%')";
		List list=objectDao.queryList(hql);		
		request.setAttribute("list", list);
		return mapping.findForward("front_queryKeyNewsAction");
	    }
	
	
	
    }
