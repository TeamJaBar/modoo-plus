package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCUtil;

public class ProductDAO {
	ArrayList<ProductVO> product;
	ArrayList<CategoryVO> category;
	Connection conn;
	PreparedStatement pstmt;

	// C : Product
	final String INSERT = "INSERT INTO PRODUCT VALUES(PNUM_SEQ.NEXTVAL, ?, ?, ?, ?, SYSDATE, ?, ?, ?, ?, ?, ?)";
	// R : Product
	final String SELECTONE = "SELECT DIB, PNUM, CATENUM, PNAME, FIXPRICE, SELPRICE, RDATE, REPERSON, REAGE, BRAND, PIMG, INFOIMG, PRODUCTCNT FROM (SELECT DECODE(D.MNUM, ?, 1, 0) DIB, P.* FROM PRODUCT P LEFT OUTER JOIN DIB D ON P.PNUM = D.PNUM) WHERE PNUM=?";
	final String SELECTONE_CART = "SELECT PNUM, CATENUM, PNAME, FIXPRICE, SELPRICE, BRAND, PIMG FROM PRODUCT WHERE PNUM=?";
	final String SELECTALL_NEW = "SELECT * FROM (SELECT DIB, PNUM, CATENUM, PNAME, FIXPRICE, SELPRICE, RDATE, REPERSON, REAGE, BRAND, PIMG "
			+ "FROM (SELECT DECODE(D.MNUM, ?, 1, 0) DIB, P.* FROM PRODUCT P LEFT OUTER JOIN DIB D ON P.PNUM = D.PNUM) ORDER BY RDATE DESC) WHERE ROWNUM<?";
	final String SELECTALL_BEST = "SELECT * FROM (SELECT DECODE(D.MNUM, ?, 1, 0) DIB, P.PNUM, P.CATENUM, P.PNAME, P.FIXPRICE, P.SELPRICE, P.RDATE, P.REPERSON, P.REAGE, P.BRAND, P.PIMG, P.PRODUCTCNT, DECODE(O.CNT, NULL, 0, O.CNT) OCNT FROM PRODUCT P LEFT OUTER JOIN DIB D ON P.PNUM = D.PNUM FULL JOIN (SELECT PNUM, SUM(CNT) CNT FROM ORDERDETAIL GROUP BY PNUM) O ON P.PNUM=O.PNUM ORDER BY OCNT DESC) WHERE ROWNUM<?";
	final String SELECTALL_CATEALL = "SELECT * FROM (SELECT DIB, PNUM, CATENUM, PNAME, FIXPRICE, SELPRICE, RDATE, REPERSON, REAGE, BRAND, PIMG "
			+ "FROM (SELECT DECODE(D.MNUM, ?, 1, 0) DIB, P.* FROM PRODUCT P LEFT OUTER JOIN DIB D ON P.PNUM = D.PNUM) WHERE CATENUM BETWEEN ? AND ? ORDER BY RDATE DESC) WHERE ROWNUM<?";
	final String SELECTALL_CATE = "SELECT * FROM (SELECT DIB, PNUM, CATENUM, PNAME, FIXPRICE, SELPRICE, RDATE, REPERSON, REAGE, BRAND, PIMG "
			+ "FROM (SELECT DECODE(D.MNUM, ?, 1, 0) DIB, P.* FROM PRODUCT P LEFT OUTER JOIN DIB D ON P.PNUM = D.PNUM) WHERE CATENUM=? ORDER BY RDATE DESC) WHERE ROWNUM<?";
	final String SELECTALL_AGE = "SELECT DIB, PNUM, CATENUM, PNAME, FIXPRICE, SELPRICE, RDATE, REPERSON, REAGE, BRAND, PIMG, "
			+ "CASE WHEN REAGE BETWEEN 0 AND 3 THEN 1 WHEN REAGE BETWEEN 4 AND 6 THEN 2 WHEN REAGE BETWEEN 7 AND 10 THEN 3 WHEN REAGE BETWEEN 11 AND 13 THEN 4 WHEN REAGE >= 14 THEN 5 END AS CATEAGE "
			+ "FROM (SELECT DECODE(D.MNUM, ?, 1, 0) DIB, P.* FROM PRODUCT P LEFT OUTER JOIN DIB D ON P.PNUM = D.PNUM) WHERE ROWNUM<?";
	final String SELECTALL = "SELECT DIB, PNUM, CATENUM, PNAME, FIXPRICE, SELPRICE, RDATE, REPERSON, REAGE, BRAND, PIMG, INFOIMG, PRODUCTCNT "
			+ "FROM (SELECT DECODE(D.MNUM, ?, 1, 0) DIB, P.* FROM PRODUCT P LEFT OUTER JOIN DIB D ON P.PNUM = D.PNUM)";
	// R : Category
	final String SELECTONE_CATE = "SELECT TRUNC(CATENUM, -2) AS CATENUM, CATEL, CATEM FROM CATEGORY WHERE CATENUM=?";
	final String SELECTALL_LCATE = "SELECT DISTINCT CATEL, DECODE(MOD(CATENUM, 100) , 0 , CATENUM , CATENUM-MOD(CATENUM, 100)) CATENUM FROM CATEGORY WHERE CATENUM BETWEEN ? AND ?";
	final String SELECTALL_MCATENAME = "SELECT CATEL, CATEM, CATENUM FROM CATEGORY WHERE CATEL=?";
	final String SELECTALL_MCATENUM = "SELECT CATENUM, CATEL, CATEM FROM CATEGORY WHERE CATENUM BETWEEN ? AND (?+99)";
	// U : Product
	final String UPDATE = "UPDATE PRODUCT SET CATENUM=?, PNAME=?, FIXPRICE=?, SELPRICE=?, REPERSON=?, REAGE=?, BRAND=?, PRODUCTCNT=? WHERE PNUM=?";
	// D : Product
	final String DELETE = "DELETE FROM PRODUCT WHERE PNUM=?";

	public ProductDAO() {
		product = new ArrayList<ProductVO>();
	}

	public boolean insert(ProductVO pvo) {
		try {
			conn = JDBCUtil.connect();
			pstmt = conn.prepareStatement(INSERT);

			pstmt.setInt(1, pvo.getCateNum());
			pstmt.setString(2, pvo.getpName());
			pstmt.setInt(3, pvo.getFixPrice());
			pstmt.setInt(4, pvo.getSelPrice());
			pstmt.setString(5, pvo.getRePerson());
			pstmt.setInt(6, pvo.getReAge());
			pstmt.setString(7, pvo.getBrand());
			pstmt.setString(8, pvo.getpImg());
			pstmt.setString(9, pvo.getInfoImg());
			pstmt.setInt(10, pvo.getProductCnt());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		return true;
	}

	public CategoryVO selectOneCate(ProductVO pvo) {
		CategoryVO data = null;
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(SELECTONE_CATE);
			pstmt.setInt(1, pvo.getCateNum());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				data = new CategoryVO();
				data.setCateNum(rs.getInt("CATENUM"));
				data.setCateL(rs.getString("CATEL"));
				data.setCateM(rs.getString("CATEM"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(conn, pstmt);
		return data;
	}

	public ProductVO selectOne(ProductVO pvo) {
		ProductVO data = null;
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(SELECTONE);
			pstmt.setInt(1, pvo.getDib());
			pstmt.setInt(2, pvo.getpNum());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				data = new ProductVO();
				data.setDib(rs.getInt("DIB"));
				data.setpNum(rs.getInt("PNUM"));
				data.setCateNum(rs.getInt("CATENUM"));
				data.setpName(rs.getString("PNAME"));
				data.setFixPrice(rs.getInt("FIXPRICE"));
				data.setSelPrice(rs.getInt("SELPRICE"));
				data.setrDate(rs.getDate("RDATE"));
				data.setRePerson(rs.getString("REPERSON"));
				data.setReAge(rs.getInt("REAGE"));
				data.setBrand(rs.getString("BRAND"));
				data.setpImg(rs.getString("PIMG"));
				data.setInfoImg(rs.getString("INFOIMG"));
				data.setProductCnt(rs.getInt("PRODUCTCNT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(conn, pstmt);
		return data;
	}

	public ProductVO selectOneCart(ProductVO pvo) {
		ProductVO data = null;
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(SELECTONE_CART);
			pstmt.setInt(1, pvo.getpNum());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				data = new ProductVO();
				data.setpNum(rs.getInt("PNUM"));
				data.setCateNum(rs.getInt("CATENUM"));
				data.setpName(rs.getString("PNAME"));
				data.setFixPrice(rs.getInt("FIXPRICE"));
				data.setSelPrice(rs.getInt("SELPRICE"));
				data.setBrand(rs.getString("BRAND"));
				data.setpImg(rs.getString("PIMG"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(conn, pstmt);
		return data;
	}

	public ArrayList<ProductVO> selectAll(ProductVO pvo) {
		ArrayList<ProductVO> datas = new ArrayList<ProductVO>();
		conn = JDBCUtil.connect();
		int cnt = 0;
		int cntAge = 0;
		try {
			if (pvo.getCateNum() == 1000) {
				pstmt = conn.prepareStatement(SELECTALL_NEW);
				pstmt.setInt(1, pvo.getDib());
				pstmt.setInt(2, pvo.getPageCnt());
			} else if (pvo.getCateNum() == 1100) {
				pstmt = conn.prepareStatement(SELECTALL_BEST);
				pstmt.setInt(1, pvo.getDib());
				pstmt.setInt(2, pvo.getPageCnt());
			} else if (pvo.getCateNum() == 100) {
				pstmt = conn.prepareStatement(SELECTALL);
				pstmt.setInt(1, pvo.getDib());
				cnt++;
			} else if (pvo.getCateNum() > 100 && pvo.getCateNum() < 200) {
				pstmt = conn.prepareStatement(SELECTALL_AGE);
				pstmt.setInt(1, pvo.getDib());
				pstmt.setInt(2, pvo.getPageCnt());
				cntAge++;
			} else if (pvo.getCateNum() % 100 == 0) {
				pstmt = conn.prepareStatement(SELECTALL_CATEALL);
				pstmt.setInt(1, pvo.getDib());
				pstmt.setInt(2, pvo.getLowNum());
				pstmt.setInt(3, pvo.getHighNum() + 99);
				pstmt.setInt(4, pvo.getPageCnt());
			} else {
				pstmt = conn.prepareStatement(SELECTALL_CATE);
				pstmt.setInt(1, pvo.getDib());
				pstmt.setInt(2, pvo.getCateNum());
				pstmt.setInt(3, pvo.getPageCnt());
			}
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				ProductVO data = new ProductVO();
				data = new ProductVO();
				data.setDib(rs.getInt("DIB"));
				data.setpNum(rs.getInt("PNUM"));
				data.setCateNum(rs.getInt("CATENUM"));
				data.setpName(rs.getString("PNAME"));
				data.setFixPrice(rs.getInt("FIXPRICE"));
				data.setSelPrice(rs.getInt("SELPRICE"));
				data.setrDate(rs.getDate("RDATE"));
				data.setRePerson(rs.getString("REPERSON"));
				data.setReAge(rs.getInt("REAGE"));
				data.setBrand(rs.getString("BRAND"));
				data.setpImg(rs.getString("PIMG"));
				if (cntAge == 1) {
					data.setCateAge(rs.getInt("CATEAGE"));
				}
				if (cnt == 1) {
					data.setInfoImg(rs.getString("INFOIMG"));
					data.setProductCnt(rs.getInt("PRODUCTCNT"));
				}
				datas.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(conn, pstmt);
		return datas;
	}

	public ArrayList<CategoryVO> selectAll(CategoryVO cvo) {
		ArrayList<CategoryVO> datas = new ArrayList<CategoryVO>();
		conn = JDBCUtil.connect();
		try {
			if (cvo.getLowNum() != 0) {
				pstmt = conn.prepareStatement(SELECTALL_LCATE);
				pstmt.setInt(1, cvo.getLowNum());
				pstmt.setInt(2, cvo.getHighNum());
			} else {
				pstmt = conn.prepareStatement(SELECTALL_MCATENAME);
				pstmt.setString(1, cvo.getCateL());
			}
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				CategoryVO data = new CategoryVO();
				data = new CategoryVO();
				data.setCateNum(rs.getInt("CATENUM"));
				data.setCateL(rs.getString("CATEL"));
				datas.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(conn, pstmt);
		return datas;
	}

	public ArrayList<CategoryVO> selectAllCateNum(CategoryVO cvo) {
		ArrayList<CategoryVO> datas = new ArrayList<CategoryVO>();
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(SELECTALL_MCATENUM);
			pstmt.setInt(1, cvo.getCateNum());
			pstmt.setInt(2, cvo.getCateNum());

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				CategoryVO data = new CategoryVO();
				data = new CategoryVO();
				data.setCateNum(rs.getInt("CATENUM"));
				data.setCateL(rs.getString("CATEL"));
				data.setCateM(rs.getString("CATEM"));
				datas.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(conn, pstmt);
		return datas;
	}

	public ArrayList<ProductVO> selectAllSearch(ProductVO pvo) {
		ArrayList<ProductVO> datas = new ArrayList<ProductVO>();
		conn = JDBCUtil.connect();
		ProductVO data0 = null;

		try {
			try {
				pstmt = conn.prepareStatement("SELECT MAX(SELPRICE) MAXPRICE FROM PRODUCT");

				ResultSet rs = pstmt.executeQuery();
				if (rs.next()) {
					data0 = new ProductVO();
					data0.setHighNum(rs.getInt("MAXPRICE"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			String searchBar = "SELECT * FROM PRODUCT WHERE SELPRICE BETWEEN ? AND ?";

			if (pvo.getCateNum() != 0) {
				searchBar += " AND CATENUM=? ";
			}
			if (pvo.getpName() != null) {
				searchBar += " AND PNAME LIKE '%'||?||'%' ";
			}
			if (pvo.getBrand() != null) {
				searchBar += " AND Brand=? ";
			}

			pstmt = conn.prepareStatement(searchBar);
			pstmt.setInt(1, pvo.getLowNum());
			pstmt.setInt(2, pvo.getHighNum() == 0 ? data0.getHighNum() : pvo.getHighNum());

			int cnt = 3;
			if (pvo.getCateNum() != 0) {
				pstmt.setInt(cnt++, pvo.getCateNum());
			}
			if (pvo.getpName() != null) {
				pstmt.setString(cnt++, pvo.getpName());
			}
			if (pvo.getBrand() != null) {
				pstmt.setString(cnt++, pvo.getBrand());
			}

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				ProductVO data = new ProductVO();
				data = new ProductVO();
				data.setpNum(rs.getInt("PNUM"));
				data.setCateNum(rs.getInt("CATENUM"));
				data.setpName(rs.getString("PNAME"));
				data.setFixPrice(rs.getInt("FIXPRICE"));
				data.setSelPrice(rs.getInt("SELPRICE"));
				data.setrDate(rs.getDate("RDATE"));
				data.setRePerson(rs.getString("REPERSON"));
				data.setReAge(rs.getInt("REAGE"));
				data.setBrand(rs.getString("BRAND"));
				data.setpImg(rs.getString("PIMG"));
				data.setInfoImg(rs.getString("INFOIMG"));
				data.setProductCnt(rs.getInt("PRODUCTCNT"));
				datas.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(conn, pstmt);
		return datas;
	}

	public ArrayList<ProductVO> selectAllFilter(ProductVO pvo) {
		ArrayList<ProductVO> datas = new ArrayList<ProductVO>();
		conn = JDBCUtil.connect();

		try {
			String filter = "SELECT DECODE(D.MNUM, ?, 1, 0) DIB, P.PNUM, P.CATENUM, P.PNAME, P.FIXPRICE, P.SELPRICE, P.RDATE, P.REPERSON, P.REAGE, P.BRAND, P.PIMG, P.PRODUCTCNT, DECODE(O.CNT, NULL, 0, O.CNT) OCNT FROM PRODUCT P LEFT OUTER JOIN DIB D ON P.PNUM = D.PNUM  FULL JOIN (SELECT PNUM, SUM(CNT) CNT FROM ORDERDETAIL GROUP BY PNUM) O ON P.PNUM=O.PNUM WHERE 1=1 ";

			if((pvo.getCateNum()>99 && pvo.getCateNum()<300)||(pvo.getCateNum()>999 && pvo.getCateNum()<1200)) {
				filter += " AND 1=1 ";
			} else if(pvo.getCateNum()%100==0) {
				filter += " AND CATENUM BETWEEN ? AND ?";
			} else {
				filter += " AND CATENUM=?";				
			}
			
			if (pvo.getFilterTags() == 31) {
				filter += " AND REPERSON LIKE '1명' ";
			} else if (pvo.getFilterTags() == 32) {
				filter += " AND REPERSON NOT LIKE '1명' ";
			}

			 if (pvo.getFilterPrice() == 22) {
				filter += " AND SELPRICE BETWEEN 0 AND 10000";
			} else if (pvo.getFilterPrice() == 23) {
				filter += " AND SELPRICE BETWEEN 10000 AND 20000";
			} else if (pvo.getFilterPrice() == 24) {
				filter += " AND SELPRICE BETWEEN 20000 AND 30000";
			} else if (pvo.getFilterPrice() == 25) {
				filter += " AND SELPRICE BETWEEN 30000 AND 40000";
			} else if (pvo.getFilterPrice() == 26) {
				filter += " AND SELPRICE > 40000";
			}

			if (pvo.getpName() != null) {
				filter += " AND PNAME LIKE '%'||?||'%' ";
			}

			if (pvo.getFilterSortBy() == 11) {
				filter += " ORDER BY RDATE DESC";
			} else if (pvo.getFilterSortBy() == 12) {
				filter += " ORDER BY OCNT DESC ";
			} else if (pvo.getFilterSortBy() == 13) {
				filter += " ORDER BY SELPRICE ASC";
			} else if (pvo.getFilterSortBy() == 14) {
				filter += " ORDER BY SELPRICE DESC";
			}

			pstmt = conn.prepareStatement(filter);
			
			int num=2;
			pstmt.setInt(1, pvo.getDib());
			
			if((pvo.getCateNum()>99 && pvo.getCateNum()<300)||(pvo.getCateNum()>999 && pvo.getCateNum()<1200)) {

			} else if(pvo.getCateNum()%100==0) {
				pstmt.setInt(num++, pvo.getCateNum());
				pstmt.setInt(num++, pvo.getCateNum()+99);
			} else {
				pstmt.setInt(num++, pvo.getCateNum());
			}

			if (pvo.getpName() != null) {				
				pstmt.setString(num++, pvo.getpName());					
			}

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				ProductVO data = new ProductVO();
				data = new ProductVO();
				data.setDib(rs.getInt("DIB"));
				data.setpNum(rs.getInt("PNUM"));
				data.setCateNum(rs.getInt("CATENUM"));
				data.setpName(rs.getString("PNAME"));
				data.setFixPrice(rs.getInt("FIXPRICE"));
				data.setSelPrice(rs.getInt("SELPRICE"));
				data.setrDate(rs.getDate("RDATE"));
				data.setRePerson(rs.getString("REPERSON"));
				data.setReAge(rs.getInt("REAGE"));
				data.setBrand(rs.getString("BRAND"));
				data.setpImg(rs.getString("PIMG"));
				data.setProductCnt(rs.getInt("PRODUCTCNT"));
				datas.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(conn, pstmt);
		return datas;
	}

	public boolean update(ProductVO pvo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(UPDATE);
			pstmt.setInt(1, pvo.getCateNum());
			pstmt.setString(2, pvo.getpName());
			pstmt.setInt(3, pvo.getFixPrice());
			pstmt.setInt(4, pvo.getSelPrice());
			pstmt.setString(5, pvo.getRePerson());
			pstmt.setInt(6, pvo.getReAge());
			pstmt.setString(7, pvo.getBrand());
			//pstmt.setString(8, pvo.getpImg());
			//pstmt.setString(9, pvo.getInfoImg());
			pstmt.setInt(8, pvo.getProductCnt());
			pstmt.setInt(9, pvo.getpNum());

			int res = pstmt.executeUpdate();
			if (res <= 0) {
				System.out.println("로그 업데이트 실패");
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		System.out.println("로그 업테이트 성공");
		return true;
	}

	public boolean delete(ProductVO pvo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(DELETE);
			pstmt.setInt(1, pvo.getpNum());
			int res = pstmt.executeUpdate();
			if (res <= 0) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		JDBCUtil.disconnect(conn, pstmt);
		return true;
	}
}
