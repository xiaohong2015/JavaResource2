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
	
	// ����������ѯ��Action
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
	
	// ��������ϸ�������Action
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
			request.setAttribute("result", "���������������ظ�������������");
		    } else
		    {
			objectDao.saveT(sortForm);
			request.setAttribute("result", "����������ɹ�");
		    }
		return mapping.findForward("resultSortAction");
	    }
	
	// ���Զ���ˮ��Ϊ����ɾ����Action
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
			request.setAttribute("result", "ɾ���������ͳɹ�");
		    } else
		    {
			request
				.setAttribute("result",
					"��������Ȼ���ڸ����ͣ�ɾ����������ʧ��");
		    }
		return mapping.findForward("resultSortAction");
	    }
	
	
	
	
	

    }
