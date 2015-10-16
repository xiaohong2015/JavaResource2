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
	
	// ������Ϣ�鿴��Action
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
	
	// ������Ϣɾ����Action
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
	
	// ������Ϣ��ӵ�Action
	public ActionForward insertAfficheAction(ActionMapping mapping,
		ActionForm form, HttpServletRequest request,
		HttpServletResponse response)
	    {
		AfficheForm afficheForm = (AfficheForm) form;
		objectDao = new ObjectDao<AfficheForm>();
		objectDao.saveT(afficheForm);
		request.setAttribute("result", "��ӹ�����Ϣ�ɹ�");
		return mapping.findForward("resultAfficheAction");
	    }
	
    }
