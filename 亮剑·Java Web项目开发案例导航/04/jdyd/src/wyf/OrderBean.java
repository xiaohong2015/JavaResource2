package wyf;
import java.util.*;
import javax.faces.event.*;
import javax.faces.context.*;
import javax.faces.event.*;
import javax.faces.model.*;
import java.sql.*;
import org.springframework.jdbc.core.*;
public class OrderBean extends BaseBean{
	Vector<Info_Item> v = new Vector<Info_Item>();	//��Ŷ�����ϸ
	protected DataModel dm=new ListDataModel();
	private boolean isSubmit;						//�����Ƿ��ύ��־
	private JdbcTemplate jt;						//����JdbcTemplate����
	private UserLogBean ulb;	//��¼�û���½��Ϣ��Bean����
	private String start;		//��װ�û������Ԥ����ʼʱ��
	private String end;			//��װ�û������Ԥ������ʱ��
	private String rid;			//�û�ҪԤ����Դ�ı��
	private String rname;		//�û�ҪԤ����Դ������
	
	
	public void setUlb(UserLogBean ulb){
		this.ulb = ulb;			//����ulb����ע���setter����
	}
	public void setJt(JdbcTemplate jt){
		this.jt = jt;			//����jt����ע���setter����
	}
	public String getStart(){
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		String sql = "select RName from res_info where rid="+rid;
		this.rname = dbu.getStringInfo(sql);		//��ѯ�õ���Դ����
		this.rid = rid;								//����rid����ֵ
	}
		
	public void addToOrder(){								//��ӵ���������
		Info_Item ii = new Info_Item(rid,rname,start,end);	//����������¼����
		v.add(ii);											//��������¼��ӵ�����
		this.isSubmit = false;								//�����Ƿ��ύ��־λΪfalse
	}
	
	public DataModel getOrderList() {			//���ڵõ���ǰ��������ģ�͵ķ���
       	dm.setWrappedData(v);					//����DataModel
       	return dm;								//����DataModelֵ
	}
	
	public void remove(ActionEvent e){			//ɾ��ĳһ��Ԥ������ķ���
		this.v.remove(dm.getRowData());			//ɾ���û�ѡ���ĳһ����¼
	}
		
	public void removeAll(){					//��յ�ǰ��������
		v.removeAllElements();					//��մ洢����������
	}
	
	public String submitOrder(){
		if(ulb.getUsid()==null){				//Ҫ�ύ�����������ж��û��Ƿ��¼
			ulb.setTarget(true);				//��½����ת��ҳ��
			return "LOGIN";						//����LOGIN��ͼ			
		}
		String sql = "select max(OId) from order_list";	//��ѯ���������ֵ��SQL���
		int oid = jt.queryForInt(sql)+1;				//ִ�в�ѯ�õ��������һ
		sql = "insert into order_list(OId,usid,OTime) values("+oid+","+ulb.getUsid()+",sysdate)";
		Vector<String> SQL = new Vector<String>();		//����SQL�������
		SQL.add(sql);									//��SQL�����ӵ�����
		for(int i=0;i<v.size();i++){
			Info_Item ii = v.get(i);						//�õ�������Ϣ����
			sql = "insert into order_info(OId,RID,Start_Time,End_Time) values("+
				oid+","+ii.getRid()+",to_date('"+ii.getStart()+"','yyyy-mm-dd'),"+
				"to_date('"+ii.getEnd()+"','yyyy-mm-dd'))";	//��ϳɲ������ݿ��SQL���
			SQL.add(sql);									//��SQL�����ӵ�����
		}
		if(dbu.update(SQL)){
			this.isSubmit = true;							//�����Ѿ��ύ
			v.removeAllElements();							//��յ�ǰ����
			this.message = "�����ύ�ɹ�����ӭ���ٴι���";	//������ʾ��Ϣ
		}
		else{
			message = "δ֪���󣬶����ύʧ��";				//�������ʧ������ʾ����
		}
		return "SUCCESS";
	}
	
	public boolean getSubmit(){
		return this.isSubmit;
	}
	
	public int getSize(){
		return v.size();
	}
}