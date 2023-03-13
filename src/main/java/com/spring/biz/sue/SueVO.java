package com.spring.biz.sue;

import java.sql.Date;

public class SueVO {
	private int sNum; // 신고번호(PK)
	private int bNum;//보드 (FK)
	private int mNum;//멤버 (FK)
	private int scNum;//신고 카테고리(FK)
	private Date sDate;//신고 일자
	private String sResult;//신고 처리 결과
	// JAVA에서만 저장용으로 사용되는 데이터
	private String bTitle; // 제목
	private String mName; // 이름
	private String mImg; // 프로필 사진
	private String bwDate; // 작성일자
	private String bStatus; // 신고처리
	private String bContent; // 내용
	private String sCname;// 신고 카테고리 분류명
	private int nCnt; //전체 신고글 갯수
	private int cCnt; //처리 신고글 갯수
	private int aCnt; //미처리 신고글 갯수
	

	public int getsNum() {
		return sNum;
	}

	public void setsNum(int sNum) {
		this.sNum = sNum;
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

	public int getScNum() {
		return scNum;
	}

	public void setScNum(int scNum) {
		this.scNum = scNum;
	}

	public Date getsDate() {
		return sDate;
	}

	public void setsDate(Date sDate) {
		this.sDate = sDate;
	}

	public String getsResult() {
		return sResult;
	}

	public void setsResult(String sResult) {
		this.sResult = sResult;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmImg() {
		return mImg;
	}

	public void setmImg(String mImg) {
		this.mImg = mImg;
	}

	public String getBwDate() {
		return bwDate;
	}

	public void setBwDate(String bwDate) {
		this.bwDate = bwDate;
	}

	public String getbStatus() {
		return bStatus;
	}

	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getsCname() {
		return sCname;
	}

	public void setsCname(String sCname) {
		this.sCname = sCname;
	}

	public int getnCnt() {
		return nCnt;
	}

	public void setnCnt(int nCnt) {
		this.nCnt = nCnt;
	}

	public int getcCnt() {
		return cCnt;
	}

	public void setcCnt(int cCnt) {
		this.cCnt = cCnt;
	}

	public int getaCnt() {
		return aCnt;
	}

	public void setaCnt(int aCnt) {
		this.aCnt = aCnt;
	}


}
