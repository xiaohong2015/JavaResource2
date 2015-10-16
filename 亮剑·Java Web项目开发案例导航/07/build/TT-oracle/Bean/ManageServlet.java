package wyf.zrk;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import javax.naming.*;
import javax.ejb.*;
import wyf.zrk.DButil;
import wyf.zrk.BookTicket;

public class ManageServlet extends HttpServlet
{
	public  void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
    	this.doPost(request,response);
    }
	public  void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{	
    	request.setCharacterEncoding("gb2312");								//���ñ����ʽ
    	response.setContentType("text/html;charset=gb2312");				//������Ӧ�����ʽ		
    	response.setCharacterEncoding("gb2312");							//�����ַ���
    	HttpSession session = request.getSession(true);						//�õ�session����    	
    	PrintWriter out = response.getWriter();								//�õ����������    	
		DButil db = null;													//��������
		BookTicket bt = null;
		Context ctx = null;
	    try{
	        Hashtable<String,String> ht = new Hashtable<String,String>();	//����һ��map
	        ht.put(Context.INITIAL_CONTEXT_FACTORY,"weblogic.jndi.WLInitialContextFactory");
	        ht.put(Context.PROVIDER_URL, "t3://localhost:7001");
	        ctx = new InitialContext(ht);									//��ʼ��������
	        db = (DButil)ctx.lookup("java:comp/env/ejb/DButilLocal");		//�õ�Զ�̽ӿ�����
	    } 
	    catch (Exception e){e.printStackTrace();}							//��ӡ�쳣
        if(session.getAttribute("bt") == null){			 					//�����󲻴���ʱ
			try{				
				bt=(BookTicket)ctx.lookup("java:comp/env/ejb/BookTicketLocal");//�õ�Զ�̽ӿ�����
	 			session.setAttribute("bt",bt);									//������ŵ�session��
		 	}
		 	catch(Exception ce){ce.printStackTrace();}							//��ӡ�쳣
		}
		else{																	//��session�д���ʱ
		    bt = (BookTicket)session.getAttribute("bt");						//�õ�����
		}
    	String action = request.getParameter("action");						//�õ�����Ķ���
		if(action==null){													//������Ϊnullʱ
			String msg = "��Ч·������˶Ժ������룡����";					//��ʾ��Ϣ
			request.setAttribute("msg",msg);								//����Ϣ����������
			forward(request,response,"/info.jsp");							//ҳ����ת
		}
		else{
			action = action.trim();											//ȥ��actionǰ��Ĳ��ɼ��ַ�			
			if(action.equals("initial")){									//������Ϊ��ʼ��ʱ
				String sql = "select mid,mtype,to_char(mtickettime,'yyyy-mm-dd hh:mi:ss'),mname,mlinkman,mtel from msginfo";
				List<String[]> ls = db.getInfo(sql);						//�õ��������
				session.setAttribute("initlist",ls);						//���������Ự��
				forward(request,response,"/index.jsp");						//ҳ����ת
			}
			else if(action.equals("login")){								//������Ϊ��¼ʱ
				String uname = request.getParameter("uname");				//�õ��û���
				String upwd = request.getParameter("upwd");					//�õ�����
				if(uname==null||upwd==null||uname.equals("")||upwd.equals("")){//���û���������Ϊnullʱ
					String msg = "�û��������������Ϊ�գ����������룡����";//�õ���ʾ��Ϣ
					request.setAttribute("msg",msg);						//����ʾ��Ϣ����������
					forward(request,response,"/info.jsp");					//ҳ����ת
				}
				else{
					String sql = "select 1 from userinfo where uname='"		//�˶��û���������
							+uname.trim()+"' and upwd='"+upwd.trim()+"'";	//�Ƿ���ȷ��SQL
					sql = new String(sql.getBytes(),"ISO-8859-1");			//��sqlת��
					List<String[]> ls = db.getInfo(sql);					//�õ���ѯ���
					if(ls.size()!=0){										//��û�в�ѯ��ʱ
						session.setAttribute("user",uname.trim());
						if(session.getAttribute("flag")==null){
							session.setAttribute("flag","no");
						}
						String flag = (String)session.getAttribute("flag");
						if(flag.equals("no")){
							forward(request,response,"/index.jsp");				//ҳ����ת
						}
						else{
							String url = (String)session.getAttribute("url");
							forward(request,response,url);
						}						
					}
					else{
						String msg = "�Բ����û�����������������µ�¼������";
						request.setAttribute("msg",msg);					//����ʾ��Ϣ����������
						forward(request,response,"/info.jsp");				//ҳ����ת
					}
				}
			}
			else if(action.equals("logout")){								//������Ϊע��ʱ
				session.invalidate();										//ʹsessionʧЧ
				forward(request,response,"/ManageServlet?action=initial");	//ҳ����ת
			}
			else if(action.equals("checkUname")){							//������Ϊ����û����Ƿ����ʱ
				String uname = request.getParameter("uname");				//�õ��û����������
				if(uname==null){											//������Ϊ��ʱ
					out.println("no");										//����no
				}
				else{														//�����ֲ�Ϊ��ʱ
					System.out.println("the name is :"+uname);
					uname = new String(uname.trim().getBytes(),"ISO-8859-1");//������ת��
					String sql = "select 1 from userinfo where uname='"+uname+"'";//�����������Ƿ���ڵ�sql
					List<String[]> ls = db.getInfo(sql);					//�õ���ѯ���
					if(ls.size()!=0){										//��û�в�ѯ��ʱ
						out.println("no");									//�û���������
					}
					else{
						out.println("ok");									//�û�������
					}
				}
			}
			else if(action.equals("register")){								//������Ϊע��ʱ
				
				System.out.println("come in");
				
				String uname = request.getParameter("uname");				//�õ��û���
				String upwd_first = request.getParameter("upwd_first");		//�õ���һ�����������
				String upwd_second = request.getParameter("upwd_second");	//�õ��ڶ������������
				String ugender = request.getParameter("UserSex");			//�õ��Ա�
				String identify = request.getParameter("identify");			//�õ���֤��
				if(uname==null||upwd_first==null||upwd_second==null||ugender==null||identify==null){//����������Ϊ��ʱ
					out.println("<script language=\"JavaScript\"> alert(\"��Ϣ���벻�Ϸ�������\");"
								+"window.location.href=\"register.jsp\"</script>");			//��ʾ�û�
				}
				else if(!identify.toLowerCase().trim().equals(((String)session.getAttribute("randNum")).toLowerCase())){			//��������֤�����ʱ
					out.println("<script language=\"JavaScript\"> alert(\"��֤����󣡣���\");"
								+"window.location.href=\"register.jsp\"</script>");			//��ʾ�û�
				}
				else if(!upwd_first.trim().equals(upwd_second.trim())){						//��������������벻һ��ʱ
					out.println("<script language=\"JavaScript\"> alert(\"�����������벻һ�£�����\");"
								+"window.location.href=\"register.jsp\"</script>");			//��ʾ�û�
				}
				else{																		//���������Ϣ��ȷʱ
					uname = new String(uname.trim().getBytes(),"ISO-8859-1");				//������ת��
					String temp = "select 1 from userinfo where uname='"+uname+"'";
					List<String[]> ls = db.getInfo(temp);									//�õ���ѯ�б�
					if(ls.size()==0){
						ugender = new String(ugender.trim().getBytes(),"ISO-8859-1");			//���Ա�ת��
						String sql = "insert into userinfo(uname,upwd,ugender) values('"+
										uname+"','"+upwd_first+"','"+ugender+"')";				//�����¼��SQL���
						int i = db.updateDb(sql);												//ִ�в������
						if(i==1){																//����ɹ�ʱ
							out.println("<script language=\"JavaScript\"> alert(\"��ϲ�㣬ע��ɹ�������\");"
									+"window.location.href=\"index.jsp\"</script>");			//��ʾ�û�
						}
						else{																	//����ʧ��ʱ
							out.println("<script language=\"JavaScript\"> alert(\"�Բ���ע��ʧ�ܣ�����\");"
									+"window.location.href=\"register.jsp\"</script>");			//��ʾ�û�
						}						
					}
					else{
						out.println("<script language=\"JavaScript\"> alert(\"�û����ѱ�ռ�ã�����\");"
								+"window.location.href=\"register.jsp\"</script>");			//��ʾ�û�
					}

				}
			}
			else if(action.equals("lookUserInfo")){											//������Ϊ�鿴�û���Ϣʱ
				if(session.getAttribute("user")==null){										//�ж��û��Ƿ��¼
					out.println("<script language=\"JavaScript\"> alert(\"���ȵ�¼������\");"
								+"window.location.href=\"index.jsp\"</script>");			//��ʾ�û���¼
				}
				else{																		//�û��Ѿ���¼
					String uname = new String(((String)session.getAttribute("user")).trim().getBytes(),"ISO-8859-1");//���û���ת��
					String sql = "select ugender from userinfo where uname='"+uname+"'";	//�����û��Ա��SQL���
					List<String[]> ls = db.getInfo(sql);									//�õ���ѯ�б�
					String ugender = (ls.get(0))[0];										//�õ��û��Ա�
					request.setAttribute("ugender",ugender);								//���Ա����Ự��
					forward(request,response,"/modifyUserInfo.jsp");						//ҳ����ת
				}
			}
			else if(action.equals("modifyUserInfo")){										//������Ϊ�޸��û���Ϣʱ								
				String upwd_old = request.getParameter("upwd_old");
				String upwd_first = request.getParameter("upwd_first");						//�õ���һ�����������
				String upwd_second = request.getParameter("upwd_second");					//�õ��ڶ������������
				String ugender = request.getParameter("UserSex");							//�õ��û��Ա�
				String identify = request.getParameter("identify");							//�õ���֤��
				if(upwd_old==null||upwd_first==null||upwd_second==null||ugender==null||identify==null){//������Ϊ��ʱ
					out.println("<script language=\"JavaScript\"> alert(\"��Ϣ���벻�Ϸ�������\");"
								+"window.location.href=\"modifyuserinfo.jsp\"</script>");	//��ʾ�û���Ϣ
				}
				else if(!identify.trim().toLowerCase().equals(((String)session.getAttribute("randNum")).toLowerCase())){
					out.println("<script language=\"JavaScript\"> alert(\"��֤����󣡣���\");"
								+"window.location.href=\"register.jsp\"</script>");			//��ʾ�û���֤�����
				}
				else if(!upwd_first.trim().equals(upwd_second.trim())){						//�����������벻һ��ʱ
					out.println("<script language=\"JavaScript\"> alert(\"�����������벻һ�£�����\");"
								+"window.location.href=\"register.jsp\"</script>");			//��ʾ�������벻һ��
				}
				else{
					String uname = new String(((String)session.getAttribute("user")).trim().getBytes(),"ISO-8859-1");
					String test = "select 1 from userinfo where uname='"+uname+"' and upwd='"+upwd_old.trim()+"'";
					List<String[]> ls = db.getInfo(test);
					if(ls.size()!=0){
						ugender = new String(ugender.trim().getBytes(),"ISO-8859-1");
						String sql = "update userinfo set upwd='"+upwd_first+"',ugender='"+ugender+"' where uname='"+uname+"'";
						int i = db.updateDb(sql);
						if(i==1){
							out.println("<script language=\"JavaScript\"> alert(\"��ϲ�㣬�����޸ĳɹ�������\");"
									+"window.location.href=\"index.jsp\"</script>");
						}
						else{
							out.println("<script language=\"JavaScript\"> alert(\"�Բ��������޸�ʧ�ܣ�����\");"
									+"window.location.href=\"ManageServlet?action=lookUserInfo\"</script>");
						}						
					}
					else{
						out.println("<script language=\"JavaScript\"> alert(\"�ɿ���������󣡣���\");"
									+"window.location.href=\"ManageServlet?action=lookUserInfo\"</script>");
					}
				}
			}
			else if(action.equals("zzcx")){
				System.out.println("zzcx");
				String start = request.getParameter("start");
				String end = request.getParameter("end");
				if(start==null||end==null){
					out.println("<script language=\"JavaScript\"> alert(\"��Ϣ����������������룡����\");"
								+"window.location.href=\"index.jsp\"</script>");
				}
				else{
					List<String[]> ls = db.zzcx(start.trim(),end.trim());
					session.setAttribute("start",start.trim());
					session.setAttribute("end",end.trim());
					if(ls.size()==0){
						List<String> mid = db.searchMidStation(start,end);
						if(mid.size()==0){
							String msg = "û�в�ѯ����Ҫ�ĳ��Σ�����";
							request.setAttribute("msg",msg);
							forward(request,response,"/info.jsp");							
						}
						else{
							session.setAttribute("mid",mid);
							forward(request,response,"/midstation.jsp");
						}
					}
					else{
						session.setAttribute("list_train",ls);
						forward(request,response,"/trainsearch.jsp");
					}
				}
			}
			else if(action.equals("czcx")){
				System.out.println("czcx");
				String station = request.getParameter("station");
				if(station==null){
					out.println("<script language=\"JavaScript\"> alert(\"��Ϣ����������������룡����\");"
								+"window.location.href=\"index.jsp\"</script>");
				}
				else{
					List<String[]> ls = db.czcx(station.trim());
					if(ls.size()==0){
						String msg = "û�в�ѯ����Ҫ�ĳ��Σ�����";
						request.setAttribute("msg",msg);
						forward(request,response,"/info.jsp");
					}
					else{
						request.setAttribute("station",station);
						session.setAttribute("list_train",ls);
						forward(request,response,"/trainsearch.jsp");
					}
				}
			}
			else if(action.equals("cccx")){
				System.out.println("cccx");
				String train = request.getParameter("train");
				String flag = request.getParameter("flag");
				if(train==null){
					out.println("<script language=\"JavaScript\"> alert(\"��Ϣ����������������룡����\");"
								+"window.location.href=\"index.jsp\"</script>");
				}
				else{
					List<String[]> ls = db.cccx(train.trim().toUpperCase());
					if(ls.size()==0){
						String msg = "û�в�ѯ����Ҫ�ĳ��Σ�����";
						request.setAttribute("msg",msg);
						forward(request,response,"/info.jsp");
					}
					else{
						System.out.println("train name is : "+train);
						request.setAttribute("list",ls);
						request.setAttribute("tname",train);
						if(flag==null){
							forward(request,response,"/traindetail.jsp");
						}
						else if(flag.trim().equals("1")){
							forward(request,response,"/traindetail_a.jsp");
						}
						else{
							forward(request,response,"/traindetail_b.jsp");
						}
						
					}
				}
			}
			else if(action.equals("midSearch")){
				String midstation = request.getParameter("mid");
				if(midstation==null){
						String msg = "ϵͳ���󣡣���";
						request.setAttribute("msg",msg);
						forward(request,response,"/info.jsp");	
				}
				else{
					String start = (String)session.getAttribute("start");
					String end = (String)session.getAttribute("end");
					List<String[]> first = db.zzcx(start,midstation.trim());
					List<String[]> sec = db.zzcx(midstation.trim(),end);
					
					System.out.println(first);
					System.out.println(sec);
					
					for(String[] str:sec){
						first.add(str);
					}
					session.setAttribute("mid_train",first);
					forward(request,response,"/trainsearch_a.jsp");
				}
			}
			else if(action.equals("publish")){
				String amount = request.getParameter("mamount");
				String mname = request.getParameter("mname");
				String mtype = request.getParameter("msg_type");
				String mtickettime = request.getParameter("mtickettime");
				String mstart = request.getParameter("mstart");
				String mend = request.getParameter("mend");
				String mticketprice = request.getParameter("mticketprice");
				String mlinkman = request.getParameter("mlinkman");
				String mtel = request.getParameter("mtel");
				String mmsg = request.getParameter("mmsg");
				String mlevel = request.getParameter("mlevel");
				String identify = request.getParameter("identify");
				if(mtype==null||mtickettime==null||mstart==null||mend==null||mlevel==null||mname==null||
						mticketprice==null||mlinkman==null||mtel==null||mmsg==null||identify==null||amount==null){
					out.println("<script language=\"JavaScript\"> alert(\"��Ϣ���벻�Ϸ�������\");"
								+"window.location.href=\"publishmsg.jsp\"</script>");		
				}
				else if(!identify.trim().toLowerCase().equals(((String)session.getAttribute("randNum")).toLowerCase())){
					out.println("<script language=\"JavaScript\"> alert(\"��֤����󣡣���\");"
								+"window.location.href=\"publishmsg.jsp\"</script>");
				}
				else{
					int type = Integer.parseInt(mtype.trim());
					int mamount = Integer.parseInt(amount.trim());
					String uname = new String(((String)session.getAttribute("user")).trim().getBytes(),"ISO-8859-1");
					mtickettime = mtickettime.trim();
					mlinkman = new String(mlinkman.trim().getBytes(),"ISO-8859-1");
					mtel = mtel.trim();
					mticketprice = mticketprice.trim();
					mlevel = new String(mlevel.trim().getBytes(),"ISO-8859-1");
					if(mticketprice.equals("")){
						mticketprice = new String("����".getBytes(),"ISO-8859-1");
					}
					mstart =  new String(mstart.trim().getBytes(),"ISO-8859-1");
					mend =  new String(mend.trim().getBytes(),"ISO-8859-1");
					mmsg =  new String(mmsg.trim().getBytes(),"ISO-8859-1");
					mname =  new String(mname.trim().getBytes(),"ISO-8859-1");
					String sql = "insert into msginfo(mamount,mtype,mname,uid,mpublishtime,mlinkman,mtel,mticketprice,"+
								"mtickettime,mstart,mend,mmsg,mlevel) values("+mamount+","+type+",'"+mname+"',(select uid from userinfo "+
								"where uname='"+uname+"'),sysdate,'"+mlinkman+"','"+mtel+"','"+mticketprice+"',to_date('"+mtickettime
								+"','yyyy-mm-dd'),'"+mstart+"','"+mend+"','"+mmsg+"','"+mlevel+"')";
					int i = db.updateDb(sql);
					if(i==1){
						out.println("<script language=\"JavaScript\"> alert(\"��ϲ�㣬��Ϣ�����ɹ�������\");"
								+"window.location.href=\"ManageServlet?action=initial\"</script>");
					}
					else{
						out.println("<script language=\"JavaScript\"> alert(\"�Բ�����Ϣ����ʧ�ܣ�����\");"
								+"window.location.href=\"publishmsg.jsp\"</script>");
					}
				}
			}
			else if(action.equals("getTicketMsg")){
				String type = request.getParameter("type");
				if(type==null||!type.trim().matches("\\d")){
						out.println("<script language=\"JavaScript\"> alert(\"�Ƿ�URL������\");"
								+"window.location.href=\"index.jsp\"</script>");
				}
				else{
					int mtype = Integer.parseInt(type.trim());
					String pagesql = "select count(*) from msginfo";
					String sql = "";
					if(mtype==3){
						sql = "select mtype,to_char(mtickettime,'yyyy-mm-dd'),mname,mticketprice,mlevel,mamount,mid from msginfo";
					}
					else{
						sql = "select mtype,to_char(mtickettime,'yyyy-mm-dd'),mname,mticketprice,mlevel,mamount,mid"+
										" from msginfo where mtype="+mtype;
						pagesql = "select count(*) from msginfo where mtype="+mtype;
					}
					int totalpage = db.getTotalPage(pagesql);
					int nowpage = 1;
					System.out.println("the totalpage is :"+totalpage);
					session.setAttribute("totalpage",totalpage);
					session.setAttribute("nowpage",nowpage);
					session.setAttribute("sql",sql);
					List<String[]> ls = db.getPageContent(sql,1);
					session.setAttribute("list",ls);
					forward(request,response,"/messageinfo.jsp");
				}
			}
			else if(action.equals("lookdetail")){
				String id = request.getParameter("mid");
				String flag = request.getParameter("flag");
				if(id==null||!id.trim().matches("\\d+")){
					out.println("<script language=\"JavaScript\"> alert(\"�Ƿ�URL������\");"
							+"window.location.href=\"messageinfo.jsp\"</script>");
				}
				else{
					int mid = Integer.parseInt(id.trim());
					String sql = "select mname,mtype,mlevel,to_char(mtickettime,'yyyy-mm-dd'),mticketprice,"+
									"mstart,mend,to_char(mpublishtime,'yyyy-mm-dd hh:mi:ss'),mlinkman,mtel,mmsg from msginfo"+
									" where mid="+mid;
					List list = db.getInfo(sql);
					if(list.size()!=0){
						request.setAttribute("list",list.get(0));
						request.setAttribute("flag",flag);
						forward(request,response,"/lookdetail.jsp");
					}
					else{
						String msg = "�Ƿ���URL������";
						request.setAttribute("msg",msg);
						forward(request,response,"/info.jsp");
					}
				}
			}
			else if(action.equals("changePage")){
				String page = request.getParameter("page");
				String pagename = request.getParameter("pagename");
				if(page==null||pagename==null){
					String msg = "ϵͳ���󣡣���";
					request.setAttribute("msg",msg);
					forward(request,response,"/info.jsp");
				}
				else{
					int nowpage = Integer.parseInt(page.trim());
					pagename = pagename.trim();
					String sql = (String)session.getAttribute("sql");
					List<String[]> list = db.getPageContent(sql,nowpage);
					session.setAttribute("list",list);
					session.setAttribute("nowpage",nowpage);
					forward(request,response,pagename);
				}
			}
			else if(action.equals("msgManage")){
				String user = (String)session.getAttribute("user");
				user = new String(user.getBytes(),"ISO-8859-1");
				String pagesql = "select count(*) from msginfo where uid = "+
									"(select uid from userinfo where uname='"+user+"')";
				String sql = "select mtype,to_char(mtickettime,'yyyy-mm-dd'),mname,mid from msginfo "+
							"where uid = (select uid from userinfo where uname='"+user+"')";
				int totalpage = db.getTotalPage(pagesql);
				int nowpage = 1;
				System.out.println("the totalpage is :"+totalpage);
				session.setAttribute("totalpage",totalpage);
				session.setAttribute("nowpage",nowpage);
				session.setAttribute("sql",sql);
				List<String[]> ls = db.getPageContent(sql,1);
				session.setAttribute("list",ls);
				forward(request,response,"/messagemanage.jsp");
			}
			else if(action.equals("delMsg")){
				String mid = request.getParameter("mid");
				if(mid==null){
					String msg = "ϵͳ���󣡣���";
					request.setAttribute("msg",msg);
					forward(request,response,"/info.jsp");	
				}
				else{
					int id = Integer.parseInt(mid.trim());
					String val = "select 1 from msginfo where mid="+id;
					List<String[]> ls = db.getInfo(val);
					if(ls.size()!=0){
						String sql = "delete from msginfo where mid="+id;
						int i = db.updateDb(sql);
						if(i==1){
							out.println("<script language=\"JavaScript\"> alert(\"��ϲ�㣬ɾ���ɹ�������\");"
									+"window.location.href=\"ManageServlet?action=msgManage\"</script>");
						}
						else{
							out.println("<script language=\"JavaScript\"> alert(\"�Բ���ɾ��ʧ�ܣ�����\");"
									+"window.location.href=\"messagemanage.jsp\"</script>");
						}
					}
					forward(request,response,"/ManageServlet?action=msgManage");					
				}
			}
			else if(action.equals("zzSearch")){
				String tstart = request.getParameter("tstart");
				String tend = request.getParameter("tend");
				if(tstart==null||tend==null){
					out.println("<script language=\"JavaScript\"> alert(\"��Ϣ�������󣡣���\");"
							+"window.location.href=\"bookticket_a.jsp\"</script>");
				}
				else{
					List<String[]> ls = db.zzcx(tstart.trim(),tend.trim());
					session.setAttribute("start",tstart.trim());
					session.setAttribute("end",tend.trim());
					if(ls.size()==0){
						String msg = "û����������Ҫ�ĳ���";
						request.setAttribute("msg",msg);
						forward(request,response,"/info.jsp");
					}
					else{
						request.setAttribute("list",ls);
						forward(request,response,"/bookticket_b.jsp");
					}
				}
			}
			else if(action.equals("book")){
				String tname = request.getParameter("tname");
				if(tname==null){
					String msg = "�Ƿ���URL������";
					request.setAttribute("msg",msg);
					forward(request,response,"/info.jsp");
				}
				else{
					List<String[]> ls = db.cccx(tname.trim());
					if(ls.size()==0){
						String msg = "û����������Ҫ�ĳ���";
						request.setAttribute("msg",msg);
						forward(request,response,"/info.jsp");
					}
					else{
						TicketItem ti = new TicketItem();
						ti.setTname(tname.trim());
						bt.addToCart(ti);
						session.setAttribute("stationlist",ls);
						forward(request,response,"/bookticket_c.jsp");						
					}
				}			
			}
			else if(action.equals("saveStation")){
				String tstart = request.getParameter("tstart");
				String tend = request.getParameter("tend");
				System.out.println("the start and end is:"+tstart+"\t"+tend);
				if(tstart==null||tend==null){
					String msg = "�Ƿ���URL������";
					request.setAttribute("msg",msg);
					forward(request,response,"/info.jsp");
				}
				else{
					Vector<TicketItem> v = bt.getCart();
					TicketItem ti = v.get(0);
					String tname = ti.getTname();
					String sql = "select 1 from (select rsequence from relationinfo "+
									"where tid=(select tid from traininfo where tname='"+
									tname+"') and sid=(select sid from stationinfo where "+
									"sname='"+tstart+"')) A,"+
									"(select rsequence from relationinfo "+
									"where tid=(select tid from traininfo where tname='"+
									tname+"') and sid=(select sid from stationinfo where "+
									"sname='"+tend+"')) B "+
									"where A.rsequence<B.rsequence";
					sql = new String(sql.getBytes(),"ISO-8859-1");
					List<String[]> ls = db.getInfo(sql);
					if(ls.size()==0){
						out.println("<script language=\"JavaScript\"> alert(\"վ��ѡ����󣬳���վֻ����Ŀ��վǰ�棡\");"
								+"window.location.href=\"bookticket_c.jsp\"</script>");
					}
					else{
						ti.setTstart(tstart.trim());
						ti.setTend(tend.trim());
						forward(request,response,"/bookticket_d.jsp");						
					}
				}
			}
			else if(action.equals("saveMsg")){
				String linkman = request.getParameter("linkman");
				String tamount = request.getParameter("tamount");
				String tdate = request.getParameter("tdate");
				String address = request.getParameter("address");
				String tel = request.getParameter("tel");
				if(linkman==null||tamount==null||tdate==null||address==null||tel==null){
					String msg = "�Ƿ���URL������";
					request.setAttribute("msg",msg);
					forward(request,response,"/info.jsp");
				}
				else{
					String[] tt = tdate.trim().split("-");					
					Date day = new Date(Integer.parseInt(tt[0])-1900,Integer.parseInt(tt[1])-1,Integer.parseInt(tt[2])+1);
					if(day.before(new Date())){
						String msg = "��Ԥ���ĳ�Ʊ�ѹ��ڣ���˲飡";
						request.setAttribute("msg",msg);
						forward(request,response,"/info.jsp");	
					}
					else{
						TicketItem ti = bt.getCart().get(0);
						ti.setLinkman(linkman.trim());
						ti.setTamount(Integer.parseInt(tamount.trim()));
						ti.setTdate(tdate.trim());
						ti.setAddress(address.trim());
						ti.setTel(tel.trim());
						session.setAttribute("ti",ti);
						forward(request,response,"/bookticket_e.jsp");
					}				
				}
			}
			else if(action.equals("look")){
				TicketItem ti = bt.getCart().get(0);
				request.setAttribute("ti",ti);
				forward(request,response,"/bookticket_f.jsp");
			}
			else if(action.equals("delete")){
				bt.clearCart();
				forward(request,response,"/index.jsp");
			}
			else if(action.equals("subOrder")){
				TicketItem ti = bt.getCart().get(0);
				String user = (String)session.getAttribute("user");
				if(user==null){
					session.setAttribute("flag","yes");
					session.setAttribute("url","/bookticket_e.jsp");
					out.println("<script language=\"JavaScript\"> alert(\"���ȵ�¼������\");"
								+"window.location.href=\"index.jsp\"</script>");
				}
				else{
					String sql = "insert into orderinfo(uid,ostart,oend,tid,linkman,"+
									"address,tel,amount,tdate) values((select uid from "+
									"userinfo where uname='"+user+"'),'"+ti.getTstart()+"','"+
									ti.getTend()+"',(select tid from traininfo where tname='"+
									ti.getTname()+"'),'"+ti.getLinkman()+"','"+ti.getAddress()+"','"+
									ti.getTel()+"',"+ti.getTamount()+",to_date('"+ti.getTdate()+"','yyyy-mm-dd'))";
					System.out.println(sql);
					sql = new String(sql.getBytes(),"ISO-8859-1");
					int i = db.updateDb(sql);
					if(i==1){
						bt.clearCart();
						out.println("<script language=\"JavaScript\"> alert(\"��ϲ��,Ԥ���ɹ�������\");"
								+"window.location.href=\"index.jsp\"</script>");	
					}
					else{
						out.println("<script language=\"JavaScript\"> alert(\"Ԥ��ʧ�ܣ�����\");"
								+"window.location.href=\"bookticket_e.jsp\"</script>");
					}
				}
			}
			else if(action.equals("modify")){
				String tamount = request.getParameter("tamount");
				String tdate = request.getParameter("tdate");
				String linkman = request.getParameter("linkman");
				String address = request.getParameter("address");
				String tel = request.getParameter("tel");
				if(tamount==null||tdate==null||linkman==null||address==null||tel==null){
					String msg = "�Ƿ���URL������";
					request.setAttribute("msg",msg);
					forward(request,response,"/info.jsp");
				}
				else{
					String[] tt = tdate.trim().split("-");					
					Date day = new Date(Integer.parseInt(tt[0])-1900,Integer.parseInt(tt[1])-1,Integer.parseInt(tt[2])+1);
					if(day.before(new Date())){
						out.println("<script language=\"JavaScript\"> alert(\"��Ԥ���ĳ�Ʊ�ѹ��ڣ�����\");"
								+"window.location.href=\"ManageServlet?action=look\"</script>");
					}
					else{
						TicketItem ti = bt.getCart().get(0);
						ti.setAddress(address.trim());
						ti.setTamount(Integer.parseInt(tamount.trim()));
						ti.setLinkman(linkman.trim());
						ti.setTel(tel);
						ti.setTdate(tdate);
						session.setAttribute("ti",ti);
						forward(request,response,"/bookticket_e.jsp");						
					}
				}
			}
			else if(action.equals("lookBookInfo")){
				String user = (String)session.getAttribute("user");
				if(user==null){
					out.println("<script language=\"JavaScript\"> alert(\"���ȵ�¼������\");"
								+"window.location.href=\"index.jsp\"</script>");
				}
				else{
					String sql = "select O.oid,T.tname,to_char(O.tdate,'yyyy-mm-dd'),"+
									"O.ostate from orderinfo O,traininfo T "+
									"where O.tid=T.tid and uid=(select uid"+
									" from userinfo where uname='"+user.trim()+"') order by O.tdate desc";
					sql = new String(sql.getBytes(),"ISO-8859-1");
					String pagesql = "select count(*) from orderinfo where uid="+
										"(select uid from userinfo where uname='"
										+user.trim()+"')";
					pagesql = new String(pagesql.getBytes(),"ISO-8859-1");
					int totalpage = db.getTotalPage(pagesql);
					int nowpage = 1;
					System.out.println("the totalpage is :"+totalpage);
					session.setAttribute("totalpage",totalpage);
					session.setAttribute("nowpage",nowpage);
					session.setAttribute("sql",sql);
					List<String[]> ls = db.getPageContent(sql,1);
					if(ls.size()==0){
						out.println("<script language=\"JavaScript\"> alert(\"��û���κ�Ԥ����Ϣ������\");"
								+"window.location.href=\"index.jsp\"</script>");
					}
					else{
						session.setAttribute("list",ls);
						forward(request,response,"/myorder.jsp");
					}
				}
			}
			else if(action.equals("delOrder")){
				String oid = request.getParameter("oid");
				if(oid==null){
					String msg = "�Ƿ���URL������";
					request.setAttribute("msg",msg);
					forward(request,response,"/info.jsp");	
				}
				else{
					int id = Integer.parseInt(oid.trim());
					String val = "select 1 from orderinfo where oid="+id;
					List<String[]> ls = db.getInfo(val);
					if(ls.size()!=0){
						String sql = "delete from orderinfo where oid="+id;
						int i = db.updateDb(sql);
						if(i==1){
							out.println("<script language=\"JavaScript\"> alert(\"��ϲ�㣬ɾ���ɹ�������\");"
									+"window.location.href=\"ManageServlet?action=lookBookInfo\"</script>");
						}
						else{
							out.println("<script language=\"JavaScript\"> alert(\"�Բ���ɾ��ʧ�ܣ�����\");"
									+"window.location.href=\"myorder.jsp\"</script>");
						}
					}
					forward(request,response,"/ManageServlet?action=lookBookInfo");					
				}
			}
			else if(action.equals("getOrderDetail")){
				String oid = request.getParameter("oid");
				String url = request.getParameter("url");
				if(oid==null||url==null){
					String msg = "�Ƿ���URL������";
					request.setAttribute("msg",msg);
					forward(request,response,"/info.jsp");
				}
				else{
					int id = Integer.parseInt(oid.trim());
					String sql = "select O.oid,T.tname,O.ostart,O.oend,O.linkman,"+
									"O.address,O.tel,O.amount,to_char(O.tdate,'yyyy-mm-dd'),"+
									"O.ostate from orderinfo O,traininfo T "+
									"where O.tid=T.tid and O.oid="+id;
					List<String[]> ls = db.getInfo(sql);
					if(ls.size()==0){
						out.println("<script language=\"JavaScript\"> alert(\"ϵͳ���󣡣���\");"
								+"window.location.href=\"myorder.jsp\"</script>");
					}
					else{
						request.setAttribute("list",ls);
						forward(request,response,url);
					}				
				}
			}
			else if(action.equals("modifyOrder")){
				String oid = request.getParameter("oid");
				String tamount = request.getParameter("tamount");
				String tdate = request.getParameter("tdate");
				String linkman = request.getParameter("linkman");
				String address = request.getParameter("address");
				String tel = request.getParameter("tel");
				if(oid==null||oid.equals("")||tamount==null||tamount.equals("")||tdate==null||linkman==null||address==null||tel==null){
					String msg = "�Ƿ���URL������";
					request.setAttribute("msg",msg);
					forward(request,response,"/info.jsp");	
				}
				else{
					int id = Integer.parseInt(oid.trim());
					int amount = Integer.parseInt(tamount.trim());
					String sql = "update orderinfo set amount="+amount+",tdate=to_date('"+
									tdate.trim()+"','yyyy-mm-dd'),linkman='"+linkman+"',tel='"+
									tel.trim()+"',address='"+address.trim()+"' "+
									"where oid="+id;
					sql = new String(sql.getBytes(),"ISO-8859-1");
					int i = db.updateDb(sql);
					if(i==1){
						out.println("<script language=\"JavaScript\"> alert(\"��ϲ���������޸ĳɹ�������\");"
									+"window.location.href=\"myorder.jsp\"</script>");
					}
					else{
						out.println("<script language=\"JavaScript\"> alert(\"�Բ����޸�ʧ�ܣ�����\");"
									+"window.location.href=\"myorder.jsp\"</script>");	
					}					
				}
			}
			else if(action.equals("adminLogin")){
				String aname = request.getParameter("aname");
				String apwd = request.getParameter("apwd");
				String identify = request.getParameter("identify");
				if(aname==null||apwd==null||identify==null){
					out.println("<script language=\"JavaScript\"> alert(\"��Ϣ���벻�Ϸ�������\");"
								+"window.location.href=\"adminlogin.jsp\"</script>");			//��ʾ�û�
				}
				else if(!identify.toLowerCase().trim().equals(((String)session.getAttribute("randNum")).toLowerCase())){			//��������֤�����ʱ
					out.println("<script language=\"JavaScript\"> alert(\"��֤����󣡣���\");"
								+"window.location.href=\"adminlogin.jsp\"</script>");			//��ʾ�û�
				}
				else{
					String sql = "select alevel from admininfo where aname='"+aname.trim()
									+"' and apwd='"+apwd.trim()+"'";
					sql = new String(sql.getBytes(),"ISO-8859-1");
					List<String[]> ls = db.getInfo(sql);
					if(ls.size()==0){
						String msg = "�Բ����û�����������������µ�¼������";
						request.setAttribute("msg",msg);									//����ʾ��Ϣ����������
						forward(request,response,"/info.jsp");								//ҳ����ת	
					}
					else{
						session.setAttribute("admin",aname.trim());
						session.setAttribute("level",ls.get(0)[0]);
						forward(request,response,"/ManageServlet?action=lookOrder&flag=3");						
					}
				}
			}
			else if(action.equals("lookOrder")){
				String flag = request.getParameter("flag");
				if(flag==null){
					String msg = "�Ƿ���URL������";
					request.setAttribute("msg",msg);
					forward(request,response,"/info.jsp");		
				}
				else{
					String sql = "select O.oid,to_char(O.tdate,'yyyy-mm-dd'),O.ostart,O.oend,T.tname,O.ostate "+
								"from orderinfo O,traininfo T where O.tid=T.tid";
					String pagesql = "select count(*) from orderinfo";
					if(flag.equals("1")){			//1-����鿴δ������
						sql = sql+" and O.ostate='δ����' order by O.tdate desc";
						pagesql = pagesql+" where ostate='δ����'";
					}
					else if(flag.equals("2")){		//2-����鿴�Ѵ�����
						sql = sql+" and O.ostate!='δ����' order by O.tdate desc";
						pagesql = pagesql+" where ostate!='δ����'";
					}
					else{
						sql = sql+" order by O.tdate desc";
					}
					sql = new String(sql.getBytes(),"ISO-8859-1");
					pagesql = new String(pagesql.getBytes(),"ISO-8859-1");
					int totalpage = db.getTotalPage(pagesql);
					int nowpage = 1;
					System.out.println("the totalpage is :"+totalpage);
					session.setAttribute("totalpage",totalpage);
					session.setAttribute("nowpage",nowpage);
					session.setAttribute("sql",sql);
					List<String[]> ls = db.getPageContent(sql,1);
					session.setAttribute("list",ls);
					forward(request,response,"/ordermanage.jsp");
				}				
			}
			else if(action.equals("adminLogout")){
				session.invalidate();										//ʹsessionʧЧ
				forward(request,response,"/adminlogin.jsp");				//ҳ����ת
			}
			else if(action.equals("sendOrder")){
				String oid = request.getParameter("oid");
				String flag = request.getParameter("flag");
				if(oid==null||flag==null){
					String msg = "�Ƿ���URL������";
					request.setAttribute("msg",msg);
					forward(request,response,"/info.jsp");
				}
				else{
					int id = Integer.parseInt(oid.trim());
					String str = (flag.trim().equals("1"))?"�Ѷ���Ʊ":"δ����Ʊ";
					String sql = "update orderinfo set ostate='"+str+"' where oid="+id;
					sql = new String(sql.getBytes(),"ISO-8859-1");
					int i = db.updateDb(sql);
					if(i==1){
						out.println("<script language=\"JavaScript\"> alert(\"��ϲ�����������ͳɹ�������\");"
								+"window.location.href=\"ManageServlet?action=lookOrder&flag=3\"</script>");
					}
					else{
						out.println("<script language=\"JavaScript\"> alert(\"��������ʧ�ܣ�����\");"
								+"window.location.href=\"ordermanage.jsp\"</script>");
					}
				}
			}
			else if(action.equals("addAdmin")){
				String aname = request.getParameter("aname");
				String first = request.getParameter("first");
				String second = request.getParameter("second");
				if(aname==null||first==null||second==null){
					String msg = "�Ƿ���URL������";
					request.setAttribute("msg",msg);
					forward(request,response,"/info.jsp");
				}
				else if(!first.trim().equals(second.trim())){
					out.println("<script language=\"JavaScript\"> alert(\"�����������벻һ�£�����\");"
								+"window.location.href=\"resetpwd.jsp\"</script>");	
				}
				else{
					String sql = "select 1 from admininfo where aname='"+aname+"'";
					sql = new String(sql.getBytes(),"ISO-8859-1");
					List<String[]> ls = db.getInfo(sql);
					if(ls.size()!=0){
						out.println("<script language=\"JavaScript\"> alert(\"���û��Ѵ��ڣ�����\");"
								+"window.location.href=\"addadmin.jsp\"</script>");			
					}
					else{
						String temp = "insert into admininfo(aname,apwd) values('"
										+aname.trim()+"','"+first.trim()+"')";
						temp = new String(temp.getBytes(),"ISO-8859-1");
						int i = db.updateDb(temp);
						if(i==1){
							out.println("<script language=\"JavaScript\"> alert(\"��ϲ������ӳɹ�������\");"
									+"window.location.href=\"ManageServlet?action=lookAdmin\"</script>");	
						}
						else{
							out.println("<script language=\"JavaScript\"> alert(\"�Բ������ʧ�ܣ�����\");"
									+"window.location.href=\"ManageServlet?action=lookAdmin\"</script>");
						}
					}
				}				
			}
			else if(action.equals("lookAdmin")){
				String sql = "select aid,aname,alevel from admininfo";
				String pagesql = "select count(*) from admininfo";
				int totalpage = db.getTotalPage(pagesql);
				int nowpage = 1;
				System.out.println("the totalpage is :"+totalpage);
				session.setAttribute("totalpage",totalpage);
				session.setAttribute("nowpage",nowpage);
				session.setAttribute("sql",sql);
				List<String[]> ls = db.getPageContent(sql,1);
				session.setAttribute("list",ls);
				forward(request,response,"/adminmanage.jsp");				
			}
			else if(action.equals("delAdmin")){
				String aid = request.getParameter("aid");
				if(aid==null||aid.equals("")){
					String msg = "�Ƿ���URL������";
					request.setAttribute("msg",msg);
					forward(request,response,"/info.jsp");
				}
				else{
					int id = Integer.parseInt(aid.trim());
					String test = "select alevel from admininfo where aid="+id;
					List<String[]> ls = db.getInfo(test);
					
					for(String[] str:ls){
						for(String ss:str){
							System.out.println(ss);
						}
					}
					
					if(ls.size()!=0){
						String level = ls.get(0)[0];
						if(level.equals("����")){
							String msg = "��������Ա�����Ա�ɾ��������";
							request.setAttribute("msg",msg);
							forward(request,response,"/info.jsp");	
						}
						else{
							String sql = "delete from admininfo where aid="+id;
							int i = db.updateDb(sql);
							if(i==1){
								out.println("<script language=\"JavaScript\"> alert(\"��ϲ����ɾ���ɹ�������\");"
										+"window.location.href=\"ManageServlet?action=lookAdmin\"</script>");	
							}
							else{
								out.println("<script language=\"JavaScript\"> alert(\"�Բ���ɾ��ʧ�ܣ�����\");"
										+"window.location.href=\"ManageServlet?action=lookAdmin\"</script>");
							}							
						}						
					}
					else{
						out.println("<script language=\"JavaScript\">"
										+"window.location.href=\"ManageServlet?action=lookAdmin\"</script>");
					}
				}
			}
			else if(action.equals("resetPwd")){
				String aname = request.getParameter("aname");
				String first = request.getParameter("first");
				String second = request.getParameter("second");
				if(aname==null||first==null||second==null){
					String msg = "�Ƿ���URL������";
					request.setAttribute("msg",msg);
					forward(request,response,"/info.jsp");
				}
				else if(!first.trim().equals(second.trim())){
					out.println("<script language=\"JavaScript\"> alert(\"�����������벻һ�£�����\");"
								+"window.location.href=\"resetpwd.jsp\"</script>");	
				}
				else{
					String sql = "select 1 from admininfo where aname='"+aname+"'";
					sql = new String(sql.getBytes(),"ISO-8859-1");
					List<String[]> ls = db.getInfo(sql);
					if(ls.size()==0){
						out.println("<script language=\"JavaScript\"> alert(\"���û������ڣ�����\");"
								+"window.location.href=\"resetpwd.jsp\"</script>");			
					}
					else{
						String temp = "update admininfo set apwd='"+first.trim()+
										"' where aname='"+aname.trim()+"'";
						temp = new String(temp.getBytes(),"ISO-8859-1");
						int i = db.updateDb(temp);
						if(i==1){
							out.println("<script language=\"JavaScript\"> alert(\"��ϲ�������óɹ�������\");"
									+"window.location.href=\"ManageServlet?action=lookAdmin\"</script>");	
						}
						else{
							out.println("<script language=\"JavaScript\"> alert(\"�Բ�������ʧ�ܣ�����\");"
									+"window.location.href=\"ManageServlet?action=lookAdmin\"</script>");
						}
					}
				}				
			}
			else if(action.equals("modAdminPwd")){
				String oldpwd = request.getParameter("oldpwd");
				String first = request.getParameter("first");
				String second = request.getParameter("second");
				if(session.getAttribute("admin")==null){
					out.println("<script language=\"JavaScript\"> alert(\"���¼������\");"
							+"window.location.href=\"adminlogin.jsp\"</script>");
				}
				else if(oldpwd==null||first==null||second==null){
					String msg = "�Ƿ���URL������";
					request.setAttribute("msg",msg);
					forward(request,response,"/info.jsp");
				}
				else if(!first.trim().equals(second.trim())){
					out.println("<script language=\"JavaScript\"> alert(\"�����������벻һ�£�����\");"
								+"window.location.href=\"modifypwd.jsp\"</script>");	
				}
				else{
					String aname = (String)session.getAttribute("admin");
					String sql = "select 1 from admininfo where aname='"+aname.trim()
									+"' and apwd='"+oldpwd.trim()+"'";
					sql = new String(sql.getBytes(),"ISO-8859-1");
					List<String[]> ls = db.getInfo(sql);
					if(ls.size()==0){
						out.println("<script language=\"JavaScript\"> alert(\"������������󣡣���\");"
								+"window.location.href=\"modifypwd.jsp\"</script>");	
					}
					else{
						String temp = "update admininfo set apwd='"+first.trim()+
										"' where aname='"+aname.trim()+"'";
						temp = new String(temp.getBytes(),"ISO-8859-1");
						int i = db.updateDb(temp);
						if(i==1){
							out.println("<script language=\"JavaScript\"> alert(\"��ϲ���������޸ĳɹ�������\");"
									+"window.location.href=\"ManageServlet?action=lookOrder&flag=3\"</script>");	
						}
						else{
							out.println("<script language=\"JavaScript\"> alert(\"�Բ��������޸�ʧ�ܣ�����\");"
									+"window.location.href=\"modifypwd.jsp\"</script>");
						}
					}					
				}				
			}			
		}
	}
	protected void forward(HttpServletRequest request,HttpServletResponse response,String url)
    throws ServletException,IOException 
    {	
    	ServletContext sc = getServletContext();							//�õ�������
		RequestDispatcher dispatcher = sc.getRequestDispatcher(url);
		dispatcher.forward(request,response);								//ҳ����ת
    }
}