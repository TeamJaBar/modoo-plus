package com.spring.biz.product;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("productDAO")
public class ProductDAO {

	@Autowired
	JdbcTemplate template;

	// C : Product
	final String INSERT = "INSERT INTO PRODUCT (CATENUM, PNAME, FIXPRICE, SELPRICE, RDATE, REPERSON, REAGE, BRAND, PIMG, INFOIMG, PRODUCTCNT) VALUES(?, ?, ?, ?, SYSDATE(), ?, ?, ?, ?, ?, ?)";
	// R : Product
	final String SELECTONE = "SELECT DIB, PNUM, CATENUM, PNAME, FIXPRICE, SELPRICE, RDATE, REPERSON, REAGE, BRAND, PIMG, INFOIMG, PRODUCTCNT FROM (SELECT CASE WHEN D.MNUM IS NULL THEN 0 ELSE 1 END DIB, P.* FROM PRODUCT P LEFT OUTER JOIN (SELECT PNUM, MNUM FROM DIB WHERE MNUM=?) D ON P.PNUM = D.PNUM) A WHERE A.PNUM=?";
	final String SELECTONE_CART = "SELECT PNUM, CATENUM, PNAME, FIXPRICE, SELPRICE, BRAND, PIMG FROM PRODUCT WHERE PNUM=?";
	final String SELECTALL_NEW = "SELECT * FROM (SELECT DIB, PNUM, CATENUM, PNAME, FIXPRICE, SELPRICE, RDATE, REPERSON, REAGE, BRAND, PIMG FROM (SELECT CASE WHEN D.MNUM IS NULL THEN 0 ELSE 1 END DIB, P.* FROM PRODUCT P LEFT OUTER JOIN (SELECT PNUM, MNUM FROM DIB WHERE MNUM=?) D ON P.PNUM = D.PNUM) A ORDER BY A.RDATE DESC) B LIMIT ?";
	final String SELECTALL_BEST = "SELECT * FROM (SELECT CASE WHEN D.MNUM IS NULL THEN 0 ELSE 1 END DIB, P.PNUM, P.CATENUM, P.PNAME, P.FIXPRICE, P.SELPRICE, P.RDATE, P.REPERSON, P.REAGE, P.BRAND, P.PIMG, P.PRODUCTCNT, CASE WHEN O.CNT IS NULL THEN 0 ELSE O.CNT END OCNT FROM PRODUCT P LEFT OUTER JOIN (SELECT PNUM, MNUM FROM DIB WHERE MNUM=?) D ON P.PNUM = D.PNUM LEFT OUTER JOIN (SELECT PNUM, SUM(CNT) CNT FROM ORDERDETAIL GROUP BY PNUM) O ON P.PNUM=O.PNUM ORDER BY OCNT DESC) A LIMIT ?";
	final String SELECTALL_CATEALL = "SELECT * FROM (SELECT DIB, PNUM, CATENUM, PNAME, FIXPRICE, SELPRICE, RDATE, REPERSON, REAGE, BRAND, PIMG FROM (SELECT CASE WHEN D.MNUM IS NULL THEN 0 ELSE 1 END DIB, P.* FROM PRODUCT P LEFT OUTER JOIN (SELECT PNUM, MNUM FROM DIB WHERE MNUM=?) D ON P.PNUM = D.PNUM) A WHERE CATENUM BETWEEN ? AND ? ORDER BY RDATE DESC) B LIMIT ?";
	final String SELECTALL_CATE = "SELECT * FROM (SELECT DIB, PNUM, CATENUM, PNAME, FIXPRICE, SELPRICE, RDATE, REPERSON, REAGE, BRAND, PIMG FROM (SELECT CASE WHEN D.MNUM IS NULL THEN 0 ELSE 1 END DIB, P.* FROM PRODUCT P LEFT OUTER JOIN (SELECT PNUM, MNUM FROM DIB WHERE MNUM=?) D ON P.PNUM = D.PNUM) A WHERE CATENUM=? ORDER BY RDATE DESC) B LIMIT ?";
	final String SELECTALL_AGE = "SELECT DIB, PNUM, CATENUM, PNAME, FIXPRICE, SELPRICE, RDATE, REPERSON, REAGE, BRAND, PIMG, CASE WHEN REAGE BETWEEN 0 AND 3 THEN 1 WHEN REAGE BETWEEN 4 AND 6 THEN 2 WHEN REAGE BETWEEN 7 AND 10 THEN 3 WHEN REAGE BETWEEN 11 AND 13 THEN 4 WHEN REAGE >= 14 THEN 5 END AS CATEAGE FROM (SELECT CASE WHEN D.MNUM IS NULL THEN 0 ELSE 1 END DIB, P.* FROM PRODUCT P LEFT OUTER JOIN (SELECT PNUM, MNUM FROM DIB WHERE MNUM=?) D ON P.PNUM = D.PNUM) A LIMIT ?";
	final String SELECTALL = "SELECT DIB, PNUM, CATENUM, PNAME, FIXPRICE, SELPRICE, RDATE, REPERSON, REAGE, BRAND, PIMG, INFOIMG, PRODUCTCNT FROM (SELECT CASE WHEN D.MNUM IS NULL THEN 0 ELSE 1 END DIB, P.* FROM PRODUCT P LEFT OUTER JOIN (SELECT PNUM, MNUM FROM DIB WHERE MNUM=?) D ON P.PNUM = D.PNUM) A";
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
			template.update(INSERT, pvo.getCateNum(), pvo.getpName(), pvo.getFixPrice(), pvo.getSelPrice(), pvo.getRePerson(), pvo.getReAge(), pvo.getBrand(), pvo.getpImg(), pvo.getInfoImg(), pvo.getProductCnt());
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public CategoryVO selectOneCate(ProductVO pvo) {
		try {
			return template.queryForObject(SELECTONE_CATE, BeanPropertyRowMapper.newInstance(CategoryVO.class), pvo.getCateNum());
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public ProductVO selectOne(ProductVO pvo) {
		Object[] args = { pvo.getDib(), pvo.getpNum() };
		return template.queryForObject(SELECTONE, args, BeanPropertyRowMapper.newInstance(ProductVO.class));
	}

	public ProductVO selectOneCart(ProductVO pvo) {
		try {
			return template.queryForObject(SELECTONE_CART, BeanPropertyRowMapper.newInstance(ProductVO.class), pvo.getpNum());
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<ProductVO> selectAll(ProductVO pvo) {
		Object[] args;
		String query;
		List<ProductVO> datas = new ArrayList<>();
		try {
			if (pvo.getCateNum() == 1000) {
				args = new Object[] { pvo.getDib(), pvo.getPageCnt() };
				query = SELECTALL_NEW;
			} else if (pvo.getCateNum() == 1100) {
				args = new Object[] { pvo.getDib(), pvo.getPageCnt() };
				query = SELECTALL_BEST;
			} else if (pvo.getCateNum() == 100) {
				args = new Object[] { pvo.getDib() };
				query = SELECTALL;
			} else if (pvo.getCateNum() > 100 && pvo.getCateNum() < 200) {
				args = new Object[] { pvo.getDib(), pvo.getPageCnt() };
				query = SELECTALL_AGE;
			} else if (pvo.getCateNum() % 100 == 0) {
				args = new Object[] { pvo.getDib(), pvo.getLowNum(), pvo.getHighNum() + 99, pvo.getPageCnt() };
				query = SELECTALL_CATEALL;
			} else {
				args = new Object[] { pvo.getDib(), pvo.getCateNum(), pvo.getPageCnt() };
				query = SELECTALL_CATE;
			}
			datas = template.query(query, args, BeanPropertyRowMapper.newInstance(ProductVO.class));
		}
		catch(EmptyResultDataAccessException e) {
			e.printStackTrace();
		}
		return datas;
	}

	public List<CategoryVO> selectAll(CategoryVO cvo) {
		Object[] args;
		String query;
		List<CategoryVO> datas = new ArrayList<>();
		try {
			if (cvo.getLowNum() != 0) {
				args = new Object[] { cvo.getLowNum(), cvo.getHighNum() };
				query = SELECTALL_LCATE;
			} else {
				args = new Object[] { cvo.getCateL() };
				query = SELECTALL_MCATENAME;
			}
			datas = template.query(query, args, BeanPropertyRowMapper.newInstance(CategoryVO.class));
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
		}
		return datas;
	}

	public List<CategoryVO> selectAllCateNum(CategoryVO cvo) {
		Object[] args = { cvo.getCateNum(), cvo.getCateNum() };
		List<CategoryVO> datas = new ArrayList<>();
		try {
			datas = template.query(SELECTALL_MCATENUM, args, BeanPropertyRowMapper.newInstance(CategoryVO.class));
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
		}
		return datas;
	}

	public List<ProductVO> selectAllSearch(ProductVO pvo) {
		ProductVO data0 = template.queryForObject("SELECT MAX(SELPRICE) HIGHNUM FROM PRODUCT", BeanPropertyRowMapper.newInstance(ProductVO.class));
		String searchBar = "SELECT * FROM PRODUCT WHERE SELPRICE BETWEEN ? AND ?";
		ArrayList<Object> arList = new ArrayList<Object>();
		List<ProductVO> datas = new ArrayList<>();
		
		arList.add(pvo.getLowNum());
		arList.add(pvo.getHighNum() == 0 ? data0.getHighNum() : pvo.getHighNum());

		if (pvo.getCateNum() != 0) {
			searchBar += " AND CATENUM BETWEEN ? AND (?+99)";
			arList.add(pvo.getCateNum());
			arList.add(pvo.getCateNum());
		}
		if (!pvo.getpName().equals("")) {
			searchBar += " AND PNAME LIKE CONCAT('%', ?, '%') ";
			arList.add(pvo.getpName());
		}
		if (pvo.getBrand() != null) {
			searchBar += " AND BRAND=? ";
			arList.add(pvo.getBrand());
		}

		System.out.println("\t[ ProductDAO 로그 ]SearhBar SQL문: " + searchBar);
		Object[] args = arList.toArray();
		
		try {
			datas = template.query(searchBar, args, BeanPropertyRowMapper.newInstance(ProductVO.class));
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
		}
		
		return datas;
	}

	public List<ProductVO> selectAllFilter(ProductVO pvo) {
		String filter = "SELECT CASE WHEN D.MNUM IS NULL THEN 0 ELSE 1 END DIB, P.PNUM, P.CATENUM, P.PNAME, P.FIXPRICE, P.SELPRICE, P.RDATE, P.REPERSON, P.REAGE, P.BRAND, P.PIMG, P.PRODUCTCNT, CASE WHEN O.CNT IS NULL THEN 0 ELSE O.CNT END OCNT FROM PRODUCT P LEFT OUTER JOIN (SELECT PNUM, MNUM FROM DIB WHERE MNUM=?) D ON P.PNUM = D.PNUM LEFT OUTER JOIN (SELECT PNUM, SUM(CNT) CNT FROM ORDERDETAIL GROUP BY PNUM) O ON P.PNUM=O.PNUM WHERE 1=1";
		ArrayList<Object> arList = new ArrayList<Object>();
		List<ProductVO> datas = new ArrayList<>();
		
		arList.add(pvo.getDib());
		
		if ((pvo.getCateNum() > 99 && pvo.getCateNum() < 300) || (pvo.getCateNum() > 999 && pvo.getCateNum() < 1200)) {
			filter += " AND 1=1 ";
		} else if (pvo.getCateNum() % 100 == 0) {
			filter += " AND CATENUM BETWEEN ? AND ?";
			arList.add(pvo.getCateNum());
			arList.add(pvo.getCateNum() + 99);
		} else {
			filter += " AND CATENUM=?";
			arList.add(pvo.getCateNum());
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
			arList.add(pvo.getpName());
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

		Object[] args = arList.toArray();
		try {
			datas = template.query(filter, args, BeanPropertyRowMapper.newInstance(ProductVO.class));
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
		}
		return datas;
	}

	public boolean update(ProductVO pvo) {
		try {
			template.update(UPDATE, pvo.getCateNum(), pvo.getpName(), pvo.getFixPrice(), pvo.getSelPrice(), pvo.getReAge(), pvo.getBrand(), pvo.getProductCnt(), pvo.getpNum());
		} catch(Exception e) {
			return false;
		}
		return true;
	}

	public boolean delete(ProductVO pvo) {
		try {
			template.update(DELETE, pvo.getpNum());
		} catch(Exception e) {
			return false;
		}
		return true;
	}
}

/*class ProductRowMapper implements RowMapper<ProductVO> {
	@Override
	public ProductVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ProductVO data = new ProductVO();
		data.setDib(rs.getInt("DIB"));
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
}*/