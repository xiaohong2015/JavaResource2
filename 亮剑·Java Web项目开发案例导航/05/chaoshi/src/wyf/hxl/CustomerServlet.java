package wyf.hxl;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class CustomerServlet extends HttpServlet
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
		PaginationBean handlePage = (PaginationBean)session.getAttribute("handlePage");
		if(handlePage==null){
			handlePage = new PaginationBean();
			session.setAttribute("handlePage",handlePage);
		}		
		String action=request.getParameter("action");
		if(action==null){return;}
		if(action.equals("denglu"))	
		{
			String zname = request.getParameter("zname");
			String zpassword = request.getParameter("zpassword");
			String cname = new String(zname.getBytes(),"ISO-8859-1");
			String sql = "select cname from gcustomer where cname='"+cname+"' and cpw='"+zpassword+"'";
			boolean s = DB.selectMsg(sql);
			if(s)
			{
				session.setAttribute("user",zname);
				String fromWhere=(String)session.getAttribute("fromWhere");
				if(fromWhere!=null)
				{
					if(fromWhere.equals("jz"))
					{//�ؽ���
						this.getServletContext().getRequestDispatcher("/CustomerServlet?action=jiezhang").forward(request,response);
						return;
					}
					else if(fromWhere.equals("wddd"))
					{//���ҵĶ���
						this.getServletContext().getRequestDispatcher("/CustomerServlet?action=modify2").forward(request,response);
						return;						
					}
					else if(fromWhere.equals("mmcz"))
					{//����������
						this.getServletContext().getRequestDispatcher("/customerpwchange.jsp").forward(request,response);
						return;						
					}										
				}		
				this.getServletContext().getRequestDispatcher("/pagination.jsp").forward(request,response);
			}		
		    else
		    {
			   String msg = "�Բ���,��¼ʧ��,�����µ�¼!!!";
			   request.setAttribute("msg",msg);
			   this.getServletContext().getRequestDispatcher("/customermanage.jsp").forward(request,response);
		    }
		}
		else if(action.equals("zhuce")){
			String zname = request.getParameter("cname");
			String zpassword = request.getParameter("cpassword");
			String spw = request.getParameter("spw");
			String email = request.getParameter("email");
			String cname = new String(zname.getBytes(),"ISO-8859-1");
			String cpw = new String(zpassword.getBytes(),"ISO-8859-1");
			String cemail = new String(email.getBytes(),"ISO-8859-1");
			String sql = "select cname from gcustomer where cname='"+cname+"'";
			boolean s = DB.selectMsg(sql);
			if(s)
			{
				String msg ="������������������ע�ᣡ��";
				request.setAttribute("msg",msg);
				this.getServletContext().getRequestDispatcher("/customerzc.jsp").forward(request,response);
			}
			else{
				String sql0 = "insert into gcustomer(cname,cpw,cemail)"+" values('"+cname+"','"+cpw+"','"+cemail+"')";
				int flag=DB.updateMeg(sql0);
				if(flag==0)	
				{
					String msg = "ע��ʧ�ܣ�������ע�ᣡ��";
					request.setAttribute("msg",msg);
					this.getServletContext().getRequestDispatcher("/customerzc.jsp").forward(request,response);
				}
				else{
					session.setAttribute("user",cname);
					this.getServletContext().getRequestDispatcher("/pagination.jsp").forward(request,response);
				}
			}
		}
		else if(action.equals("resetpwd"))
    	{//��������ʱ
    		String aname = (String)session.getAttribute("user");
    		String apwd = request.getParameter("apwd").trim();
    		String temp = "select * from gcustomer where cname='"+aname+"'";
    		temp = new String(temp.getBytes(),"ISO-8859-1");
    		boolean flag = DB.selectMsg(temp);
    		String msg = "";
    		if(!flag)
    		{
    			msg = "�Բ���,�û�������";
    		}
    		else
    		{
    			String sql = "update gcustomer set cpw='"+apwd+"' where cname='"+aname+"'";
    			sql = new String(sql.getBytes(),"ISO-8859-1");
    			int i = DB.updateMeg(sql);
    			if(i==1)
    			{
    				msg="��ϲ��,�����޸ĳɹ���";
    			}
    			else
    			{
    				msg = "�Բ���,�����޸�ʧ�ܣ�";    				
    			}
    		}
    		request.setAttribute("msg",msg);
    		this.getServletContext().getRequestDispatcher("/customerpwchange.jsp").forward(request,response);
    	}
		else if(action.equals("logout"))
		{
			//���û�ע����¼ʱ
    		//ʹsessionʧЧ
    		request.getSession(true).invalidate();
    		response.sendRedirect("pagination.jsp");
    	}
    	else if(action.equals("quanbuxinxi"))
    	{
			handlePage.setShowPage(1);
			String sql = "select goodsid,goodsname,gprice,gtype,gimgurl,gamount from goodsmessage";
			handlePage.setSql(sql);
			int totolPage = DB.totolPage(sql);
			handlePage.setTotolPage(totolPage);	
			Vector<String[]> vv = DB.selectPageMeg(1,sql);
			if(vv.size()==0)
			{
				String msg = "�̳��Ѿ��ۿ���Ʒ����";
				pageForward(msg,request,response);
			}
			else
			{
				request.setAttribute("vv",vv);
    			String url = "/pagination.jsp";
				ServletContext sc = getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher(url);
				rd.forward(request,response);
			}
    	}
		else if(action.equals("searchthing"))
		{	
			String searchthing = request.getParameter("searchthings").trim();
			handlePage.setShowPage(1);
			String searchth = new String(searchthing.getBytes(),"ISO-8859-1");
			String sql = "select goodsid,goodsname,gprice,gtype,gimgurl,gamount "
			             +" from goodsmessage where goodsname like '%"+searchth+"%'";
			handlePage.setSql(sql);
			int totolPage = DB.totolPage(sql);
			handlePage.setTotolPage(totolPage);	
			Vector<String[]> vv = DB.selectPageMeg(1,sql);
			if(vv.size()==0)
			{
				String msg = "�Բ���û�в�ѯ�����<br/>����Ʒ��Ϣ����";
				pageForward(msg,request,response);
			}
			else
			{
				request.setAttribute("vv",vv);
    			String url = "/pagination.jsp";
				ServletContext sc = getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher(url);
				rd.forward(request,response);
			}				
		}
		else if(action.equals("search"))
		{
			String gtype = request.getParameter("gtype").trim();
			handlePage.setShowPage(1);			
			String sql = "select goodsid,goodsname,gprice,gtype,gimgurl,gamount"
			             +" from goodsmessage where gtype='"+gtype+"'";
			sql = new String(sql.getBytes(),"ISO-8859-1");
			handlePage.setSql(sql);
			int totolPage = DB.totolPage(sql);
			handlePage.setTotolPage(totolPage);
			Vector<String[]> vv = DB.selectPageMeg(1,sql);
			request.setAttribute("vv",vv);
			String url = "/pagination.jsp";
			ServletContext sc = getServletContext();
			RequestDispatcher rd = sc.getRequestDispatcher(url);
			rd.forward(request,response);			
		}
		else if(action.equals("next"))
		{	
			int p=handlePage.getShowPage();
			int q=handlePage.getTotolPage();
			if(p<q)
			{
				p++;
			}
			handlePage.setShowPage(p);
			String sql=handlePage.getSql();
			Vector<String[]> vv =DB.selectPageMeg(p,sql);	
			request.setAttribute("vv",vv);
			String url = "/pagination.jsp";
			ServletContext sc = getServletContext(); 
			RequestDispatcher rd = sc.getRequestDispatcher(url); 
			rd.forward(request,response); 
		}
		else if(action.equals("before"))
		{	
			int p=handlePage.getShowPage();
			if(p>1)
			{
				p--;
			}			
			handlePage.setShowPage(p);
			String sql=handlePage.getSql();
			Vector<String[]> vv =DB.selectPageMeg(p,sql);	
			request.setAttribute("vv",vv);
			String url = "/pagination.jsp";
			ServletContext sc = getServletContext(); 
			RequestDispatcher rd = sc.getRequestDispatcher(url); 
			rd.forward(request,response); 
		}
		else if(action.equals("pageChange"))
		{
			String  page =request.getParameter("changePage");
			int p = Integer.parseInt(page.trim());
			handlePage.setShowPage(p);
			String sql=handlePage.getSql();
			Vector<String[]> vv =DB.selectPageMeg(handlePage.getShowPage(),sql);	
			request.setAttribute("vv",vv);
			String url = "/pagination.jsp";
			ServletContext sc = getServletContext(); 
			RequestDispatcher rd = sc.getRequestDispatcher(url); 
			rd.forward(request,response); 
		}
		else if(action.equals("buy"))
		{
	  	    //�õ�Ҫ��������ID
	    	String goodsid = request.getParameter("goodsid").trim();
	    	String sqlw=(String)handlePage.getSql();
	    	if(sqlw.trim().equals(""))
	    	{
	    		String	sqlq = "select goodsid,goodsname,gprice,gtype,gimgurl,gamount from goodsmessage where goodsid="+Integer.parseInt(goodsid);
				//�õ�Ҫ��������
    			handlePage.setSql(sqlq);
	    	}
    		handlePage.buy(goodsid);
    		//�õ�������ǰ���ݵ�sql
    		String sql = handlePage.getSql();
    		int page = handlePage.getShowPage();
    		session.setAttribute("handlePage",handlePage);
			String url = "/pagination.jsp";
    		//���غ�,�õ�ҳ������
    		Vector<String[]> vv = DB.selectPageMeg(page,sql);
    		String msg=null;
    		if(vv.size()==0)
    		{//ȱ���û���Ҫ����Ʒ
    			msg = "��Ǹ������Ҫ��\\n��Ʒ,��ʱȱ��!";
    			request.setAttribute("msg",msg);
    		}
			request.setAttribute("vv",vv);
			//forward��Ҫȥ��ҳ��
    		ServletContext sc = getServletContext(); //�õ������� 
			RequestDispatcher rd = sc.getRequestDispatcher(url); 
			rd.forward(request,response);	
		}
     	else if(action.equals("delete"))
		{
			String goodsid = request.getParameter("goodsid");
			handlePage.removeItem(goodsid);
    		session.setAttribute("handlePage",handlePage);
    		response.sendRedirect("cart.jsp");
		}
		else if(action.equals("customermodify"))
		{				
    		String cpw = request.getParameter("cpw").trim();//�õ��û��޸ĺ����Ϣ
    		String cemail = request.getParameter("cemail").trim();
    		String cname = (String)session.getAttribute("user");    		
    		cname = new String(cname.getBytes(),"ISO-8859-1");//����ת��
    		//�������ݿ��û���Ϣ
    		String sql = "update gcustomer set cpw='"+cpw
    					+"',cemail='"+cemail+"' where cname='"+cname+"'";
    		int i = DB.updateMeg(sql);
    		if(i==0)
    		{//������Ϣʧ��
    			String msg = "�Բ���,��Ϣ�޸�ʧ��!!!";
    			pageForward(msg,request,response);	
    		}
    		else
    		{//��Ϣ�޸ĳɹ�
    			response.sendRedirect("customerxgxx.jsp");    			
    		}
		}
		else if(action.equals("change"))
		{
			//�õ��޸���Ʒ�����ƺ��޸ĺ������
    		String gnum = request.getParameter("gnum").trim();
    		String goodsid = request.getParameter("goodsid").trim();
    		int num = 0;
    		try
    		{
    			num = Integer.parseInt(gnum);
    		}
    		catch(Exception e)
    		{
    			//�޸ĵ��������Ϸ�ʱ
    			String msg = "�Բ���,�����޸Ĵ���!!!";
    			pageForward(msg,request,response);
    		}
    		//�õ��������
    		String sql = "select gamount from goodsmessage where goodsid='"+goodsid+"'";
    		sql = new String(sql.getBytes(),"iso-8859-1");
			String c = DB.selectAmount(sql);
			int count = Integer.parseInt(c);
    		if(count<num)
    		{//����������޸ĵ�ֵʱ
    			String msg = "�Բ���"+goodsid+"����Ʒ��治�������\\n����ֻ�� "+count+"�������޸�Ϊ"+num+"!";
    			request.setAttribute("msg",msg);
    		}
    		else
    		{//����湻ʱ
	    		//�õ��û��Ĺ��ﳵ
	    		Map<String,Integer> cart = handlePage.getCart();
	    		//�޸���Ʒ����
	    		cart.put(goodsid,num);
	    		session.setAttribute("handlePage",handlePage);	    		
	    	}
	    	this.getServletContext().getRequestDispatcher("/cart.jsp").forward(request,response);
		}
		else if(action.equals("jiezhang"))
		{
			session.setAttribute("fromWhere","jz");			
			if(session.getAttribute("user")==null)
			{
				this.getServletConfig().getServletContext().getRequestDispatcher("/customermanage.jsp").forward(request,response);
				return;
			}    		
    		Map<String,Integer> cart = handlePage.getCart();//�õ��û��Ĺ��ﳵ
    		Set<String> goodsid = cart.keySet();
    		String msg = "";
    		for(String str:goodsid)
    		{
    			//�õ���Ʒ����
    			int count = cart.get(str); 
    			//�õ��������Ʒ������
	    		String sql = "select gamount from goodsmessage where goodsid="+Integer.parseInt(str);
				int ga = DB.getSelectId(sql);
    			if(ga<count)
    			{
    				msg = "�Բ���"+goodsid+"����Ʒ��治�������\\n����ֻ�� "+ga+"�����ܽ���!";
    			}
    		}
    		if(msg.equals(""))
    		{//��megΪ��ʱ�������湻    		
    			int oid = DB.getID("ordergoodsmeg","oid");
	    		for(String str:goodsid)
	    		{	
	    			int count = cart.get(str); //�õ���Ʒ����
	    			//�õ��������Ʒ������
	    			String sqlx="select gprice from goodsmessage where goodsid="+Integer.parseInt(str);
	    			sqlx=new String(sqlx.getBytes(),"iso-8859-1");
	    			double gprice=DB.selectPrice(sqlx);
		    		String sql = "select gamount from goodsmessage where goodsid="+Integer.parseInt(str);
					int ga = DB.getSelectId(sql);
					String sqly="select goodsname from goodsmessage where goodsid="+Integer.parseInt(str);
					sqly=new String(sqly.getBytes(),"iso-8859-1");
					String gb = DB.selectAmount(sqly);					
	    			String sqlz = "insert into ordergoodsmeg(oid,goodsid,goodsname,gprice,orderamount,buytime) values("
	    			+oid+","+str+",'"+gb+"',"+gprice+","+count+",now())";
	    			sqlz=new String(sqlz.getBytes(),"iso-8859-1");
	    			int flag =DB.updateMeg(sqlz);
	    			if(flag==0)
	    			{
	    				msg = "�Բ���,�����ύʧ��!!!";
						pageForward(msg,request,response);
	    			}
	    			else
		    		{
		    			int i = ga-count;
		    			String sql1 = "update goodsmessage set gamount ="+i
    					+" where goodsid="+Integer.parseInt(str);
    					int f =DB.updateMeg(sql1);
		    			session.setAttribute("handlePage",handlePage);
		    		
		    		}		
	    		}
				String sqldd="select max(oid)from ordergoodsmeg";
				int  orderid=DB.getSelectId(sqldd);
				request.setAttribute("orderid",orderid);
    			String url = "/receive.jsp";//forward��Ҫȥ��ҳ��
				ServletContext sc = getServletContext(); 
				RequestDispatcher rd = sc.getRequestDispatcher(url); 
				rd.forward(request,response);
    		}
    		else
    		{//��ʾ�û���治��
    			request.setAttribute("msg",msg);
    			this.getServletContext().getRequestDispatcher("/cart.jsp").forward(request,response);
    		}
		}
		else if(action.equals("saveRec"))
		{
			//�յ�������
			String orederid=request.getParameter("orderid");
    		String recname = request.getParameter("recname");
    		String recadr = request.getParameter("recadr");
    		String rectel = request.getParameter("rectel");    		
    		String [] recMsg=new String[3];
    		recMsg[0] = recname.trim();
    		recMsg[1] = recadr.trim();
    		recMsg[2] = rectel.trim();
			//�õ��򶩵�������Ϣ���в������ݵ�sql
			String sqldd="select max(oid)from ordergoodsmeg";
			int  i=DB.getSelectId(sqldd);
    		double oprice = handlePage.getAccount();
    		String cname = (String)session.getAttribute("user");
    		cname=new String(cname.getBytes(),"iso-8859-1");
    		String upsql = "insert into ordermeg(oid,cname,receivename,receiveadds,receivetel,"+
    		    "allmoney,buytime) values("+i+",'"+cname+"','"+recMsg[0]+"','"+recMsg[1]+"','"+recMsg[2]+"',"+oprice+",now())";
    		upsql=new String(upsql.getBytes(),"iso-8859-1");   	
    		int flag = DB.updateMeg(upsql);	
    		String msg = "";
    		if(flag==1)
    		{    		
				int mmname=Integer.parseInt(orederid); 
		      	String sql = "select oid,receivename,receiveadds,receivetel,allmoney,zhuangtai from ordermeg where oid='"+mmname+"'";
		        sql = new String(sql.getBytes(),"ISO-8859-1");
		      	String[] vl = DB.getString(sql);
		      	if(vl.length==0)
		      	{
		      		msg = "�Բ���,û�ж�����";
					pageForward(msg,request,response);
		      	}
		      	else
		      	{
		      		request.setAttribute("list",vl);
		      		session.setAttribute("handlePage",handlePage);
					String url = "/customerdd.jsp";//forward��Ҫȥ��ҳ��
					ServletContext sc = getServletContext(); 
					RequestDispatcher rd = sc.getRequestDispatcher(url); 
					rd.forward(request,response); 
				
		      	}
    		}
    		else
    		{    			
    			msg = "�Բ���,�����ύʧ��";
				pageForward(msg,request,response);
    		}
    		//���ջ�����Ϣ��javaBean������Ϊ��
    		session.setAttribute("handlePage",null);	    		
		}
		else if(action.equals("getMessage"))
    	{//�û�����õ�ĳ��Ʒ����ϸ��Ϣʱ
	    	//�õ���ƷID
    		String goodsid = request.getParameter("goodsid").trim();
       		String sql = "select goodsid,goodsname,gtype,gprice,gdate,gamount,"
       		+"gimgurl,gintroduction from goodsmessage where goodsid="+goodsid;
    		String wsql=new String(sql.getBytes(),"iso-8859-1"); 
    		//�õ�����Ʒ����ϸ��Ϣ
    		Vector<String[]> vv = DB.getMessage(wsql);	 		
			request.setAttribute("vv",vv);
			String url = "/goodsmessage.jsp";//forward��Ҫȥ��ҳ��
			ServletContext sc = getServletContext(); 
			RequestDispatcher rd = sc.getRequestDispatcher(url); 
			rd.forward(request,response); 
    	}
    	else if(action.equals("delete1"))
		{
			String mname = request.getParameter("oid").trim();
			int mmname=Integer.parseInt(mname);	
			String sw1="delete from ordergoodsmeg where oid="+mmname;			
    		int eee=DB.updateMeg(sw1);
    		String sw0= "delete from ordermeg where oid="+mmname;
    		int ee=DB.updateMeg(sw0);
    		if(ee==1&&eee>=1)
    		{
    			String msg = "ɾ���ɹ�!!!";
				pageForward(msg,request,response); 
    		}    		
    		else
    		{
				String msg = "�ö����Ѿ�������!!!";
				pageForward(msg,request,response);
    		}
		}
		else if(action.equals("change1"))
		{
			String sno=request.getParameter("oid").trim();
			String sname=request.getParameter("goodsname").trim();
			int mmname=Integer.parseInt(sno); 
			String receiveshuliang=request.getParameter("receiveshuliang").trim();
			int receivesl=Integer.parseInt(receiveshuliang);
			String sql="update ordergoodsmeg set orderamount ="+receivesl+" where oid="+mmname
			+" and goodsname='"+sname+"'";
			sql=new String(sql.getBytes(),"iso-8859-1"); 
			int f =DB.updateMeg(sql); 
			String sqlz="select gprice,orderamount from ordergoodsmeg where oid="+sno;
			sqlz = new String(sqlz.getBytes(),"ISO-8859-1");
	      	Vector<String[]> vc = DB.getMessage(sqlz);
	      	double gprice=0.00;
	      	for(String[] str:vc)
	      	{	      		
	      		double jg=(double)Double.parseDouble(str[0]);
	      		int sl=Integer.parseInt(str[1]);
	      		gprice+=jg*sl;	
	      	}
	      	String sqlx="update ordermeg set allmoney ="+gprice+" where oid="+sno;
			sqlx=new String(sqlx.getBytes(),"iso-8859-1");
			int ff =DB.updateMeg(sqlx); 
	      	String sqlh = "select oid,receivename,receiveadds,receivetel,allmoney from ordermeg where oid='"+mmname+"'";
	        sql = new String(sqlh.getBytes(),"ISO-8859-1");
	      	String[] vl = DB.getString(sql);
      		request.setAttribute("list",vl);
      		session.setAttribute("handlePage",handlePage);
			String url = "/customerddxiugai.jsp";//forward��Ҫȥ��ҳ��
			ServletContext sc = getServletContext(); 
			RequestDispatcher rd = sc.getRequestDispatcher(url); 
			rd.forward(request,response);			
		}
		else if(action.equals("tijiao"))
		{			
			String mname = request.getParameter("oid").trim();
			int mmname=Integer.parseInt(mname); 	
			String receivename = request.getParameter("receivename").trim();
			String receiveadds = request.getParameter("receiveadds").trim();
			String receivetel = request.getParameter("receivetel").trim();			
			String sql="update ordermeg  set receivename='"+receivename+"',receiveadds='"+receiveadds+
			"',receivetel='"+receivetel+"' where oid="+mmname;
			sql=new String(sql.getBytes(),"iso-8859-1");  
			int f =DB.updateMeg(sql);
			String sqlr = "select oid,receivename,receiveadds,receivetel,allmoney,zhuangtai from ordermeg where oid="+mmname;
	        sqlr = new String(sqlr.getBytes(),"ISO-8859-1");
	      	String[] vg = DB.getString(sqlr);
			if(f==0)
	      	{
	      		String msg = "�Բ���,û�ж�����";
				pageForward(msg,request,response);
	      	}
	      	else
	      	{
	      		
	      		request.setAttribute("list",vg);
	      		session.setAttribute("handlePage",handlePage);
	      		String url = "/customerdd.jsp";
				ServletContext sc = getServletContext(); 
				RequestDispatcher rd = sc.getRequestDispatcher(url); 
				rd.forward(request,response); 
	      	}
		}
		else if(action.equals("modify"))
		{
	     	String mname = request.getParameter("oid").trim();
			int mmname=Integer.parseInt(mname); 
	      	String sql = "select oid,receivename,receiveadds,receivetel,allmoney from ordermeg where oid='"+mmname+"'";
	        sql = new String(sql.getBytes(),"ISO-8859-1");
	      	String[] vl = DB.getString(sql);
	      	if(vl.length==0)
	      	{
	      		String msg = "�Բ���,û�ж�����";
				pageForward(msg,request,response);
	      	}
	      	else
	      	{	      	
	      		request.setAttribute("list",vl);
	      		session.setAttribute("handlePage",handlePage);
				String url = "/customerddxiugai.jsp";//forward��Ҫȥ��ҳ��
				ServletContext sc = getServletContext(); 
				RequestDispatcher rd = sc.getRequestDispatcher(url); 
				rd.forward(request,response);			
	      	}
		}
		else if(action.equals("modify1"))
		{
	     	String mname = request.getParameter("oid").trim();
			int mmname=Integer.parseInt(mname); 
	      	String sql = "select oid,receivename,receiveadds,receivetel,allmoney,zhuangtai from ordermeg where oid='"+mmname+"'";
	        sql = new String(sql.getBytes(),"ISO-8859-1");
	      	String[] vl = DB.getString(sql);
	      	if(vl.length==0)
	      	{
	      		String msg = "�Բ���,û�ж�����";
				pageForward(msg,request,response);
	      	}
	      	else
	      	{	      	
	      		request.setAttribute("list",vl);
	      		session.setAttribute("handlePage",handlePage);
				String url = "/customerdd.jsp";//forward��Ҫȥ��ҳ��
				ServletContext sc = getServletContext(); 
				RequestDispatcher rd = sc.getRequestDispatcher(url); 
				rd.forward(request,response);			
	      	}
		}
		else if(action.equals("modify2"))
		{
		    session.setAttribute("fromWhere","wddd");
		    if(session.getAttribute("user")==null)
			{
				response.sendRedirect("customermanage.jsp");
			}
			else
			{
		     	String cname=(String)session.getAttribute("user");
		     	cname=new String(cname.getBytes(),"iso-8859-1");
		      	String sql = "select oid,receivename,receiveadds,receivetel,"+
		      	"allmoney,zhuangtai,buytime,cname from ordermeg where cname='"+cname+"'";
		        sql = new String(sql.getBytes(),"ISO-8859-1");
		      	Vector<String[]> vl = DB.getMessage(sql);
	      		if(vl.size()==0)
		      	{
		      		String msg="û�ж�����";
		      		pageForward(msg,request,response);
		      	}
		      	else
		      	{
		      		request.setAttribute("use",cname);
		      		request.setAttribute("list",vl);
		      		session.setAttribute("handlePage",handlePage);
					String url = "/ddbiao.jsp";//forward��Ҫȥ��ҳ��
					ServletContext sc = getServletContext(); 
					RequestDispatcher rd = sc.getRequestDispatcher(url); 
					rd.forward(request,response); 
				}
	      	}
		}
		else if(action.equals("paixu"))
		{
	    	session.setAttribute("wdddpx","desc");
	    	if(session.getAttribute("user")==null)
	    	{
	    		response.sendRedirect("customermanage.jsp");
	    	}
	    	else{	    	
		     	String cname=(String)request.getParameter("user");
		     	cname=new String(cname.getBytes(),"iso-8859-1");
		      	String sql = "select oid,receivename,receiveadds,receivetel,"+
	      		"allmoney,zhuangtai,buytime from ordermeg where cname='"+cname+"' order by buytime desc";
		        sql = new String(sql.getBytes(),"ISO-8859-1");		        
		      	Vector<String[]> vl = DB.getMessage(sql);
	      		if(vl.size()==0)
		      	{
		      		String msg="û�ж�����";
		      		pageForward(msg,request,response);
		      	}
		      	else
		      	{
		      		request.setAttribute("use",cname);
		      		request.setAttribute("list",vl);
		      		session.setAttribute("handlePage",handlePage);
					String url = "/ddbiao.jsp";//forward��Ҫȥ��ҳ��
					ServletContext sc = getServletContext(); 
					RequestDispatcher rd = sc.getRequestDispatcher(url); 
					rd.forward(request,response); 
				}
			}
		}
		else if(action.equals("paixus"))
		{	    	
	     	session.setAttribute("wdddpx","asc");
	    	if(session.getAttribute("user")==null)
	    	{
	    		response.sendRedirect("customermanage.jsp");
	    	}
	    	else
	    	{
		     	String cname=(String)request.getParameter("user");
		     	cname=new String(cname.getBytes(),"iso-8859-1");
		      	String sql = "select oid,receivename,receiveadds,receivetel,"+
	      		"allmoney,zhuangtai,buytime from ordermeg where cname='"+cname+"' order by buytime asc";
		        sql = new String(sql.getBytes(),"ISO-8859-1");		        
		      	Vector<String[]> vl = DB.getMessage(sql);
	      		if(vl.size()==0)
		      	{
		      		String msg="û�ж�����";
		      		pageForward(msg,request,response);
		      	}
		      	else
		      	{
		      		request.setAttribute("use",cname);
		      		request.setAttribute("list",vl);
		      		session.setAttribute("handlePage",handlePage);
					String url = "/ddbiao.jsp";//forward��Ҫȥ��ҳ��
					ServletContext sc = getServletContext(); 
					RequestDispatcher rd = sc.getRequestDispatcher(url); 
					rd.forward(request,response); 
				}	    		
	    	}	     	
		}
	}
	public void pageForward(String msg,HttpServletRequest request,HttpServletResponse response)
    							throws ServletException,IOException
    {
		request.setAttribute("msg",msg);
		String url = "/error.jsp";
		ServletContext sc = getServletContext(); 
		RequestDispatcher rd = sc.getRequestDispatcher(url); 
		rd.forward(request,response);   	
    }
}

