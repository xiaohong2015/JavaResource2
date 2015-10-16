package wyf.wyy;
import java.util.Calendar;
public class DateUtil {
	public static int getDay(String start,String end){
		Calendar before = DateUtil.changeStringToDate(start);	//�õ���ʼʱ�����
		Calendar after = DateUtil.changeStringToDate(end); 		//�õ�����ʱ�����
		long first = before.getTimeInMillis();					//�õ���ʼʱ��ĺ���ֵ
		long second = after.getTimeInMillis();					//�õ�����ʱ��ĺ���ֵ
		int day = (int)((second-first)/(1000*60*60*24));			
		return day;
	}
	public static String addSomeDay(String date,int day){
		Calendar cal = DateUtil.changeStringToDate(date);
		cal.add(Calendar.DAY_OF_MONTH,day);
		String newString = DateUtil.getDateString(cal);
		return newString;
	}
	public static String getDateString(Calendar cal){
		int year =  cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONDAY)+1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		return year+"-"+month+"-"+day;
	}
	public static Calendar changeStringToDate(String date){
		String regex = "-";							//����ַ���������ʽ
		String d[] = date.split(regex);				//��ֵõ��ַ�������
		int year = Integer.parseInt(d[0]);			//�õ����
		int month = Integer.parseInt(d[1])-1;		//�õ��·�
		int day = Integer.parseInt(d[2]);			//�õ������Ǹ����еĵڼ���
		Calendar calendar = Calendar.getInstance();	//�õ�һ��Calendarʵ��
		calendar.set(year,month,day);				//��������Ϊ�ַ������ݵ�����
		return calendar;							//�������ڶ���
	}
	public static void main(String[] args) {
		System.out.println(getDay("2005-2-5","2005-3-5"));	
		System.out.println(addSomeDay("2008-10-1",30));
		System.out.println(getDateString(changeStringToDate("2005-10-4")));
	}
}