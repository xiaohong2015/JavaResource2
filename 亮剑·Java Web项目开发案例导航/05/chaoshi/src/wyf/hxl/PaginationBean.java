package wyf.hxl;
import java.util.*;
public class PaginationBean
{
	private int totolPage=1;
	private int totolCount=0;
	private int showPage=1;
	private String sql="";
	private Map<String,Integer> cart = new HashMap<String,Integer>();

	public Map<String,Integer> getCart()
	{
		return cart;
	}

	public void setSql(String n)
	{
		this.sql=n;System.out.println("$$"+n);
	}
	public String getSql()
	{
		return sql;
	}
	public void setTotolCount(int n)
	{
		this.totolCount=n;
	}
	public int getTotolCount()
	{
		return totolCount;
	}

	public void setTotolPage(int n)
	{
		this.totolPage=n;
	}
	public int getTotolPage()
	{
		return this.totolPage;
	}
	public void setShowPage(int n)
	{
		this.showPage=n;
	}
	public int getShowPage()
	{
		return this.showPage;
	}
	public void buy(String goodsid)
	{
		if(cart.containsKey(goodsid))
		{//�û����ǵ�һ�ι�����Ʒ
			
			cart.put(goodsid,cart.get(goodsid)+1);//������Ʒ������1
		}
		else
		{//�û���һ�ι���
			cart.put(goodsid,1);
		}
	}
	public Vector<String[]> getCartContent()
	{
		Vector<String[]> vv = new Vector<String[]>();
		
		Set<String> goodsid = cart.keySet();//�õ�Map�еļ�ֵ
		
		for(String str:goodsid)//�õ�����Ʒ����Ϣ
		{
			String[] a = new String[4];
			a[2] = str;
			//�õ���Ʒ����
			a[3] = cart.get(str).toString();
			try{
				str = new String(str.getBytes(),"ISO-8859-1");	
			}
			catch(Exception e){
				e.printStackTrace();
			}
			
			//�õ���Ʒ���ƺͼ۸�
			String sql = "select goodsname,gprice from goodsmessage where goodsid='"+str+"'";
			Vector<String[]> vt = DB.getMessage(sql);
			String[] gmeg = vt.get(0);
			a[0] = gmeg[0];
			a[1] = gmeg[1];
			vv.add(a);
		}
		return vv;
	}
	public double getAccount()
	{
		double num = 0.00;
		//�õ�������Ʒ����Ϣ
		Vector<String[]> ginfo = this.getCartContent();
		for(String[] str:ginfo)
		{//�õ���Ʒ�ܼ�
			num += Double.parseDouble(str[3])*Double.parseDouble(str[1]);
		}
		//ʹ��Ʒ������λС��
		num = Math.round(num*100)/100.00;
		return num;
	}
	
	public void removeItem(String goodsid)
	{ 
		try{
			goodsid= new String(goodsid.getBytes("iso-8859-1"),"gb2312");
			cart.remove(goodsid);
		}
		catch(Exception e)
		
		{
			e.printStackTrace();
		}
		
	}
}