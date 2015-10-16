package com.action;

import javax.servlet.http.*;
import org.apache.struts.action.*;
import com.actionForm.SortForm;
import org.apache.struts.actions.DispatchAction;

import com.dao.ObjectDao;

import java.util.List;
import java.io.UnsupportedEncodingException;

public class SortAction extends DispatchAction
    {

	private ObjectDao<SortForm> objectDao = null;
	
	// 对新闻类别查询的Action
	public ActionForward selectSortAction(ActionMapping mapping,
		ActionForm form, HttpServletRequest request,
		HttpServletResponse response)
		throws UnsupportedEncodingException
	    {
		objectDao = new ObjectDao<SortForm>();
		String bigSort = request.getParameter("bigSort");
		bigSort = new String(bigSort.getBytes("ISO8859_1"), "gb2312");
		String hql = "from SortForm where bigSort='" + bigSort
			+ "' order by id desc";
		List list = objectDao.queryList(hql);
		request.setAttribute("list", list);
		return mapping.findForward("selectSortAction");
	    }
	
	// 对新闻详细类别插入的Action
	public ActionForward insertSortAction(ActionMapping mapping,
		ActionForm form, HttpServletRequest request,
		HttpServletResponse response)
		throws UnsupportedEncodingException
	    {
		SortForm sortForm = (SortForm) form;
		String hql = "from SortForm where bigSort = '"
			+ sortForm.getBigSort() + "' and smallSort = '"
			+ sortForm.getSmallSort() + "'";
		objectDao = new ObjectDao<SortForm>();
		SortForm sort = objectDao.queryFrom(hql);
		if (sort != null)
		    {
			request.setAttribute("result", "您输入的类别名称重复，请重新输入");
		    } else
		    {
			objectDao.saveT(sortForm);
			request.setAttribute("result", "您输入的类别成功");
		    }
		return mapping.findForward("resultSortAction");
	    }
	
	// 以自动流水号为条件删除的Action
	public ActionForward deleteSortAction(ActionMapping mapping,
		ActionForm form, HttpServletRequest request,
		HttpServletResponse response)
		throws UnsupportedEncodingException
	    {
		int id = Integer.parseInt(request.getParameter("id"));
		objectDao = new ObjectDao<SortForm>();
		String hql="from SortForm where id="+id+"";
		SortForm sortForm=objectDao.queryFrom(hql);
		if (objectDao.deleteT(sortForm))
		    {
			request.setAttribute("result", "删除新闻类型成功");
		    } else
		    {
			request
				.setAttribute("result",
					"新闻中仍然存在该类型，删除新闻类型失败");
		    }
		return mapping.findForward("resultSortAction");
	    }
	
	
	
	
	

    }
