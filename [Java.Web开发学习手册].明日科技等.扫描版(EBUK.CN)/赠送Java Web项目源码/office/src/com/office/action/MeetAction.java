package com.office.action;

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
import com.office.actionform.MeetForm;
import com.office.dao.Content;
import com.office.dao.DB;
import com.office.tools.Change;
import com.office.tools.CheckUserAble;
public class MeetAction extends Action {
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
		if(mark.equals("meet_look"))
			forward=executeMeetLook(mapping,form,request,response);
		if(mark.equals("meet_sigle_look"))
			forward=executeMeetSigleLook(mapping,form,request,response);
		if(mark.equals("meet_del"))
			forward=executeMeetDel(mapping,form,request,response);
		if(mark.equals("meet_add"))
			forward=executeMeetAdd(mapping,form,request,response);
		return forward;
	}
	
	public ActionForward executeMeetLook(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response){
		ArrayList meetlist=new ArrayList();
		HttpSession session=request.getSession();
		session.setAttribute("selectmenu1", "meet");
		session.setAttribute("selectmenu2", "meet_look");
	    String sql="select * from "+Content.TB_MEET+" order by "+Content.MEETTIME+" desc";
		
	    String str_currentpage=request.getParameter("page");
        if(str_currentpage==null||str_currentpage.equals(""))
			 str_currentpage="0";
		int currentpage=Change.strtoint(str_currentpage);
		if(currentpage<=0)
			currentpage=1;

	    DB db=new DB();
		meetlist=db.getallmeetlist(sql,currentpage);
	    
	    session.setAttribute("numrs",Integer.toString(db.getNumrs()));
	    session.setAttribute("numper", Integer.toString(db.getNumper()));
	    session.setAttribute("currentpage",Integer.toString(db.getCurrentPage()));
	    session.setAttribute("numpages", Integer.toString(db.getNumPages()));
	    session.setAttribute("meetlist", meetlist);
		
	    return mapping.findForward("success");
	}
	public ActionForward executeMeetSigleLook(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response){
		ArrayList meetlist=new ArrayList();
		HttpSession session=request.getSession();
		MeetForm textform=(MeetForm)form; 
		String lookid1=request.getParameter("id");
		if(lookid1==null||lookid1.equals(""))lookid1="0";
		int lookid=Change.strtoint(lookid1);
		meetlist=(ArrayList)session.getAttribute("meetlist");
		boolean flag=false;
		if(meetlist!=null||meetlist.size()!=0){
			for(int i=0;i<meetlist.size();i++){
			    MeetForm meetsigleform=(MeetForm)meetlist.get(i);
			    if(lookid==meetsigleform.getMeetid()){
    				flag=true;
	    			textform.setSubject(meetsigleform.getSubject());
	        		textform.setSpeaker(meetsigleform.getSpeaker());
	    	    	textform.setListener(meetsigleform.getListener());
    	    		textform.setAddress(meetsigleform.getAddress());
	        		textform.setContent(meetsigleform.getContent());
	        		textform.setTime(meetsigleform.getTime());
	    	    	break;
			    }
			}
		}
		if(!flag){
			ActionMessages errors=new ActionMessages();
			errors.add("lookR",new ActionMessage("office.meet.look.sigle.error"));
			saveErrors(request,errors);
			return mapping.findForward("false");
		}
		return mapping.findForward("success");
	}
	public ActionForward executeMeetDel(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response){
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
		String sql="delete from "+Content.TB_MEET+" where "+Content.MEETID+"="+id;
	    DB db=new DB();
	    int i=db.del(sql);
	    if(i==0){
	    	errors.add("deleteR",new ActionMessage("office.del.false"));
	    	saveErrors(request,errors);
	    	return mapping.findForward("false");
	    }
	    return mapping.findForward("success");
	}
	public ActionForward executeMeetAdd(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response){
		ActionMessages errors=new ActionMessages();
		MeetForm meetform=(MeetForm)form;
		HttpSession session=request.getSession();
		
		LogonForm logonuser=(LogonForm)session.getAttribute("logonuser");
				
		if(!CheckUserAble.check(logonuser)){
			session.setAttribute("selectmenu2", "");
			errors.add("notAllow",new ActionMessage("office.user.noallow"));
			saveErrors(request,errors);
			return mapping.findForward("notallow");
		}
		
		session.setAttribute("selectmenu2", "meet_add");
	    boolean flag=true;
		String mark=request.getParameter("addtype");
	     if(mark==null||mark.equals(""))mark="link";
	     if(mark.equals("link"))
		  return mapping.findForward("success");
	     if(mark.equals("add")){
	    	 String time=meetform.getTime();
	    	 String speaker=meetform.getSpeaker();
	    	 String listener=meetform.getListener();
	    	 String address=meetform.getAddress();
	    	 String subject=meetform.getSubject();
	    	 String content=meetform.getContent();
	    	 if(time==null||time.equals("")){
	    		 errors.add("noTime",new ActionMessage("office.meet.notime.error"));
	    		 flag=false;
	    	 }
	    	 if(speaker==null||speaker.equals("")){
	    		 errors.add("nospeaker",new ActionMessage("office.meet.nospeaker.error"));
	    		 flag=false;
	    	 }
	    	 if(listener==null||listener.equals("")){
	    		 errors.add("nolistener",new ActionMessage("office.meet.nolistener.error"));
	    		 flag=false;
	    	 }
	    	 if(address==null||address.equals("")){
	    		 errors.add("noaddress",new ActionMessage("office.meet.noaddress.error"));
	    		 flag=false;
	    	 }
	    	 if(subject==null||subject.equals("")){
	    		 errors.add("nosubject",new ActionMessage("office.meet.nosubject.error"));
	    		 flag=false;
	    	 }
	    	 if(content==null||content.equals("")){
	    		 errors.add("nocontent",new ActionMessage("office.meet.nocontent.error"));
	    		 flag=false;
	    	 }
	         if(!flag){
	        	 saveErrors(request,errors);
	        	 return mapping.findForward("false");
	         }	        
	         String timeerrors=Change.checkdate(time);
	         if(!(timeerrors.equals("success"))){
	        	 errors.add("timeE",new ActionMessage(timeerrors));
	        	 saveErrors(request,errors);
	        	 return mapping.findForward("false");
	         }
	         DB db=new DB();
	         
	         String sql="insert into "+Content.TB_MEET+" values('"+subject+"','"+speaker+"','"+listener+"','"+time+"','"+address+"','"+content+"')";
	         int i=db.update(sql);
	         if(i==0){
	        	errors.add("addR",new ActionMessage("office.insert.false"));
	        	saveErrors(request,errors);
	        	return mapping.findForward("false");
	         }
	         else{
	        	 errors.add("addR",new ActionMessage("office.insert.success"));
	        	 saveErrors(request,errors);
	        	 meetform.clear();
	         }
	     }
	    return mapping.findForward("success");
	}
}