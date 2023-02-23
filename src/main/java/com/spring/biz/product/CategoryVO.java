package com.spring.biz.product;

public class CategoryVO {
	private int cateNum; // 카테고리번호(PK)
	private String cateL; // 대분류
	private String cateM; // 중분류
	private int lowNum; // JAVA에서만 저장용으로 사용하는 데이터 : 최저 카테고리번호
	private int highNum; // JAVA에서만 저장용으로 사용하는 데이터 : 최고 카테고리번호

	public int getCateNum() {
		return cateNum;
	}

	public void setCateNum(int cateNum) {
		this.cateNum = cateNum;
	}

	public String getCateL() {
		return cateL;
	}

	public void setCateL(String cateL) {
		this.cateL = cateL;
	}

	public String getCateM() {
		return cateM;
	}

	public void setCateM(String cateM) {
		this.cateM = cateM;
	}

	public int getLowNum() {
		return lowNum;
	}

	public void setLowNum(int lowNum) {
		this.lowNum = lowNum;
	}

	public int getHighNum() {
		return highNum;
	}

	public void setHighNum(int highNum) {
		this.highNum = highNum;
	}

	@Override
	public String toString() {
		return "CategoryVO [cateNum=" + cateNum + ", cateL=" + cateL + ", cateM=" + cateM + ", lowNum=" + lowNum + ", highNum=" + highNum + "]";
	}
	
}
