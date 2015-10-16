package com.fileUD.javabean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB {
	private String classname="com.microsoft.jdbc.sqlserver.SQLServerDriver";
	private String URL="jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=db_JSDQ13";
	private String username="sa";
	private String pwd="";
	private Connection con;
	private Statement stm;
	private ResultSet rs;
	
	public DB(){
		try{
			Class.forName(classname);
		}catch(ClassNotFoundException e){
			e.printStackTrace();
			System.out.println("�������ݿ�����ʧ�ܣ�");
		}
	}
	private void getCon(){
		if(con==null){
			try{
				con=DriverManager.getConnection(URL,username,pwd);
			}catch(SQLException e){
				con=null;
				e.printStackTrace();
				System.out.println("�������ݿ�����ʧ�ܣ�");
			}			
		}
	}
	private void getStm(){
		if(stm==null){
			try {
				getCon();
				stm=con.createStatement();
			} catch (SQLException e) {
				System.out.println("����Statement����ʧ�ܣ�");
				e.printStackTrace();
			}			
		}
	}
	private void getStmed(){
		if(stm==null){
			try {
				getCon();
				stm=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE ,ResultSet.CONCUR_READ_ONLY);
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("�����������ɿɹ����������Statement����ʧ�ܣ�");
			}		
		}
	}
	public ResultSet Read(String sql){
		if(sql==null)sql="";
		System.out.println("sql:"+sql);
		getStmed();
		ResultSet rs=null;
		try {
			rs = stm.executeQuery(sql);
		} catch (SQLException e) {
			rs=null;
			e.printStackTrace();
            System.out.println("��ѯ���ݿ�ʧ�ܣ�");
		}
		return rs;
	}
	public int CUD(String sql){
		if(sql==null)sql="";
		System.out.println("sql:"+sql);
		getStmed();
		int i=0;
		try {
			i = stm.executeUpdate(sql);
		} catch (SQLException e) {
			i=0;
			e.printStackTrace();
            System.out.println("��������ʧ�ܣ�");
		}
		return i;
	}
	public void closed(){
		try{
			if(rs!=null){
			    rs.close();
		    }
		    if(stm!=null){
			    stm.close();
		    }
		    if(con!=null){
			    con.close();
		    }
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println("�ر����ݿ�ʧ�ܣ�");
		}
	}
}
