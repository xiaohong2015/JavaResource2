package com.action;

import java.util.List;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForward;
import com.actionForm.ForceForm;
import org.apache.struts.actions.DispatchAction;
import com.dao.ObjectDao;

public class ForceAction extends DispatchAction {
	private ObjectDao<ForceForm> objectDao = null;

	// 后台：焦点导读查看的Action
	public ActionForward selectForceAction(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		objectDao = new ObjectDao<ForceForm>();
		String hql = "from ForceForm order by id desc";
		List list = objectDao.queryList(hql);
		request.setAttribute("list", list);
		return mapping.findForward("selectForceAction");
	}

	// 后台：焦点导读全部查看的Action
	public ActionForward selectOneForceAction(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		objectDao = new ObjectDao<ForceForm>();
		String id = request.getParameter("id");
		String hql = "from ForceForm where id = '" + id + "'";
		ForceForm forceForm = objectDao.queryFrom(hql);
		request.setAttribute("form", forceForm);
		return mapping.findForward("selectOneForceAction");
	}

	// 后台：焦点导读添加的Action
	public ActionForward insertForceAction(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		objectDao = new ObjectDao<ForceForm>();
		ForceForm forceForm = (ForceForm) form;
		objectDao.saveT(forceForm);
		request.setAttribute("result", "您是所添加的焦点导读内容成功");
		return mapping.findForward("insertForceAction");
	}

	// 后台：进入修改导读修改页面的Action
	public ActionForward queryForceFormAction(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("id");
		String hql = "from ForceForm where id='" + id + "'";
		objectDao = new ObjectDao<ForceForm>();
		ForceForm forceForm = objectDao.queryFrom(hql);
		request.setAttribute("form", forceForm);
		return mapping.findForward("queryForceFormAction");
	}

	// 后台：焦点导读修改的Action
	public ActionForward updateForceAction(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		objectDao = new ObjectDao<ForceForm>();
		ForceForm forceForm = (ForceForm) form;
		objectDao.updateT(forceForm);
		request.setAttribute("form", forceForm);
		request.setAttribute("result", "您是所修改的焦点导读内容成功");
		return mapping.findForward("updateForceAction");
	}

	// 后台：焦点导读删除的Action
	public ActionForward deleteForceAction(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		objectDao = new ObjectDao<ForceForm>();
		String id = request.getParameter("id");
		String hql = "from ForceForm where id='" + id + "'";
		ForceForm forceForm = objectDao.queryFrom(hql);
		objectDao.deleteT(forceForm);
		return selectForceAction(mapping, form, request, response);
	}

	// 前台：焦点导读全部查询
	public ActionForward queryForceAction(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		objectDao = new ObjectDao<ForceForm>();
		String hql = "from ForceForm order by id desc";
		List list = objectDao.queryList(hql);
		request.setAttribute("list", list);
		return mapping.findForward("queryForceAction");
	}

	// 前台：焦点导读详细查询
	public ActionForward queryForceOneAction(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		objectDao = new ObjectDao<ForceForm>();
		String id = request.getParameter("id");
		String hql = "from ForceForm where id='" + id + "' order by id desc";
		ForceForm forceForm = objectDao.queryFrom(hql);
		request.setAttribute("form", forceForm);
		return mapping.findForward("queryForceOneAction");
	}

}
