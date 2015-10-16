package wyf.cgq;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
public class LoginDB
{
	public static String[] login(String uid,String pwd)
	{
		String[] impinfo=new String[2];//impinfo[0]:0��ʾû������û���1��ʾ�����²����ˣ�2��ʾ�������²�����
		impinfo[0]="0";
		String impId=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try
		{
			conn=getConnection();
			String sql="select impRight,impId from userinfo where impId=? and pwd=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,uid);
			pstmt.setString(2,pwd);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				impinfo[0]=rs.getInt("impRight")+"";
				impinfo[1]=rs.getString("impId");
			}
			else
			{
				impinfo[0]="0";
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				if(conn!=null){conn.close();}
				if(pstmt!=null){pstmt.close();}
				if(rs!=null){rs.close();}
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
		return impinfo;
	}
	public static Connection getConnection()
	{														//������ݿ����ӵķ���
		Connection conn=null;								//�������ݿ���������
		try
		{
			Context initial=new InitialContext();			//���������
			DataSource ds=(DataSource)initial.lookup("java:comp/env/rsglxt");
			conn=ds.getConnection();						//ͨ������Դ������ݿ�����
		}
		catch(NamingException e){e.printStackTrace();}		//�쳣�Ĳ��������
		catch(SQLException e){e.printStackTrace();}			//�쳣�Ĳ��������
		return conn;										//�������ݿ�����
	}
}