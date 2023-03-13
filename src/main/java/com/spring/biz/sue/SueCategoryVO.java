package com.spring.biz.sue;

public class SueCategoryVO {
	private int scNum; // 신고 카테고리(PK)
	private String scName; // 신고 카테고리 분류명

	public int getScNum() {
		return scNum;
	}

	public void setScNum(int scNum) {
		this.scNum = scNum;
	}

	public String getScName() {
		return scName;
	}

	public void setScName(String scName) {
		this.scName = scName;
	}

	@Override
	public String toString() {
		return "SueCategoryVO [scNum=" + scNum + ", scName=" + scName + "]";
	}

}
