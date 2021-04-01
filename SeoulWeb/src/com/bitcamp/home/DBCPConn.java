package com.bitcamp.home;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class DBCPConn {
	protected Connection con = null; //protected로해서 다른 폴더에서 상속을 받아도 사용가능하게
	protected PreparedStatement pstmt = null;
	protected ResultSet rs = null;
	protected String sql = null;
	//DB연결
	public void getConn() {
		try {
			Context ctx = new InitialContext();
			Context envCtx = (Context)ctx.lookup("java:comp/env");
			
			DataSource ds = (DataSource)envCtx.lookup("jdbc/myoracle"); //지역변수로 존재해서 닫을 필요 없다. getConn메소드가 끝나면 없어지니까
			con = ds.getConnection();
		}catch(Exception e) {
			System.out.println("DBCP연결 에러 발생--->"+e.getMessage());
		}
	}
	//DB닫기
	public void getClose() {
		try {
			sql = null;
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		}catch(Exception e) {
			System.out.println("DB닫기 에러발샐---?"+e.getMessage());
		}
	}
	
}
