package com.office.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.office.actionform.LogonForm;

public class LogoffAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors=new ActionMessages();
		HttpSession session=request.getSession();
//		LogonForm logonuser=(LogonForm)session.getAttribute("logonuser");
//	    if(logonuser==null){
//			 errors=new ActionMessages();
//			 errors.add("notAllow",new ActionMessage("office.logon.notallow"));
//			 saveErrors(request,errors);
//			 return mapping.findForward("notallowlogon");
//		}
		session.invalidate();
		String mark=mapping.getParameter();
		if(mark.equals("logon_agin"))
			return mapping.findForward("logon_agin");
		else
			return mapping.findForward("logoff");
	}
}