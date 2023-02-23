package com.spring.biz.product;

import java.io.Serializable;
import java.sql.Date;

public class ProductVO implements Serializable {
	// 직렬화: 자바 시스템 내부에서 사용되는 Object 또는 Data를 외부의 자바 시스템에서도 사용할 수 있도록 바이트 형태로 데이터를
	// 변환하는 기술로써, JVM의 메모리에 상주되어 있는 객체 데이터를 바이트 형태로 변환하는 기술
	private static final long serialVersionUID = 1L;
	
	private int pNum; // 상품번호(PK)
	private int cateNum; // 카테고리(FK)
	private String pName; // 상품명
	private int fixPrice; // 정가
	private int selPrice; // 판매가
	private Date rDate; // 등록일
	private String rePerson; // 게임인원
	private int reAge; // 게임연령
	private String brand; // 브랜드
	private String pImg; // 상품 사진 url
	private String infoImg; // 상품 상세정보 url
	private int productCnt; // 재고
	private int dib; // JAVA에서만 저장용으로 사용하는 데이터 : 좋아요(하트) 1: true, 0, false
	private int lowNum; // JAVA에서만 저장용으로 사용하는 데이터 : 최저 연령, 최저 가격
	private int highNum; // JAVA에서만 저장용으로 사용하는 데이터 : 최고 연령, 최고 가격
	private int filterSortyBy; // JAVA에서만 저장용으로 사용하는 데이터 : 검색필터 sortBy
	private int filterPrice; // JAVA에서만 저장용으로 사용하는 데이터 : 검색필터 price
	private int filterTags; // JAVA에서만 저장용으로 사용하는 데이터 : 검색필터 tags
	private int pageCnt; // JAVA에서만 저장용으로 사용하는 데이터 : 더보기
	private int pCnt; // JAVA에서만 저장용으로 사용하는 데이터 : 구매 수량(purchaseCnt)
	private int cateAge; // JAVA에서만 저장용으로 사용하는 데이터 : 나이별 카테고리

	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
	}

	public int getCateNum() {
		return cateNum;
	}

	public void setCateNum(int cateNum) {
		this.cateNum = cateNum;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getFixPrice() {
		return fixPrice;
	}

	public void setFixPrice(int fixPrice) {
		this.fixPrice = fixPrice;
	}

	public int getSelPrice() {
		return selPrice;
	}

	public void setSelPrice(int selPrice) {
		this.selPrice = selPrice;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public String getRePerson() {
		return rePerson;
	}

	public void setRePerson(String rePerson) {
		this.rePerson = rePerson;
	}

	public int getReAge() {
		return reAge;
	}

	public void setReAge(int reAge) {
		this.reAge = reAge;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getpImg() {
		return pImg;
	}

	public void setpImg(String pImg) {
		this.pImg = pImg;
	}

	public String getInfoImg() {
		return infoImg;
	}

	public void setInfoImg(String infoImg) {
		this.infoImg = infoImg;
	}

	public int getProductCnt() {
		return productCnt;
	}

	public void setProductCnt(int productCnt) {
		this.productCnt = productCnt;
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

	public int getFilterSortBy() {
		return filterSortyBy;
	}

	public void setFilterSortBy(int filterSortBy) {
		this.filterSortyBy = filterSortBy;
	}

	public int getFilterPrice() {
		return filterPrice;
	}

	public void setFilterPrice(int filterPrice) {
		this.filterPrice = filterPrice;
	}

	public int getFilterTags() {
		return filterTags;
	}

	public void setFilterTags(int filterTags) {
		this.filterTags = filterTags;
	}

	public int getDib() {
		return dib;
	}

	public void setDib(int dib) {
		this.dib = dib;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public int getpCnt() {
		return pCnt;
	}

	public void setpCnt(int pCnt) {
		this.pCnt = pCnt;
	}

	public int getCateAge() {
		return cateAge;
	}

	public void setCateAge(int cateAge) {
		this.cateAge = cateAge;
	}

	@Override
	public String toString() {
		return "ProductVO [pNum=" + pNum + ", cateNum=" + cateNum + ", pName=" + pName + ", fixPrice=" + fixPrice + ", selPrice=" + selPrice + ", rDate=" + rDate + ", rePerson=" + rePerson
				+ ", reAge=" + reAge + ", brand=" + brand + ", pImg=" + pImg + ", infoImg=" + infoImg + ", productCnt=" + productCnt + ", dib=" + dib + ", lowNum=" + lowNum + ", highNum=" + highNum
				+ ", FilterSortBy=" + filterSortyBy + ", filterPrice=" + filterPrice + ", filterTags=" + filterTags + ", pageCnt=" + pageCnt + ", pCnt=" + pCnt + "]";
	}

}
