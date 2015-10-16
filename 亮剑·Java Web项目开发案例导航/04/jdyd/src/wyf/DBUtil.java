package wyf;
import java.util.*;
import javax.sql.*;
import java.io.*;
import javax.faces.model.*;
import org.springframework.jdbc.core.*;
import org.springframework.transaction.*;
import org.springframework.jdbc.datasource.*;
import org.springframework.transaction.support.*;            
public class DBUtil{
	public JdbcTemplate jt;									//����JdbcTemplate��������						
	private List rl = null;										//����List��������
	private String sql = null;									//����SQL�ַ�������
	private DataSource ds;										//����DataSource����
	private DataSourceTransactionManager dtm;				
	private DefaultTransactionDefinition dtd;
	public void setJt(JdbcTemplate jt){						//jt��Ա��setter����
		this.jt = jt;										//����jt���Ե�ֵ
	}
	public void setDs(DataSource ds){
		this.ds=ds;
	}

	public int getTotal(String sql,int span){			//�õ���ҳ��
		int total = 0;									//����ҳ������ֵ
		sql = "select count(*) from ("+sql+")a";
		int rows = jt.queryForInt(sql);					//ִ�в�ѯ�õ��ܼ�¼����		
		total = rows/span+((rows%span==0)?0:1);			//����õ���ҳ��						
		return total;
	}
	
	public SelectItem[] getResType(){
		sql = "select GId,GName from group_info";		//��������Դ�����Ϣ��SQL���
		rl = jt.queryForList(sql);						//ִ�в�ѯ�õ����
		SelectItem[] list=new SelectItem[rl.size()];
		if(rl.size()!=0){
			for(int i=0;i<rl.size();i++){
				Map map = (Map)rl.get(i);
				int gid = Integer.valueOf(map.get("GID").toString());
				String gname = map.get("GNAME").toString();
				list[i] = new SelectItem(gid,gname);
			}
		}
		return list;
	}
	
	public Vector getResList(String sql,int curPage,int span){
		Vector al = new Vector();
		int startRow = (curPage-1)*span;					//������ʼ����
		int endRow = startRow + span;						//�����������
		rl = jt.queryForList(sql);							//�����õ����
		if(rl.size()!=0){									//�����Ϊ�յ����
			for(int i=startRow;i<rl.size()&&i<endRow;i++){	//�������
				Map map=(Map)rl.get(i);						//���List��ÿһ��Ϊһ��LinkedHashMap
				ResItem ri = new ResItem();					//����һ��ResItem����			
				ri.setRid(map.get("RID").toString());		//����rid����ֵ
				ri.setRname(map.get("RNAME").toString());	//����rname����ֵ
				ri.setRspec(map.get("RSPEC").toString());	//����rspec����ֵ
				ri.setRdetail(map.get("RDETAIL").toString());//����rdetail����ֵ
				ri.setRprice(map.get("RPRICE").toString());	//����rprice����ֵ
				ri.setGid(map.get("GID").toString());		//������Դ��gid����ֵ
				ri.setRstatus(map.get("RSTATUS").toString());
				al.add(ri);									//���˿γ̶���Ž�����List��
			}
		}
		return al;														//���ؽ��
	}
	
	public Vector getUserList(String sql,int curPage,int span){
		Vector al = new Vector();
		int startRow = (curPage-1)*span;					//������ʼ����
		int endRow = startRow + span;						//�����������
		rl = jt.queryForList(sql);							//�����õ����
		if(rl.size()!=0){									//�����Ϊ�յ����
			for(int i=startRow;i<rl.size()&&i<endRow;i++){	//�������
				Map map=(Map)rl.get(i);						//���List��ÿһ��Ϊһ��LinkedHashMap
				User_Item ui = new User_Item();				//����һ��User_Item����			
				ui.setUsid(map.get("USID").toString());		//����usid����ֵ
				ui.setUname(map.get("UNAME").toString());	//����uname����ֵ
				ui.setUgender(map.get("UGENDER").toString());//����ugender����ֵ
				ui.setUemail(map.get("UEMAIL").toString());//����uemail����ֵ
				ui.setUphone(map.get("UPHONE").toString());	//����uphone����ֵ
				al.add(ui);									//���˿γ̶���Ž�����List��
			}
		}
		return al;														//���ؽ��
	}
	
	public Vector getOrderList(String sql,int curPage,int span){
		Vector al = new Vector();
		int startRow = (curPage-1)*span;					//������ʼ����
		int endRow = startRow + span;						//�����������
		rl = jt.queryForList(sql);							//�����õ����
		if(rl.size()!=0){									//�����Ϊ�յ����
			for(int i=startRow;i<rl.size()&&i<endRow;i++){	//�������
				Map map=(Map)rl.get(i);						//���List��ÿһ��Ϊһ��LinkedHashMap
				List_Item li = new List_Item();					//����һ��List_Item����			
				li.setOId(map.get("OID").toString());			//����OId����ֵ
				li.setOTime(map.get("OTIME").toString());		//����OTime����ֵ
				li.setOStatus(map.get("OSTATUS").toString());	//����OStatus����ֵ
				li.setODetail(map.get("ODETAIL").toString());	//����ODetail����ֵ
				li.setUname(map.get("UNAME").toString());		//����Uname����ֵ
				al.add(li);										//���˿γ̶���Ž�����List��
			}
		}
		return al;												//���ؽ��
	}
	
	public Vector getOrderDetail(String sql){
		Vector al = new Vector();
		rl = jt.queryForList(sql);							//�����õ����
		if(rl.size()!=0){									//�����Ϊ�յ����
			for(int i=0;i<rl.size();i++){	//�������
				Map map=(Map)rl.get(i);						//���List��ÿһ��Ϊһ��LinkedHashMap
				Info_Item ii = new Info_Item();				//����һ��Info_Item����			
				ii.setEnd(map.get("END").toString());		//����end����ֵ
				ii.setStart(map.get("ST").toString());		//����start����ֵ
				ii.setStatus(map.get("STATUS").toString());	//����status����ֵ
				ii.setRname(map.get("RNAME").toString());	//����rname����ֵ
				ii.setRid(map.get("RID").toString());		//����rid����ֵ
				ii.setGname(map.get("GNAME").toString());	//����gname����ֵ
				ii.setOrid(map.get("ORID").toString());		//����orid����ֵ
				al.add(ii);									//���˿γ̶���Ž�����List��
			}
		}
		return al;	
	}
	
	public Vector getResOrderList(String sql){
		Vector al = new Vector();
		rl = jt.queryForList(sql);							//�����õ����
		if(rl.size()!=0){									//�����Ϊ�յ����
			for(int i=0;i<rl.size();i++){	//�������
				Map map=(Map)rl.get(i);						//���List��ÿһ��Ϊһ��LinkedHashMap
				Info_Item ii = new Info_Item();				//����һ��Info_Item����			
				ii.setEnd(map.get("END").toString());		//����end����ֵ
				ii.setStart(map.get("ST").toString());		//����start����ֵ
				ii.setStatus(map.get("STATUS").toString());	//����status����ֵ
				al.add(ii);									//���˿γ̶���Ž�����List��
			}
		}
		return al;		
	}
	
	public Vector getGroupList(String sql){
		Vector al = new Vector();
		rl = jt.queryForList(sql);							//�����õ����
		if(rl.size()!=0){									//�����Ϊ�յ����
			for(int i=0;i<rl.size();i++){	//�������
				Map map=(Map)rl.get(i);						//���List��ÿһ��Ϊһ��LinkedHashMap
				GroupItem gi = new GroupItem();				//����һ��GroupItem ����			
				gi.setGid(map.get("GID").toString());		//����gid����ֵ
				gi.setGname(map.get("GNAME").toString());	//����gname����ֵ
				al.add(gi);									//���˿γ̶���Ž�����List��
			}
		}
		return al;	
	}
	
	public Vector getAdminList(String sql,int curPage,int span){
		Vector al = new Vector();
		int startRow = (curPage-1)*span;					//������ʼ����
		int endRow = startRow + span;						//�����������		
		rl = jt.queryForList(sql);							//�����õ����
		if(rl.size()!=0){									//�����Ϊ�յ����
			for(int i=startRow;i<rl.size()&&i<endRow;i++){	//�������
				Map map=(Map)rl.get(i);						//���List��ÿһ��Ϊһ��LinkedHashMap
				Admin_Item ai = new Admin_Item();			//����һ��Admin_Item����			
				ai.setAid(map.get("AID").toString());		//����aid����ֵ
				ai.setAname(map.get("ANAME").toString());	//����aname����ֵ
				ai.setAlevel(map.get("ALEVEL").toString().trim());	//����alevel����ֵ
				al.add(ai);									//���˿γ̶���Ž�����List��
			}
		}
		return al;
	}
	
	public String getStringInfo(String sql){
		String info = null;										//���������ַ�������
		try{
			info = (String)jt.queryForObject(sql,String.class);		//ִ�в�ѯ
		}
		catch(Exception e){
			info = null;
		}
		return info;											//���ز�ѯ���
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
        		jt.update(v.get(i));								//ִ�и���       		
        	}
        	dtm.commit(ts);									//���쳣�������ύ����
       }
       catch(Exception e){
           dtm.rollback(ts);								//�����쳣�����лع�
           flag = false;									//���±�־����Ϊfalse
       }
		return flag;
	}
	
	public boolean update(String sql){						//ִ�е���SQL���ķ���
		boolean flag = false;
		int result = jt.update(sql);		//ִ�и��µõ����¼�¼����
		if(result>=0){						//���¼�¼��������һʱ
			flag = true;					//�����½����־��Ϊtrue
		}
		return flag;						//���ظ��½����־λ
	}
}