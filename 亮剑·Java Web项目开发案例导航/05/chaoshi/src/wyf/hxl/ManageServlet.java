package wyf.hxl;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class ManageServlet extends HttpServlet
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException
	{
		this.doPost(request,response);	
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException
	{
		request.setCharacterEncoding("GB2312");
		response.setCharacterEncoding("GB2312");
		response.setContentType("text/html;charset=GB2312");
		HttpSession session=request.getSession(true);
		PrintWriter out=response.getWriter();
		ManageBean spSearch = (ManageBean)session.getAttribute("spSearch");
		if(spSearch==null){
			spSearch = new ManageBean();
		}		
		String action=request.getParameter("action").trim();	
		if(action.equals("add"))
		{     
			String gn = request.getParameter("goodsname");
			String gt = request.getParameter("gtype");
			String gprice = request.getParameter("gprice");
			String gdate = request.getParameter("gdate");
			String gamount = request.getParameter("gamount");
			String gimgurl = request.getParameter("Gimgurl");
			String gi = request.getParameter("gintroduction");
			int shumu = Integer.parseInt(gamount);			

			String sql3 = "insert into goodsmessage(goodsname,gtype,gprice,gdate,"
			+"gamount,gimgurl,gintroduction) values('"+gn+"','"+gt+"','"
			+gprice+"',now(),"+shumu+",'"+gimgurl+"','"+gi+"')";
			sql3= new String(sql3.getBytes(),"iso-8859-1");
			int flag = DB.updateMeg(sql3);
			String msg=null;
			if(flag==0)
			{
				msg = "�����Ʒʧ�ܣ���������ӣ�����";
			}
			else
			{
				msg = "�����Ʒ�ɹ�������";			
			}
			request.setAttribute("msg",msg);
			ServletContext sc = getServletContext();			//�õ������� 
			RequestDispatcher rd = sc.getRequestDispatcher("/goodsmanage.jsp");
			rd.forward(request,response);
		}
		else if(action.equals("mandenglu"))
		{
			String mmname = request.getParameter("mmname");
			String mmpassword = request.getParameter("mmpassword");
			String cname = new String(mmname.getBytes(),"ISO-8859-1");
			String sql = "select mname from mmanager where mname='"+cname+"' and mpw='"+mmpassword+"'";
			boolean s = DB.selectMsg(sql);
			if(s)
			{
				session.setAttribute("manager",cname);
				String sql1 = "select mpermitted from mmanager where mname='"+cname+"' and mpw='"+mmpassword+"'";
				String sql11 = new String(sql1.getBytes(),"ISO-8859-1");
				String str = DB.selectAmount(sql11).trim();	
				System.out.println("str"+str+"|"+session.getId());		
				if(str.equals("chaoji"))
				{
					session.setAttribute("chaoji","chaoji");
				}
				else if(str.equals("putong"))
				{
					session.setAttribute("name",cname);
					session.setAttribute("putong","putong");
				}
				ServletContext sc = getServletContext();			//�õ������� 
				RequestDispatcher rd = sc.getRequestDispatcher("/spgltree.jsp");
				rd.forward(request,response);
			}
			else
			{
				String msg = "�Բ���,��¼ʧ��,�����µ�¼!!!";
				request.setAttribute("msg",msg);
				ServletContext sc = getServletContext();			//�õ������� 
				RequestDispatcher rd = sc.getRequestDispatcher("/admindl.jsp");
				rd.forward(request,response);
			}
		}
		else if(action.equals("tianjia"))
		{
			String mname = request.getParameter("mname");
			String mpassword = request.getParameter("mpassword");
			String mpw = request.getParameter("mpw");
			String quanxian = request.getParameter("quanxian");
			String cname = new String(mname.getBytes(),"ISO-8859-1");
			String cpw = new String(mpassword.getBytes(),"ISO-8859-1");
			String cquanxian = new String(quanxian.getBytes(),"ISO-8859-1");
			String sql = "select mname from mmanager where mname='"+cname+"'";
			boolean s = DB.selectMsg(sql);
			String msg=null;
			if(s)
			{
				msg ="�ù���Ա�Ѿ����ڣ���������ӣ�";				
			}
			else
			{
				String sql0 = "insert into mmanager(mname,mpw,mpermitted )"+" values('"+cname+"','"+cpw+"','"+cquanxian+"')";
				int flag=DB.updateMeg(sql0);
				if(flag==0)
				{
					msg = "���ʧ�ܣ���������ӣ�";
				}
				else
				{
					msg="��ϲ��������Ա��ӳɹ���";					
				}	
			}
			request.setAttribute("msg",msg);
			ServletContext sc = getServletContext();			//�õ������� 
			RequestDispatcher rd = sc.getRequestDispatcher("/manzc.jsp");
			rd.forward(request,response);						
		}
		else if(action.equals("mandelete"))
		{
			String mname = request.getParameter("mname").trim();
    		String sql = "delete from mmanager where mname='"+mname+"'";
    		sql = new String(sql.getBytes(),"ISO-8859-1");
    		int i = DB.updateMeg(sql);
    		String msg=null;
    		if(i==1)
    		{
    			msg = "��ϲ��,����Աɾ���ɹ�!!!";
    		}
    		else
    		{
    			msg = "�Բ���,����Աɾ��ʧ��!!!";
    		}
			request.setAttribute("msg",msg);
			ServletContext sc = getServletContext();			//�õ������� 
			RequestDispatcher rd = sc.getRequestDispatcher("/mandelete.jsp");
			rd.forward(request,response);						    		
		}
		else if(action.equals("resetpwd"))
    	{//��������ʱ
    		String aname = request.getParameter("aname").trim();
    		String apwd = request.getParameter("apwd").trim();
    		String temp = "select * from mmanager where mname='"+aname+"'";
    		temp = new String(temp.getBytes(),"ISO-8859-1");
    		boolean flag = DB.selectMsg(temp);
    		String msg =null;
    		if(!flag)
    		{
    			msg = "�Բ���,�û����������!!!";
    		}
    		else
    		{
    			String sql = "update mmanager set mpw='"+apwd+"' where mname='"+aname+"'";
    			sql = new String(sql.getBytes(),"ISO-8859-1");
    			int i = DB.updateMeg(sql);
    			if(i==1)
    			{
    				msg = "��ϲ��,�������óɹ�!!!";
    			}
    			else
    			{
    				msg = "�Բ���,��������ʧ��!!!";
    			}
    		}
			request.setAttribute("msg",msg);
			ServletContext sc = getServletContext();			//�õ������� 
			RequestDispatcher rd = sc.getRequestDispatcher("/manchangepw.jsp");
			rd.forward(request,response);    		
    	}
    	else if(action.equals("logout"))
		{
			//������Աע����¼ʱ
    		//ʹsessionʧЧ
    		request.getSession(true).invalidate();
    		this.getServletContext().getRequestDispatcher("/admindl.jsp").forward(request,response);
			return;	
    	}
    	else if(action.equals("goodsdelete"))
		{
			String goodsid = request.getParameter("goodsid").trim();
			int gid=Integer.parseInt(goodsid);
			String sqlorder="select count(*) from ordergoodsmeg where goodsid="+gid;
			boolean flag = DB.selectMsg(sqlorder);
			String msg=null;
			if(flag)
			{
				msg=goodsid+"����Ʒ�Ѿ��۳���Ϊ��ͳ��\\n��Ŀ���㣬�ʲ���ɾ����";
			}
			else
			{				
	    		String sql = "delete from goodsmessage where goodsid="+goodsid;
	    		int i = DB.updateMeg(sql);
	    		if(i==1)
	    		{
	    			msg=goodsid+"����Ʒɾ���ɹ���";
	    		}
	    		else
	    		{
	                msg=goodsid+"����Ʒɾ��ʧ�ܣ�";
	    		}				
			}
    		request.setAttribute("msg",msg);
		    String url = "/goodsmd.jsp";
			ServletContext sc = getServletContext();
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request,response);
		}
		else if(action.equals("goodsxiugai"))
		{
			//�õ��޸���Ʒ����Ϣ
    		String goodsname = request.getParameter("goodsname").trim();
    		String gtype = request.getParameter("splx").trim();
    		String gprice = request.getParameter("spjg").trim();
    		String gdate = request.getParameter("sjqq").trim();
    		String gamount = request.getParameter("spsl").trim();
    		String gimgurl = request.getParameter("url").trim();
    		String gintroduction = request.getParameter("gintroduction").trim();
    		String goodsid=request.getParameter("goodsid").trim();			
			int gnum = Integer.parseInt(gamount);
			double gjg = Double.parseDouble(gprice);
			String sql = "update goodsmessage  set goodsname='"+goodsname+"',gtype='"+gtype+
			"',gprice="+gjg+",gdate='"+gdate+"',gamount="+gnum+",gimgurl='"+gimgurl+
			"',gintroduction='"+gintroduction+"' where goodsid="+goodsid;
			sql = new String(sql.getBytes(),"iso-8859-1");
			int i = DB.updateMeg(sql);
			String msg =null;
			if(i==1)
			{
				msg=goodsid+"����Ʒ��Ϣ�޸ĳɹ���";
			}
			else
			{
				msg = "�Բ���,�޸�ʧ��!!!";
			}
			request.setAttribute("msg",msg);
			String url = "/goodsmd.jsp";
			ServletContext sc = getServletContext();
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request,response);	
	    }
	    else if(action.equals("orderxiugai"))
		{			
			//�õ��޸Ķ�������Ϣ
    		String oid  = request.getParameter("oid").trim();
			int gnum = Integer.parseInt(oid);
			String sql = "update ordermeg  set zhuangtai='�ѷ���' where oid="+gnum;
			sql = new String(sql.getBytes(),"iso-8859-1");
			int i = DB.updateMeg(sql);
			String msg=null;
			if(i==1)
			{
				msg = "��ϲ��,"+oid+"�Ŷ������ͳɹ�!!!";
			}
			else
			{
				msg = "�Բ���,"+oid+"�Ŷ�������ʧ��!!!";
			}
			request.setAttribute("msg",msg);
			String ddfs=(String)session.getAttribute("ddfs");
			if(ddfs==null)
			{
				ddfs="ordergl";
			}
			this.getServletContext().getRequestDispatcher("/ManageServlet?action="+ddfs).forward(request,response);	
	    }
	    else if(action.equals("searchorder"))
	    {
	     	String ddfs=(String)session.getAttribute("ddfs");
			if(ddfs==null)
			{
				ddfs="ordergl";
			}	
		    String ddtitle="";
		    String ddmsg="";
			if(ddfs.equals("ordergl"))
			{
			   ddtitle="";
			   ddmsg="";
			}
		    else if(ddfs.equals("orderyfs"))
			{
			   ddtitle=" and zhuangtai='�ѷ���'";
			   ddmsg="�ѷ���";
			}
		    else if(ddfs.equals("orderwfs"))
			{
			   ddtitle=" and zhuangtai='δ����'";
			   ddmsg="δ����";
			}	    	
	    	String oid = request.getParameter("searchorder").trim();
	    	String msg=null;
	   		if(oid.equals(""))
	    	{
	    		msg = "������Ҫ��ѯ�Ķ����Ķ����ţ���";				
	    	}
	    	else
	    	{
	    		int ss = Integer.parseInt(oid);
		    	String sql = "select oid,cname,receivename,receiveadds,receivetel,allmoney,"+
		    	"zhuangtai from ordermeg where oid="+ss+ddtitle;
		      	String sql11 = new String(sql.getBytes(),"ISO-8859-1");
		      	Vector<String[]> vv = DB.getMessage(sql11);
		      	request.setAttribute("vv",vv);	
		      	if(vv.size()==0)
		      	{
		      		msg="�Բ���û��"+oid+"��"+ddmsg+"��������Ϣ��";
		      	}			
	    	}
	    	request.setAttribute("msg",msg);
	    	ServletContext sc = getServletContext(); 
		    RequestDispatcher rd = sc.getRequestDispatcher("/orderdetail.jsp"); 
			rd.forward(request,response);	    	 
	    }
	    else if(action.equals("searchgoods"))
	    {	
			String searchgoods = request.getParameter("searchgoods").trim();
			spSearch.setShowPage(1);
			String searchth = new String(searchgoods.getBytes(),"ISO-8859-1");
			String sql = "select goodsname,gtype,gprice,gdate,gamount,gimgurl,gintroduction,"
			             +"goodsid from goodsmessage where goodsname like '%"+searchth+"%'";
			spSearch.setSql(sql);
			int totolPage = DB.totolPage(sql);
			spSearch.setTotolPage(totolPage);	
			Vector<String[]> vv = DB.selectPageMeg(1,sql);
			if(vv.size()==0)
			{
				String msg = "û�в�ѯ�������Ϣ����";
				request.setAttribute("msg",msg);
			}
			request.setAttribute("vv",vv);
			String url = "/goodsmd.jsp";
			ServletContext sc = getServletContext();
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request,response);				
		}
	    else if(action.equals("next"))
		{	
			int p=spSearch.getShowPage();
			int q=spSearch.getTotolPage();
			if(p<q)
			{
				p++;
			}
			spSearch.setShowPage(p);
			String sql11="select goodsname,gtype,gprice,gdate,gamount,gimgurl,gintroduction,goodsid from goodsmessage";
			String sql111=new String(sql11.getBytes(),"iso-8859-1");
			spSearch.setSql(sql111);
			String sql=spSearch.getSql();
			Vector<String[]> vv =DB.selectPageMeg(p,sql);	
			request.setAttribute("vv",vv);
			String url="";
			if(vv==null)
			{
				String sqli="select goodsid,goodsname,gprice,gtype,gimgurl,gamount,gintroduction from goodsmessage";
				spSearch.setShowPage(1);
				int nowpage = spSearch.getShowPage();
		        int totolpage = DB.totolPage("select * from goodsmessage");
		        spSearch.setTotolPage(totolpage);
		        spSearch.setSql(sqli);
				vv = DB.selectPageMeg(nowpage,sqli);
				url = "/goodsmd.jsp";				
				ServletContext sc = getServletContext(); 
				RequestDispatcher rd = sc.getRequestDispatcher(url); 
				rd.forward(request,response);
			}
			else
			{
				url = "/goodsmd.jsp";	
				ServletContext sc = getServletContext(); 
				RequestDispatcher rd = sc.getRequestDispatcher(url); 
				rd.forward(request,response);
			}			
		}	
		else if(action.equals("before"))
		{	
			int p=spSearch.getShowPage();
			if(p>1){
				p--;
			}
			spSearch.setShowPage(p);
			String sql=spSearch.getSql();
			Vector<String[]> vv =DB.selectPageMeg(p,sql);	
			request.setAttribute("vv",vv);
			String url = "/goodsmd.jsp";
			ServletContext sc = getServletContext(); 
			RequestDispatcher rd = sc.getRequestDispatcher(url); 
			rd.forward(request,response); 
		}
		else if(action.equals("pageChange"))
		{
			String  page =request.getParameter("changePage");
			int p = Integer.parseInt(page.trim());
			spSearch.setShowPage(p);
			String sql=spSearch.getSql();
			Vector<String[]> vv =DB.selectPageMeg(spSearch.getShowPage(),sql);	
			request.setAttribute("vv",vv);
			String url = "/goodsmd.jsp";
			ServletContext sc = getServletContext(); 
			RequestDispatcher rd = sc.getRequestDispatcher(url); 
			rd.forward(request,response); 
		}
		else if(action.equals("next1"))
		{	
			int p=spSearch.getShowPage();
			int q=spSearch.getTotolPage();
			if(p<q)
			{
				p++;
			}
			spSearch.setShowPage(p);
			String sql11="select goodsname,gtype,gprice,gdate,gamount,gimgurl,gintroduction,goodsid from goodsmessage";
			String sql111=new String(sql11.getBytes(),"iso-8859-1");
			spSearch.setSql(sql111);
			String sql=spSearch.getSql();
			Vector<String[]> vv =DB.selectPageMeg(p,sql);	
			request.setAttribute("vv",vv);
			String url="";
			if(vv==null)
			{
				String sqli="select goodsid,goodsname,gprice,gtype,gimgurl,gamount,gintroduction from goodsmessage";
				spSearch.setShowPage(1);
				int nowpage = spSearch.getShowPage();
		        int totolpage = DB.totolPage("select * from goodsmessage");
		        spSearch.setTotolPage(totolpage);
		        spSearch.setSql(sqli);
				vv = DB.selectPageMeg(nowpage,sqli);
				url = "/goodsmd.jsp";				
				ServletContext sc = getServletContext(); 
				RequestDispatcher rd = sc.getRequestDispatcher(url); 
				rd.forward(request,response);
			}
			else
			{
				url = "/goodsmd.jsp";	
				ServletContext sc = getServletContext(); 
				RequestDispatcher rd = sc.getRequestDispatcher(url); 
				rd.forward(request,response);
			}
			
		}	
		else if(action.equals("before1"))
		{	
			int p=spSearch.getShowPage();
			if(p>1){
				p--;
			}
			spSearch.setShowPage(p);
			String sql=spSearch.getSql();
			Vector<String[]> vv =DB.selectPageMeg(p,sql);	
			request.setAttribute("vv",vv);
			String url = "/goodsmd.jsp";
			ServletContext sc = getServletContext(); 
			RequestDispatcher rd = sc.getRequestDispatcher(url); 
			rd.forward(request,response); 
		}
		else if(action.equals("pageChange1"))
		{
			String  page =request.getParameter("changePage1");
			int p = Integer.parseInt(page.trim());
			spSearch.setShowPage(p);
			String sql=spSearch.getSql();
			Vector<String[]> vv =DB.selectPageMeg(spSearch.getShowPage(),sql);	
			request.setAttribute("vv",vv);
			String url = "/goodsmd.jsp";
			ServletContext sc = getServletContext(); 
			RequestDispatcher rd = sc.getRequestDispatcher(url); 
			rd.forward(request,response); 
		}
		else if(action.equals("ordergl"))
		{
		    String chaoji=(String)session.getAttribute("chaoji");
		    String putongF=(String)session.getAttribute("putong");
		    if(chaoji==null&&putongF==null)
		    {
		      request.setAttribute("msg", "�Բ���ֻ�й���Ա�ſ���\\nʹ�ô���ܣ����½��");
	          this.getServletContext().getRequestDispatcher("/dl.jsp").forward(request,response);
	          return;
		    }			
			String pxfs=request.getParameter("pxfs");
			if(pxfs==null)
			{
				pxfs="asc";
			}			
			session.setAttribute("pxfs",pxfs);
			session.setAttribute("ddfs","ordergl");			
			spSearch.setShowPage(1);
			String sql = "select oid,cname,receivename,receiveadds,receivetel,allmoney,"+
	      	"zhuangtai,buytime from ordermeg order by buytime "+pxfs;
	        sql = new String(sql.getBytes(),"ISO-8859-1");
	        spSearch.setSql(sql);
			int totolPage = DB.totolPage(sql);
			spSearch.setTotolPage(totolPage);	
			Vector<String[]> vv = DB.selectPageMeg(1,sql);
	      	request.setAttribute("vv",vv);
	      	session.setAttribute("spSearch",spSearch);
	      	if(vv.size()==0)
	      	{
	      		String msg = "�Բ���,û�ж�����";
				request.setAttribute("msg",msg);
				String url = "/welcome.jsp";
				ServletContext sc = getServletContext(); 
				RequestDispatcher rd = sc.getRequestDispatcher(url); 
				rd.forward(request,response); 
	      	}
	      	else
	      	{
	      		
	      		String url = "/ordercx.jsp";
				ServletContext sc = getServletContext(); 
				RequestDispatcher rd = sc.getRequestDispatcher(url); 
				rd.forward(request,response); 
	      	}
	    }
	    else if(action.equals("xia"))
		{	
			int p=spSearch.getShowPage();
			int q=spSearch.getTotolPage();			
			if(p<q)
			{
				p++;
			}
			spSearch.setShowPage(p);
			String sqle=spSearch.getSql();
			Vector<String[]> vv3 =DB.selectPageMeg(p,sqle);	
			request.setAttribute("vv",vv3);
			String url = "/ordercx.jsp";
			ServletContext sc = getServletContext(); 
			RequestDispatcher rd = sc.getRequestDispatcher(url); 
			rd.forward(request,response); 
		}
		else if(action.equals("qian"))
		{	
			int p=spSearch.getShowPage();
			if(p>1){
				p--;
			}			
			spSearch.setShowPage(p);
			String sqlw=spSearch.getSql();
			Vector<String[]> vv2 =DB.selectPageMeg(p,sqlw);	
			request.setAttribute("vv",vv2);
			String url = "/ordercx.jsp";
			ServletContext sc = getServletContext(); 
			RequestDispatcher rd = sc.getRequestDispatcher(url); 
			rd.forward(request,response); 
		}
		else if(action.equals("huan"))
		{
			String  page =request.getParameter("huan");
			int p = Integer.parseInt(page.trim());
			spSearch.setShowPage(p);
			String sqlq=spSearch.getSql();
			Vector<String[]> vv1=DB.selectPageMeg(spSearch.getShowPage(),sqlq);	
			request.setAttribute("vv",vv1);
			String url = "/ordercx.jsp";
			ServletContext sc = getServletContext(); 
			RequestDispatcher rd = sc.getRequestDispatcher(url); 
			rd.forward(request,response); 
		}
		else if(action.equals("orderyfs"))
		{
		    String chaoji=(String)session.getAttribute("chaoji");
		    String putongF=(String)session.getAttribute("putong");
		    if(chaoji==null&&putongF==null)
		    {
		      request.setAttribute("msg", "�Բ���ֻ�й���Ա�ſ���\\nʹ�ô���ܣ����½��");
	          this.getServletContext().getRequestDispatcher("/dl.jsp").forward(request,response);
	          return;
		    }		    
			String pxfs=request.getParameter("pxfs");
			if(pxfs==null)
			{
				pxfs="asc";
			}			
			session.setAttribute("pxfs",pxfs);		  
			session.setAttribute("ddfs","orderyfs");		    
			spSearch.setShowPage(1);
			String sql = "select oid,cname,receivename,receiveadds,receivetel,allmoney,"+
	      	"zhuangtai,buytime from ordermeg where zhuangtai='�ѷ���' order by buytime "+pxfs;
	        sql = new String(sql.getBytes(),"ISO-8859-1");
	        spSearch.setSql(sql);
			int totolPage = DB.totolPage(sql);
			spSearch.setTotolPage(totolPage);	
			Vector<String[]> vvyfs = DB.selectPageMeg(1,sql);	      	
	      	if(vvyfs.size()==0)
	      	{
	      		String msg = "�Բ���,û�ж�����";
				request.setAttribute("msg",msg);
				String url = "/welcome.jsp";
				ServletContext sc = getServletContext(); 
				RequestDispatcher rd = sc.getRequestDispatcher(url); 
				rd.forward(request,response); 
	      	}
	      	else
	      	{
	      		request.setAttribute("vv",vvyfs);
	      		session.setAttribute("spSearch",spSearch);
	      		String url = "/ordercx.jsp";
				ServletContext sc = getServletContext(); 
				RequestDispatcher rd = sc.getRequestDispatcher(url); 
				rd.forward(request,response); 
	      	}
	   	}
	   	else if(action.equals("orderwfs"))
		{
		    String chaoji=(String)session.getAttribute("chaoji");
		    String putongF=(String)session.getAttribute("putong");
		    if(chaoji==null&&putongF==null)
		    {
		      request.setAttribute("msg", "�Բ���ֻ�й���Ա�ſ���\\nʹ�ô���ܣ����½��");
	          this.getServletContext().getRequestDispatcher("/dl.jsp").forward(request,response);
	          return;
		    }    
			String pxfs=request.getParameter("pxfs");
			if(pxfs==null)
			{
				pxfs="asc";
			}			
			session.setAttribute("pxfs",pxfs);		  
			session.setAttribute("ddfs","orderwfs");   
			spSearch.setShowPage(1);
			String sql = "select oid,cname,receivename,receiveadds,receivetel,allmoney,"+
	      	"zhuangtai,buytime from ordermeg where zhuangtai='δ����' order by buytime "+pxfs;
	        sql = new String(sql.getBytes(),"ISO-8859-1");
	        spSearch.setSql(sql);
			int totolPage = DB.totolPage(sql);
			spSearch.setTotolPage(totolPage);	
			Vector<String[]> vvwfs = DB.selectPageMeg(1,sql);	      	
	      	if(vvwfs.size()==0)
	      	{
	      		String msg = "�Բ���,û��δ���͵Ķ�����\\nϵͳ����ת�ػ�ӭҳ��";
				request.setAttribute("msg",msg);
				String url = "/welcome.jsp";
				ServletContext sc = getServletContext(); 
				RequestDispatcher rd = sc.getRequestDispatcher(url); 
				rd.forward(request,response); 
	      	}
	      	else
	      	{
	      		request.setAttribute("vv",vvwfs);
	      		session.setAttribute("spSearch",spSearch);
	      		String url = "/ordercx.jsp";
				ServletContext sc = getServletContext(); 
				RequestDispatcher rd = sc.getRequestDispatcher(url); 
				rd.forward(request,response); 
	      	}
	    }
	    else if(action.equals("chakan"))
		{		
	     	String mname = request.getParameter("oid").trim();
			int mmname=Integer.parseInt(mname); 
	      	String sql="select oid,cname,receivename,receiveadds,receivetel,"
	      	+"allmoney,zhuangtai,buytime from ordermeg where oid="+mmname;
	        sql = new String(sql.getBytes(),"ISO-8859-1");
	      	Vector<String[]> vl = DB.getMessage(sql);
	      	if(vl.size()==0)
	      	{
		      	String msg = "�Բ���,û�ж�����";
				request.setAttribute("msg",msg);
				String url = "/welcome.jsp";
				ServletContext sc = getServletContext(); 
				RequestDispatcher rd = sc.getRequestDispatcher(url); 
				rd.forward(request,response); 
	      	}
	      	else
	      	{
	      	
	      		request.setAttribute("vv",vl);
	      		session.setAttribute("spSearch",spSearch);
				String url = "/orderdetail.jsp";//forward��Ҫȥ��ҳ��
				ServletContext sc = getServletContext(); 
				RequestDispatcher rd = sc.getRequestDispatcher(url); 
				rd.forward(request,response); 				
	      	}
		}		
	}
	public void pageForward(String msg,HttpServletRequest request,HttpServletResponse response)
    							throws ServletException,IOException
    {
		request.setAttribute("msg",msg);
		String url = "/houtaierror.jsp";
		ServletContext sc = getServletContext(); 
		RequestDispatcher rd = sc.getRequestDispatcher(url); 
		rd.forward(request,response);   	
    }	
}		