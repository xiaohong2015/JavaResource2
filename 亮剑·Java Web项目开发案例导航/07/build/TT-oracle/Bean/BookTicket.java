package wyf.zrk;

import java.util.*;

public interface BookTicket{
	 //���ﳵ����ӳ�Ʊ
	 public void addToCart(TicketItem ti);

     //�ӹ��ﳵ��ɾ����Ʊ�ķ���
	 public boolean removeFromCart(String id);
 
	 //��ȡ��Ʊ�б�
	 public Vector<TicketItem> getCart();
	 
     //��չ��ﳵ
	 public void clearCart();
}