package wyf;
import java.util.*;
import javax.faces.model.*;
public class FenYeBean extends BaseBean{
    protected int span = 4;			//ÿҳ��ʾ��������¼
	protected int curPage = 1;		//��ǰ��ʾ��һҳ
	protected int maxPage;			//���ҳ��
	protected String sql;			//������SQL���
    protected DataModel dm=new ListDataModel();		//ҳ����ʾ������ģ��	
    protected Vector al = new Vector();				//��ʾ��¼�ļ���
    public int getMaxPage(){						//�õ����ҳ���ķ���    	
		this.maxPage = dbu.getTotal(this.getSql(),this.getSpan());
		return this.maxPage;						//���ز�ѯ�õ������ҳ��
	}

	public void setSpan(int span) {				//span���Ե�setter����
		this.span = span;						//����span����ֵ
		this.setCurPage(1);						//���õ�ǰ��ʾ��һҳ
	}
	public int getSpan() {
		return (this.span); 					//span���Ե�getter����
	}
	
	public void setCurPage(int curPage){
		this.curPage = curPage;					//curPage��setter����
	}
	public int getCurPage(){
		return this.curPage;					//curPage��getter����
	}
	
	public String getSql() {
		return (this.sql);						//sql���Ե�getter����
	}
	
	public void prePage(){				//��һҳ
		this.curPage -= 1;				//��ǰҳ����һ
		if(curPage<0){					//���������ĵ�ǰҳС��0
			this.curPage = 1;			//����ʾ��һҳ
		}
	}
	public void nextPage(){					//��һҳ
		this.curPage += 1;					//��ǰҳ����һ
		if(this.curPage>this.maxPage){		//���������ĵ�ǰҳ�������ҳ��
			this.curPage = this.maxPage;	//����ʾ���һҳ
		}
	}
	
	public SelectItem[] getPageSpanList(){		//�õ�ÿҳ��ʾ�������������б�ѡ������
		SelectItem[] list=new SelectItem[9];	//���������б�ѡ������
		for(int i=0;i<9;i++){					//ѭ��9��
			list[i]=new SelectItem(Integer.valueOf(i+1),(i+1)+"��/ҳ");
		}
		return list;							//���������б��������
	}
	
	public SelectItem[] getPageList(){					//���ػ�ҳ�����б��ѡ������
		SelectItem[] list=new SelectItem[this.maxPage];	//���������б�ѡ������
		for(int i=0;i<this.maxPage;i++){
			list[i]=new SelectItem(Integer.valueOf(i+1),"��"+(i+1)+"ҳ");
		}
		return list;									//���������б��������
	}
	
	public int getSize(){
		return al.size();					//����ҳ����ʾ��Ϣ�����Ĵ�С
	}
}