package com;

import java.sql.*;

/**
 * �ļ�����ConnDB
 *  �������������ݿ�
 *  ��˾�����տƼ�
 *  ���ߣ�����
 */
public class ConnDB {
	Connection conn = null;

	Statement stmt = null;

	ResultSet rs = null;

	public ConnDB() {
		try {
			Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
		} catch (java.lang.ClassNotFoundException e) {
			System.err.println(e.getMessage());
		}
	}

	/**
	 * ���������� ִ�в�ѯ����
	 * ������  String
	 * ����ֵ�� ResultSet
	*/
	public ResultSet executeQuery(String sql) {
		try {
			conn = DriverManager
					.getConnection("jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=db_JSDQ21;user=sa;password=");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			rs = stmt.executeQuery(sql);
		} catch (SQLException ex) {
			System.err.println(ex.getMessage());
		}
		return rs;
	}

	/**
	 * ���������� ִ�и��²���
	 * ������  String
	 * ����ֵ�� int
	*/
	public int executeUpdate(String sql) {
		int result = 0;
		try {
			conn = DriverManager
					.getConnection("jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=db_JSDQ21;user=sa;password=");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			result = stmt.executeUpdate(sql);
		} catch (SQLException ex) {
			result = 0;
		}
		return result;
	}

	/**
	 * ���������� �ر����ݿ�����
	 * ������  ��
	 * ����ֵ�� void
	 */	
	public void close() {
		try {
			if (rs != null)
				rs.close();
		} catch (Exception e) {
			e.printStackTrace(System.err);
		}
		try {
			if (stmt != null)
				stmt.close();
		} catch (Exception e) {
			e.printStackTrace(System.err);
		}
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace(System.err);
		}
	}
}
