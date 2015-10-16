package wyf.zrk;

import java.util.*;
import org.springframework.orm.hibernate3.*;
import org.hibernate.*;

public class DButilDAOImpl {
	private SessionFactory sf;
	
	public void setSf(SessionFactory sf){
		this.sf = sf;
	}
	public SessionFactory getSf(){
		return this.sf;
	}
	
	public List<?> getInfo(String hql){
		Session sess = sf.openSession();		//�õ��Ự
		Query q = sess.createQuery(hql);		//ִ�в�ѯ
		List<?> ls = q.list();					//�õ���ѯ���
		sess.close();
		return ls;								//����
	}
	
	public String updateObj(String tname,Object obj) {		
		String msg = "yes";
		Session sess = sf.openSession();										//�����Ự
		Transaction t = sess.beginTransaction();							//��ʼһ������
		try{
			if(tname.equals("userinfo")) {										//������Ϊ�û���ʱ
				UserInfo user = (UserInfo)obj;									//ǿ������ת��
				UserInfo ui = (UserInfo)sess.get(UserInfo.class,user.getU_id());//�õ��û�����
				ui.setU_pwd(user.getU_pwd());									//�޸�����
				sess.save(ui);													//�������
			}
			else if(tname.equals("saleinfo")) {
				SaleInfo temp = (SaleInfo)obj;
				SaleInfo si = (SaleInfo)sess.get(SaleInfo.class,temp.getS_id());
				si.setS_location(temp.getS_location());
				si.setS_detail(temp.getS_detail());
				si.setS_longitude(temp.getS_longitude());
				si.setS_latitude(temp.getS_latitude());
				si.setS_wuye(temp.getS_wuye());
				si.setS_type(temp.getS_type());
				si.setS_area(temp.getS_area());
				si.setS_price(temp.getS_price());
				si.setS_linkman(temp.getS_linkman());
				si.setS_address(temp.getS_address());
				si.setS_tel(temp.getS_tel());
				si.setS_email(temp.getS_email());
				si.setS_remark(temp.getS_remark());
				si.setS_high(temp.getS_high());
				sess.save(si);
			}
			else if(tname.equals("rentinfo")) {
				RentInfo temp = (RentInfo)obj;
				RentInfo ri = (RentInfo)sess.get(RentInfo.class,temp.getR_id());
				ri.setR_location(temp.getR_location());
				ri.setR_detail(temp.getR_detail());
				ri.setR_latitude(temp.getR_latitude());
				ri.setR_longitude(temp.getR_longitude());
				ri.setR_wuye(temp.getR_wuye());
				ri.setR_type(temp.getR_type());
				ri.setR_area(temp.getR_area());
				ri.setR_high(temp.getR_high());
				ri.setR_lease(temp.getR_lease());
				ri.setR_price(temp.getR_price());
				ri.setR_linkman(temp.getR_linkman());
				ri.setR_address(temp.getR_address());
				ri.setR_tel(temp.getR_tel());
				ri.setR_email(temp.getR_email());
				ri.setR_remark(temp.getR_remark());
				sess.save(ri);
			}			
			else if(tname.equals("admininfo")) {
				AdminInfo ai = (AdminInfo)obj;
				AdminInfo admin = (AdminInfo)sess.get(AdminInfo.class,ai.getA_id());
				admin.setA_pwd(ai.getA_pwd());
				sess.save(admin);
			}
			else if(tname.equals("questioninfo")) {
				QuestionInfo qi = (QuestionInfo)obj;
				QuestionInfo question = (QuestionInfo)sess.get(QuestionInfo.class,qi.getQ_id());
				question.setQ_flag(qi.getQ_flag());
				sess.save(question);
			}
			else if(tname.equals("relation")) {
				RelationToUserAndMsg rt = (RelationToUserAndMsg)obj;
				RelationToUserAndMsg rtua = (RelationToUserAndMsg)sess.get(RelationToUserAndMsg.class,rt.getRtuam_id());
				rtua.setR_agree(rt.getR_agree());
				sess.save(rtua);
			}
			else if(tname.equals("contractrentinfo")) {
				ContractRentInfo cri = (ContractRentInfo)obj;
				ContractRentInfo cf = (ContractRentInfo)sess.get(ContractRentInfo.class,cri.getCr_id());
				cf.setCr_state(cri.getCr_state());
				sess.save(cf);
			}
			else if(tname.equals("contractsaleinfo")) {
				ContractSaleInfo csi = (ContractSaleInfo)obj;
				ContractSaleInfo cf = (ContractSaleInfo)sess.get(ContractSaleInfo.class,csi.getCs_id());
				cf.setCs_state(csi.getCs_state());
				sess.save(cf);
			}
	
		}
		catch(Exception e) {
			e.printStackTrace();												//��ӡ�쳣
			msg = "no";
		}
		finally {
			t.commit();	
			sess.close();														//�رջỰ
		}
		return msg;
	}
	
	public String insertObj(String tname,Object obj) {
		String msg = "yes";
		Session sess = sf.openSession();										//�����Ự
		Transaction t = sess.beginTransaction();								//����һ������
		try {
			if(tname.equals("userinfo")) {
				UserInfo ui = (UserInfo)obj;
				sess.save(ui);
			}
			else if(tname.equals("rentinfo")) {
				RentInfo ri = (RentInfo)obj;
				sess.save(ri);
			}
			else if(tname.equals("saleinfo")) {
				SaleInfo si = (SaleInfo)obj;
				sess.save(si);
			}
			else if(tname.equals("relation")) {
				RelationToUserAndMsg rtuam = (RelationToUserAndMsg)obj;
				sess.save(rtuam);
			}
			else if(tname.equals("questioninfo")) {
				QuestionInfo qi = (QuestionInfo)obj;
				sess.save(qi);
			}
			else if(tname.equals("admininfo")) {
				AdminInfo ai = (AdminInfo)obj;
				sess.save(ai);
			}
			else if(tname.equals("answerinfo")) {
				AnswerInfo ai = (AnswerInfo)obj;
				sess.save(ai);
			}
			else if(tname.equals("contractrentinfo")) {
				ContractRentInfo cri = (ContractRentInfo)obj;
				sess.save(cri);
			}
			else if(tname.equals("contractsaleinfo")) {
				ContractSaleInfo csi = (ContractSaleInfo)obj;
				sess.save(csi);
			}
		}
		catch(Exception e) {
			msg = "no";
			e.printStackTrace();
		}
		finally {
			t.commit();
			sess.close();
		}
		return msg;		
	}
	
	public List<?> getPageList(int span,int page,String hql) {		
		Session sess = sf.openSession();			//�õ��Ự
		Query q = sess.createQuery(hql);			//ִ�в�ѯ
		List<?> ls = q.list();						//�õ���ѯ���
		sess.close();								//�رջỰ
		List list = new ArrayList();				//����һ���б�
		int begin = (page==1)?0:(page-1)*span;		//�õ�Ҫ����ҳ����ʼλ��
		int k = 0;									//��������
		for(int i=begin;i<ls.size()&&k<span;i++) {	//ѭ���õ�ĳҳ����
			k++;									//����
			list.add(ls.get(i));					//��������ӵ�list��
		}
		return list;								//����
	}
	
	public int getTotalPage(String hql,int span) {
		Session sess = sf.openSession();				//�õ��Ự
		Query q = sess.createQuery(hql);				//ִ�в�ѯ
		List<?> ls = q.list();							//�õ���ѯ���
		int count = ls.size();							//�õ��ܼ�¼��
		int total = count/span+((count%span==0)?0:1);	//�õ���ҳ��
		sess.close();									//�رջỰ
		System.out.println("the total page is : " +total);
		return total;
	}
	
	public String deleteObj(String tname,Object obj) {
		String flag = "yes";
		Session sess = sf.openSession();						//�����Ự
		Transaction t = sess.beginTransaction();				//����һ������
		try {
			if(tname.equals("saleinfo")) {
				SaleInfo si = (SaleInfo)sess.get(SaleInfo.class,((SaleInfo)obj).getS_id());
				if(si!=null) {
					sess.delete(si);
				}
			}
			else if(tname.equals("rentinfo")) {
				RentInfo ri = (RentInfo)sess.get(RentInfo.class,((RentInfo)obj).getR_id());
				if(ri!=null) {
					sess.delete(ri);
				}
			}
			else if(tname.equals("relation")) {
				RelationToUserAndMsg rt = (RelationToUserAndMsg)sess.get(
						RelationToUserAndMsg.class,(Integer)obj);
				if(rt!=null) {
					sess.delete(rt);
				}
			}
			else if(tname.equals("questioninfo")) {
				QuestionInfo qi = (QuestionInfo)sess.get(QuestionInfo.class,((QuestionInfo)obj).getQ_id());
				if(qi!=null) {
					sess.delete(qi);
				}
			}
			else if(tname.equals("admininfo")) {
				AdminInfo ai = (AdminInfo)sess.get(AdminInfo.class,((AdminInfo)obj).getA_id());
				if(ai!=null) {
					sess.delete(ai);
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			flag = "no";
		}
		finally {
			t.commit();
			sess.close();
		}
		return flag;
	}
}