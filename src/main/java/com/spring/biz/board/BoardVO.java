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
	private Date sSearchDate;//메인 페이지에서 날짜 선택시 보여주게 하는 JAVA 저장 객체
	private Date eSearchDate;//메인 페이지에서 날짜 선택시 보여주게 하는 JAVA 저장 객체
	private String searchContent;//헤더에서 제목 검색시 보여주게 하는 JAVA 저장 객체
	private String bMname;//JAVA 저장 객체: 작성자
	private int bMscore;//JAVA 저장 객체: 점수
	private String bMimg;//JAVA 저장 객체: 프로필 이미지
	private int aCnt; //JAVA 저장 객체 : 신청자 수
	private int sortBy; //JAVA 저장 객체 : 정렬 기준 - bDate(1) or bWdate(2)
	private int aNum; //JAVA 저장 객체 : applicant 테이블 PK
	private String aChk; //JAVA 저장 객체 : 평가 확인 여부
	private int pageNum;
	private int amount;
	private int sue; //JAVA 저장 객체 : 신고여부
	
	
	
	public int getSue() {
		return sue;
	}
	public void setSue(int sue) {
		this.sue = sue;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getaChk() {
		return aChk;
	}
	public void setaChk(String aChk) {
		this.aChk = aChk;
	}
	public int getaNum() {
		return aNum;
	}
	public void setaNum(int aNum) {
		this.aNum = aNum;
	}
	public Date getsSearchDate() {
		return sSearchDate;
	}
	public void setsSearchDate(Date sSearchDate) {
		this.sSearchDate = sSearchDate;
	}
	public Date geteSearchDate() {
		return eSearchDate;
	}
	public void seteSearchDate(Date eSearchDate) {
		this.eSearchDate = eSearchDate;
	}
	public String getSearchContent() {
		return searchContent;
	}
	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}
	public int getSortBy() {
		return sortBy;
	}
	public void setSortBy(int sortBy) {
		this.sortBy = sortBy;
	}
	public int getaCnt() {
		return aCnt;
	}
	public void setaCnt(int aCnt) {
		this.aCnt = aCnt;
	}
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
				+ bLocal + ", bAddress=" + bAddress + ", bAction=" + bAction + ", aSerchDate=" + sSearchDate
				+ ", bSerchDate=" + eSearchDate + ", searchContent=" + searchContent + ", bMname=" + bMname
				+ ", bMscore=" + bMscore + ", bMimg=" + bMimg + ", aCnt=" + aCnt + ", sortBy=" + sortBy + "]";
	}
	
	
}
