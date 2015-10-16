package wyf.zrk;

public class ModifyAdminPwdBean {
	private InfoBean info;
	private AdminLoginBean alb;
	private DButilDAOImpl db;
	private String aname;
	private String oldPwd;
	private String firstPwd;
	private String secondPwd;
	private String errMsg;	
	
	public void setInfo(InfoBean info) {
		this.info = info;
	}
	public void setAlb(AdminLoginBean alb) {
		this.alb = alb;
	}
	public void setDb(DButilDAOImpl db) {
		this.db = db;
	}
	public String getAname() {
		return this.alb.getAname();
	}
	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}
	public String getOldPwd() {
		return this.oldPwd;
	}
	public void setFirstPwd(String firstPwd) {
		this.firstPwd = firstPwd;
	}
	public String getFirstPwd() {
		return this.firstPwd;
	}
	public void setSecondPwd(String secondPwd) {
		this.secondPwd = secondPwd;
	}
	public String getSecondPwd() {
		return this.secondPwd;
	}
	public void setErrMsg(String msg) {
		this.errMsg = errMsg;
	}
	public String getErrMsg() {
		String msg = errMsg;
		this.errMsg = "";
		return msg;
	}
	
	public String modify() {
		System.out.println("admin modify......");
		String msg = "";
		if(oldPwd.trim().equals("")) {
			errMsg = "�����벻��Ϊ�գ�";
			msg = "error";
		}
		else if(firstPwd.trim().equals("")) {
			errMsg = "��һ�������벻��Ϊ�գ�";
			msg = "error";
		}
		else if(secondPwd.trim().equals("")) {
			errMsg = "�ڶ��������벻��Ϊ�գ�";
			msg = "error";
		}
		else if(!firstPwd.trim().equals(secondPwd.trim())) {
			errMsg = "�����������벻һ�£�";
			msg = "error";
		}
		else if(!alb.getApwd().equals(oldPwd.trim())) {
			errMsg = "�������������";
			msg = "error";
		}
		else {
			AdminInfo ai = new AdminInfo();
			ai.setA_pwd(this.firstPwd);
			ai.setA_id(this.alb.getAdmin().getA_id());
			String flag = db.updateObj("admininfo",ai);
			if(flag.equals("yes")) {
				this.info.setUrl("AdminIndex.jsp");
				this.info.setMsg("��ϲ���������޸ĳɹ���");
				msg = "success";
			}
			else if(flag.equals("no")) {
				errMsg = "�����޸�ʧ�ܣ�";
				msg = "error";
			}
		}
		return msg;
	}
	
	
	
	
}