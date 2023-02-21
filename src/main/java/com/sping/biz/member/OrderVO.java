package com.sping.biz.member;

import java.util.Date;

public class OrderVO {
	private int oNum; // 주문번호(PK)
	private int mNum; // 유저번호(FK)
	private String oShipName; // 배송정보: 받으실분
	private String oZipCode; // 배송정보: 우편번호
	private String oUserAddr; // 배송정보: 주소
	private String oDetailAddr; // 배송정보: 상세주소
	private String oTel; // 배송정보: 휴대폰 번호
	private Date oDate; // 주문 날짜
	private int oStatus; // 주문상태
	private int oPoint; // 적립금 사용
	private String tempDate; // JAVA에서만 저장용으로 사용하는 데이터 : 날짜
	private int tempCnt; // JAVA에서만 저장용으로 사용하는 데이터 : 주문(상태/일자)별 개수
	private String pNumPimg; // JAVA에서만 저장용으로 사용하는 데이터 : 이미지
	private int pNumcnt; // JAVA에서만 저장용으로 사용하는 데이터 : 수량
	private int pNumSelPrice; // JAVA에서만 저장용으로 사용하는 데이터 : 상품가격
	private int mNummpoint; // JAVA에서만 저장용으로 사용하는 데이터 : 적립금
	private int pNumdcharge; // JAVA에서만 저장용으로 사용하는 데이터 : 배송비
	private String pNumPname; // JAVA에서만 저장용으로 사용하는 데이터 : 상품이름
	private int searchCal; // JAVA에서만 저장용으로 사용하는 데이터 : 날짜검색

	public int getoNum() {
		return oNum;
	}

	public void setoNum(int oNum) {
		this.oNum = oNum;
	}

	public int getmNum() {
		return mNum;
	}

	public void setmNum(int mNum) {
		this.mNum = mNum;
	}

	public Date getoDate() {
		return oDate;
	}

	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}

	public int getoStatus() {
		return oStatus;
	}

	public void setoStatus(int oStatus) {
		this.oStatus = oStatus;
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

	public String getpNumPimg() {
		return pNumPimg;
	}

	public void setpNumPimg(String pNumPimg) {
		this.pNumPimg = pNumPimg;
	}

	public int getpNumcnt() {
		return pNumcnt;
	}

	public void setpNumcnt(int pNumcnt) {
		this.pNumcnt = pNumcnt;
	}

	public int getpNumSelPrice() {
		return pNumSelPrice;
	}

	public void setpNumSelPrice(int pNumSelPrice) {
		this.pNumSelPrice = pNumSelPrice;
	}

	public int getmNummpoint() {
		return mNummpoint;
	}

	public void setmNummpoint(int mNummpoint) {
		this.mNummpoint = mNummpoint;
	}

	public int getpNumdcharge() {
		return pNumdcharge;
	}

	public void setpNumdcharge(int pNumdcharge) {
		this.pNumdcharge = pNumdcharge;
	}

	public String getpNumPname() {
		return pNumPname;
	}

	public void setpNumPname(String pNumPname) {
		this.pNumPname = pNumPname;
	}

	public int getSearchCal() {
		return searchCal;
	}

	public void setSearchCal(int searchCal) {
		this.searchCal = searchCal;
	}

	public String getoShipName() {
		return oShipName;
	}

	public void setoShipName(String oShipName) {
		this.oShipName = oShipName;
	}

	public String getoZipCode() {
		return oZipCode;
	}

	public void setoZipCode(String oZipCode) {
		this.oZipCode = oZipCode;
	}

	public String getoUserAddr() {
		return oUserAddr;
	}

	public void setoUserAddr(String oUserAddr) {
		this.oUserAddr = oUserAddr;
	}

	public String getoDetailAddr() {
		return oDetailAddr;
	}

	public void setoDetailAddr(String oDetailAddr) {
		this.oDetailAddr = oDetailAddr;
	}

	public String getoTel() {
		return oTel;
	}

	public void setoTel(String oTel) {
		this.oTel = oTel;
	}

	public int getoPoint() {
		return oPoint;
	}

	public void setoPoint(int oPoint) {
		this.oPoint = oPoint;
	}

}