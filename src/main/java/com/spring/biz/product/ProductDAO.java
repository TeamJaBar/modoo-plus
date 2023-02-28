package com.spring.biz.product;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("productDAO")
public class ProductDAO {

	@Autowired
	JdbcTemplate template;

	// C : Product
	final String INSERT = "INSERT INTO PRODUCT (CATENUM, PNAME, FIXPRICE, SELPRICE, RDATE, REPERSON, REAGE, BRAND, PIMG, INFOIMG, PRODUCTCNT) VALUES(?, ?, ?, ?, SYSDATE(), ?, ?, ?, ?, ?, ?)";
	// R : Product
	final String SELECTONE = "SELECT DIB, PNUM, CATENUM, PNAME, FIXPRICE, SELPRICE, RDATE, REPERSON, REAGE, BRAND, PIMG, INFOIMG, PRODUCTCNT FROM (SELECT CASE D.MNUM WHEN ? THEN 1 ELSE 0 END DIB, P.* FROM PRODUCT P LEFT OUTER JOIN DIB D ON P.PNUM = D.PNUM) A WHERE A.PNUM=?";
	final String SELECTONE_CART = "SELECT PNUM, CATENUM, PNAME, FIXPRICE, SELPRICE, BRAND, PIMG FROM PRODUCT WHERE PNUM=?";
	final String SELECTALL_NEW = "SELECT * FROM (SELECT DIB, PNUM, CATENUM, PNAME, FIXPRICE, SELPRICE, RDATE, REPERSON, REAGE, BRAND, PIMG FROM (SELECT CASE D.MNUM WHEN ? THEN 1 ELSE 0 END DIB, P.* FROM PRODUCT P LEFT OUTER JOIN DIB D ON P.PNUM = D.PNUM) A ORDER BY A.RDATE DESC) B LIMIT ?";
	final String SELECTALL_BEST = "SELECT * FROM (SELECT CASE D.MNUM WHEN ? THEN 1 ELSE 0 END DIB, P.PNUM, P.CATENUM, P.PNAME, P.FIXPRICE, P.SELPRICE, P.RDATE, P.REPERSON, P.REAGE, P.BRAND, P.PIMG, P.PRODUCTCNT, CASE WHEN O.CNT IS NULL THEN 0 ELSE O.CNT END OCNT FROM PRODUCT P LEFT OUTER JOIN DIB D ON P.PNUM = D.PNUM RIGHT OUTER JOIN (SELECT PNUM, SUM(CNT) CNT FROM ORDERDETAIL GROUP BY PNUM) O ON P.PNUM=O.PNUM ORDER BY OCNT DESC) A LIMIT ?";
	final String SELECTALL_CATEALL = "SELECT * FROM (SELECT DIB, PNUM, CATENUM, PNAME, FIXPRICE, SELPRICE, RDATE, REPERSON, REAGE, BRAND, PIMG FROM (SELECT CASE D.MNUM WHEN ? THEN 1 ELSE 0 END DIB, P.* FROM PRODUCT P LEFT OUTER JOIN DIB D ON P.PNUM = D.PNUM) A WHERE CATENUM BETWEEN ? AND ? ORDER BY RDATE DESC) B LIMIT ?";
	final String SELECTALL_CATE = "SELECT * FROM (SELECT DIB, PNUM, CATENUM, PNAME, FIXPRICE, SELPRICE, RDATE, REPERSON, REAGE, BRAND, PIMG FROM (SELECT CASE D.MNUM WHEN ? THEN 1 ELSE 0 END DIB, P.* FROM PRODUCT P LEFT OUTER JOIN DIB D ON P.PNUM = D.PNUM) A WHERE CATENUM=? ORDER BY RDATE DESC) B LIMIT ?";
	final String SELECTALL_AGE = "SELECT DIB, PNUM, CATENUM, PNAME, FIXPRICE, SELPRICE, RDATE, REPERSON, REAGE, BRAND, PIMG, CASE WHEN REAGE BETWEEN 0 AND 3 THEN 1 WHEN REAGE BETWEEN 4 AND 6 THEN 2 WHEN REAGE BETWEEN 7 AND 10 THEN 3 WHEN REAGE BETWEEN 11 AND 13 THEN 4 WHEN REAGE >= 14 THEN 5 END AS CATEAGE FROM (SELECT CASE D.MNUM WHEN ? THEN 1 ELSE 0 END DIB, P.* FROM PRODUCT P LEFT OUTER JOIN DIB D ON P.PNUM = D.PNUM) A LIMIT ?";
	final String SELECTALL = "SELECT DIB, PNUM, CATENUM, PNAME, FIXPRICE, SELPRICE, RDATE, REPERSON, REAGE, BRAND, PIMG, INFOIMG, PRODUCTCNT FROM (SELECT CASE D.MNUM WHEN ? THEN 1 ELSE 0 END DIB, P.* FROM PRODUCT P LEFT OUTER JOIN DIB D ON P.PNUM = D.PNUM) A";
	// R : Category
	final String SELECTONE_CATE = "SELECT TRUNCATE(CATENUM, -2) AS CATENUM, CATEL, CATEM FROM CATEGORY WHERE CATENUM=?";
	final String SELECTALL_LCATE = "SELECT DISTINCT CATEL, CASE MOD(CATENUM, 100) WHEN 0 THEN CATENUM ELSE CATENUM-MOD(CATENUM, 100) END CATENUM FROM CATEGORY WHERE CATENUM BETWEEN ? AND ?";
	final String SELECTALL_MCATENAME = "SELECT CATEL, CATEM, CATENUM FROM CATEGORY WHERE CATEL=?";
	final String SELECTALL_MCATENUM = "SELECT CATENUM, CATEL, CATEM FROM CATEGORY WHERE CATENUM BETWEEN ? AND (?+99)";
	// U : Product
	final String UPDATE = "UPDATE PRODUCT SET CATENUM=?, PNAME=?, FIXPRICE=?, SELPRICE=?, REPERSON=?, REAGE=?, BRAND=?, PRODUCTCNT=? WHERE PNUM=?";
	// D : Product
	final String DELETE = "DELETE FROM PRODUCT WHERE PNUM=?";

	public boolean insert(ProductVO pvo) {
		try {
			template.update(INSERT, pvo.getCateNum(), pvo.getpName(), pvo.getFixPrice(), pvo.getSelPrice(), pvo.getRePerson(), pvo.getReAge(), pvo.getBrand(), pvo.getpImg(), pvo.getInfoImg(),
					pvo.getProductCnt());
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public CategoryVO selectOneCate(ProductVO pvo) {
		Object[] args = { pvo.getCateNum() };
		return template.queryForObject(SELECTONE_CATE, args, new CategoryRowMapper());
	}

	public ProductVO selectOne(ProductVO pvo) {
		Object[] args = { pvo.getDib(), pvo.getpNum() };
		return template.queryForObject(SELECTONE, args, new ProductRowMapper());
	}

	public ProductVO selectOneCart(ProductVO pvo) {
		Object[] args = { pvo.getpNum() };
		return template.queryForObject(SELECTONE, args, new ProductRowMapper());
	}

	public List<ProductVO> selectAll(ProductVO pvo) {
		if (pvo.getCateNum() == 1000) {
			Object[] args = { pvo.getDib(), pvo.getPageCnt() };
			return template.query(SELECTALL_NEW, args, new ProductRowMapper());
		} else if (pvo.getCateNum() == 1100) {
			Object[] args = { pvo.getDib(), pvo.getPageCnt() };
			return template.query(SELECTALL_BEST, args, new ProductRowMapper());
		} else if (pvo.getCateNum() == 100) {
			Object[] args = { pvo.getDib() };
			return template.query(SELECTALL, args, new ProductRowMapper());
		} else if (pvo.getCateNum() > 100 && pvo.getCateNum() < 200) {
			Object[] args = { pvo.getDib(), pvo.getPageCnt() };
			return template.query(SELECTALL_AGE, args, new ProductRowMapper());
		} else if (pvo.getCateNum() % 100 == 0) {
			Object[] args = { pvo.getDib(), pvo.getLowNum(), pvo.getHighNum() + 99, pvo.getPageCnt() };
			return template.query(SELECTALL_CATEALL, args, new ProductRowMapper());
		} else {
			Object[] args = { pvo.getDib(), pvo.getCateNum(), pvo.getPageCnt() };
			return template.query(SELECTALL_CATE, args, new ProductRowMapper());
		}
	}

	public List<CategoryVO> selectAll(CategoryVO cvo) {
		if (cvo.getLowNum() != 0) {
			Object[] args = { cvo.getLowNum(), cvo.getHighNum() };
			return template.query(SELECTALL_LCATE, args, new CategoryRowMapper());
		} else {
			Object[] args = { cvo.getCateL() };
			return template.query(SELECTALL_MCATENAME, args, new CategoryRowMapper());
		}
	}

	public List<CategoryVO> selectAllCateNum(CategoryVO cvo) {
		Object[] args = { cvo.getCateNum(), cvo.getCateNum() };
		return template.query(SELECTALL_MCATENUM, args, new CategoryRowMapper());
	}

	public List<ProductVO> selectAllSearch(ProductVO pvo) {
		ProductVO data0 = template.queryForObject("SELECT MAX(SELPRICE) MAXPRICE FROM PRODUCT", new ProductRowMapper());
		String searchBar = "SELECT * FROM PRODUCT WHERE SELPRICE BETWEEN ? AND ?";

		if (pvo.getCateNum() != 0) {
			searchBar += " AND CATENUM=? ";
		}
		if (pvo.getpName() != null) {
			searchBar += " AND PNAME LIKE CONCAT('%', ?, '%') ";
		}
		if (pvo.getBrand() != null) {
			searchBar += " AND Brand=? ";
		}

		System.out.println("SearhBar : " + searchBar);

		ArrayList<Object> arList = new ArrayList<Object>();
		arList.add(pvo.getLowNum());
		arList.add(pvo.getHighNum() == 0 ? data0.getHighNum() : pvo.getHighNum());

		if (pvo.getCateNum() != 0) {
			arList.add(pvo.getCateNum());
		}
		if (pvo.getpName() != null) {
			arList.add(pvo.getpName());
		}
		if (pvo.getBrand() != null) {
			arList.add(pvo.getBrand());
		}

		Object[] args1 = arList.toArray();
		return template.query(searchBar, args1, new ProductRowMapper());
	}

	public List<ProductVO> selectAllFilter(ProductVO pvo) {
		String filter = "SELECT CASE D.MNUM WHEN 1 THEN 1 ELSE 0 END DIB, P.PNUM, P.CATENUM, P.PNAME, P.FIXPRICE, P.SELPRICE, P.RDATE, P.REPERSON, P.REAGE, P.BRAND, P.PIMG, P.PRODUCTCNT, CASE WHEN O.CNT IS NULL THEN 0 ELSE O.CNT END OCNT FROM PRODUCT P LEFT OUTER JOIN DIB D ON P.PNUM = D.PNUM RIGHT OUTER JOIN (SELECT PNUM, SUM(CNT) CNT FROM ORDERDETAIL GROUP BY PNUM) O ON P.PNUM=O.PNUM WHERE 1=1";

		if ((pvo.getCateNum() > 99 && pvo.getCateNum() < 300) || (pvo.getCateNum() > 999 && pvo.getCateNum() < 1200)) {
			filter += " AND 1=1 ";
		} else if (pvo.getCateNum() % 100 == 0) {
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
			filter += " AND PNAME LIKE CONCAT('%', ?, '%') ";
		}

		if (pvo.getFilterSortBy() == 11) {
			filter += " ORDER BY RDATE DESC";
		} else if (pvo.getFilterSortBy() == 12) {
			filter += " ORDER BY OCNT DESC";
		} else if (pvo.getFilterSortBy() == 13) {
			filter += " ORDER BY SELPRICE ASC";
		} else if (pvo.getFilterSortBy() == 14) {
			filter += " ORDER BY SELPRICE DESC";
		}

		ArrayList<Object> arList = new ArrayList<Object>();

		arList.add(pvo.getDib());

		if ((pvo.getCateNum() > 99 && pvo.getCateNum() < 300) || (pvo.getCateNum() > 999 && pvo.getCateNum() < 1200)) {

		} else if (pvo.getCateNum() % 100 == 0) {
			arList.add(pvo.getCateNum());
			arList.add(pvo.getCateNum() + 99);
		} else {
			arList.add(pvo.getCateNum());
		}

		if (pvo.getpName() != null) {
			arList.add(pvo.getpName());
		}

		Object[] args = arList.toArray();
		return template.query(filter, args, new ProductRowMapper());
	}

	public boolean update(ProductVO pvo) {
		template.update(UPDATE, pvo.getCateNum(), pvo.getpName(), pvo.getFixPrice(), pvo.getSelPrice(), pvo.getReAge(), pvo.getBrand(), pvo.getProductCnt(), pvo.getpNum());
		return true;
	}

	public boolean delete(ProductVO pvo) {
		template.update(DELETE, pvo.getpNum());
		return true;
	}
}

class ProductRowMapper implements RowMapper<ProductVO> {
	@Override
	public ProductVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ProductVO data = new ProductVO();
		data.setpNum(rs.getInt("PNUM"));
		data.setCateNum(rs.getInt("CATENUM"));
		data.setpName(rs.getString("PNAME"));
		data.setFixPrice(rs.getInt("FIXPRICE"));
		data.setSelPrice(rs.getInt("SELPRICE"));
		data.setrDate(rs.getTimestamp("RDATE"));
		data.setRePerson(rs.getString("REPERSON"));
		data.setReAge(rs.getInt("REAGE"));
		data.setBrand(rs.getString("BRAND"));
		data.setpImg(rs.getString("PIMG"));
		data.setInfoImg(rs.getString("INFOIMG"));
		data.setProductCnt(rs.getInt("PRODUCTCNT"));
		return data;
	}
}

class CategoryRowMapper implements RowMapper<CategoryVO> {
	@Override
	public CategoryVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		CategoryVO data = new CategoryVO();
		data.setCateNum(rs.getInt("CATENUM"));
		data.setCateL(rs.getString("CATEL"));
		data.setCateM(rs.getString("CATEM"));
		data.setLowNum(rs.getInt("LOWNUM"));
		data.setHighNum(rs.getInt("HIGHNUM"));
		return data;
	}
}