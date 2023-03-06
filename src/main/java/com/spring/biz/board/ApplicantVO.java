package com.spring.biz.board;

public class ApplicantVO {
	private int aNum; //PK
	private int bNum; 
	private int mNum;
	private String achk;
	//JAVA에서만 저장용으로 사용되는 데이터
	private String mId; //아이디
	private String mName; //이름
	private String mImg; //프로필 사진
	private int score; //점수
	
	public int getaNum() {
		return aNum;
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
	public String getAchk() {
		return achk;
	}
	public void setAchk(String achk) {
		this.achk = achk;
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
	public void setaNum(int aNum) {
		this.aNum = aNum;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}


	
	
	}

