package com.spring.biz.member;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private int mNum; // 유저번호(PK)
	private String mId; // ID
	private String mPw; // PW
	private String mName; // 이름
	private String mEmail; // 이메일
	private String mTel; // 전화번호
	private String zipCode; // 우편번호
	private String userAddr; // 주소
	private String detailAddr; // 상세주소
	private int mPoint; // 포인트
	private Date mDate; // 가입일
	private String kakao; // 카카오로그인
	private int score; // 회원 점수
	private String mStatus; // 회원 상태
	private String mImg; // 프로필 이미지 file name
	private MultipartFile uploadFile; //JAVA에서만 저장용으로 사용하는 데이터 
	private String tempDate; // JAVA에서만 저장용으로 사용하는 데이터 : 가입일
	private int tempCnt; // JAVA에서만 저장용으로 사용하는 데이터 : 신규회원수
	private String findPw; // JAVA에서만 저장용으로 사용하는 데이터 : 암호화 이메일 임시 저장
	private String saveId; // JAVA에서만 저장용으로 사용하는 데이터 : 쿠키 아이디 저장 여부
	private String mode; // JAVA에서만 저장용으로 사용하는 데이터 : 회원 정보 찾기 종류

	public int getmNum() {
		return mNum;
	}

	public void setmNum(int mNum) {
		this.mNum = mNum;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPw() {
		return mPw;
	}

	public void setmPw(String mPw) {
		this.mPw = mPw;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmTel() {
		return mTel;
	}

	public void setmTel(String mTel) {
		this.mTel = mTel;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getUserAddr() {
		return userAddr;
	}

	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}

	public String getDetailAddr() {
		return detailAddr;
	}

	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}

	public int getmPoint() {
		return mPoint;
	}

	public void setmPoint(int mPoint) {
		this.mPoint = mPoint;
	}

	public Date getmDate() {
		return mDate;
	}

	public void setmDate(Date mDate) {
		this.mDate = mDate;
	}

	public String getKakao() {
		return kakao;
	}

	public void setKakao(String kakao) {
		this.kakao = kakao;
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

	public String getmImg() {
		return mImg;
	}

	public void setmImg(String mImg) {
		this.mImg = mImg;
	}

	public String getTempDate() {
		return tempDate;
	}

	public void setTempDate(String tempDate) {
		this.tempDate = tempDate;
	}

	public int getTempCnt() {
		return tempCnt;
	}

	public void setTempCnt(int tempCnt) {
		this.tempCnt = tempCnt;
	}

	public String getFindPw() {
		return findPw;
	}

	public void setFindPw(String findPw) {
		this.findPw = findPw;
	}

	public String getSaveId() {
		return saveId;
	}

	public void setSaveId(String saveId) {
		this.saveId = saveId;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	@Override
	public String toString() {
		return "MemberVO [mNum=" + mNum + ", mId=" + mId + ", mPw=" + mPw + ", mName=" + mName + ", mEmail=" + mEmail + ", mTel=" + mTel + ", zipCode=" + zipCode + ", userAddr=" + userAddr
				+ ", detailAddr=" + detailAddr + ", mPoint=" + mPoint + ", mDate=" + mDate + ", kakao=" + kakao + ", score=" + score + ", mstatus=" + mStatus + ", mImg=" + mImg + ", tempDate="
				+ tempDate + ", tempCnt=" + tempCnt + ", findPw=" + findPw + ", saveId=" + saveId + ", mode=" + mode + "]";
	}
	
	

}
