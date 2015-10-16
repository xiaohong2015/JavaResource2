package wyf.wyy;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.springframework.web.context.*;
import org.springframework.web.context.support.*;

public class StudentServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res)
	throws ServletException, IOException{
    	this.doPost(req,res);
    }   	    
    public void doPost(HttpServletRequest req, HttpServletResponse res)
	throws ServletException,IOException{
    	res.setCharacterEncoding("GBK");				//����res����ΪGBK								
    	req.setCharacterEncoding("GBK");				//����req����ΪGBK
    	HttpSession session = req.getSession();			//�õ�session����
    	String action = req.getParameter("action");		//�õ�action����
    	String message = "";							//������Ϣ�ַ���
    	String sql = "";								//����SQL����ַ���
    	Vector<Vector<String>> v;						//������Ϣ��������
    	Vector<String> student;							//���ѧ����Ϣ������
    	Vector<String> ve = new Vector<String>();		//�����ʱSQL���
    	final int delay = 30;							//����ͼ������
    	final int distance = 5;							//���ƿ��������ʱ��
    	String stuNO = (String)session.getAttribute("stuNO");//�õ���ǰ��½��ѧ����Ϣ
    	//��ȡWeb�����е�Spring��������
        WebApplicationContext wac
           = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
        StuDB sdb = (StuDB)wac.getBean("StuDB");						//�õ�StuDB����
        DBUtil dbu = (DBUtil)wac.getBean("DBUtil");						//�õ�DBUtil����    	
    	if(action.equals("login")){							
			stuNO = req.getParameter("uname").trim();			//�õ���½�û���
			String pwd = req.getParameter("pwd").trim();				//�õ���½����			
			if((sdb.verify(stuNO,pwd))){								//��½�ɹ�								
    			student = sdb.getStuInfo(stuNO);						//ִ�в�ѯ�õ���ѧ����Ϣ
    			session.setAttribute("stuNO",stuNO);					//��ѧ�ŷŽ�session
    			session.setAttribute("stuName",student.get(1));			//��ѧ�������Ž�session		
			}
			else{
				message = "�Ƿ����û��������룬��˶Ժ����µ�½��";	 //��½ʧ����Ϣ
				req.setAttribute("message", message);					//������Ϣ						
			}
			req.getRequestDispatcher("login.jsp").forward(req,res);	//ת����loginҳ��							
    	}
    	else if(action.equals("logout")){
			req.getSession(true).invalidate();							//ʹsessionʧЧ
			req.getRequestDispatcher("login.jsp").forward(req,res); 	//ת������½ҳ��
    	}
    	else if(action.equals("stuInfo")){								//�鿴ѧ����Ϣ
    		if(stuNO!=null){											//ѧ���Ѿ���½
    			student = sdb.getStuInfo(stuNO);						//��ѯ�õ�ѧ����Ϣ
    			req.setAttribute("student",student);					//����ѧ����Ϣ
    			req.getRequestDispatcher("stuInfo.jsp").forward(req,res);//û�е�½��ת������½ҳ��
    		}
    		else{
    			message = "����û�е�½�����ȵ�½�ٲ鿴��"	;			 //��ʾ��Ϣ
    			req.setAttribute("message", message);					//������Ϣ
    			req.getRequestDispatcher("login.jsp").forward(req,res); //û�е�½��ת������½ҳ��
    		}
    	}
    	else if(action.equals("stuChangePwd")){
    		String oldPwd = req.getParameter("oldPwd").trim();			//�õ�ѧ������ľ�����
    		String newPwd = req.getParameter("newPwd").trim();			//�õ�Ҫ�޸ĺ������    		
    		boolean flag = sdb.changePwd(stuNO,oldPwd,newPwd);			//���ø���ѧ������ķ���
    		if(flag==true){												//���³ɹ�
    			message = "�����޸ĳɹ����´������������½��";			//��ѧ���û�����ʾ��Ϣ    			
    		}
    		else{														//�����޸�ʧ��
    			message = "���������������˶Ժ������޸ġ�";			//�޸�ʧ�ܵ���ʾ��Ϣ
    		}
    		student = sdb.getStuInfo(stuNO);						//��ѯ�õ�ѧ����Ϣ
    		req.setAttribute("student",student);						//����ѧ����Ϣ
 				req.setAttribute("message", message);						//������Ϣ
    		req.getRequestDispatcher("stuInfo.jsp").forward(req,res); 	//û�е�½��ת������½ҳ��   		
    	}
			else if(action.equals("cb")){											//��ǰ����ͼ���ѯ
				if(stuNO!=null){													//ѧ���Ѿ���½
					sql = "select borrow_list.BookNO,BookName,Author,"+
			    		  "Publish,StartTime,End,BorrowNO from borrow_list,book"+
			    		  " where borrow_list.StudentNO='"+stuNO+"' and"+
			    		  " borrow_list.BookNO=book.BookNO and Deal="+0;			//��ѯ��ǰ����ͼ���SQL
					v = dbu.getInfo(sql);											//��ѯ�õ���ǰ�����¼
					for(int i=0;i<v.size();i++){
						Vector<String> vtemp = v.get(i);							//����ȡ��ÿһ����¼
						String end = vtemp.get(5);									//�õ��黹ʱ���ַ�����ʾ
						Calendar cal = Calendar.getInstance();						//�õ���ǰʱ��
						String now = DateUtil.getDateString(cal);					//ת��Ϊ�ַ�����ʾ
						if(DateUtil.getDay(now,end)<0){								//ͼ���ѳ���
							String newEnd = "<font color='red'/>"+end;				//�����ڵ���黹��������Ϊ��ɫ����
							vtemp.setElementAt(newEnd,5);
						}
					}
					req.setAttribute("v",v);										//������Ϣ����
					req.getRequestDispatcher("current_book.jsp").forward(req,res); 	//ת������ʾҳ��    			
				}
				else{
					message = "����û�е�½�����ȵ�½�ٲ鿴��"	;			 //��ʾ��Ϣ
					req.setAttribute("message", message);					//������Ϣ
					req.getRequestDispatcher("login.jsp").forward(req,res); //û�е�½��ת������½ҳ��
				}    		
			}
		  else if(action.equals("bh")){										//������ʷ��ѯ    	
    		StatusBean status = (StatusBean)session.getAttribute("status");	//�õ���¼״̬��Bean
    		int page = 1;													//��ǰ��ʾ��һҳ
    		int span = status.getSpan();									//�õ�ÿҳ��ʾ��������¼  		
    		sql = "select borrow_list.BookNO,BookName,Author,"+
    		  	  "Publish,StartTime,End,Deal from borrow_list,book "+
    		  	  "where borrow_list.StudentNO='"+stuNO+"' and"+
    		      " borrow_list.BookNO=book.BookNO and Deal!="+0;			//��ѯ��ǰѧ��������ʷ��SQL
    		status.setSql(sql);												//����SQL���
    		v = dbu.getPageContent(sql,page,span);							//�õ���ǰҳ��ʾ��¼
    		sql = "select count(*) from borrow_list where StudentNO"+
    			  "='"+stuNO+"' and Deal!="+0;								//�õ���ҳ����SQL
    		int total = dbu.getTotal(sql,span);								//�õ���ҳ��			
    		status.setCurPage(page);										//���õ�ǰ��ʾ��һҳ
    		status.setTotal(total);											//������ҳ��
    		session.setAttribute("status",status);							//�Ž�session    		
    		req.setAttribute("v",v);
    		req.getRequestDispatcher("borrow_history.jsp").forward(req,res);//ת��
    	}
    	else if(action.equals("changePage")){								//�����ҳʱ
    		String curPageStr = req.getParameter("curPage").trim();			//�õ���ҳ�Ĳ���
    		String url = req.getParameter("url").trim();					//�õ�Ҫת����ҳ��
    		System.out.println(url+"Ҫת���ҳ��"+"��"+curPageStr+"ҳ");
    		int page = Integer.parseInt(curPageStr);						//ת��������ֵ
    		StatusBean status = (StatusBean)session.getAttribute("status");	//�õ���¼״̬��Bean
    		status.setCurPage(page);										//���浱ǰҳ
    		int span = status.getSpan();									//�õ�ÿҳ��ʾ��¼����
    		sql = status.getSql();											//�õ���ѯ��¼��SQL���
    		v = dbu.getPageContent(sql,page,span);							//�õ��ı�����ʾ��¼
    		session.setAttribute("status",status);							//����״̬��session
    		req.setAttribute("v",v);										//���ü�¼����
    		req.getRequestDispatcher(url).forward(req,res);//ת��    		
    	}
    	else if(action.equals("lb")){										//�����¼    	
    		StatusBean status = (StatusBean)session.getAttribute("status");	//�õ���¼״̬��JavaBean
    		int page = 1;													//��ǰ��ʾ��һҳ
    		int span = status.getSpan();									//�õ�ÿҳ��ʾ��������¼
    		sql = "select borrow_list.BookNO,BookName,Author,"+
    		  	  "Publish,StartTime from borrow_list,book "+
    		  	  "where borrow_list.StudentNO='"+stuNO+"' and"+
    		      " borrow_list.BookNO=book.BookNO and Deal="+2;			//�ӽ����¼��������ʧ��¼��SQL
    		status.setSql(sql);												//����SQL���
    		v = dbu.getPageContent(sql,page,span);							//ִ�в�ѯ    		
    		sql = "select count(*) from borrow_list where StudentNO='"+
    			  stuNO+"' and Deal="+2;									//�õ���¼��������SQL
    		int total = dbu.getTotal(sql,span);								//�õ���ҳ��
    		status.setTotal(total);											//������ҳ��    		
    		status.setCurPage(page);										//���õ�ǰ��ʾ��һҳ
    		session.setAttribute("status",status);							//����״̬��session
    		req.setAttribute("v",v);										//����Ҫ��ʾ��¼����
    		req.getRequestDispatcher("lost_book.jsp").forward(req,res);		//ת��
    	}
			else if(action.equals("guashi")){							//ͼ���ʧ
				String loseNO = req.getParameter("loseNO").trim();		//�õ���ʧͼ���Ӧ���ļ�¼���������    		
				sql = "update book set BookStatus="+2+" where "+
					  "BookNO=(select BookNO from borrow_list "+
					  "where BorrowNO='"+loseNO+"')";					//����ͼ��״̬�ĵ�SQL
				ve.add(sql);											//��SQL�����ӽ�����
				sql = "update borrow_list set Deal="+2+" where "+
					  "BorrowNO='"+loseNO+"'";							//���½����¼��Deal�ֶε�SQL���
				ve.add(sql);											//��SQL�����ӽ�����
				sql = "insert into amercement(BorrowNO,StudentNO,"+
					  "Detail,Mulct) values('"+loseNO+"','"+stuNO+
					  "','���鷣��',(select BookPrice from book,"+
					  "borrow_list where borrow_list.BookNO="+
					  "book.BookNO and borrow_list.BorrowNO='"+loseNO+"'))";//�򷣿��¼�в���������鷣���¼
				ve.add(sql);											//��SQL�����ӽ�����
				Calendar cal = Calendar.getInstance();					//�õ���ǰ����
				String now = DateUtil.getDateString(cal);				//ת��Ϊ���ڸ�ʽ
				sql = "select End from borrow_list where BorrowNO='"+
					  loseNO+"'";										//�õ�����Ӧ�ù黹��ʱ���SQL���
				String end = dbu.getStringInfo(sql);					//ִ�в�ѯ�õ�Ӧ�黹ʱ��
				int days = DateUtil.getDay(now,end);					//�õ����ڲ�
				if(days<0){												//ͼ���ѳ���
					double money = -days*0.1;							//���㷣��
					sql = "insert into amercement(BorrowNO,StudentNO"+
					   	   ",Detail,Mulct) values('"+loseNO+"','"+stuNO+
					   	   "','���ڷ���',"+money+")";					//���볬�ڷ����¼��SQL
					ve.add(sql);										//��SQL�����ӽ�����
				}
				sql = "update student set Permitted=0 where StudentNO"+
					  "='"+stuNO+"'";									//���¸�ѧ���Ľ���Ȩ��
				ve.add(sql);
				sql = "select OrderNO from order_list where BookNO="+
					  "(select BookNO from borrow_list where BorrowNO='"+
					  loseNO+"') and EndTime is null";					//�鿴��Ԥ���б����Ƿ��и����ԤԼ��¼
				String OrderNO = dbu.getStringInfo(sql);
				System.out.println(sql+OrderNO+"ԤԼ�б�");
				if(OrderNO!=null){
					sql = "update order_list set EndTime='ͼ���Ѷ�ʧ' where "+
						  "EndTime is null and OrderNO='"+OrderNO+"'";	//����Ԥ���б��и�ͼ���Ԥ����¼���ý�ֹʱ��Ϊ�������Ѷ�ʧ��
					ve.add(sql);										//��SQL�����ӽ�����
				}
				boolean flag = dbu.update(ve); 							//������������ִ�и���
				sql = "select BookName from book,borrow_list where "+
					  "borrow_list.BookNO=book.BookNO and BorrowNO='"+
					  loseNO+"'";										//�õ���ʧͼ���������SQL
				String bookName = dbu.getStringInfo(sql);				//ִ�в�ѯ�õ�ͼ����
				if(flag==true){
					message = "<font color='red'/>"+bookName+"����ʧ�ɹ���"+
							  "��ʧȥ����Ȩ�ޣ��뵽�������ɷ����ͨ����Ȩ�ޡ�";//������ʧ��ʾ��Ϣ
				}
				else{
					message = "<font color='red'/>"+bookName+"��ʧʧ�ܣ�"+
							  "����δ֪���󣡣���";							   //��ʧʧ����ʾ��Ϣ
				}
				req.setAttribute("message",message);							//������Ϣ
				req.getRequestDispatcher("stu_info_one.jsp").forward(req,res);	//����ҳ��
			}
    	else if(action.equals("xujie")){									//����ͼ��
    		String bNO = req.getParameter("borrowNO");						//�õ�Ҫ����Ľ�����¼��
    		sql = "select XuJie from borrow_list where BorrowNO="+bNO;	//��ѯ�Ƿ��Ѿ�����ı�־
    		String flag = dbu.getStringInfo(sql).trim();							//ִ�в�ѯ�õ����
    		if(flag.equals("1")){											//�Ѿ������һ��
    			message = "�����Ѿ������һ�Σ������ٴ����衣";			   //������ʾ��Ϣ
    		}
    		else{
    			sql = "select order_list.BookNO from borrow_list,"+
    				  "order_list where BorrowNO="+bNO+" and "+
    				  "borrow_list.BookNO=order_list.BookNO";				//��ѯ�����Ƿ��ڱ�ԤԼ��SQL
    			if(dbu.isExist(sql)){
    				message = "�����Ѿ���ԤԼ��������ʱ���顣";			//������ʾ��Ϣ		
    			}
    			else{
    				sql = "select End from borrow_list where BorrowNO"+
    					  " ='"+bNO+"'";									//�����Ӧ�ù黹��ʱ��
    				String end = dbu.getStringInfo(sql);					//ִ�в�ѯ�õ����
    				Calendar cal = Calendar.getInstance();					//�õ���ǰʱ��
    				String now = DateUtil.getDateString(cal);			//ת��Ϊ�ַ�����ʽ
    				String newEnd = DateUtil.addSomeDay(end,delay);			//���黹���ڼ�����������
    				int day = DateUtil.getDay(now,end);						//�õ����뻹�����ڵ�����
    				if(day>distance){
    					message = "����ͼ��ֻ���ڹ黹ǰ5�����衣";		  //���ڹ黹ǰ5�����ʾ��Ϣ
    				}
    				else{
    					if(day<=0){											//ͼ���Ѿ�����
    						message = "ͼ���ѳ��ڣ��������裬��"+
    								  "���컹�顣";						   //������ʾ��Ϣ
    					}
    					else{
    						sql = "update borrow_list set End='"+newEnd+"'"+
    							  ",Xujie=1 where BorrowNO='"+bNO+"'";		//���½��ļ�¼���SQL
    						if(dbu.update(sql)){
    							message = "����ɹ����µĹ黹����Ϊ"+newEnd;//����ɹ���Ϣ
    						}
    					}
    				}
    			}			
    		}
    		req.setAttribute("message",message);						//������ʾ��Ϣ
    		req.getRequestDispatcher("stu_info_one.jsp").forward(req,res);//ת��    
    	}
    	else if(action.equals("fk")){										//�����¼    	
    		StatusBean status = (StatusBean)session.getAttribute("status");	//�õ���¼״̬��JavaBean
    		int span = status.getSpan();									//�õ�ÿҳ��ʾ��������¼
    		int page =	1;													//��ǰ��ʾ��һҳ
    		sql = "select PayTime,Detail,Mulct,BookName from book,"+
    			  "borrow_list,amercement where amercement.StudentNO='"+
    			  stuNO+"' and Pay="+1+" and (amercement.BorrowNO="+
    			  "borrow_list.BorrowNO and borrow_list.BookNO=book.BookNO)";//�õ��Ѿ��ɷѵļ�¼��SQL���    		
    		status.setSql(sql);												//����SQL    		
    		v = dbu.getPageContent(sql,page,span);							//�õ���ǰҳ��ʾ������    		
    		sql = "select count(*) from amercement where StudentNO='"+
    			  stuNO+"' and Pay="+1;										//�õ���¼��������SQL���
    		int total = dbu.getTotal(sql,span);								//ִ�в�ѯ�õ���¼������
    		sql = "select sum(Mulct) from amercement";						//�õ��ѽ��ɷ����ܺ͵�SQL
    		String money = dbu.getStringInfo(sql);							//ִ�в�ѯ   
    		status.setTotal(total);											//������ҳ��    		
    		status.setCurPage(page);										//���õ�ǰ��ʾ��һҳ
    		status.setMoney(money);											//�����ѽ�Ƿ��
    		session.setAttribute("status",status);							//����״̬��session
    		req.setAttribute("v",v);										//����Ҫ��ʾ��¼����
    		req.getRequestDispatcher("account.jsp").forward(req,res);		//ת��
    	}
    	else if(action.equals("cf")){										//��ǰ�������Ϊ���ɵ�Ƿ��    
    		sql = "select BookName,Detail,StartTime,End,Mulct from book,"+
    			  "borrow_list,amercement where amercement.StudentNO='"+
    			  stuNO+"' and Pay="+0+" and (amercement.BorrowNO="+
    			  "borrow_list.BorrowNO and borrow_list.BookNO=book.BookNO)";//�õ��������û�н��ɵķ����¼
    		v = dbu.getInfo(sql);
    		v.addAll(sdb.getCurMoney(stuNO));								//�õ���ǰ�����¼�г��ڵķ�����Ϣ
    		req.setAttribute("v",v);										//������Ϣ����
    		req.getRequestDispatcher("current_amerce.jsp").forward(req,res);//ת������ʾҳ��    		    		
    	}
    	else if(action.equals("gs")){											//���߹�ʧͼ��֤
    		String pwd = req.getParameter("pwd");								//�õ����������
    		if(sdb.verify(stuNO,pwd)){
    			sql = "update student set Permitted="+0+" where StudentNO"+
    				  "='"+stuNO+"'";											//���¸�ѧ���Ľ���Ȩ�޵�SQL���
	    		if(dbu.update(sql)==true){
	    			message = "��ʧ�ɹ���";											//��ʧ�ɹ�����ʾ��Ϣ
	    		}
	    		else{
	    			message = "δ֪���󣬹�ʧʧ�ܡ�";								//��ʧʧ�ܵ���ʾ��Ϣ
	    		}
	    	}
	    	else{
	    		message = "������󣬹�ʧʧ�ܡ�";
	    	}    		
    		req.setAttribute("message",message);							//������ʾ��Ϣ
    		req.getRequestDispatcher("lost_card.jsp").forward(req,res);		//ת����ҳ��
    	}
		else if(action.equals("inform")){									//ԤԼ֪ͨ�б�
			sql = "select order_list.StudentNO,Class,BookName,Author,"+
				  "book.BookNO,EndTime from student,book,order_list "+
				  "where student.StudentNO=order_list.StudentNO and "+
				  "book.BookNO=order_list.BookNO and EndTime is not null";	//��������Ԥ����¼��SQL���
			StatusBean status = (StatusBean)session.getAttribute("status");	//�õ���¼״̬��Bean
			if(status==null){
				status = new StatusBean();									//Ϊ���򴴽�һ��Bean����
			}
			int span = status.getSpan();									//�õ�ÿҳ��ʾ��������¼
			int page =	1;													//��ǰ��ʾ��һҳ
			status.setSql(sql);												//����SQL    	
			v = dbu.getPageContent(sql,page,span);							//�õ���ǰҳ��ʾ������
			sql = "select count(*) from student,book,order_list "+
				  "where student.StudentNO=order_list.StudentNO and "+
				  "book.BookNO=order_list.BookNO and EndTime is not null";
			int total = dbu.getTotal(sql,span);								//ִ�в�ѯ�õ���¼������
			status.setTotal(total);											//������ҳ��    		
			status.setCurPage(page);										//���õ�ǰ��ʾ��һҳ
			session.setAttribute("status",status);							//����״̬��session
			req.setAttribute("v",v);										//����Ҫ��ʾ��¼����
			req.getRequestDispatcher("order_list.jsp").forward(req,res);	//ת��	
		}
		else if(action.equals("simple")){										//��ѯͼ��search book
			String key = req.getParameter("key").toUpperCase();				//�õ��ؼ���
			String condition = req.getParameter("condition");				//�õ���ѯ����
			sql = "select BookNO,BookName,Author,Publish,BookIsbn,"+
				  "BuyTime,BookPrice,BookStatus from book where upper("+
				  condition+") like '%"+key+"%'";							//ģ����ѯ��SQL���
			StatusBean status = (StatusBean)session.getAttribute("status");	//�õ���¼״̬��Bean
			int span = status.getSpan();									//�õ�ÿҳ��ʾ��������¼
			int page =	1;													//��ǰ��ʾ��һҳ   		
			status.setSql(sql);												//����SQL    	
			v = dbu.getPageContent(sql,page,span);							//�õ���ǰҳ��ʾ������    		
			sql = "select count(*) from book where "+condition+" like "+
				  "'%"+key+"%'";											//�õ���¼��������SQL���
			int total = dbu.getTotal(sql,span);								//ִ�в�ѯ�õ���¼������
			status.setTotal(total);											//������ҳ��    		
			status.setCurPage(page);										//���õ�ǰ��ʾ��һҳ
			session.setAttribute("status",status);							//����״̬��session
			req.setAttribute("v",v);										//����Ҫ��ʾ��¼����
			req.getRequestDispatcher("query_book_result.jsp").forward(req,res);	//ת��	
		}
		else if(action.equals("complex")){									//���Ӳ�ѯ
			String BookName = req.getParameter("BookName").toUpperCase();	//�õ�������ѯ�ؼ���
			String Author = req.getParameter("Author").toUpperCase();		//�õ����߲�ѯ�ؼ���
			String Publish = req.getParameter("Publish").toUpperCase();		//�õ��������ѯ�ؼ���
			sql = "select BookNO,BookName,Author,Publish,BookIsbn,"+
				  "BuyTime,BookPrice,BookStatus from book where upper("+
				  "BookName) like '%"+BookName+"%' and upper(Author) like"+
				  "'%"+Author+"%' and upper(Publish) like '%"+Publish+"%'";	//ģ����ѯ��SQL���
			StatusBean status = (StatusBean)session.getAttribute("status");	//�õ���¼״̬��Bean
			int span = status.getSpan();									//�õ�ÿҳ��ʾ��������¼
			int page =	1;													//��ǰ��ʾ��һҳ   		
			status.setSql(sql);												//����SQL    	
			v = dbu.getPageContent(sql,page,span);							//�õ���ǰҳ��ʾ������    		
			sql = "select count(*) from book where upper(BookName) like "+
				  "'%"+BookName+"%' and upper(Author) like'%"+Author+"%' "+
				  "and upper(Publish) like '%"+Publish+"%'";					//�õ���¼��������SQL���
			System.out.println(sql);
			int total = dbu.getTotal(sql,span);								//ִ�в�ѯ�õ���¼������
			status.setTotal(total);											//������ҳ��    		
			status.setCurPage(page);										//���õ�ǰ��ʾ��һҳ
			session.setAttribute("status",status);							//����״̬��session
			req.setAttribute("v",v);										//����Ҫ��ʾ��¼����
			req.getRequestDispatcher("query_book_result.jsp").forward(req,res);	//ת��	
		}
    	else if(action.equals("order")){									//ԤԼͼ��
    		String bookNO = req.getParameter("bookNO");						//�õ�ԤԼͼ����
    		sql = "select Permitted from student where StudentNO='"+stuNO+"'";//�鿴����Ȩ��
    		String per = dbu.getStringInfo(sql);							//�õ�Ȩ��
    		if(per.equals("0")){
    			message = "��û�н���Ȩ�ޣ����Բ���Ԥ�����뵽������ͨ��"
    					  +"<a href='StudentServlet?action=changePage"+
	    				  "&url=query_book_result.jsp&curPage=1'/><br>"+
	    				  "������ﷵ��"; 									 //��ʾ��Ϣ
    		}
    		else{	
	    		sql = "insert into order_list(StudentNO,BookNO)values "+
	    			  "('"+stuNO+"','"+bookNO+"')";							//��ԤԼ���в���ԤԼ��¼��SQL���
	    		if(dbu.update(sql)==true){
	    			message = "ԤԼ�ɹ������עԤԼ֪ͨ������ʱȡ�顣"+
	    					  "<a href='StudentServlet?action=changePage"+
	    					  "&url=query_book_result.jsp&curPage=1'/><br>"+
	    					  "������ﷵ��";		  //ԤԼ�ɹ���ʾ��Ϣ		
	    		}
	    		else{
	    			message = "�ܱ�Ǹ������δ֪����ԤԼʧ�ܡ�"+
	    					  "<a href='StudentServlet?action=changePage"+
	    					  "&url=query_book_result.jsp&curPage=1'/><<����";    	  //ԤԼʧ����ʾ��Ϣ
	    		}
    		}    		
    		req.setAttribute("message",message);							//������ʾ��Ϣ
    		req.getRequestDispatcher("stu_info_two.jsp").forward(req,res);	//ת��
    	}
    	else if(action.equals("sarchMyOrder")){								//��ѯ�Լ���Ԥ��
    		String studentNO = req.getParameter("stuNO");					//�õ�Ҫ��ѯԤ����¼��ѧ��
    		sql = "select order_list.StudentNO,Class,BookName,Author,"+
    			  "book.BookNO,EndTime from student,book,order_list "+
    			  "where student.StudentNO=order_list.StudentNO and "+
    			  "book.BookNO=order_list.BookNO and order_list.StudentNO"+
    			  "='"+studentNO+"' and EndTime is not null";				//��������Ԥ����¼��SQL���
    		System.out.println(sql);
    		StatusBean status = (StatusBean)session.getAttribute("status");	//�õ���¼״̬��Bean
    		int span = status.getSpan();									//�õ�ÿҳ��ʾ��������¼
    		int page =	1;													//��ǰ��ʾ��һҳ
    		status.setSql(sql);												//����SQL    	
    		v = dbu.getPageContent(sql,page,span);							//�õ���ǰҳ��ʾ������
    		sql = "select count(*) from order_list where StudentNO"+
    			  "='"+studentNO+"'";										//������¼��������SQL			
    		int total = dbu.getTotal(sql,span);								//ִ�в�ѯ�õ���¼������
    		status.setTotal(total);											//������ҳ��    		
    		status.setCurPage(page);										//���õ�ǰ��ʾ��һҳ
    		session.setAttribute("status",status);							//����״̬��session
    		req.setAttribute("v",v);										//����Ҫ��ʾ��¼����
    		req.getRequestDispatcher("order_list.jsp").forward(req,res);	//ת��	
    	}
    }
}