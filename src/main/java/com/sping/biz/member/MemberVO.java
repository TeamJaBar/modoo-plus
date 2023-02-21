package member;

import java.sql.Date;

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
	private String tempDate; // JAVA에서만 저장용으로 사용하는 데이터 : 가입일
	private int tempCnt; // JAVA에서만 저장용으로 사용하는 데이터 : 신규회원수
	private String findPw; // JAVA에서만 저장용으로 사용하는 데이터 : 암호화 이메일 임시 저장

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

	public int getmPoint() {
		return mPoint;
	}

	public void setmPoint(int mPoint) {
		this.mPoint = mPoint;
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

	public Date getmDate() {
		return mDate;
	}

	public void setmDate(Date mDate) {
		this.mDate = mDate;
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

	public String getKakao() {
		return kakao;
	}

	public void setKakao(String kakao) {
		this.kakao = kakao;
	}

}
