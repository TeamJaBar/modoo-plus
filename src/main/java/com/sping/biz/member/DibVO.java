package member;

public class DibVO {
	private int dibNum; // 찜번호(PK)
	private int mNum; // 유저번호(FK)
	private int pNum; // 상품번호(FK)
	private int dCnt; // 수량
	private String pNumPimg; // JAVA에서만 저장용으로 사용하는 데이터 : 상품이미지
	private String pNumPname; // JAVA에서만 저장용으로 사용하는 데이터 : 상품이름
	private int pNumSelPrice; // JAVA에서만 저장용으로 사용하는 데이터 : 상품가격

	public int getDibNum() {
		return dibNum;
	}

	public void setDibNum(int dibNum) {
		this.dibNum = dibNum;
	}

	public int getmNum() {
		return mNum;
	}

	public void setmNum(int mNum) {
		this.mNum = mNum;
	}

	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
	}

	public int getdCnt() {
		return dCnt;
	}

	public void setdCnt(int dCnt) {
		this.dCnt = dCnt;
	}

	public String getpNumPimg() {
		return pNumPimg;
	}

	public void setpNumPimg(String pNumPimg) {
		this.pNumPimg = pNumPimg;
	}

	public String getpNumPname() {
		return pNumPname;
	}

	public void setpNumPname(String pNumPname) {
		this.pNumPname = pNumPname;
	}

	public int getpNumSelPrice() {
		return pNumSelPrice;
	}

	public void setpNumSelPrice(int pNumSelPrice) {
		this.pNumSelPrice = pNumSelPrice;
	}



}
