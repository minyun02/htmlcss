package com.bitcamp.home.member;

import java.util.ArrayList;
import java.util.List;

import com.bitcamp.home.DBCPConn;

public class MemberDAO extends DBCPConn {
	public MemberDAO() {}
	public static MemberDAO getInstance() {//다른곳에서 memberDAO 객체를 생성하지않고 바로 메소드를 쓸수있게 해주는 메소드(calendar같이)
		return new MemberDAO();
	}
	
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
	//우편번호 검색
	public List<ZipCodeVO> zipcodeSearchSelect(String doro){
		List<ZipCodeVO> zipList = new ArrayList<ZipCodeVO>();
		try {
			getConn();
			sql = "select zipcode, sido, sigungu, um, doro, build1, build2, sibuild, dong, "
					+ "leename, gibun1, gibun2 from zipcode where doro like ? order by zipcode";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+doro+"%");
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ZipCodeVO vo = new ZipCodeVO();
				vo.setZipcode(rs.getString(1));
				vo.setSido(rs.getString(2));
				vo.setSigungu(rs.getString(3));
				vo.setUm(rs.getString(4));
				vo.setDoro(rs.getString(5));
				vo.setBuild1(rs.getInt(6));
				vo.setBuild2(rs.getInt(7));
				vo.setSibuild(rs.getString(8));
				vo.setDong(rs.getString(9));
				vo.setLeename(rs.getString(10));
				vo.setGibun1(rs.getInt(11));
				vo.setGibun2(rs.getInt(12));
				zipList.add(vo); //다음 반복문으로 넘어가기전에 컬렉션에 넣어준다
				System.out.println();
			}
					
		}catch(Exception e) {
			System.out.println("우편번호 검색 에러발생(DAO)--->"+e.getMessage());
			e.printStackTrace();
		}finally {
			getClose();
		}
		return zipList;
	}
}




