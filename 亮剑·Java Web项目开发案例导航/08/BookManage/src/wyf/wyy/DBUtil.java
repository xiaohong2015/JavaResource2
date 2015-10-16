package wyf.wyy;
import java.util.*;
import javax.sql.*;
import java.io.*;
import org.springframework.jdbc.core.*;
import org.springframework.transaction.*;
import org.springframework.jdbc.datasource.*;
import org.springframework.transaction.support.*;            
public class DBUtil{
	private JdbcTemplate jt;									//����JdbcTemplate��������						
	private List rl = null;										//����List��������
	private String sql = null;									//����SQL�ַ�������
	private DataSource ds;										//����DataSource����
	private DataSourceTransactionManager dtm;				
	private DefaultTransactionDefinition dtd;
	public void setJt(JdbcTemplate jt){						//jt��Ա��set����
		this.jt = jt;										//����jt���Ե�ֵ
	}
	public void setDs(DataSource ds){
		this.ds=ds;
	}
	public int getTotal(String sql,int span){						//�õ���ҳ��
		int total = 0;										//����ҳ������ֵ
		int rows = jt.queryForInt(sql);					//ִ�в�ѯ�õ��ܼ�¼����
		total = rows/span+((rows%span==0)?0:1);			//����õ���ҳ��		
		return total;
	}
	public Vector<Vector<String>> getPageContent(String sql,int page,int span){
		Vector<Vector<String>> vlist = new Vector<Vector<String>>();	//������Ϣ����
		int start = (page-1)*span;										//�õ���ʼ��¼����
		int end = start+span;											//������¼����
		rl = jt.queryForList(sql);									//�����õ����
		if(rl.size()!=0){				
			for(int i=start;i<end&&i<rl.size();i++){								//������ѯ���
				Map map=(Map)rl.get(i);									//���List��ÿһ��Ϊһ��LinkedHashMap
				Set set=map.keySet();									//Map�ļ�ֵΪ�����е�����
				Vector<String> vtemp = new Vector<String>();			//������ʱ��Ϣ����				
				for(Object o:set){										
					String info = map.get(o).toString();				//��ȡ������Ϣ����ת��
					vtemp.add(info);									//����Ϣ��ӽ���ʱ����										
				}
				vlist.add(vtemp);										//��ÿ����¼��ӽ���������			
			}
		}		
		return vlist;
	}
	public String getStringInfo(String sql){
		String info = null;
		try{
			info = (String)jt.queryForObject(sql,String.class);
		}
		catch(Exception e){
			info = null;
		}
		return info;
	}
	public boolean isExist(String sql){
		boolean result = false;
		rl = jt.queryForList(sql);							//ִ�в�ѯ
        if(rl.size()!=0){									//�жϲ�ѯ���
        	result = true;									//��������û���ֵ��־λΪtrue
        }
		return result;										//���ر�־λ
	}
	public boolean update(Vector<String> v){					//������
		boolean flag = true;									//���½����־
		dtm = new DataSourceTransactionManager(ds);				//�õ��������
		dtd = new DefaultTransactionDefinition();
        dtd.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus ts = dtm.getTransaction(dtd);
        try{
        	for(int i=0;i<v.size();i++){
        		jt.update(v.get(i));						//ִ�и���        		
        	}
        	dtm.commit(ts);									//���쳣�������ύ����           	                             
       }
       catch(Exception e) {
           dtm.rollback(ts);								//�����쳣�����лع�				
           flag = false;									//���±�־����Ϊfalse
           e.printStackTrace();
       }      
		return flag;
	}					//��������ķ���
	public boolean update(String sql){						//ִ�е���SQL���ķ���
		boolean flag = false;
		int result = jt.update(sql);		//ִ�и��µõ����¼�¼����
		if(result>=0){						//���¼�¼��������һʱ
			flag = true;					//�����½����־��Ϊtrue
		}
		return flag;
	}
	public Vector<Vector<String>> getInfo(String sql){
		Vector<Vector<String>> vlist = new Vector<Vector<String>>();		//������Ϣ����	
    	rl = jt.queryForList(sql);								//ִ�в�ѯ�õ����
		if(rl.size()!=0){
			for(int i=0;i<rl.size();i++){						//������ѯ���
				Map map=(Map)rl.get(i);							//���List��ÿһ��Ϊһ��LinkedHashMap
				Set set=map.keySet();							//Map�ļ�ֵΪ�����е�����
				Vector<String> vtemp = new Vector<String>();	//������ʱ��Ϣ����
				for(Object o:set){	
					String info = map.get(o).toString();	//��ȡ������Ϣ����ת��
					vtemp.add(info);						//����Ϣ��ӽ���ʱ����										
				}
				vlist.add(vtemp);								//��ÿ����¼��ӽ���������			
			}
		}
		return vlist;
	}
	public boolean canBorrow(String stuNO,String bNO){
		boolean flag = false;
		String sql = "select EndTime from order_list where "+
					 "BookNO='"+bNO+"'";	//��������Ԥ����¼
		Vector<String> vtemp = new Vector<String>();
		rl = jt.queryForList(sql);									//ִ�в�ѯ�õ����
		if(rl.size()!=0){
				for(int i=0;i<rl.size();i++){						//������ѯ���
				Map map=(Map)rl.get(i);								//���List��ÿһ��Ϊһ��LinkedHashMap
				Set set=map.keySet();								//Map�ļ�ֵΪ�����е�����				
				for(Object o:set){
					String info = map.get(o).toString();		//��ȡ������Ϣ����ת��							
					vtemp.add(info);							//����Ϣ��ӽ���ʱ����										
				}					
			}
			Calendar cal = Calendar.getInstance();					//�õ���ǰʱ��						
			String now = DateUtil.getDateString(cal);				//תΪ�ַ�����ʽ
			for(int i=0;i<vtemp.size();i++){
				String endTime = vtemp.get(i);						//�õ���ֹ����
				int day = DateUtil.getDay(now,endTime);				//�õ����ڲ�
				if(day>0){
					sql = "select StudentNO from order_list"+
						  " where EndTime='"+endTime+"'";			//��ԤԼ��Χ��				
					String orStuNO = this.getStringInfo(sql);		//�õ�ԤԼ�����ѧ��ѧ��
					if(orStuNO.equals(stuNO)){
						flag = true;
					}
				}
			}
		}
		else{
			flag =true;
		}
		return flag;		
	}
}