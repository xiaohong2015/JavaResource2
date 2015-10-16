package wyf.zrk;
import java.util.*;
import javax.annotation.*;
import javax.ejb.*;
import javax.sql.*;
import java.sql.*;
@Stateless
public class DButilBean implements DButilLocal,DButilRemote{
	@Resource(name="train_ds")									//ע��������Դ
	public DataSource ds;
	int span = 8;												//����ÿҳ�ļ�¼��
	Connection con = null;										//������������
	Statement st = null;										//�����������
	ResultSet rs = null;										//�������������
	public List<String[]> getInfo(String sql){
		List<String[]> ls = new ArrayList<String[]>();			//���ڴ���������
		try{
			con = ds.getConnection();							//�õ�����
			st = con.createStatement();							//�������
			rs = st.executeQuery(sql);							//ִ�м���
			ResultSetMetaData rsmd = rs.getMetaData();			//�������õ������Ԫ����
			int count = rsmd.getColumnCount();					//�õ����������
			while(rs.next()){
				String[] str = new String[count];				//�������飬�������ÿһ����¼
				for(int i=0;i<count;i++){						//ѭ����
					str[i] = new String(rs.getString(i+1).getBytes("ISO-8859-1"),"gbk");//�õ�����
				}
				ls.add(str);									//����������б���
			}			
		}
		catch(Exception e){e.printStackTrace();}				//��ӡ�쳣
		finally{
			try{
				if(rs!=null){rs.close();}						//�رս����
				if(st!=null){st.close();}						//�ر����
				if(con!=null){con.close();}						//�黹����
			}
			catch(Exception e){e.printStackTrace();}			//��ӡ�쳣
		}		
		return ls;
	}
	
	public int updateDb(String sql){
		int i = 0;
		try{
			con = ds.getConnection();							//�õ�����
			st = con.createStatement();							//�������
			i = st.executeUpdate(sql);							//ִ�и���		
		}
		catch(Exception e){
			e.printStackTrace();								//��ӡ�쳣
		}
		finally{
			try{
				if(st!=null){st.close();}						//�ر����
				if(con!=null){con.close();}						//�黹����				
			}
			catch(Exception e){
				e.printStackTrace();							//��ӡ�쳣
			}
		}
		return i;
	}
	
	public int getTotalPage(String sql){
		int totalpage = 1;								//������ҳ��
		int count = 0;									//�����ܼ�¼��
		try{
			con = ds.getConnection();					//�õ�����
			st = con.createStatement();					//�������
			rs = st.executeQuery(sql);					//�õ������
			if(rs.next()){								//�õ�������еļ�¼
				count = rs.getInt(1);					//�õ��ܼ�¼��
				totalpage = (count%span==0)?(count/span):(count/span+1);//�õ���ҳ��
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try{
				if(rs!=null){rs.close();}						//�رս����
				if(st!=null){st.close();}						//�ر����
				if(con!=null){con.close();}						//�黹����	
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
		
		return totalpage;
		
	}
	
	public List<String[]> getPageContent(String sql,int page){
		List<String[]> ls = new ArrayList<String[]>();
		try{
			con = ds.getConnection();							//�õ�����
			st = con.createStatement();							//�������
			rs = st.executeQuery(sql);							//�õ������
			ResultSetMetaData rsmd = rs.getMetaData();			//�������õ������Ԫ����
			int count = rsmd.getColumnCount();					//�õ����������
			int i = 0;
			int start = (page-1)*span;							//�õ���ʼ��¼
			if(start!=0){
				rs.absolute(start);								//���������λ��Ҫȡ�ļ�¼��ǰһ��
			}
			while(rs.next()&&i<span){
				i++;
				String[] str = new String[count];				//�������飬�������ÿһ����¼
				for(int k=0;k<count;k++){						//ѭ����
					str[k] = new String(rs.getString(k+1).getBytes("ISO-8859-1"),"gbk");//�õ�����
				}
				ls.add(str);									//����������б���
			}			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try{
				if(rs!=null){rs.close();}						//�رս����
				if(st!=null){st.close();}						//�ر����
				if(con!=null){con.close();}						//�黹����	
			}
			catch(Exception e){
				e.printStackTrace();							//��ӡ�쳣
			}
		}
		return ls;
	}
	
	public List<String[]> zzcx(String start,String end){
		List<String[]> ls = new ArrayList<String[]>();
		String sql = "select A.tid,A.tname,A.sname,A.rstart,B.sname,B.rarrive,B.typename "+
						"from (select TA.tid,TA.tname,to_char(RA.rstart,'hh24:mi') rstart,SA.sname "+
						"from traininfo TA,relationinfo RA,stationinfo SA "+
						"where TA.tid=RA.tid and SA.sid=RA.sid "+
						"and SA.sname like '%"+start+"%') A,"+
						"(select TA.tid,TA.tname,to_char(RA.rarrive,'hh24:mi') rarrive,SA.sname,"+
						"TI.tname typename "+
						"from traininfo TA,relationinfo RA,stationinfo SA,typeinfo TI "+
						"where TA.tid=RA.tid and SA.sid = RA.sid and SA.sname like '%"+end+"%' "+
						"and TI.tid = TA.ttypeid) B "+
						"where A.tid = B.tid and A.tid in ("+
						"select AA.tid from	"+
						"(select tid,rsequence from relationinfo	where sid in"+
						"(select sid from stationinfo where sname like '%"+start+"%')) AA,"+
						"(select tid,rsequence from relationinfo where sid in"+
						"(select sid from stationinfo where sname like'%"+end+"%')) BB "+
						"where AA.tid = BB.tid and AA.rsequence<BB.rsequence)";
		System.out.println(sql);
		try{
			sql = new String(sql.getBytes(),"ISO-8859-1");		//ת��
			con = ds.getConnection();							//�õ�����
			st = con.createStatement();							//�������
			rs = st.executeQuery(sql);							//�õ������
			while(rs.next()){
				String[] str = new String[7];
				for(int i=0;i<7;i++){
					str[i] = new String(rs.getString(i+1).getBytes("ISO-8859-1"),"gbk");
				}
				ls.add(str);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try{
				if(rs!=null){rs.close();}						//�رս����
				if(st!=null){st.close();}						//�ر����
				if(con!=null){con.close();}						//�黹����	
			}
			catch(Exception e){
				e.printStackTrace();							//��ӡ�쳣
			}				
		}
		return ls;
	}
	
	public List<String[]> czcx(String station){
		List<String[]> ls = new ArrayList<String[]>();
		String sql = "select A.tid,A.tname,A.sname,A.rstart,B.sname,B.rarrive,B.typename "+
						"from (select TA.tid,TA.tname,to_char(RA.rstart,'hh24:mi') rstart,SA.sname "+
							"from traininfo TA,relationinfo RA,stationinfo SA "+
							"where TA.tid=RA.tid and TA.tstartid=RA.sid "+
							"and TA.tstartid=SA.sid) A,"+
							"(select TA.tid,TA.tname,to_char(RA.rarrive,'hh24:mi') rarrive,SA.sname,"+
							"TI.tname typename "+
							"from traininfo TA,relationinfo RA,stationinfo SA,typeinfo TI "+
							"where TA.tid=RA.tid and TA.tendid = RA.sid	and	TA.tendid = SA.sid "+
							"and TI.tid = TA.ttypeid) B where A.tid = B.tid and A.tid in ("+
							"select tid from relationinfo where sid in ("+
							"select sid from stationinfo where sname like '%"+station+"%'))";
		try{
			sql = new String(sql.getBytes(),"ISO-8859-1");		//ת��
			con = ds.getConnection();							//�õ�����
			st = con.createStatement();							//�������
			rs = st.executeQuery(sql);							//�õ������
			while(rs.next()){
				String[] str = new String[7];
				for(int i=0;i<7;i++){
					str[i] = new String(rs.getString(i+1).getBytes("ISO-8859-1"),"gbk");
				}
				ls.add(str);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try{
				if(rs!=null){rs.close();}						//�رս����
				if(st!=null){st.close();}						//�ر����
				if(con!=null){con.close();}						//�黹����	
			}
			catch(Exception e){
				e.printStackTrace();							//��ӡ�쳣
			}				
		}
		return ls;
	}
	
	public List<String[]> cccx(String train){
		List<String[]> ls = new ArrayList<String[]>();
		String sql = "select sname,rarrive,rstart from stationinfo,"+
						"(select sid,to_char(rarrive,'hh24:mi') rarrive,"+
						"to_char(rstart,'hh24:mi') rstart,rsequence "+
						"from relationinfo where tid =("+
						"select tid from traininfo where tname='"+train+"')) A "+
						"where stationinfo.sid=A.sid order by A.rsequence";
		System.out.println(sql);
		try{
			sql = new String(sql.getBytes(),"ISO-8859-1");		//ת��
			con = ds.getConnection();							//�õ�����
			st = con.createStatement();							//�������
			rs = st.executeQuery(sql);							//�õ������
			while(rs.next()){
				String[] str = new String[3];
				for(int i=0;i<3;i++){
					str[i] = rs.getString(i+1);
					if(i==0){
						str[i] = new String(str[i].getBytes("ISO-8859-1"),"gbk");
					}
					if(str[i]==null){
						str[i]="-:-";
					}
				}
				ls.add(str);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try{
				if(rs!=null){rs.close();}						//�رս����
				if(st!=null){st.close();}						//�ر����
				if(con!=null){con.close();}						//�黹����	
			}
			catch(Exception e){
				e.printStackTrace();							//��ӡ�쳣
			}				
		}
		return ls;
	}	
	public List<String> searchMidStation(String start,String end){
		List<String> ls = new ArrayList<String>();
		String sql = "select sname from stationinfo "+
						"where sid in (select AA.sid from"+
						"(select B.sid from ("+
						"select tid,rsequence from relationinfo "+
						"where sid = (select sid from stationinfo "+
						"where sname='"+start+"')) A,"+
						"(select sid,tid,rsequence from relationinfo) B "+
						"where A.tid = B.tid and A.rsequence<B.rsequence) AA,"+
						"(select A.sid from(select sid,tid,rsequence from "+
						"relationinfo) A,(select tid,rsequence from relationinfo "+
						"where sid = (select sid from stationinfo where "+
						"sname='"+end+"')) B where A.tid = B.tid and "+
						"A.rsequence<B.rsequence) BB where AA.sid = BB.sid)";
		System.out.println(sql);
		try{
			sql = new String(sql.getBytes(),"ISO-8859-1");		//ת��
			con = ds.getConnection();							//�õ�����
			st = con.createStatement();							//�������
			rs = st.executeQuery(sql);							//�õ������
			while(rs.next()){
				String str = rs.getString(1);
				str = new String(str.getBytes("ISO-8859-1"),"gbk");
				ls.add(str);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try{
				if(rs!=null){rs.close();}						//�رս����
				if(st!=null){st.close();}						//�ر����
				if(con!=null){con.close();}						//�黹����	
			}
			catch(Exception e){
				e.printStackTrace();							//��ӡ�쳣
			}				
		}
		return ls;
	}
	
	
	
}