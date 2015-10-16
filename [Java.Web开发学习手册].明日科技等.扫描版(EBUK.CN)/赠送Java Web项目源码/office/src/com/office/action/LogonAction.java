package com.office.action;

import java.sql.ResultSet;
import java.util.ArrayList;

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
import com.office.dao.Content;
import com.office.dao.DB;
import com.office.officemenu.Searchtypelist;
import com.office.tools.CheckUser;

public class LogonAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=new ActionForward();
		String mark=mapping.getParameter();
		if(mark.equals("logon_no"))
			forward=executeLogonNo(mapping,form,request,response);   //在登录模块中单击“登录”按钮时触发该方法
	    if(mark.equals("index"))
	    	forward=executeIndex(mapping,form,request,response);     //在首页index.jsp中单击“首页”链接时触发该方法
		return forward;
	}
	public ActionForward executeLogonNo(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		
		LogonForm logonform=(LogonForm)form;
		ActionMessages errors=new ActionMessages(); 
	    String username=logonform.getUsername();
	    String userpassword=logonform.getUserpassword();
	    boolean mark=true;
	    if(username==null||username.equals("")){
	    	errors.add("noname",new ActionMessage("office.no.username.error"));
	        mark=false;
	    }
	    if(userpassword==null||userpassword.equals("")){
	    	errors.add("nopswd",new ActionMessage("office.no.userpassword.error"));
	        mark=false;
	    }
	    if(!mark){
	    	saveErrors(request,errors);
	        return mapping.findForward("false");
	    }	    
	    ArrayList personsearchtypelist = Searchtypelist.getpersonsearchtypelist();
		ArrayList cartypelist = Searchtypelist.getcarsearchtypelist();
		ArrayList thingtypelist = Searchtypelist.getthingsearchtypelist();
		ArrayList advicetypelist=Searchtypelist.getadvicesearchtypelist();
		session.setAttribute("personsearchtypelist", personsearchtypelist);
		session.setAttribute("cartypelist", cartypelist);
		session.setAttribute("thingtypelist", thingtypelist);
		session.setAttribute("advicetypelist", advicetypelist);
	    
	    DB db=new DB();
		String sql="select * from "+Content.TB_USER+" where "+Content.USERNAME+"='"+username+"' and "+Content.USERPASSWORD+"='"+userpassword+"'";
		ResultSet rs=db.getRs(sql);
		if(rs.next()){					
			logonform.setUsername(rs.getString(Content.USERNAME));
			logonform.setUsertruename(rs.getString(Content.USERTRUENAME));
			logonform.setUserable(rs.getInt(Content.USERABLE));
			logonform.setUsergood(rs.getString(Content.USERGOOD));
			logonform.setUserbranch(rs.getString(Content.USERBRANCH));
			logonform.setUserjob(rs.getString(Content.USERJOB));
			logonform.setUsersex(rs.getString(Content.USERSEX));
			logonform.setUseremail(rs.getString(Content.USEREMAIL));
			logonform.setUsertel(rs.getString(Content.USERTEL));
			logonform.setUseraddress(rs.getString(Content.USERADDRESS));		   
			logonform.setUseraccesstimes(rs.getInt(Content.USERACCESSTIMES)+1);
		    logonform.setUserfoundtime(rs.getString(Content.USERFOUNDTIME));			
		   
		    boolean flag=true;
			flag=CheckUser.check(logonform.getUsername(),request);
			if(!flag){
			  errors.add("logonR", new ActionMessage("office.user.exist.error"));
			  saveErrors(request,errors);
			  return mapping.findForward("false");
			}  
		
			  sql="update "+Content.TB_USER+" set "+Content.USERACCESSTIMES+"="+Content.USERACCESSTIMES+"+1 where "+Content.USERNAME+"='"+username+"'";
			  int i=db.update(sql);
	          if(i==0){
	           errors.add("logonR",new ActionMessage("office.logon.false"));
	           saveErrors(request,errors);
	           return mapping.findForward("false");
	          }
	             
			  session.setAttribute("logonuser",logonform);
	          session.setAttribute("selectmenu1", "index");
	          Loadmenu((int)logonform.getUserable(),request);
	          
	          return mapping.findForward("success");
			
		}
		else{
	    	errors.add("logonR",new ActionMessage("offic.name.or.password.wrong.error"));
		    saveErrors(request,errors);
		    return mapping.findForward("false");
		}
	}
	private void Loadmenu(int userable,HttpServletRequest request){
		ArrayList menulist=new ArrayList();
		String sql="select * from "+Content.TB_MENU+" where "+Content.USERABLE+" <= "+userable+" and "+Content.MENUJIBIE+"='1' order by "+Content.MENUORDER;
		DB db=new DB();
		menulist=db.getmenulist(sql);	
    	HttpSession session=request.getSession();
	    session.setAttribute("menulist", menulist);
	}
	public ActionForward executeIndex(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		session.setAttribute("selectmenu1","index");
		return mapping.findForward("success");
	}
}
