package com.bOS.bPRO_PersonManage.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.HibernateException;

import com.bOS.bPRO_PersonManage.actionform.UsersForm;
import com.bOS.bPRO_PersonManage.en.Users;
import com.bOS.bPRO_PersonManage.service.UsersDao;

/**
 * @author BWeiMing
 *
 */
public class UsersAction extends Action {

    private UsersDao dao=new UsersDao();
    
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        String action =request.getParameter("action");
        System.out.println("\nUsersAction*********************action="+action);
        if(action==null||"".equals(action)){
            return mapping.findForward("error");
        }else if("listuser".equals(action)){
            return listUser(mapping,form,request,response);
        }else if("adduser".equals(action)){
            return addUsers(mapping,form,request,response);
        }else if("logon".equals(action)){
            return logon(mapping,form,request,response);
        }else if("updateuser".equals(action)){
            return updateUser(mapping,form,request,response);
        }else if("deleteuser".equals(action)){
            return deleteUser(mapping,form,request,response);
        }else if("selectuser".equals(action)){
            return selectUser(mapping,form,request,response);
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
    private ActionForward selectUser(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws HibernateException {
        Long id=new Long(request.getParameter("id"));
        Users u=dao.loadUsers(id.longValue());
        request.setAttribute("user",u);
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
    private ActionForward deleteUser(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws HibernateException {
        Long id=new Long(request.getParameter("id"));
        Users users=new Users();
        users.setId(id);
        dao.deleteUsers(users);
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
    private ActionForward updateUser(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws HibernateException {
        UsersForm usersform=(UsersForm)form;
        Users users=usersform.populate();
        dao.updateUsers(users);
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
    private ActionForward logon(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws HibernateException {
        UsersForm usersform=(UsersForm)form;
        Users users=new Users();
        users.setUsername(usersform.getUsername());
        users.setPassword(usersform.getPassword());
        boolean flag=dao.logonUsers(users);
        if(flag){
            request.getSession().setAttribute("users",users.getUsername());
            return mapping.findForward("success");
        }else{
            return mapping.findForward("failed");
       }
    }

    /**
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws HibernateException
     */
    private ActionForward addUsers(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws HibernateException {
        UsersForm usersform=(UsersForm)form;
        Users users=usersform.populate();
        dao.addUsers(users);
        return mapping.findForward("success");
    }

    /**
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @param action
     * @return
     * @throws HibernateException
     */
    private ActionForward listUser(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws HibernateException {
        request.setAttribute("list",dao.listUser());
        return mapping.findForward("success");
    }

}
