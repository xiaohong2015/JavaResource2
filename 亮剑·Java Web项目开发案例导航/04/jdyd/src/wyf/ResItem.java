package wyf;

public class ResItem{
	private String rid;			//��װ����Դ�������
	private String rname;		//��װ����Դ��������
	private String rspec;		//��װ����Դ��������
	private String rdetail;		//��װ����Դ����������
	private String rprice;		//��װ����Դ�۸�
	private String gid;			//��Դ��������ID
	private String rstatus;		//��Դ״̬
	
	public void setRstatus(String rstatus){
		this.rstatus = rstatus;				//rstatus��setter����
	}
	public String getRstatus(){
		return this.rstatus;				//rstatus��getter����
	}	
	
	public String getGid(){	
		return this.gid;					//gid��getter����
	}
	
	public void setGid(String gid){
		this.gid = gid;						//gid��setter����
	}
	
	public void setRid(String rid) {
		this.rid = rid;						//rid��setter���� 
	}

	public void setRname(String rname) {
		this.rname = rname; 				//rname��setter����
	}

	public void setRspec(String rspec) {
		this.rspec = rspec; 				//rspec��setter����
	}

	public void setRdetail(String rdetail) {
		this.rdetail = rdetail; 			//rdetail��setter����
	}

	public void setRprice(String rprice) {
		this.rprice = rprice; 				//rprice��setter����
	}

	public String getRid() {
		return (this.rid); 					//rid��getter����
	}

	public String getRname() {
		return (this.rname); 				//rname��getter����
	}

	public String getRspec() {
		return (this.rspec); 				//rspec��getter����
	}

	public String getRdetail() {
		return (this.rdetail); 				//rdetail��getter����
	}

	public String getRprice() {
		return (this.rprice); 				//rprice��getter����
	}

}