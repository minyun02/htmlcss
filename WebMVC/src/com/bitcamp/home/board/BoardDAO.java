package com.bitcamp.home.board;

import java.util.ArrayList;
import java.util.List;

import com.bitcamp.home.DBCPConn;


// BoardDAOImpl.java
public class BoardDAO extends DBCPConn implements BoardDAOService {

	@Override
	public int oneRecordInsert(BoardVO vo) {

		return 0;
	}

	@Override
	public void oneRecordSelect(BoardVO vo) {

		
	}

	@Override
	public int boardDelete(int no, String userid) {

		return 0;
	}

	@Override
	public void hitCount(int no) {

		
	}

	@Override
	public int totalRecord(PageSearchVO vo) {
		int totalRecord=0;
		try {
			getConn();
			sql = "select count(no) from board";
			if(vo.getSearchWord()!=null) {//검색어 있을때
				sql += " where " + vo.getSearchKey() + " like ?";
			}
			pstmt = con.prepareStatement(sql);
			if(vo.getSearchWord() != null) {
				pstmt.setString(1, "%"+vo.getSearchWord()+"%");
			}
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalRecord = rs.getInt(1);
			}
			
		}catch(Exception e) {
			System.out.println("총 레코드수 구하기 에러 발생---->"+e.getMessage());
			e.printStackTrace();
		}finally {
			getClose();
		}
		return totalRecord;
	}

	@Override
	public int boardUpdate(BoardVO vo) {

		return 0;
	}

	@Override
	public List<BoardVO> onePageRecordSelect(PageSearchVO vo) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		try {
			getConn();
			sql = "select * from "
					+ "( select * from "
					+ "( select no, subject, userid, hit, to_char(writedate, 'MM-DD HH:MI') writedate from board ";
					//검색어가 있을때
					if(vo.getSearchWord()!=null) {
						sql += " where "+vo.getSearchKey()+" like ? ";
					}
					sql += " order by no desc ) "
					+ " where rownum<=? order by no ) "
					+ " where rownum<=? order by no desc";
			
			pstmt = con.prepareStatement(sql);
			
			if(vo.getSearchWord()==null) {//검색어가 없을때
				pstmt.setInt(1, vo.getPageNum()*vo.getOnePageRecord()); //2*5
				if(vo.getPageNum() == vo.getTotalPage()) {//현재페이지가 총 페이지랑 같을 때 = 마지막페이지
					pstmt.setInt(2, vo.getLastPageRecord()); //마지막 페이지면
				}else {
					pstmt.setInt(2, vo.getOnePageRecord()); // 마지막 페이지가 아니면
				}
			}else {//검색어가 있을때
				pstmt.setString(1, "%"+vo.getSearchWord()+"%");
				pstmt.setInt(2, vo.getPageNum()*vo.getOnePageRecord());
				if(vo.getPageNum() == vo.getTotalPage()) {//현재페이지가 총 페이지랑 같을 때 = 마지막페이지
					pstmt.setInt(3, vo.getLastPageRecord()); //마지막 페이지면
				}else {
					pstmt.setInt(3, vo.getOnePageRecord()); // 마지막 페이지가 아니면
				}
			}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new BoardVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(5), rs.getInt(4)));
			}
			
		}catch(Exception e) {
			System.out.println("한페이지 레코드 선택 에러 발생 ----->"+e.getMessage());
			e.printStackTrace();
		}finally {
			getClose();
		}
		return list;
	}

}
