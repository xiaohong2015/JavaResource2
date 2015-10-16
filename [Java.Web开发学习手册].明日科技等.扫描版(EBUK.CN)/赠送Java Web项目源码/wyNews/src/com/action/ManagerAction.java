package com.action;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.*;
import org.apache.struts.action.*;
import com.actionForm.ManagerForm;
import com.dao.ObjectDao;
import org.apache.struts.actions.DispatchAction;

public class ManagerAction extends DispatchAction
    {
	
	private ObjectDao<ManagerForm> objectDao = null;
	
	// 用户登录
	public ActionForward checkManagerAction(ActionMapping mapping,
		ActionForm form, HttpServletRequest request,
		HttpServletResponse response)
	    {
		objectDao = new ObjectDao<ManagerForm>();
		ManagerForm managerForm = (ManagerForm) form;
		String password = managerForm.getPassword();
		String hql = "from ManagerForm where account ='"
			+ managerForm.getAccount() + "'";
		managerForm = objectDao.queryFrom(hql);
		if (managerForm == null)
		    {
			request.setAttribute("result", "您输入的用户名不存在");
		    } else if (!managerForm.getPassword().equals(password))
		    {
			request.setAttribute("result", "您输入的密码不正确");
		    } else
		    {
			request.setAttribute("form", managerForm);
		    }
		return mapping.findForward("checkManagerAction");
	    }
	
	// 用户添加的Action
	public ActionForward insertManagerAction(ActionMapping mapping,
		ActionForm form, HttpServletRequest request,
		HttpServletResponse response)
	    {
		objectDao = new ObjectDao<ManagerForm>();
		ManagerForm managerForm = (ManagerForm) form;
		String account = managerForm.getAccount();
		String hql = "from ManagerForm where account='" + account + "'";
		ManagerForm manager = objectDao.queryFrom(hql);
		if (manager == null || manager.equals(""))
		    {
			objectDao.saveT(managerForm);
		    } else
		    {
			request.setAttribute("result", "用户名已经存在，不能够进行保存");
		    }
		return mapping.findForward("resultManagerAction");
	    }
	
	// 用户全部查看的Action
	public ActionForward selectManagerAction(ActionMapping mapping,
		ActionForm form, HttpServletRequest request,
		HttpServletResponse response)
	    {
		objectDao = new ObjectDao<ManagerForm>();
		String hql = "from ManagerForm";
		List<ManagerForm> list = objectDao.queryList(hql);
		request.setAttribute("list", list);
		return mapping.findForward("selectManagerAction");
	    }
	
	// 用户删除的Action
	public ActionForward deleteManagerAction(ActionMapping mapping,
		ActionForm form, HttpServletRequest request,
		HttpServletResponse response)
		throws UnsupportedEncodingException
	    {
		objectDao = new ObjectDao<ManagerForm>();
		String account = new String(request.getParameter("account")
			.getBytes("ISO8859_1"), "gb2312");
		String hql = "from ManagerForm where account='" + account + "'";
		ManagerForm managerForm = objectDao.queryFrom(hql);
		objectDao.deleteT(managerForm);
		return selectManagerAction(mapping, form, request, response);
	    }
	
	// 用户修改的Action
	public ActionForward updateManagerAction(ActionMapping mapping,
		ActionForm form, HttpServletRequest request,
		HttpServletResponse response)
	    {
		objectDao = new ObjectDao<ManagerForm>();
		ManagerForm managerForm = (ManagerForm) form;
		objectDao.updateT(managerForm);
		request.setAttribute("result", "用户修改成功！！！");
		return mapping.findForward("updateManagerAction");
	    }
	
    }
