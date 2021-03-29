package com.bitcamp.home.board;

import java.util.List;

public interface BoardDAOService {
	// 1. 레코드 추가 - 글쓰기(insert)
	public int oneRecordInsert(BoardVO vo);
	
	// 2. 레코드 선택 (1개) - 글내용보기, 글수정폼(select)
	//public BoardVO 			글번호랑 아이디가 필요
	public void oneRecordSelect(BoardVO vo);
	
	// 3. 레코드 삭제 - 글 삭제
	//public int boardDelete(BoardVO vo); 
	public int boardDelete(int no, String userid);
	
	// 4. 조회수 증가
	public void hitCount(int no);
	
	// 5. 총 레코드 수
	public int totalRecord(PageSearchVO vo);
	
	// 6. 레코드 수정 - update
	public int boardUpdate(BoardVO vo);
	
	// 7. 한 페이지 레코드 선택
	public List<BoardVO> onePageRecordSelect(PageSearchVO vo);
}
