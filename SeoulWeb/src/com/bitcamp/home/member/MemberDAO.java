package com.bitcamp.home.member;

import com.bitcamp.home.DBCPConn;

public class MemberDAO extends DBCPConn {
	//로그인
	public void loginCheck(MemberVO vo) {
		try {
			getConn();
			sql = "select username from register where userid=? and userpwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getUserid());
			pstmt.setString(2, vo.getUserpwd());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setUsername(rs.getString(1));
			}
		}catch(Exception e){
			System.out.println("로그인 에러발생"+e.getMessage());
			e.printStackTrace();
		}finally {
			getClose();
		}
	}
}
