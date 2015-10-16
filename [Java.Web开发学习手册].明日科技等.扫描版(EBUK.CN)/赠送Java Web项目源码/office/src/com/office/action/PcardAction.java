package com.office.action;

import java.util.ArrayList;
import java.util.Date;
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
import com.office.actionform.PcardForm;
import com.office.dao.Content;
import com.office.dao.DB;
import com.office.tools.Change;
import com.office.tools.CheckUserAble;

public class PcardAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response){
		HttpSession session=request.getSession();
		LogonForm logonuser=(LogonForm)session.getAttribute("logonuser");
		 if(logonuser==null){
			 ActionMessages errors=new ActionMessages();
			 errors.add("notAllow",new ActionMessage("office.logon.notallow"));
			 saveErrors(request,errors);
			 return mapping.findForward("notallowlogon");
		 }
		String mark=mapping.getParameter();
		ActionForward forward=new ActionForward();
		if(mark.equals("pcard_look"))
			forward=executePcardLook(mapping,form,request,response);
		if(mark.equals("pcard_sigle_look"))
			forward=executePcardSigleLook(mapping,form,request,response);
		if(mark.equals("pcard_del"))
			forward=executePcardDel(mapping,form,request,response);
		if(mark.equals("pcard_add"))
			forward=executePcardAdd(mapping,form,request,response);
		if(mark.equals("pcard_update"))
			forward=executePcardUpdate(mapping,form,request,response);
		return forward;
	}
	
	public ActionForward executePcardLook(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response){
		HttpSession session=request.getSession();
		session.setAttribute("selectmenu1", "pcard");
		session.setAttribute("selectmenu2", "pcard_look");
	    String sql="select * from "+Content.TB_PCARD+" order by "+Content.PCARDTIME+" desc";
	    
	    String str_currentpage=request.getParameter("page");
        if(str_currentpage==null||str_currentpage.equals(""))
			 str_currentpage="0";
		int currentpage=Change.strtoint(str_currentpage);
		if(currentpage<=0)
			currentpage=1;

	    DB db=new DB();
	    ArrayList pcardlist=db.getallpcardlist(sql,currentpage);
	    
	    session.setAttribute("numrs",Integer.toString(db.getNumrs()));
	    session.setAttribute("numper", Integer.toString(db.getNumper()));
	    session.setAttribute("currentpage",Integer.toString(db.getCurrentPage()));
	    session.setAttribute("numpages", Integer.toString(db.getNumPages()));
	    session.setAttribute("pcardlist",pcardlist);
	  	
	    return mapping.findForward("success");
	}
	
	public ActionForward executePcardSigleLook(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response){
		HttpSession session=request.getSession();
		PcardForm pcardform=(PcardForm)form; 
		String lookid1=request.getParameter("id");
		 if(lookid1==null||lookid1.equals(""))lookid1="0";
		int lookid=Change.strtoint(lookid1);
		
		ArrayList pcardlist=(ArrayList)session.getAttribute("pcardlist");
		boolean flag=false;		
		if(pcardlist!=null||pcardlist.size()!=0){
			for(int i=0;i<pcardlist.size();i++){
			    PcardForm pcardsigleform=(PcardForm)pcardlist.get(i);
			    if(lookid==pcardsigleform.getPcardid()){
				    flag=true;
				    pcardform.setSubject(pcardsigleform.getSubject());
	    		    pcardform.setAuthor(pcardsigleform.getAuthor());
	    		    pcardform.setTime(pcardsigleform.getTime());
	    		    pcardform.setContent(pcardsigleform.getContent());
	    		    break;
			    }
			}
		}
		if(!flag){
			ActionMessages errors=new ActionMessages();
			errors.add("lookR",new ActionMessage("office.pcard.look.sigle.error"));
			saveErrors(request,errors);
			return mapping.findForward("false");
		}
		return mapping.findForward("success");
	}
	
	public ActionForward executePcardDel(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response){
		ActionMessages errors=new ActionMessages();
		HttpSession session=request.getSession();
		
		LogonForm logonuser=(LogonForm)session.getAttribute("logonuser");
		
		if(!CheckUserAble.check(logonuser)){
			session.setAttribute("selectmenu2", "");
			errors.add("notAllow",new ActionMessage("office.user.noallow"));
			saveErrors(request,errors);
			return mapping.findForward("notallow");
		}
		
		String id1=request.getParameter("id");
		int id=Change.strtoint(id1);
		String sql="delete from "+Content.TB_PCARD+" where "+Content.PCARDID+"="+id;
		DB db=new DB();
		int i=db.del(sql);
		if(i==0){
			errors=new ActionMessages();
			errors.add("deleteR",new ActionMessage("office.delete.false"));
			saveErrors(request,errors);
			return mapping.findForward("false");
		}
	    return mapping.findForward("success");
	}
	public ActionForward executePcardAdd(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response){
		ActionMessages errors=new ActionMessages();
		HttpSession session=request.getSession();
		
		LogonForm logonuser=(LogonForm)session.getAttribute("logonuser");
				
		if(!CheckUserAble.check(logonuser)){
			session.setAttribute("selectmenu2", "");
			errors.add("notAllow",new ActionMessage("office.user.noallow"));
			saveErrors(request,errors);
			return mapping.findForward("notallow");
		}
		
		session.setAttribute("selectmenu2", "pcard_add");
	    PcardForm pcardform=(PcardForm)form;
	    String subject=""; 
	    String content="";
	    String mark=request.getParameter("addtype");
	     if(mark==null|mark.equals(""))mark="link";
	     if(mark.equals("link"))return mapping.findForward("success");
	     if(mark.equals("add")){
	       	subject=pcardform.getSubject();
	       	content=pcardform.getContent();
	     }
	     if(subject==null||subject.equals("")){
	    	 errors.add("nosubject",new ActionMessage("office.pcard.nosubject.error"));
	    	 saveErrors(request,errors);
	    	 return mapping.findForward("false");
	     }
	     
	     DB db=new DB();
		 
		 String author=((LogonForm)session.getAttribute("logonuser")).getUsername();
		 String time=Change.datetostr(new Date());
		 String sql="insert into "+Content.TB_PCARD+" values('"+subject+"','"+author+"','"+time+"','"+content+"')";
		 int k=db.inseart(sql);
		 if(k==0){
		  	errors.add("addR",new ActionMessage("office.insert.false"));
		  	saveErrors(request,errors);
		  	return mapping.findForward("false");
		 }
		 pcardform.clear();
		 errors.add("addR",new ActionMessage("office.insert.success"));
		 saveErrors(request,errors);
		 return mapping.findForward("success");
	}
	
	public ActionForward executePcardUpdate(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response){
		PcardForm pcardform=(PcardForm)form;
		ActionMessages errors=new ActionMessages();
		HttpSession session=request.getSession();
			
		LogonForm logonuser=(LogonForm)session.getAttribute("logonuser");
		
		if(!CheckUserAble.check(logonuser)){
			session.setAttribute("selectmenu2", "");
			errors.add("notAllow",new ActionMessage("office.user.noallow"));
			saveErrors(request,errors);
			return mapping.findForward("notallow");
		}
		
		session.setAttribute("selectmenu2", "pcard_update");
		String subject="";
		String content="";
		DB db=new DB();
		
		String mark=request.getParameter("updatetype");
		if(mark==null|mark.equals(""))mark="link";
	    if(mark.equals("link")){
			String lookid1=request.getParameter("id");
			 if(lookid1==null||lookid1.equals(""))lookid1="0";
			int lookid=Change.strtoint(lookid1);
			session.setAttribute("id", lookid1);
			
			ArrayList pcardlist=(ArrayList)session.getAttribute("pcardlist");
			boolean flag=false;		
			for(int i=0;i<pcardlist.size();i++){
				PcardForm pcardsigleform=(PcardForm)pcardlist.get(i);
				if(lookid==pcardsigleform.getPcardid()){
					flag=true;
					pcardform.setSubject(pcardsigleform.getSubject());
		    		pcardform.setAuthor(pcardsigleform.getAuthor());
		    		pcardform.setTime(pcardsigleform.getTime());
		    		pcardform.setContent(pcardsigleform.getContent());
		    		break;
				}
			}
			if(!flag){
				errors.add("lookR",new ActionMessage("office.pcard.look.sigle.error"));
				saveErrors(request,errors);
				return mapping.findForward("false");
			}
		  return mapping.findForward("update");
	     }
	     
	     if(mark.equals("update")){
	       	subject=pcardform.getSubject();
	       	content=pcardform.getContent();
	     }
	     if(subject==null||subject.equals("")){
	    	 errors.add("nosubject",new ActionMessage("office.pcard.nosubject.error"));
	    	 saveErrors(request,errors);
	    	 return mapping.findForward("false");
	     }
	     String id1=(String)session.getAttribute("id");
	     int id=Change.strtoint(id1);
	     
	     String sql="update "+Content.TB_PCARD+" set "+Content.PCARDSUBJECT+"='"+subject+"',"+Content.PCARDCONTENT+"='"+content+"' where "+Content.PCARDID+"="+id;
		 int k=db.update(sql);
		 if(k==0){
		  	errors.add("updateR",new ActionMessage("office.update.false"));
		  	saveErrors(request,errors);
		  	return mapping.findForward("false");
		 }
		 pcardform.clear();
		 errors.add("updateR",new ActionMessage("office.update.success"));
		 saveErrors(request,errors);
		 return mapping.findForward("success");
	}
	
}