package com.bitcamp.library;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConnection {
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		}catch(Exception e) {
			System.out.println("드라이브로딩 에러...-->"+e.getMessage());
		}
	}
	//상속받아서만 사용하게끔 접속제한자를 걸었다.
	protected Connection conn = null;
	protected PreparedStatement pstmt = null;
	protected ResultSet rs = null;
	protected String sql = null;
	protected String url = "jdbc:oracle:thin:@localhost:1521:xe";
	//DB연결
	public void connection() {
		try {
			conn = DriverManager.getConnection(url, "c##scott", "tiger");
		}catch(Exception e) {
			System.out.println("데이터베이스 연결에러 발생-->"+e.getMessage());
		}
	}
	//DB닫기
	public void closeDB() {
		try {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null) conn.close();
		}catch(Exception e) {
			System.out.println("데이터베이스 닫기 에러 발생 -->"+e.getMessage());
		}
	}
}
