package com.spring.biz.sue;

import java.sql.Date;

public class SueVO {
	private int sNum; //신고번호(PK)
	private int bNum; 
	private int mNum;
	private int scNum;
	private Date sDate;
	private String sResult;
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
	
	
	

	

}
