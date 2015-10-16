package com.bOS.bPRO_PersonManage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.HibernateException;

import com.bOS.bPRO_PersonManage.actionform.JobForm;
import com.bOS.bPRO_PersonManage.en.Job;
import com.bOS.bPRO_PersonManage.service.JobDao;

/**
 * @author BWeiMing
 *
 */
public class JobAction extends Action {
    private JobDao dao=new JobDao();

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        String action =request.getParameter("action");
        System.out.println("\nJobAction*********************action="+action);
        if(action==null||"".equals(action)){
            return mapping.findForward("error");
        }else if("listjob".equals(action)){
            return listJob(mapping,form,request,response);
        }else if("addjob".equals(action)){
            return addJob(mapping,form,request,response);
        }else if("deletejob".equals(action)){
            return deleteJob(mapping,form,request,response);
        }else if("updatejob".equals(action)){
            return updateJob(mapping,form,request,response);
        }else if("detailjob".equals(action)){
            return detailjob(mapping,form,request,response);
        }
        return mapping.findForward("error");
    }

    /**
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws HibernateException
     */
    private ActionForward detailjob(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws HibernateException {
        Long id=new Long(request.getParameter("id"));
        Job j=dao.loadJob(id.longValue());
        request.setAttribute("job",j);
        return mapping.findForward("success");
    }

    /**
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws HibernateException
     */
    private ActionForward updateJob(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws HibernateException {
        JobForm jobform=(JobForm)form;
        Job j=jobform.populate();
        dao.updateJob(j);
        return mapping.findForward("success");
    }

    /**
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws HibernateException
     */
    private ActionForward deleteJob(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws HibernateException {
        Long id=new Long(request.getParameter("id"));
        Job j=new Job();
        j.setId(id);
        dao.deleteJob(j);
        return mapping.findForward("success");
    }

    /**
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws HibernateException
     */
    private ActionForward addJob(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws HibernateException {
        JobForm jobform=(JobForm)form;
        Job job=jobform.populate();
        dao.addJob(job);
        return mapping.findForward("success");
    }

    /**
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws HibernateException
     */
    private ActionForward listJob(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws HibernateException {
        String isstock=request.getParameter("isstock");
        if(isstock==null||"".equals(isstock)){
            request.setAttribute("list",dao.listJob(new Byte("0").byteValue()));
        }else{
            request.setAttribute("list",dao.listJob(new Byte("1").byteValue()));
        }
        return mapping.findForward("success");
    }
}
