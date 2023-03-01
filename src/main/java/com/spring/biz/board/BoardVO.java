package com.spring.biz.board;

import java.util.Date;

public class BoardVO {
	private int bNum;//글번호(pk)
	private int mNum;//작성자(fk)
	private String bTitle;//제목
	private String bContent;//내용
	private String bRate;//실력
	private int bCnt;//모집인원
	private Date bDate;//모임일자
	private Date bWdate;//작성일자
	private Date bCdate;//수정일자
	private String bStatus;//기본/신고 상태
	private String bLatitude;//위도
	private String bLongitude;//경도
	private String bLocal;//지역
	private String bAddress;//주소
	private String bAction;//모집완료,모집중,지난모임
	private String aSerchDate;//메인 페이지에서 날짜 선택시 보여주게 하는 JAVA 저장 객체
	private String bSerchDate;//메인 페이지에서 날짜 선택시 보여주게 하는 JAVA 저장 객체
	private String searchTitle;//헤더에서 제목 검색시 보여주게 하는 JAVA 저장 객체
	private String searchAction;// bAction에 따라 보여주게 하는 JAVA 저장 객체
	private String bMname;//JAVA 저장 객체: 작성자
	private int bMscore;//JAVA 저장 객체: 점수
	private String bMimg;//JAVA 저장 객체: 프로필 이미지
	
	
	public int getbMscore() {
		return bMscore;
	}
	public void setbMscore(int bMscore) {
		this.bMscore = bMscore;
	}
	public String getbMimg() {
		return bMimg;
	}
	public void setbMimg(String bMimg) {
		this.bMimg = bMimg;
	}
	public String getbMname() {
		return bMname;
	}
	public void setbMname(String bMname) {
		this.bMname = bMname;
	}
	public String getaSerchDate() {
		return aSerchDate;
	}
	public void setaSerchDate(String aSerchDate) {
		this.aSerchDate = aSerchDate;
	}
	public String getSearchAction() {
		return searchAction;
	}
	public void setSearchAction(String searchAction) {
		this.searchAction = searchAction;
	}
	public String getSearchTitle() {
		return searchTitle;
	}
	public void setSearchTitle(String searchTitle) {
		this.searchTitle = searchTitle;
	}
	public String getbSerchDate() {
		return bSerchDate;
	}
	public void setbSerchDate(String bSerchDate) {
		this.bSerchDate = bSerchDate;
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
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public String getbRate() {
		return bRate;
	}
	public void setbRate(String bRate) {
		this.bRate = bRate;
	}
	public int getbCnt() {
		return bCnt;
	}
	public void setbCnt(int bCnt) {
		this.bCnt = bCnt;
	}
	public Date getbDate() {
		return bDate;
	}
	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}
	public Date getbWdate() {
		return bWdate;
	}
	public void setbWdate(Date bWdate) {
		this.bWdate = bWdate;
	}
	public Date getbCdate() {
		return bCdate;
	}
	public void setbCdate(Date bCdate) {
		this.bCdate = bCdate;
	}
	public String getbStatus() {
		return bStatus;
	}
	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}
	public String getbLatitude() {
		return bLatitude;
	}
	public void setbLatitude(String bLatitude) {
		this.bLatitude = bLatitude;
	}
	public String getbLongitude() {
		return bLongitude;
	}
	public void setbLongitude(String bLongitude) {
		this.bLongitude = bLongitude;
	}
	public String getbLocal() {
		return bLocal;
	}
	public void setbLocal(String bLocal) {
		this.bLocal = bLocal;
	}
	public String getbAddress() {
		return bAddress;
	}
	public void setbAddress(String bAddress) {
		this.bAddress = bAddress;
	}
	public String getbAction() {
		return bAction;
	}
	public void setbAction(String bAction) {
		this.bAction = bAction;
	}
	@Override
	public String toString() {
		return "BoardVO [bNum=" + bNum + ", mNum=" + mNum + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bRate="
				+ bRate + ", bCnt=" + bCnt + ", bDate=" + bDate + ", bWdate=" + bWdate + ", bCdate=" + bCdate
				+ ", bStatus=" + bStatus + ", bLatitude=" + bLatitude + ", bLongitude=" + bLongitude + ", bLocal="
				+ bLocal + ", bAddress=" + bAddress + ", bAction=" + bAction + ", aSerchDate=" + aSerchDate
				+ ", bSerchDate=" + bSerchDate + ", searchTitle=" + searchTitle + ", searchAction=" + searchAction
				+ ", bMname=" + bMname + ", bMscore=" + bMscore + ", bMimg=" + bMimg + "]";
	}
	
}
