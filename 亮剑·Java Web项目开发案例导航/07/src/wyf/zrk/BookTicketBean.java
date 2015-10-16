package wyf.zrk;
import java.util.*;
import javax.annotation.*;
import javax.ejb.*;
import javax.sql.*;
import java.sql.*;
@Stateful
public class BookTicketBean implements BookTicketLocal,BookTicketRemote{
	//�洢Ԥ����Ʊ��Ϣ���б�
    private Vector<TicketItem> cart = new Vector<TicketItem>();	
	public void addToCart(TicketItem ti){	//����һ��ֻ����Ԥ��һ�ֳ��Σ���cart��ֻ
		if(cart.size()==0){					//���Է�һ�������ڴ˾Ͳ�����Ҫ�����ж�
			cart.add(ti);
		}
		else{
			cart.clear();
			cart.add(ti);
		}							
	}
     //�ӹ��ﳵ��ɾ����Ʊ�ķ���
	 public boolean removeFromCart(String tname){
	 	boolean flag = false;	 	
	 	for(TicketItem ti:cart){	
			if(ti.getTname().equals(tname)){				
				cart.remove(ti);
				flag = true;
	        }
		}
	 	return flag;
	 } 
	 //��ȡ��Ʊ�б�
	 public Vector<TicketItem> getCart(){
	 	return cart;
	 }	 
     //��չ��ﳵ
	 public void clearCart(){
	 	cart.clear();
	 }	
}