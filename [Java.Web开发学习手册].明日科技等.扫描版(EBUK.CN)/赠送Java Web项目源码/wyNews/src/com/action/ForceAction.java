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

	// ��̨�����㵼���鿴��Action
	public ActionForward selectForceAction(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		objectDao = new ObjectDao<ForceForm>();
		String hql = "from ForceForm order by id desc";
		List list = objectDao.queryList(hql);
		request.setAttribute("list", list);
		return mapping.findForward("selectForceAction");
	}

	// ��̨�����㵼��ȫ���鿴��Action
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

	// ��̨�����㵼����ӵ�Action
	public ActionForward insertForceAction(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		objectDao = new ObjectDao<ForceForm>();
		ForceForm forceForm = (ForceForm) form;
		objectDao.saveT(forceForm);
		request.setAttribute("result", "��������ӵĽ��㵼�����ݳɹ�");
		return mapping.findForward("insertForceAction");
	}

	// ��̨�������޸ĵ����޸�ҳ���Action
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

	// ��̨�����㵼���޸ĵ�Action
	public ActionForward updateForceAction(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		objectDao = new ObjectDao<ForceForm>();
		ForceForm forceForm = (ForceForm) form;
		objectDao.updateT(forceForm);
		request.setAttribute("form", forceForm);
		request.setAttribute("result", "�������޸ĵĽ��㵼�����ݳɹ�");
		return mapping.findForward("updateForceAction");
	}

	// ��̨�����㵼��ɾ����Action
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

	// ǰ̨�����㵼��ȫ����ѯ
	public ActionForward queryForceAction(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		objectDao = new ObjectDao<ForceForm>();
		String hql = "from ForceForm order by id desc";
		List list = objectDao.queryList(hql);
		request.setAttribute("list", list);
		return mapping.findForward("queryForceAction");
	}

	// ǰ̨�����㵼����ϸ��ѯ
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
