package com.spring.biz.sue;

import java.util.Date;

public class SueVO {
	private int sNum; // 신고번호(PK)
	private int bNum; // 보드 (FK)
	private int mNum; // 멤버 (FK) - 신고한 사람
	private int scNum; // 신고 카테고리(FK)
	private Date sDate; // 신고 일자
	private String sResult; // 신고 처리 결과
	private Date srDate;// 신고처리 일자
	// JAVA에서만 저장용으로 사용되는 데이터
	private String bTitle; // 제목
	private String mId; // 신고한 사람 아이디
	private String mName; // 이름
	private String mImg; // 프로필 사진
	private Date bWdate; // 작성일자
	private String bStatus; // 신고처리
	private String bContent; // 내용
	private String scName; // 신고 카테고리 분류명
	private String mStatus; // 상태(기본/정지)
	private String smId;// 신고 당한 사람의 ID
	private int smNum;// 신고 당한 사람
	private int aCnt; // 전체 신고글 갯수
	private int nCnt; // 미처리 신고글 갯수
	private int cCnt; // 처리 신고글 갯수
	private int pageNum;
	private int amount;
	private int score;



	public String getSmId() {
		return smId;
	}

	public void setSmId(String smId) {
		this.smId = smId;
	}

	public int getSmNum() {
		return smNum;
	}

	public void setSmNum(int smNum) {
		this.smNum = smNum;
	}

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

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
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

	public Date getbWdate() {
		return bWdate;
	}

	public void setbWdate(Date bWdate) {
		this.bWdate = bWdate;
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

	public String getScName() {
		return scName;
	}

	public void setScName(String scName) {
		this.scName = scName;
	}

	public int getaCnt() {
		return aCnt;
	}

	public void setaCnt(int aCnt) {
		this.aCnt = aCnt;
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

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	public Date getSrDate() {
		return srDate;
	}

	public void setSrDate(Date srDate) {
		this.srDate = srDate;
	}


}
