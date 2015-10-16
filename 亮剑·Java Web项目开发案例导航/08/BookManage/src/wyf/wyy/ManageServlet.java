package wyf.wyy;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.springframework.web.context.*;
import org.springframework.web.context.support.*;
public class ManageServlet extends HttpServlet{
	public void doGet(HttpServletRequest req,HttpServletResponse res)
	throws ServletException,IOException{		
		this.doPost(req,res);
	}
	public void doPost(HttpServletRequest req,HttpServletResponse res)
	throws ServletException,IOException{
		req.setCharacterEncoding("gbk");						//����req����ΪGBK
		res.setCharacterEncoding("gbk");						//����res����ΪGBK
		String action = req.getParameter("action");				//�õ�����action����
		System.out.println(" action ManageServlet"+action);
		final int day = 60;										//��������
		final int order = 1;									//ΪԤԼͬѧ����ͼ������
		String sql = "";										//����SQL�������
		String message = "";									//������Ϣ�ַ���
		Vector<Vector<String>> v = new Vector<Vector<String>>();//������Ϣ��������
		Vector<String> student;									//�������ѧ����Ϣ������
		Vector<String> ve = new Vector<String>();				//�����������SQL���
		HttpSession session = req.getSession();					//�õ�session
		WebApplicationContext wac = 
			WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
		StuDB sdb = (StuDB)wac.getBean("StuDB");						//�õ�StuDB����
        DBUtil dbu = (DBUtil)wac.getBean("DBUtil");						//�õ�DBUtil����
        StatusBean status = (StatusBean)session.getAttribute("status");	//�õ���¼״̬��Bean          
		if(action.equals("login")){								//����Ա��½
			String mID = req.getParameter("uname").trim();		//�õ�Ҫ��½�Ĺ���Ա��
			String mPwd = req.getParameter("pwd").trim();		//�õ�Ҫ��½�Ĺ���Ա����
			sql = "select * from manage where ManageID='"+
				  mID+"' and managePwd='"+mPwd+"'";
			if(dbu.isExist(sql)){									//���������¼����
				sql = "select ManageLevel from manage where"+
					  " ManageID='"+mID+"'";						//�õ�����Ա�����SQL
				String adLevel = dbu.getStringInfo(sql);
				System.out.println("��½����Ա���� "+adLevel);
				session.setAttribute("adLevel",adLevel);			//�Ž�session
				session.setAttribute("adName",mID);				//������Ա���Ž�session
			}
			else{
				message = "�Ƿ����û��������룬��˶Ժ��½";	//��½ʧ����ʾ��Ϣ
				req.setAttribute("message",message);			//������ʾ��Ϣ
			}
			req.getRequestDispatcher("admin_login.jsp").forward(req,res);
		}
		else if(action.equals("logout")){									//ע��
			req.getSession(true).invalidate();								//ʹsessionʧЧ
			req.getRequestDispatcher("admin_login.jsp").forward(req,res); 	//ת������½ҳ��
		}
		else if(action.equals("adManage")){									//�鿴����Ա��Ϣ
			String mID = (String)session.getAttribute("adName");			//�õ���½�Ĺ���ԱID		
			if(mID!=null){						//������Ա����Ž�session
				res.sendRedirect("admin_manage.jsp");							//ת���˺�ά��ҳ��				
			}
			else{																//����Աû�е�½
				message = "�Բ�������û�е�½�����ȵ�½��";					//������ʾ��Ϣ
				req.setAttribute("message",message);							//������ʾ��Ϣ	
				req.getRequestDispatcher("admin_login.jsp").forward(req,res);	//ת����Ϣ����½ҳ��				
			}
		}
		else if(action.equals("adChangePwd")){							//����Ա�޸�����
			String oldPwd = req.getParameter("oldPwd").trim();			//�õ�ѧ������ľ�����
    		String newPwd = req.getParameter("newPwd").trim();			//�õ�Ҫ�޸ĺ������ 
    		String mID = (String)session.getAttribute("adName");		//�õ���½�Ĺ���ԱID   		
    		sql = "select * from manage where ManageID='"+
				  mID+"' and managePwd='"+oldPwd+"'";					//ȷ�������Ƿ���ȷ��SQL
			if(dbu.isExist(sql)){
				sql = "update manage set ManagePwd='"+newPwd+
					  "' where ManageID='"+mID+"'";						//���������SQL���
				if(dbu.update(sql)){
					message = "�����޸ĳɹ����´������������½��";	   //�޸�����ɹ�����ʾ
				}
				else{
					message = "δ֪���������޸�ʧ�ܡ�";				//�޸�ʧ��
				}
			}	
    		else{															 //�����޸�ʧ��
    			message = "���������������˶Ժ������޸ġ�";				//�޸�ʧ�ܵ���ʾ��Ϣ
    		}    	
 			req.setAttribute("message", message);							 //������Ϣ
    		req.getRequestDispatcher("admin_manage.jsp").forward(req,res); 	 //û�е�½��ת������½ҳ��   	
		}
		else if(action.equals("befor_aa")){										//��ӹ���Ա����
			String adLevel = (String)session.getAttribute("adLevel");			//�õ�����Ա����
			if(adLevel.equals("1")){
				res.sendRedirect("add_admin.jsp");								//��Ȩ�����͵�����ҳ��
			}
			else{				
				message = "�����ǳ�������Ա��û�жԹ���Ա���й���Ĺ��ܡ�"; 		 //������ʾ��Ϣ
				req.setAttribute("message",message);
				req.getRequestDispatcher("admin_info_one.jsp").forward(req,res);	//ת��
			}																		//���÷���ִ���ж�Ȩ��
		}
		else if(action.equals("addAdmin")){
			String adID = req.getParameter("adID").trim();
			String adPwd = req.getParameter("adPwd").trim();
			System.out.println(adID+" "+adPwd+" ");
			sql = "select * from manage where ManageID='"+adID+"'";		//�鿴�ù���Ա���Ƿ��Ѿ����ڵ�SQL
			if(dbu.isExist(sql)){
				message = "����Ա���Ѵ��ڣ���˶Ժ�������ӣ�����";
			}
			else{
				sql = "insert into manage(ManageID,ManagePwd) values('"+
					   adID+"','"+adPwd+"')";									//�����¹���Ա��SQL
				if(dbu.update(sql)){
					message = "�ɹ���ӹ���Ա��";							//�ɹ�������ʾ��Ϣ
				}
				else{
					message = "δ֪�������ʧ�ܡ�";						   //���ʧ����ʾ��Ϣ
				}
			}			
			req.setAttribute("message",message);							//������Ϣ
			req.getRequestDispatcher("add_admin.jsp").forward(req,res);		//ת��
		}
		else if(action.equals("befor_rp")){									//������������ҳ��֮ǰ
			String adLevel = (String)session.getAttribute("adLevel");		//�õ�����Ա����
			if(adLevel.equals("1")){
				res.sendRedirect("admin_resetPwd.jsp");						//��Ȩ�����͵�����ҳ��
			}
			else{				
				message = "�����ǳ�������Ա��û�жԹ���Ա���й���Ĺ��ܡ�"; 		 //������ʾ��Ϣ
				req.setAttribute("message",message);
				req.getRequestDispatcher("admin_info_one.jsp").forward(req,res);	//ת��
			}								
		}
		else if(action.equals("reset_admin_pwd")){									//���ù���Ա����
			String adID = req.getParameter("adID").trim();							//�õ�Ҫ���õĹ���Ա��
			String adPwd = req.getParameter("adPwd").trim();						//�õ���������
			sql = "select * from manage where ManageID='"+adID+"'";					//�鿴�ù���Ա�Ƿ���ڵ�SQL
			if(dbu.isExist(sql)){
				sql = "update manage set ManagePwd='"+adPwd+"' "+
					  "where ManageID='"+adID+"'";									//���������SQL���
				if(dbu.update(sql)){
					message = "�������óɹ�������";								   //���óɹ���Ϣ
				}
				else{
					message = "δ֪��������ʧ�ܡ�";								  //ʧ����Ϣ
				}				
			}
			else{
				message = "�ù���Ա�����ڣ���˶Ժ��������롣";						//����Ա�����ڵ���Ϣ							
			}
			req.setAttribute("message",message);
			req.getRequestDispatcher("admin_resetPwd.jsp").forward(req,res);
		}
		else if(action.equals("befor_la")){
			System.out.println("����Ա�б�֮ǰ"+status);
			String adLevel = (String)session.getAttribute("adLevel");
			if(adLevel.equals("1")){
				sql = "select ManageID,ManageLevel from manage";					//��������Ա�б��SQL
				status.setSql(sql);													//����SQL���
				int span = status.getSpan();										//�õ�ÿҳ��ʾ��¼����
				v = dbu.getPageContent(sql,1,span);
				sql = "select count(*) from manage";								//�õ���¼��������SQL
				int total = dbu.getTotal(sql,span);										//ִ�в�ѯ�õ���ҳ��
				status.setTotal(total);												//�����ܹ��ж���ҳ
				status.setCurPage(1);												//���õ�ǰ��ʾ��һҳ
				req.setAttribute("v",v);
				req.getRequestDispatcher("list_admin.jsp").forward(req,res);		//ת�����б�ҳ��				
			}
			else{
				message = "�����ǳ�������Ա��û�жԹ���Ա���й���Ĺ��ܡ�"; 		 //û��Ȩ�޵���ʾ��Ϣ
				req.setAttribute("message",message);
				req.getRequestDispatcher("admin_info_one.jsp").forward(req,res);		//ת�����б�ҳ��	
			}
		}
		else if(action.equals("delAdmin")){
			String mID = req.getParameter("mID").trim();							//�õ�Ҫɾ���Ĺ���Ա��
			sql = "delete from manage where ManageID='"+mID+"'";					//ɾ����SQL���
			if(dbu.update(sql)){
				message = "ɾ������Ա"+mID+"�ɹ�<a href='StudentServlet?"+		 	//ɾ���ɹ�����ʾ��Ϣ
						  "action=changePage&url=list_admin.jsp&"+
    					  "curPage=1'/><br>������ﷵ��";
			}
			else{
				message = "δ֪����ɾ��ʧ��<a href='StudentServlet?"+				//ɾ���ɹ�����ʾ��Ϣ
						  "action=changePage&url=list_admin.jsp&"+
    					  "curPage=1'/><br>������ﷵ��";							   //ɾ��ʧ����ʾ��Ϣ
			}
			req.setAttribute("message",message);
			req.getRequestDispatcher("admin_info_one.jsp").forward(req,res);		 //���͵���Ϣ��ʾҳ��
		}
//=====================����Ա�����ֽ���============================================================
		else if(action.equals("stu_manage")){										 //����ѧ������֮ǰ
			String mID = (String)session.getAttribute("adName");					 //�õ���½�Ĺ���Ա��
			if(mID!=null){
				res.sendRedirect("stu_manage.jsp");									 //ת����ѧ������ҳ��				
			}
			else{
				message = "�Բ�������û�е�½�����ȵ�½��";								 //û�е�½����ʾ��Ϣ
				req.setAttribute("message",message);								 //������Ϣ
				req.getRequestDispatcher("admin_login.jsp").forward(req,res);		 //���͵���½ҳ��
			}
		}
		else if(action.equals("add_stu")){											//���ѧ��
			String stuNO = req.getParameter("stuNO").trim();						//�õ����ѧ����ѧ��
			String stuName = req.getParameter("stuName").trim();					//�õ�ѧ������
			String age = req.getParameter("age").trim();							//�õ�ѧ������
			String gender = req.getParameter("gender");							    //�õ�ѧ���Ա�
			String stuClass = req.getParameter("stuClass").trim();					//�õ�ѧ���İ༶
			String dep = req.getParameter("dep").trim();							//�õ�ѧ��ϵ��
			sql = "select * from student where StudentNO='"+stuNO+"'";				//�鿴��ѧ���Ƿ��Ѿ�����
			if(dbu.isExist(sql)){
				message = "��ѧ��ѧ���Ѿ����ڡ���˶Ժ���ӣ�";					   //������ʾ��Ϣ
			}
			else{
				sql = "insert into student values('"+stuNO+"','"+stuNO+
				  	  "','"+stuName+"','"+age+"','"+gender+"','"+stuClass+
				  	  "','"+dep+"',"+1+")";											//������ѧ����SQL���
				if(dbu.update(sql)){
					message = "��������ɹ���";									 //����ɹ���Ϣ
				}
				else{
					message = "λ�ô������ʧ�ܡ�";									//����������Ϣ
				}
			}			
			req.setAttribute("message",message);
			req.getRequestDispatcher("stu_manage.jsp").forward(req,res);			
		}
		else if(action.equals("list_stu")){											 //�г�����ѧ����Ϣ
			sql = "select * from student";											 //��������ѧ����SQL
			int span = status.getSpan();										     //�õ�ÿҳ��ʾ��������¼
			v = dbu.getPageContent(sql,1,span);										 //�õ���ǰҳ��ʾ����
			status.setSql(sql);														 //����SQL
			sql = "select count(*) from student";									 //ͳ��ѧ����¼����			
			int total = dbu.getTotal(sql,span);										 //����õ���ҳ��			
			status.setTotal(total);													 //������ҳ��
			status.setCurPage(1);													 //���õ�ǰΪ��һҳ		
			req.setAttribute("v",v);												 //������Ϣ����
			req.getRequestDispatcher("list_stu.jsp").forward(req,res);				 //ת��			
		}
		else if(action.equals("delStu")){							//ɾ��ѧ��
			String stuNO = req.getParameter("stuNO");				//�õ�Ҫɾ����ѧ��ѧ��
			sql = "delete from student where StudentNO='"+stuNO+"'";//ɾ��ѧ����SQL���
			if(dbu.update(sql)){
				message = "ɾ���ɹ�<a href='ManageServlet?action"+
						  "=list_stu'>����";						  //ɾ���ɹ���ʾ
			}
			else{
				message = "δ֪����ɾ��ʧ�ܡ�<a href='ManageServlet"+
						  "?action=list_stu'>����";						  	  //ɾ��ʧ����ʾ��Ϣ
			}
			req.setAttribute("message",message);								//������ʾ��Ϣ
			req.getRequestDispatcher("admin_info_two.jsp").forward(req,res);	//ת��
		}
		else if(action.equals("editStu")){										//�޸�ѧ����Ϣ
			String stuNO = req.getParameter("stuNO");							//�õ�����ѧ��			
			student = sdb.getStuInfo(stuNO);									//�õ�������Ϣ
			req.setAttribute("student",student);								//������Ϣ����
			req.getRequestDispatcher("edit_stu.jsp").forward(req,res);			//ת��
		}
		else if(action.equals("save_stu")){											//�޸ĺ���Ϣ���б���ʱ
			String stuNO = req.getParameter("stuNO").trim();						//�õ��޸�ǰ��ѧ��ѧ��
			String newNO = req.getParameter("newNO").trim();						//�õ��޸ĺ��ѧ��
			String stuName = req.getParameter("stuName").trim();					//�õ��޸ĺ��ѧ������
			String age = req.getParameter("age").trim();							//�õ��޸ĺ��ѧ������
			String gender = req.getParameter("gender");							    //�õ��޸ĺ��ѧ���Ա�
			String stuClass = req.getParameter("stuClass").trim();					//�õ��޸ĺ��ѧ���İ༶
			String dep = req.getParameter("dep").trim();							//�õ��޸ĺ��ѧ��ϵ��
			String per = req.getParameter("per");									//�õ��޸ĺ�Ľ���Ȩ��
			sql = "select * from student where StudentNO='"+newNO+"'";				//�鿴���޸ĵ�ѧ���Ƿ��Ѿ����ڵ�SQL���
			if(!newNO.equals(stuNO)&&dbu.isExist(sql)){
				message = "�޸ĺ��ѧ���Ѿ����ڡ�";			   					 //��ѧ���Ѿ����ڵ���ʾ��Ϣ
			}			
			else{
				sql = "update student set StudentNO='"+newNO+"',"+
					  "Name='"+stuName+"',Age="+age+",Gender"+
					  "='"+gender+"',Class='"+stuClass+"',Department"+
					  "='"+dep+"',Permitted="+per+" where StudentNO='"+
					  stuNO+"'";												   //���¸�����Ϣ��SQL���
				System.out.println(sql);
				if(dbu.update(sql)){											   //�жϸ��½��
					message = "�޸ı���ɹ���";									//�޸ĳɹ���ʾ
				}
				else{
					message = "δ֪�����޸�ʧ��";								  //�޸�ʧ����ʾ
				}
			}
			student = sdb.getStuInfo(newNO);										//�õ�������Ϣ
			req.setAttribute("student",student);									//���ø�����Ϣ����
			req.setAttribute("message",message);								   //������ʾ��Ϣ
			req.getRequestDispatcher("edit_stu.jsp").forward(req,res);			   //ת��
		}
		else if(action.equals("search_stu")){									//��ѯѧ��
			String stuNO = req.getParameter("stuNO").trim();					//�õ�Ҫ��ѯ��ѧ��
			sql = "select * from student where StudentNO='"+stuNO+"'";			//��ѯ��Ϣ��SQL
			v = dbu.getInfo(sql);												//ִ�в�ѯ�õ����
			req.setAttribute("v",v);											//����ѧ����Ϣ
			req.getRequestDispatcher("list_stu.jsp").forward(req,res);			//ת����Ϣ
		}
//============================ѧ���������========================================================
		else if(action.equals("book_manage")){													//ͼ�����
			String mID = (String)session.getAttribute("adName");				//�õ���½�Ĺ���Ա��
			if(mID!=null){
				res.sendRedirect("book_manage.jsp");							//ת����ѧ������ҳ��				
			}
			else{
				message = "�Բ�������û�е�½�����ȵ�½��";					//û�е�½����ʾ��Ϣ
				req.setAttribute("message",message);							//������Ϣ
				req.getRequestDispatcher("admin_login.jsp").forward(req,res);	//���͵���½ҳ��
			}						
		}
		else if(action.equals("add_book")){
			String bNO = req.getParameter("bNO").trim();					//�õ�ͼ����
			String bName = req.getParameter("bName").trim();				//�õ�ͼ������
			String author = req.getParameter("author").trim();				//�õ�ͼ������
			String publish = req.getParameter("publish").trim();			//�õ�ͼ�����������
			String isbn = req.getParameter("isbn").trim();					//�õ�ͼ��ISBN��
			String price = req.getParameter("price").trim();				//�õ�ͼ��۸�
			Calendar cal = Calendar.getInstance();							//�õ���ǰ���ڶ���
			String now = DateUtil.getDateString(cal);						//ת�����ַ�����ʽ
			sql = "select * from book where BookNO='"+bNO+"'";				//�鿴��ͼ�����Ƿ���ڵ�SQL���
			if(dbu.isExist(sql)){
				message = "��ͼ�����Ѿ����ڣ���˶Ժ����롣";			   //ͼ�����Դ��ڵĵ���ʾ��Ϣ
			}
			else{
				sql = "insert into book values('"+bNO+"','"+bName+
				  	  "','"+author+"','"+publish+"',"+"'"+isbn+
				  	  "',"+now+",'"+price+"',"+0+")";					//����ͼ���¼��SQL���
				if(dbu.update(sql)){
					message = "���ͼ��ɹ���";								//��ӳɹ�����ʾ��Ϣ
				}
				else{
					message = "δ֪�������ʧ�ܡ�";							 //���ʧ����Ϣ
				}
			}
			req.setAttribute("message",message);							//������ʾ��Ϣ
			req.getRequestDispatcher("book_manage.jsp").forward(req,res);	//ת������ʾҳ��
		}
		else if(action.equals("list_book")){						//����ͼ���б�
			sql = "select * from book";								//��������ͼ���¼��SQL
			int span = status.getSpan();							//�õ�ÿҳ��ʾ��������¼
			int page = 1;											//��ǰ��ʾ��һҳ
			v = dbu.getPageContent(sql,1,span);						//�õ���ǰҳ��ʾ����			
			status.setSql(sql);										//����SQL���
			sql = "select count(*) from book";						//������¼��������SQL���
			int total = dbu.getTotal(sql,span);						//�õ�������
			status.setTotal(total);									//�����¼����
			req.setAttribute("v",v);								//������Ϣ����
			req.getRequestDispatcher("list_book.jsp").forward(req,res);
		}
		else if(action.equals("delBook")){							//ɾ��ͼ��
			String bNO = req.getParameter("bNO").trim();			//�õ�Ҫɾ����ͼ����
			sql = "delete from book where BookNO='"+bNO+"'";		//ɾ����ͼ���SQL���
			if(dbu.update(sql)){
				message = "ɾ���ɹ�<a href='ManageServlet?"+
						  "action=list_book'>����";				  //ɾ���ɹ���Ϣ
			}
			else{
				message = "δ֪����ɾ��ʧ��<a href='ManageServlet?"+
						  "action=list_book'>����";				  //ɾ��ʧ����ʾ��Ϣ
			}
			req.setAttribute("message",message);					//������Ϣ
			req.getRequestDispatcher("list_book.jsp").forward(req,res);
		}
		else if(action.equals("editBook")){							//�༭ͼ����Ϣ
			String bNO = req.getParameter("bNO").trim();				//�õ�ͼ����
			sql = "select * from book where BookNO='"+bNO+"'";			//����ͼ����Ϣ��SQL
			v = dbu.getInfo(sql);										//ִ�в�ѯ�õ���Ϣ
			System.out.println(v.size());
			req.setAttribute("v",v);									//������Ϣ����
			req.getRequestDispatcher("edit_book.jsp").forward(req,res); //���͵��༭ͼ��ҳ��
		}
		else if(action.equals("save_book")){
			String newBNO = req.getParameter("newNO").trim();				//�õ��޸ĺ�����
			String bName = req.getParameter("bName").trim();				//�õ��޸ĺ������
			String author = req.getParameter("author").trim();				//�õ��޸ĺ�������
			String publish = req.getParameter("publish").trim();			//�õ��޸ĺ�ͼ�����������
			String isbn = req.getParameter("isbn").trim();					//�õ��޸ĺ�ͼ��ISBN��
			String price = req.getParameter("price").trim();				//�õ��޸ĺ�ͼ��۸�
			String bNO = req.getParameter("bNO").trim();					//�õ��޸�ǰ�����
			sql = "select * from book where BookNO='"+newBNO+"'";			//�鿴�޸ĺ��ͼ�����Ƿ���ڵ�SQL
			if(!bNO.equals(newBNO)&&dbu.isExist(sql)){
				message = "�޸ĺ��ͼ�����Ѵ��ڣ���˶����롣";			  //��ʾ��Ϣ
			}
			else{
				sql = "update book set BookNO='"+newBNO+"',"+
					  "BookName='"+bName+"',Author='"+author+
					  "',Publish='"+publish+"',BookIsbn='"+
					  isbn+"',BookPrice="+price+" where BookNO"+
					  "='"+bNO+"'";											//���¸�ͼ����Ϣ��SQL���
				if(dbu.update(sql)){
					message = "ͼ����Ϣ�޸ĳɹ���";						   //�޸ĳɹ���ʾ��Ϣ
				}
				else{
					message = "δ֪�����޸�ʧ�ܡ�";							  //�޸�ʧ����ʾ��Ϣ
				}				
			}
			sql = "select * from book where BookNO='"+newBNO+"'";			//�����޸ĺ��ͼ����Ϣ��SQL���
			v = dbu.getInfo(sql);											//ִ�в�ѯ�õ�ͼ����Ϣ
			req.setAttribute("v",v);										//����ͼ����Ϣ
			req.setAttribute("message",message);							//������ʾ��Ϣ
			req.getRequestDispatcher("edit_book.jsp").forward(req,res); 	//���͵��༭ͼ��ҳ��
		}
		else if(action.equals("search_book")){								//����ͼ��
			String condition = req.getParameter("condition");				//�õ���������
			String key = req.getParameter("key");							//�õ����ҹؼ���
			sql = "select * from book where "+condition+
				  " like '%"+key+"%'";										//��ѯ��SQL���
			v = dbu.getInfo(sql);											//ִ�в�ѯ�õ����
			req.setAttribute("v",v);										//���ò�ѯ���
			req.getRequestDispatcher("list_book.jsp").forward(req,res);		//ת��
		}
//===============================ͼ��������==============================================
		else if(action.equals("borrow_manage")){							//������Ĺ���ʱ�жϹ���Ա�Ƿ��½
			String mID = (String)session.getAttribute("adName");					 //�õ���½�Ĺ���Ա��
			if(mID!=null){
				res.sendRedirect("borrow_manage.jsp");								 //ת����ѧ������ҳ��				
			}
			else{
				message = "�Բ�������û�е�½�����ȵ�½��";						 //û�е�½����ʾ��Ϣ
				req.setAttribute("message",message);								 //������Ϣ
				req.getRequestDispatcher("admin_login.jsp").forward(req,res);		 //���͵���½ҳ��
			}
		}
		else if(action.equals("borrow_book")){										//ѧ������
			String stuNO = req.getParameter("stuNO");								//�õ�Ҫ�����ѧ��
			String bNO = req.getParameter("bNO");									//�õ�Ҫ������			
			sql = "select Permitted from student where StudentNO='"+stuNO+"'";		//�õ�����Ȩ�޵�SQL���
			String per = dbu.getStringInfo(sql);									//ִ�в�ѯ
			if(per!=null){
				if(per.equals("1")){													//��Ȩ�޽���
					if(sdb.getCurMoney(stuNO).size()>0){								//�����г��ڵ���û��
						message = "�������鳬�ڣ����ɽ��顣";
					}
					else{
						sql = "select * from book where BookNO='"+bNO+"'";				//�鿴�����Ƿ���ڵ�SQL
						if(dbu.isExist(sql)){
							if(dbu.canBorrow(stuNO,bNO)){
								Calendar now = Calendar.getInstance();							//�õ���ǰ����
								String start = DateUtil.getDateString(now);						//ת�����ַ�����ʽ
								String end = DateUtil.addSomeDay(start,day);					//�õ�Ӧ�黹����
								sql = "insert into borrow_list(StudentNO,BookNO,StartTime,"+
									  "End) values('"+stuNO+"','"+bNO+"','"+start+"',"+
									  "'"+end+"')";												//����ı��в�������¼��SQL
								ve.add(sql);
								sql = "update book set BookStatus=1 where BookNO='"+bNO+"'";	//����ͼ��״̬��SQL
								ve.add(sql);
								if(dbu.update(ve)){
									message = "����ɹ���";
								}
								else{
									message = "δ֪���󣬽���ʧ��";
								}
							}
							else{
								message = "�����ѱ���ԤԼ�����ɽ����";
							}							
						}
						else{
							message = "��ͼ���Ŷ�Ӧͼ�鲻���ڣ���˶Ժ��������롣";		  //ͼ�鲻������ʾ
						}					
					}
				}
				else{
					message = "����û�н���Ȩ�ޡ�";
				}			
			}
			else{
				message = "û�и�ѧ��ѧ������˶Ժ�����";									  //û�и�ѧ��ѧ��
			}
			req.setAttribute("message",message);
			req.getRequestDispatcher("borrow_manage.jsp").forward(req,res);
		}
		else if(action.equals("return_book")){													//ѧ������
			String bNO = req.getParameter("bNO");						//�õ�Ҫ��������
			Calendar cal = Calendar.getInstance();					//�õ���ǰʱ��						
			String now = DateUtil.getDateString(cal);				//תΪ�ַ�����ʽ
			String temp = "";											//����ʱ���ַ�������				
			sql = "select BorrowNO from borrow_list where BookNO='"+
				  bNO+"' and Deal!=1";									//���Ҹý����¼��Ӧ����ŵ�SQL
			String boNO = dbu.getStringInfo(sql);						//ִ�в�ѯ�õ������¼��
			if(boNO!=null){
				sql = "select StudentNO from borrow_list where "+
					  "BorrowNO='"+boNO+"'";
				String stuNO = dbu.getStringInfo(sql);					//�õ�����ѧ��
				sql = "select Pay from amercement where BorrowNO='"+
					  boNO+"' and Detail='���鷣��'";											//�鿴�ü�¼�Ƿ��ڷ��������û�д����������������ǹ�ʧ��ͼ��黹
				String pay = dbu.getStringInfo(sql);					//�õ��Ƿ���
				boolean flag = false;									//�Ƿ�ɻ���
				if(pay!=null){
					if(pay.equals("1")){
						message = "����Ϊ��ʧͼ���Ҵ�����ϣ������ٻ��顣";
					}
					else{												//��ʧ��δ����					
						temp = "delete from amercement where BorrowNO"+	
   							   "='"+boNO+"'";							//ɾ���˷����¼��SQL���	
						ve.add(temp);						
						flag = true;									//��־λΪtrue;
					}
				}
				if(pay==null||flag==true){								//�Ƿ�ɻ���
					sql = "select End from borrow_list where BorrowNO='"+					  	   
					       boNO+"'";						//�õ�����Ӧ�ù黹��ʱ��										
					String end = dbu.getStringInfo(sql);	//ִ�в�ѯ�õ�Ӧ�黹ʱ��										
					int days = DateUtil.getDay(now,end);					//�õ����ڲ�	
					if(days==day){
						message = "�������鲻�ܵ��컹��";
					}
					else{
						if(days<0){												//ͼ���ѳ���	
							double money = -days*0.1;							//���㷣��
							temp = "insert into amercement(BorrowNO,StudentNO"+							
							   	   ",Detail,Mulct) values('"+boNO+"','"+stuNO+							
							   	   "','���ڷ���',"+money+")";					//���볬�ڷ����¼��SQL				
							ve.add(temp);
							temp = "update student set Permitted=0 where "+
								   "StudentNO='"+stuNO+"'";						//���¸�������Ȩ�޵�SQL
							ve.add(temp);
						}
						temp = "update book set BookStatus=0 where"+
							   " BookNO='"+bNO+"'";							//���´�ͼ��״̬Ϊ�ڹ�
						ve.add(temp);
						temp = "update borrow_list set Deal=1 where"+
							   " BorrowNO='"+boNO+"'";							//���½��ļ�¼Ϊ�ѹ黹
						ve.add(temp);
						sql = "select OrderNO from order_list where"+
							  " BookNO='"+bNO+"' and (EndTime is null"+
							  " or EndTime='ͼ���Ѷ�ʧ')";						   	//�鿴�����Ƿ�ԤԼ
						String oNO = dbu.getStringInfo(sql);						//�õ�ԤԼ���					
						if(oNO!=null){											//��ԤԼ
							String endTime = "";
							endTime = DateUtil.addSomeDay(now,order);			//ΪԤԼͬѧ����ͼ������
							temp = "update order_list set EndTime='"+
								   endTime+"' where OrderNO='"+oNO+"'";			//����ԤԼ��
							ve.add(temp);
						}
						if(dbu.update(ve)){
						message = "����ɹ�";
						}
						else{
							message = "δ֪���󣬻���ʧ�ܡ�";
						}						
					}						
				}
			}
			else{
				message = "û�ж�Ӧ�Ľ����¼����˶����롣";
			}
			req.setAttribute("message",message);
			req.getRequestDispatcher("return_book.jsp").forward(req,res);		
		}
		else if(action.equals("get_amer_list")){					//�鿴������Ƿ��״̬
			String stuNO = req.getParameter("stuNO");
			sql = "select Name from student where StudentNO='"+stuNO+"'";
    		String stuName = dbu.getStringInfo(sql);
    		if(stuName!=null){    			
				sql = "select BookName,Detail,StartTime,End,Mulct,AmerceNO from "+
					  "book,borrow_list,amercement where amercement.StudentNO='"+
	    			  stuNO+"' and Pay="+0+" and (amercement.BorrowNO="+
	    			  "borrow_list.BorrowNO and borrow_list.BookNO=book.BookNO)";//�õ��������û�н��ɵķ����¼
	    		v = dbu.getInfo(sql);											//�õ���ǰ���ڷ�����Ϣ
	    		req.setAttribute("va",v);										//������Ϣ����
	    		v = sdb.getCurMoney(stuNO);	    		
	    		req.setAttribute("vb",v);										//������Ϣ����  
				req.setAttribute("stuName",stuName);							//����ѧ��������Ϣ
	    		req.getRequestDispatcher("list_amerce.jsp").forward(req,res);	//ת������ʾҳ�� 
    		}
    		else{
    			message = "û�и�ѧ�Ŷ�Ӧ��ѧ������˶Ժ����롣";
    			req.setAttribute("message",message);
				req.getRequestDispatcher("amerce.jsp").forward(req,res);		
    		}		 
		}
		else if(action.equals("amerce")){
			String aNO = req.getParameter("AmerceNO");						//�õ������¼������
			sql = "select StudentNO from amercement where AmerceNO"+
				  "='"+aNO+"'";
			String stuNO = dbu.getStringInfo(sql);							//�õ�����ѧ��
			Calendar cal = Calendar.getInstance();							//�õ���ǰʱ��
			String now = DateUtil.getDateString(cal);						//ת��Ϊ�ַ�����ʽ
			sql = "update amercement set Pay=1,PayTime='"+now+"'"+
				  " where AmerceNO='"+aNO+"'";								//���¼�¼
			if(dbu.update(sql)){
				message = "���ɳɹ�<a href='ManageServlet?"+
						  "action=get_amer_list&stuNO="+stuNO+"'>����";		  		//��ʾ��Ϣ
			}
			else{
				message = "����ʧ��<a href='ManageServlet?"+
						  "action=get_amer_list&stuNO="+stuNO+"'>����";		  //��ʾ��Ϣ
			}
			req.setAttribute("message",message);
			System.out.println(message);
			req.getRequestDispatcher("list_amerce.jsp").forward(req,res);	//׼��
		}
	}
}
