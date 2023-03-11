package com.spring.biz.sue;

public class SueCategoryVO {
	private int scNum;//신고 카테고리(PK)
	private String sCname;// 신고 카테고리 분류명
	public int getScNum() {
		return scNum;
	}
	public void setScNum(int scNum) {
		this.scNum = scNum;
	}
	public String getsCname() {
		return sCname;
	}
	public void setsCname(String sCname) {
		this.sCname = sCname;
	}
	@Override
	public String toString() {
		return "SueCategoryVO [scNum=" + scNum + ", sCname=" + sCname + "]";
	}
	
	
}
