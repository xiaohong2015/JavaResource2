package com.lh.dao;
import java.sql.*;
/**
 * �������ݿ���࣬������ݿ�����
 * @author Administrator
 *
 */

public class DBCon {
	private static Connection conn = null;
	public static Connection getConn(){
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");//����������
			String user = "sa";//�û���
			String pwd = "sa";//����
			String url = "jdbc:sqlserver://localhost:1433;DataBaseName=test";//����URL
			conn = DriverManager.getConnection(url, user, pwd);//��ȡ����
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
