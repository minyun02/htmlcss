package com.bitcamp.home.board;

import java.util.ArrayList;
import java.util.List;

import com.bitcamp.home.DBCPConn;

public class BoardDAO extends DBCPConn {
	public int totalRecord(PageVO vo) {
		int totalRecord = 0;
		try {
			getConn();
			sql = "select count(no) from board";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalRecord = rs.getInt(1);
			}
		}catch(Exception e) {
			System.out.println("총 레코드수 불러오기 에러------>"+e.getMessage());
			e.printStackTrace();
		}finally {
			getClose();
		}
		return totalRecord;
	}

	public List<BoardVO> onePageRecordSelect(PageVO pVO) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		try {
			getConn();
			sql = "select * from "
					+ " ( select * from "
					+ " ( select no, subject, userid, hit, to_char(writedate, 'YYYY.MM.DD') writedate from board order by no desc) "
					+ " where rownum<=? order by no ) "
					+ " where rownum<=? order by no desc";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pVO.getNowPageNum()*pVO.getOnePageRecord());
			if(pVO.getNowPageNum() == pVO.getTotalPage()) { //현재 페이자가 총 페이지랑 같으면 마지막페이지이다.
				pstmt.setInt(2, pVO.getLastPageRecord()); //마지막페이지일때
			}else {
				pstmt.setInt(2, pVO.getOnePageRecord()); //마지막페이지가 아닐때
			}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new BoardVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5)));
			}
		}catch(Exception e) {
			System.out.println("레코드 불러오기 에러 발생0------->"+e.getMessage());
			e.printStackTrace();
		}finally {
			getClose();
		}
		return list;
	}
}
