package com.bitcamp.home.data;

import java.util.List;

public interface DataDAOImpl {
	//글 올리기
	public int dataInsert(DataVO vo);
	//글 선택 -- 글 내용보기, 글수정
	public void dataSelect(DataVO vo);
	//글 수정
	public int dataUpdate(DataVO vo, List<String> newFile);
	//글 삭제
	public int dataDelete(DataVO vo);
	//글 목록
	public List<DataVO> dataSelectAll();
	//조회수 증가
	public void hitCount(int no);
	//다운로드 횟수 증가
	public int downloadCount(int no);
	
	
}
