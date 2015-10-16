package wyf.wyy;
import java.util.*;
import java.io.*;
import org.springframework.jdbc.core.*;
public class StuDB {
	private JdbcTemplate jt;								//����JdbcTemplate��������					
	private List rl = null;									//����List��������
	private String sql = null;								//����SQL�ַ�������
	public void setJt(JdbcTemplate jt){						//jt��Ա��set����
		this.jt = jt;										//����jt���Ե�ֵ
	}
	public boolean verify(String StuNO,String pwd){	//��½��֤
		boolean result = false;								//��½�ɹ�ʧ�ܱ�־
		sql = "select * from student where "+				//����SQL���
			  "StudentNO='"+StuNO+"' and Password='"+pwd+"'";
        rl = jt.queryForList(sql);							//ִ�в�ѯ
        if(rl.size()!=0){									//�жϲ�ѯ���
        	result = true;									//��������û���ֵ��־λΪtrue
        }
		return result;										//���ر�־λ
	}
	public Vector<String> getStuInfo(String stuNO){
		Vector<String> vinfo = new Vector<String>();		//������Ϣ����
		sql = "select StudentNO,Name,Age,Gender,"+
    		  "Class,Department,Permitted from"+
    		  " student where StudentNO='"+stuNO+"'";		//����SQL���
		rl = jt.queryForList(sql);							//�õ�ѧ����Ϣ
		if(rl.size()!=0){
			for(int i=0;i<rl.size();i++){					//������ѯ���
				Map map=(Map)rl.get(i);						//���List��ÿһ��Ϊһ��LinkedHashMap
				Set set=map.keySet();						//Map�ļ�ֵΪ�����е�����
				for(Object o:set){
						String info = map.get(o).toString();//��ȡ������Ϣ����ת��
						vinfo.add(info);						//����Ϣ��ӽ���������									
				}
				if(vinfo.get(6).equals("1")){
					String per = (this.getCurMoney(stuNO).size()>0)?"0":"1";
					vinfo.set(6,per);
				}
			}
		}
		return vinfo;											//���ز�ѯ���
	}
	public boolean changePwd(String stuNO,String oldPwd,String newPwd){
		boolean flag = false;								//���½����־
		sql = "select * from student where "+				//������ѯ�û����������Ƿ�ƥ���SQL���
			  "StudentNO='"+stuNO+"' and Password='"+oldPwd+"'";
		rl = jt.queryForList(sql);							//ִ�в�ѯ
		if(rl.size()!=0){									//�û���������ƥ��
			sql = "update student set Password='"+newPwd+
				  "' where StudentNO='"+stuNO+"'";			//��������SQL���
			jt.execute(sql);								//ִ�и���
			flag = true;									//���³ɹ����ñ�־λ			
		}
		return flag;
	}
	public Vector<Vector<String>> getCurMoney(String stuNO){
		Vector<Vector<String>> vlist = new Vector<Vector<String>>();	//������Ϣ����
		sql = "select BookName,'���ڷ���',StartTime,End from book,"+
			  "borrow_list where StudentNO='"+stuNO+"' and book.BookNO"+
			  "=borrow_list.BookNO and Deal=0";							//��������ǰ�����¼							
		rl = jt.queryForList(sql);										//ִ�в�ѯ�õ����
		if(rl.size()!=0){
			for(int i=0;i<rl.size();i++){						//������ѯ���
				Map map=(Map)rl.get(i);							//���List��ÿһ��Ϊһ��LinkedHashMap
				Set set=map.keySet();							//Map�ļ�ֵΪ�����е�����
				Vector<String> vtemp = new Vector<String>();	//������ʱ��Ϣ����
				for(Object o:set){
					String info = map.get(o).toString();		//��ȡ������Ϣ����ת��
					vtemp.add(info);						//����Ϣ��ӽ���ʱ����										
				}
				String end = vtemp.get(3);							//�õ�Ӧ�ù黹ͼ��������ַ���
				String now = 
					DateUtil.getDateString(Calendar.getInstance());	//�õ�һ����ǰ���ڵ�ʵ��
				int exceed = DateUtil.getDay(end,now);				//�õ���������
				if(exceed>0){
					vtemp.add(String.valueOf(exceed/10.0));			//������ת���ɳ��ڷ����ӵ�����
					vlist.add(vtemp);								//�����ڼ�¼��ӽ���������	
				}					
			}
		}
		return vlist;	
	}
}