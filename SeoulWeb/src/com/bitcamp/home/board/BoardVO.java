package com.bitcamp.home.board;

public class BoardVO {
	private int no;
	private String subject;
	private String userid;
	private String writedate;
	private int hit;
	
	public BoardVO() {}
	
	public BoardVO(int no, String subject, String userid, int hit, String writedate) {
		this.no=no;
		this.subject=subject;
		this.userid=userid;
		this.hit=hit;
		this.writedate=writedate;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
}
