package com.action;

import java.util.List;

import javax.servlet.http.*;
import org.apache.struts.action.*;
import com.actionForm.AfficheForm;
import org.apache.struts.actions.DispatchAction;
import com.dao.ObjectDao;

public class AfficheAction extends DispatchAction
    {
	private ObjectDao<AfficheForm> objectDao = null;
	
	// 公告信息查看的Action
	public ActionForward selectAfficheAction(ActionMapping mapping,
		ActionForm form, HttpServletRequest request,
		HttpServletResponse response)
	    {
		objectDao = new ObjectDao<AfficheForm>();
		List<AfficheForm> list = objectDao
			.queryList("from AfficheForm order by id desc");
		request.setAttribute("list", list);
		return mapping.findForward("selectAfficheAction");
	    }
	
	// 公告信息删除的Action
	public ActionForward deleteAfficheAction(ActionMapping mapping,
		ActionForm form, HttpServletRequest request,
		HttpServletResponse response)
	    {
		objectDao = new ObjectDao<AfficheForm>();
		String id = request.getParameter("id");
		AfficheForm afficheForm = objectDao
			.queryFrom("from AfficheForm where id='" + id + "'");
		objectDao.deleteT(afficheForm);
		return selectAfficheAction(mapping, form, request, response);
	    }
	
	// 公告信息添加的Action
	public ActionForward insertAfficheAction(ActionMapping mapping,
		ActionForm form, HttpServletRequest request,
		HttpServletResponse response)
	    {
		AfficheForm afficheForm = (AfficheForm) form;
		objectDao = new ObjectDao<AfficheForm>();
		objectDao.saveT(afficheForm);
		request.setAttribute("result", "添加公告信息成功");
		return mapping.findForward("resultAfficheAction");
	    }
	
    }
