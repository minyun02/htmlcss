package com.bitcamp.home.board;

public class PageVO {
	private int nowPageNum = 1;
	private int onePageNum = 5;
	private int onePageRecord = 5;
	
	private int totalRecord;
	private int totalPage;
	private int startPageNum = 1;
	
	private int lastPageRecord = 5;
	
	
	
	public int getNowPageNum() {
		return nowPageNum;
	}

	public void setNowPageNum(int nowPageNum) {
		this.nowPageNum = nowPageNum;
		
		//시작페이지 번호를 계산한다.
		startPageNum = (nowPageNum-1)/onePageNum*onePageNum+1;
		System.out.println("시작페이지는===>"+startPageNum);
	}

	public int getOnePageNum() {
		return onePageNum;
	}

	public void setOnePageNum(int onePageNum) {
		this.onePageNum = onePageNum;
	}

	public int getOnePageRecord() {
		return onePageRecord;
	}

	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		//레코드수를 이용해서 총 페이지를 계산한다.
		totalPage = (int)Math.ceil(totalRecord/(double)onePageRecord);
		
		//마지막페이지 레코드 수를 계산
		if(totalRecord%onePageRecord==0) {
			lastPageRecord = onePageRecord;
		}else {
			lastPageRecord = totalRecord%onePageRecord;
		}
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartPageNum() {
		return startPageNum;
	}

	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}

	public int getLastPageRecord() {
		return lastPageRecord;
	}

	public void setLastPageRecord(int lastPageRecord) {
		this.lastPageRecord = lastPageRecord;
	}
}
