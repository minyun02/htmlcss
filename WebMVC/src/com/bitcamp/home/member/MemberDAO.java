package com.bitcamp.home.member;

import com.bitcamp.home.DBCPConn;

public class MemberDAO extends DBCPConn {
	//아이디 중복검사
	public boolean idCheck(String userid) {
		boolean result = false; // true : 아이다가 있다(중복), false: 아이디가 없다(사용가능)
		try {
			sql = "select userid from register where userid=?";
			
			getConn();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			getClose();
		}
		return result;
	}
}
