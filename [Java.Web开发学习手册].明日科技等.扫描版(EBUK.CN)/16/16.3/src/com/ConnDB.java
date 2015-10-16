package com;

import java.sql.*;

/**
 * 文件名：ConnDB
 *  描述：操作数据库
 *  公司：明日科技
 *  作者：无语
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
	 * 功能描述： 执行查询操作
	 * 参数：  String
	 * 返回值： ResultSet
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
	 * 功能描述： 执行更新操作
	 * 参数：  String
	 * 返回值： int
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
	 * 功能描述： 关闭数据库连接
	 * 参数：  无
	 * 返回值： void
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
