package com.bitcamp.board;

import com.bitcamp.library.DBConnection;

public class BoardDAO extends DBConnection {
	//게시판 글 등록 메소드
	public int insertBoard(BoardVO vo) {
		int result = 0;
		try {
			connection(); //DB 연결
			
			sql = "insert into board(no, subject, content, userid, hit, writedate, ip) "
					+ " values(boardsq.nextval, ?, ?, ?, 0, sysdate, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getSubject());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getUserid());
			pstmt.setString(4, vo.getIp());
			
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("게시판 글 등록 에러....->"+e.getMessage());
		}finally {
			closeDB();
		}
		return result;
	}
}
