package wyf.zrk;

import javax.faces.model.SelectItem;

public class MsgSearchBean {
	private String location;
	private String type;
	private String size;
	private String area;
	private String price;
	private AllRentInfoBean arib;
	private AllQiuGouInfoBean qgib;
	private AllSaleInfoBean asib;
	private AllQiuZuInfoBean qzib;
	
	public void setLocation(String location) {		
		if(location.equals("��������")) {
			this.location = "%";
		}
		else {
			try {
				this.location = new String(location.getBytes(),"ISO-8859-1");
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	public String getLocation() {
		return this.location;
	}
	public void setType(String type) {
		if(type.equals("��ҵ����")) {
			this.type = "%";
		}
		else {
			try {
				this.type = new String(type.getBytes(),"ISO-8859-1");
			}
			catch(Exception e) {
				e.printStackTrace();
			}		
		}
	}
	public String getType()	{
		return this.type;
	}
	public void setSize(String size) {
		if(size.equals("���Ͳ���")) {
			this.size = "%";
		}
		else {
			try {
				this.size = new String(size.getBytes(),"ISO-8859-1");
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	public String getSize() {
		return this.size;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getArea() {
		return this.area;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPrice() {
		return this.price;
	} 
	public void setArib(AllRentInfoBean arib) {
		System.out.println("set the arib...");
		this.arib = arib;
	}
	public void setQgib(AllQiuGouInfoBean qgib) {
		System.out.println("set the qgib");
		this.qgib = qgib;
	}
	public void setQzib(AllQiuZuInfoBean qzib) {
		System.out.println("set the qiuzu ib./");
		this.qzib = qzib;
	}
	public void setAsib(AllSaleInfoBean asib) {
		System.out.println("set the sale info bean...");
		this.asib = asib;
	}
	
	public SelectItem[] getHouseLocation(){
		SelectItem[] si = new SelectItem[]{
			new SelectItem("��������","��������"),
			new SelectItem("·����","·����"),
			new SelectItem("·����","·����"),	
			new SelectItem("������","������"),
			new SelectItem("������","������"),
			new SelectItem("��ұ��","��ұ��"),
			new SelectItem("��ƽ��","��ƽ��"),
			new SelectItem("����","����"),
			new SelectItem("Ǩ����","Ǩ����"),
			new SelectItem("�С���","�С���"),
			new SelectItem("������","������"),
			new SelectItem("��ͤ��","��ͤ��"),
			new SelectItem("Ǩ����","Ǩ����"),
			new SelectItem("������","������"),
			new SelectItem("�ƺ���","�ƺ���")
		};
		return si;
	}
	
	public SelectItem[] getHouseType(){
		SelectItem[] si = new SelectItem[]{
			new SelectItem("��ҵ����","��ҵ����"),
			new SelectItem("��ͨסլ","��ͨסլ"),
			new SelectItem("��Ԣ","��Ԣ"),
			new SelectItem("����","����"),
			new SelectItem("����","����"),
			new SelectItem("��Ʒ��","��Ʒ��"),
			new SelectItem("����","����")
		};
		return si;
	}
	
	public SelectItem[] getHouseSize() {
		SelectItem[] si = new SelectItem[] {
			new SelectItem("���Ͳ���","���Ͳ���"),
			new SelectItem("���˼�","���˼�"),
			new SelectItem("һ��һ��","һ��һ��"),
			new SelectItem("����һ��","����һ��"),
			new SelectItem("��������","��������"),
			new SelectItem("����һ��","����һ��"),
			new SelectItem("���Ҷ���","���Ҷ���"),
			new SelectItem("����һ��","����һ��"),
			new SelectItem("���Ҷ���","���Ҷ���"),
			new SelectItem("����һ��","����һ��"),
			new SelectItem("���Ҷ���","���Ҷ���"),
			new SelectItem("����","����"),
			new SelectItem("����","����"),
			new SelectItem("���淿","���淿"),
			new SelectItem("�ֿ�","�ֿ�"),
			new SelectItem("����","����"),
			new SelectItem("����","����")
		};
		return si;
	}	
	
	public SelectItem[] getHouseArea(){
		SelectItem[] si = new SelectItem[] {
			new SelectItem("0-1000000","�������"),
			new SelectItem("0-50","50ƽ������"),
			new SelectItem("50-70","50-70ƽ��"),
			new SelectItem("70-90","70-90ƽ��"),
			new SelectItem("90-110","90-110ƽ��"),
			new SelectItem("110-130","110-130ƽ��"),
			new SelectItem("130-150","130-150ƽ��"),
			new SelectItem("150-1000000","150ƽ������")
		};
		return si;
	}
	
	public SelectItem[] getHousePrice()	{
		SelectItem[] si = new SelectItem[] {
			new SelectItem("0-1000000","�۸���"),
			new SelectItem("0-60","60��Ԫ����"),
			new SelectItem("60-80","60-80��Ԫ"),
			new SelectItem("80-100","80-100��Ԫ"),
			new SelectItem("100-120","100-120��Ԫ"),
			new SelectItem("120-150","120-150��Ԫ"),
			new SelectItem("150-200","150-200��Ԫ"),
			new SelectItem("200-1000000","200��Ԫ����")
		};
		return si;
	}
	public SelectItem[] getMonthPrice() {
		SelectItem[] si = new SelectItem[] {
			new SelectItem("0-1000000","�۸���"),
			new SelectItem("0-300","300Ԫ����/��"),
			new SelectItem("300-500","300-500Ԫ/��"),
			new SelectItem("500-800","500-800Ԫ/��"),
			new SelectItem("800-1000","800-1000Ԫ/��"),
			new SelectItem("1000-1000000","1000Ԫ����/��")
		};
		return si;
	}
	
	
	public String chuZuSearch() {
		String hql = "";
		String pageHql = "";
		String[] housearea = this.area.split("-");
		String[] houseprice = this.price.split("-");
		try {
			hql = "from RentInfo as ri where ri.r_msgtype='"
						+new String("����".getBytes(),"ISO-8859-1")
						+"' and ri.r_location like '"+this.location
						+"' and ri.r_wuye like '"+this.type
						+"' and ri.r_type like '"+this.size
						+"' and ri.r_area>="+Integer.parseInt(housearea[0])
						+" and ri.r_area<="+Integer.parseInt(housearea[1])
						+" and ri.r_price>="+Integer.parseInt(houseprice[0])
						+" and ri.r_price<="+Integer.parseInt(houseprice[1])
						+" order by ri.r_publishtime desc";
			pageHql = "from RentInfo as ri where ri.r_msgtype='"
						+new String("����".getBytes(),"ISO-8859-1")
						+"' and ri.r_location like '"+this.location
						+"' and ri.r_wuye like '"+this.type
						+"' and ri.r_type like '"+this.size
						+"' and ri.r_area>="+Integer.parseInt(housearea[0])
						+" and ri.r_area<="+Integer.parseInt(housearea[1])
						+" and ri.r_price>="+Integer.parseInt(houseprice[0])
						+" and ri.r_price<="+Integer.parseInt(houseprice[1]);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		this.arib.setHql(hql);
		this.arib.setNowPage(1);
		this.arib.setPageHql(pageHql);
		return "allrentinfo";
	}
	
	public String qiuZuSearch() {
		String hql = "";
		String pageHql = "";
		String[] housearea = this.area.split("-");
		String[] houseprice = this.price.split("-");
		try {
			hql = "from RentInfo as ri where ri.r_msgtype='"
						+new String("����".getBytes(),"ISO-8859-1")
						+"' and ri.r_location like '"+this.location
						+"' and ri.r_wuye like '"+this.type
						+"' and ri.r_type like '"+this.size
						+"' and ri.r_area>="+Integer.parseInt(housearea[0])
						+" and ri.r_area<="+Integer.parseInt(housearea[1])
						+" and ri.r_price>="+Integer.parseInt(houseprice[0])
						+" and ri.r_price<="+Integer.parseInt(houseprice[1])
						+" order by ri.r_publishtime desc";
			pageHql = "from RentInfo as ri where ri.r_msgtype='"
						+new String("����".getBytes(),"ISO-8859-1")
						+"' and ri.r_location like '"+this.location
						+"' and ri.r_wuye like '"+this.type
						+"' and ri.r_type like '"+this.size
						+"' and ri.r_area>="+Integer.parseInt(housearea[0])
						+" and ri.r_area<="+Integer.parseInt(housearea[1])
						+" and ri.r_price>="+Integer.parseInt(houseprice[0])
						+" and ri.r_price<="+Integer.parseInt(houseprice[1]);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		this.qzib.setHql(hql);
		this.qzib.setNowPage(1);
		this.qzib.setPageHql(pageHql);
		return "allqiuzuinfo";
	}
	
	public String chuShouSearch() {
		String hql = "";
		String pageHql = "";
		String[] housearea = this.area.split("-");
		String[] houseprice = this.price.split("-");
		try {
			hql = "from SaleInfo as si where si.s_msgtype='"
						+new String("����".getBytes(),"ISO-8859-1")
						+"' and si.s_location like '"+this.location
						+"' and si.s_wuye like '"+this.type
						+"' and si.s_type like '"+this.size
						+"' and si.s_area>="+Integer.parseInt(housearea[0])
						+" and si.s_area<="+Integer.parseInt(housearea[1])
						+" and si.s_price>="+Integer.parseInt(houseprice[0])
						+" and si.s_price<="+Integer.parseInt(houseprice[1])
						+" order by si.s_publishtime desc";
			pageHql = "from SaleInfo as si where si.s_msgtype='"
						+new String("����".getBytes(),"ISO-8859-1")
						+"' and si.s_location like '"+this.location
						+"' and si.s_wuye like '"+this.type
						+"' and si.s_type like '"+this.size
						+"' and si.s_area>="+Integer.parseInt(housearea[0])
						+" and si.s_area<="+Integer.parseInt(housearea[1])
						+" and si.s_price>="+Integer.parseInt(houseprice[0])
						+" and si.s_price<="+Integer.parseInt(houseprice[1]);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		this.asib.setHql(hql);
		this.asib.setNowPage(1);
		this.asib.setPageHql(pageHql);
		return "allsaleinfo";
	}
	
	public String qiuGouSearch() {
		String hql = "";
		String pageHql = "";
		String[] housearea = this.area.split("-");
		String[] houseprice = this.price.split("-");
		try {
			hql = "from SaleInfo as si where si.s_msgtype='"
						+new String("��".getBytes(),"ISO-8859-1")
						+"' and si.s_location like '"+this.location
						+"' and si.s_wuye like '"+this.type
						+"' and si.s_type like '"+this.size
						+"' and si.s_area>="+Integer.parseInt(housearea[0])
						+" and si.s_area<="+Integer.parseInt(housearea[1])
						+" and si.s_price>="+Integer.parseInt(houseprice[0])
						+" and si.s_price<="+Integer.parseInt(houseprice[1])
						+" order by si.s_publishtime desc";
			pageHql = "from SaleInfo as si where si.s_msgtype='"
						+new String("��".getBytes(),"ISO-8859-1")
						+"' and si.s_location like '"+this.location
						+"' and si.s_wuye like '"+this.type
						+"' and si.s_type like '"+this.size
						+"' and si.s_area>="+Integer.parseInt(housearea[0])
						+" and si.s_area<="+Integer.parseInt(housearea[1])
						+" and si.s_price>="+Integer.parseInt(houseprice[0])
						+" and si.s_price<="+Integer.parseInt(houseprice[1]);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		this.qgib.setHql(hql);
		this.qgib.setNowPage(1);
		this.qgib.setPageHql(pageHql);
		return "allqiugouinfo";
	}
	
}