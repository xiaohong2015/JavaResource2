package wyf;

import java.util.Map;
import javax.faces.context.*;
import org.springframework.jdbc.core.*;


public class AdminLogBean extends BaseBean {

	private String aid;
	private String aname = "wyf";
	private String apwd = "123123";
	private String valCode;
	private boolean flag; // �Ƿ񳬼�����Ա�ı�־

	public String getAid() {
		return aid; // aid��getter����
	}

	public void setAid(String aid) {
		this.aid = aid; // aid��setter����
	}

	public String getAname() {
		return aname; // aname��getter����
	}

	public void setAname(String aname) {
		this.aname = aname; // aname��setter����
	}

	public String getApwd() {
		return apwd; // apwd��getter����
	}

	public void setApwd(String apwd) {
		this.apwd = apwd; // apwd��setter����
	}

	public String getValCode() {
		return valCode; // valcode��getter����
	}

	public void setValCode(String valCode) {
		this.valCode = valCode.toUpperCase(); // valCode��setter����������תΪ��д
	}

	public boolean isSuper() {
		return this.flag; // �����Ƿ��ǳ�������Ա�ķ���
	}

	public void loginAdmin() {
		FacesContext fc = FacesContext.getCurrentInstance(); // �õ�FacesContextʵ��
		ExternalContext ec = fc.getExternalContext(); // �õ�ExternalContextʵ��
		Map session = ec.getSessionMap(); // �õ�����HttpSession��Map ʵ��
		String code = (String) session.get("randNum"); // �õ�session�����֤��
		code = code.toUpperCase(); // ����֤��ת�ɴ�д
		if (!code.equals(valCode)) { // �������ĺ�ϵͳ��������֤�벻һ��
			message = "��֤��������󣬵�½ʧ��"; // ��֤��������ʾ��Ϣ
		} else { // ��֤��������ȷ
			String sql = "select AId from admin_info where AName='" + aname
					+ "' and APwd='" + apwd + "'"; // ��֤�û����������SQL���
			this.setAid(dbu.getStringInfo(sql)); // ���ù���Ա�������
			if (aid == null) {
				message = "��½ʧ�ܣ��û��������벻ƥ��"; // ��¼ʧ����ʾ��Ϣ
			} else {
				message = aname + ",��ӭ����Ƶ�Ԥ����������"; // ��¼�ɹ���ʾ��Ϣ
				sql = "select ALevel from admin_info where AId=" + this.aid;
				this.flag = dbu.getStringInfo(sql).equals("����"); // �õ�����Ա�ļ�����Ϣ
			}
		}
	}

	public String adminLogout() {
		this.setAid(null); // ����aid����ֵΪnull
		this.setAname(null); // ����aname����ֵΪnull
		this.setMessage(null); // ����message����Ϊnull
		this.flag = false; // ���ù���Ա�����־Ϊfalse������ͨ����Ա
		return "adminLogin"; // ���ع����¼ҳ��
	}
}
