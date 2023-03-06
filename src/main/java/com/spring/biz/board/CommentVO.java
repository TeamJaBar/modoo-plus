package com.spring.biz.board;

import java.util.Date;

public class CommentVO {
	private int cNum;//댓글 pk
	private int bNum;//보드 fk
	private int mNum;//멤버 fk
	private String cContent;//댓글 내용
	private Date cWdate;//작성 일자
	private Date cCdate;//수정 일자
	private String mId;//JAVA 저장 객체: 작성자 아이디
	
	
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public int getmNum() {
		return mNum;
	}
	public void setmNum(int mNum) {
		this.mNum = mNum;
	}
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	public Date getcWdate() {
		return cWdate;
	}
	public void setcWdate(Date cWdate) {
		this.cWdate = cWdate;
	}
	public Date getcCdate() {
		return cCdate;
	}
	public void setcCdate(Date cCdate) {
		this.cCdate = cCdate;
	}
	
	
}
