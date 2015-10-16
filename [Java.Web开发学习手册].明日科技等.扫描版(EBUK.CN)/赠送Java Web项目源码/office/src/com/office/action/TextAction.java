package com.office.action;

import java.sql.ResultSet;
import java.sql.Statement;
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
import com.office.actionform.TextForm;
import com.office.dao.Content;
import com.office.dao.DB;
import com.office.tools.Change;
import com.office.tools.CheckUserAble;
public class TextAction extends Action {
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
		if(mark.equals("text_look_get"))
			forward=executeTextLookGet(mapping,form,request,response);
		if(mark.equals("text_look_send"))
			forward=executeTextLookSend(mapping,form,request,response);
		if(mark.equals("text_sigle_look"))
			forward=executeTextSigleLook(mapping,form,request,response);
		if(mark.equals("text_add"))
			forward=executeTextAdd(mapping,form,request,response);
		if(mark.equals("text_del"))
			forward=executeTextDel(mapping,form,request,response);
		return forward;
	}
	
	public ActionForward executeTextLookGet(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response){
		ArrayList gettextlist=new ArrayList();
		HttpSession session=request.getSession();
		
		session.setAttribute("selectmenu2","text_look");
		session.setAttribute("selectmenu3","text_look_get");
		LogonForm logonuser=(LogonForm)session.getAttribute("logonuser");
		String user=logonuser.getUsername();
		String sql_get="select * from "+Content.TB_TEXT+" where "+Content.TEXTGETER+" ='"+user+"' and "+Content.TEXTDELGETER+"='0'"+" order by "+Content.TEXTMARK+" desc,"+Content.TEXTSENDTIME+" desc";
		String str_currentpage=request.getParameter("page");
        if(str_currentpage==null||str_currentpage.equals(""))
			 str_currentpage="0";
		int currentpage=Change.strtoint(str_currentpage);
		if(currentpage<=0)
			currentpage=1;
	    
		DB db=new DB();
	    gettextlist=db.getalltextlist(sql_get,currentpage);
        db.closed();
	    session.setAttribute("numrs",Integer.toString(db.getNumrs()));
	    session.setAttribute("numper", Integer.toString(db.getNumper()));
	    session.setAttribute("currentpage",Integer.toString(db.getCurrentPage()));
	    session.setAttribute("numpages", Integer.toString(db.getNumPages()));
	    session.setAttribute("gettextlist",gettextlist);
	    
		return mapping.findForward("success");
	}
	
	public ActionForward executeTextLookSend(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response){
		ArrayList sendtextlist=new ArrayList();
		HttpSession session=request.getSession();
		LogonForm logonuser=(LogonForm)session.getAttribute("logonuser");
		String user=logonuser.getUsername();
		session.setAttribute("selectmenu3", "text_look_send");
	    String sql_send="select * from "+Content.TB_TEXT+" where "+Content.TEXTSENDER+" ='"+user+"' and "+Content.TEXTDELSENDER+"='0' order by "+Content.TEXTSENDTIME+" desc";
	    String str_currentpage=request.getParameter("page");
        if(str_currentpage==null||str_currentpage.equals(""))
			 str_currentpage="0";
		int currentpage=Change.strtoint(str_currentpage);
		if(currentpage<=0)
			currentpage=1;
	    
		DB db=new DB();
	    sendtextlist=db.getalltextlist(sql_send,currentpage);
        db.closed();
	    session.setAttribute("numrs",Integer.toString(db.getNumrs()));
	    session.setAttribute("numper", Integer.toString(db.getNumper()));
	    session.setAttribute("currentpage",Integer.toString(db.getCurrentPage()));
	    session.setAttribute("numpages", Integer.toString(db.getNumPages()));
	    session.setAttribute("sendtextlist",sendtextlist);
		
	    return mapping.findForward("success");
	}
	
	public ActionForward executeTextSigleLook(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response){
		HttpSession session=request.getSession();
		TextForm textform=(TextForm)form; 
		ArrayList textlist=new ArrayList();
		String lookid1=request.getParameter("id");
		 if(lookid1==null||lookid1.equals(""))lookid1="0";
		int lookid=Change.strtoint(lookid1);
		String action=request.getParameter("from");
		 if(action==null||action.equals(""))action="get";
		if(action.equals("get"))
			textlist=(ArrayList)session.getAttribute("gettextlist");
		else if(action.equals("send"))
			textlist=(ArrayList)session.getAttribute("sendtextlist");
		boolean flag=false;
		if(textlist!=null||textlist.size()!=0){
			for(int i=0;i<textlist.size();i++){
			    TextForm textsigleform=(TextForm)textlist.get(i);
			    if(lookid==textsigleform.getTextid()){
			    	flag=true;
				    textform.setSubject(textsigleform.getSubject());
	    		    textform.setSender(textsigleform.getSender());
	    		    textform.setGeter(textsigleform.getGeter());
	    		    textform.setContent(textsigleform.getContent());
	    		    textform.setSendtime(textsigleform.getSendtime());
	    		    break;
			    }
			}
		}
		if(!flag){
			ActionMessages errors=new ActionMessages();
			errors.add("lookR",new ActionMessage("office.text.look.sigle.error"));
			saveErrors(request,errors);
			return mapping.findForward("looksiglewrong");
		}
		String fromwhere=request.getParameter("from");
		if(fromwhere==null)fromwhere="";
		if(fromwhere.equals("get")){
			DB db=new DB();
		    String sql="update "+Content.TB_TEXT+" set "+Content.TEXTMARK+"='0' where "+Content.TEXTID+"="+lookid;
		    int i=db.update(sql);
		    db.closed();
		    if(i==0){
			    ActionMessages errors=new ActionMessages();
			    errors.add("updateR",new ActionMessage("office.update.false"));
			    saveErrors(request,errors);
			    return mapping.findForward("false");
		    }
		}
		return mapping.findForward("success");
	}
	
	public ActionForward executeTextDel(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response){
		ActionMessages errors=new ActionMessages();
		HttpSession session=request.getSession();
		
		LogonForm logonuser=(LogonForm)session.getAttribute("logonuser");
				
		if(!CheckUserAble.check(logonuser)){
			session.setAttribute("selectmenu2", "");
			errors.add("notAllow",new ActionMessage("office.user.noallow"));
			saveErrors(request,errors);
			return mapping.findForward("notallow");
		}
		
		String from=request.getParameter("from");
		if(!"send".equals(from))
			from="get";
		
		String strid=request.getParameter("id");
		if(strid==null)
			strid="0";
		int id=Change.strtoint(strid);		
		
		String sql="select * from "+Content.TB_TEXT+" where "+Content.TEXTID+"="+id;
		DB db=new DB();
		ResultSet rs=db.getRs(sql);
		try{
    		if(rs.next()){	    		
			    String delgetter=rs.getString(Content.TEXTDELGETER);
			    String delsender=rs.getString(Content.TEXTDELSENDER);
			    if("get".equals(from)){						//如果删除的是“收件箱”里的公文
                    if(delsender.equals("1"))                          	//判断该公文是否被发送者从他的发件箱中删除。如果删除，则从数据表中删除该公文
                        sql="delete from "+Content.TB_TEXT+" where "+Content.TEXTID+"="+id;
                    else if(delsender.equals("0"))                    	//判断该公文是否没有被发送者从他的发件箱中删除。如果没有删除，则将该公文标记为“已被公文接收者删除”状态
                        sql="update "+Content.TB_TEXT+" set "+Content.TEXTDELGETER+"=1 where "+Content.TEXTID+"="+id;                  
                } 
			    else if("send".equals(from)){				//如果删除的是“发件箱”里的公文
                    if(delgetter.equals("1"))                          	//判断该公文是否被接收者从他的收件箱中删除。如果删除，则从数据表中删除该公文
                        sql="delete from "+Content.TB_TEXT+" where "+Content.TEXTID+"="+id;
                    else if(delgetter.equals("0"))                    	//判断该公文是否没有被接收者从他的收件箱中删除。如果没有删除，则将该公文标记为“已被公文发送者删除”状态
                        sql="update "+Content.TB_TEXT+" set "+Content.TEXTDELSENDER+"=1 where "+Content.TEXTID+"="+id;                  
                } 
			    Statement stm=db.getStm();
			    boolean ok=stm.execute(sql);					//调用execute()方法来执行一个功能不确定的SQL语句
			    if(ok)											//返回true，则表示调用execute()方法执行SQL语句后，返回的是一个ResultSet结果集合；返回false，则表示调用execute()方法执行SQL语句后，返回的是更新记录的数量
			    	errors.add("deleteR",new ActionMessage("office.del.false"));
			    else
			    	errors.add("deleteR",new ActionMessage("office.del.success"));			    	
		    }
    		else
    			errors.add("deleteR",new ActionMessage("office.del.false"));		    	
    		saveErrors(request,errors);
		}catch(Exception e){e.printStackTrace();}

		return mapping.findForward(from);
	}
	
	public ActionForward executeTextAdd(ActionMapping mapping, ActionForm form,HttpServletRequest request, HttpServletResponse response){
		ActionMessages errors=new ActionMessages();
		HttpSession session=request.getSession();
		session.setAttribute("selectmenu1", "text");
		session.setAttribute("selectmenu2", "text_add");
		LogonForm logonuser=(LogonForm)session.getAttribute("logonuser");
		
		if(!CheckUserAble.check(logonuser)){
			errors.add("notAllow",new ActionMessage("office.user.noallow"));
			saveErrors(request,errors);
			return mapping.findForward("notallow");
		}
		String type=request.getParameter("addtype");
		if(type==null||type.equals(""))type="link";
		if(type.equals("link"))
			return mapping.findForward("success");
		TextForm textform=(TextForm)form;
	    String geter=textform.getGeter();
	     if(geter==null)geter="";
	    String sender=logonuser.getUsername();
	        
	    String subject=textform.getSubject();
	     if(subject==null||subject.equals(""))subject="无标题!";
	    String content=textform.getContent();
	     if(content==null||content.equals(""))content="无内容";
	    String mark="1";
	    String sendtime=Change.datetostr(new Date());
	    boolean falg=true;
	    if(geter.equals("")){
	    	errors.add("nogeter",new ActionMessage("office.text.add.nogeter"));
	        saveErrors(request,errors);
	        falg=false;
	    }
	    if(!falg){
	    	return mapping.findForward("false");
	    }
	   
	    
	    DB db=new DB();
	    String sql="insert into "+Content.TB_TEXT+" values('"+subject+"','"+sender+"','"+geter+"','"+mark+"','"+content+"','"+sendtime+"','0','0')";
	    int k=db.inseart(sql);
	    db.closed();
	    if(k==0){
	    	errors.add("addR",new ActionMessage("office.insert.false"));
	    	saveErrors(request,errors);
	    	return mapping.findForward("false");
	    }
	    textform.clear();
	    errors.add("addR",new ActionMessage("office.insert.success"));
	    saveErrors(request,errors);
	    return mapping.findForward("success");
	    
	}	
}