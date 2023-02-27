package com.spring.biz.member;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;


@Repository("orderDAO")
public class OrderDAO {
	
	@Autowired
	private JdbcTemplate template;

	final String INSERT_OR = "INSERT INTO MORDER (MNUM, OSHIPNAME, OZIPCODE, OUSERADDR, ODETAILADDR, OTEL, ODATE, OSTATUS, OPOINT) VALUES(?, ?, ?, ?, ?, ?, SYSDATE(), 1, ?)";
	final String INSERT_ORD = "INSERT INTO ORDERDETAIL (ONUM, PNUM, CNT) VALUES(?, ?, ?)";
	// 관리자 페이지
	final String SELECTALL_STATUS = "SELECT OSTATUS, COUNT(*) AS CNT FROM MORDER GROUP BY OSTATUS";
	final String SELECTALL_SALES = "SELECT DATE_FORMAT(ODATE, '%y/%m/%d') AS TDATE, SUM(P.SELPRICE*O.CNT) CNT FROM MORDER M, ORDERDETAIL O, PRODUCT P WHERE M.ONUM=O.ONUM AND O.PNUM=P.PNUM GROUP BY DATE_FORMAT(ODATE, '%y/%m/%d') ORDER BY DATE_FORMAT(ODATE, '%y/%m/%d') ASC LIMIT 14";
	// 사용자 페이지
	final String SELECTONE_ONUM = "SELECT A.ONUM, A.MNUM FROM (SELECT ONUM, MNUM FROM MORDER WHERE MNUM=? ORDER BY ODATE DESC) A LIMIT 1";
	final String SELECTALL_ORDER = "SELECT ODate, PIMG, M.ONUM, PNAME, SELPRICE, CNT, OSTATUS "
			+ "FROM MORDER M, ORDERDETAIL O, PRODUCT P WHERE M.ONUM=O.ONUM AND O.PNUM=P.PNUM AND M.OSTATUS BETWEEN 1 AND 3 AND MNUM=? ORDER BY ODNUM ASC"; // 주문목록
	final String SELECTALL_CAN = "SELECT ODate, PIMG, M.ONUM, PNAME, SELPRICE, CNT, OSTATUS  "
			+ "FROM MORDER M, ORDERDETAIL O, PRODUCT P WHERE M.ONUM=O.ONUM AND O.PNUM=P.PNUM AND M.OSTATUS=4 AND MNUM=? ORDER BY ODNUM ASC"; // 취소목록
	final String SELECTALL_ORDER_CAL = "SELECT ODate, PIMG, M.ONUM, PNAME, SELPRICE, CNT, OSTATUS FROM MORDER M, ORDERDETAIL O, PRODUCT P WHERE M.ONUM=O.ONUM AND O.PNUM=P.PNUM AND M.OSTATUS BETWEEN 1 AND 3 AND MNUM=? AND M.ODATE BETWEEN SYSDATE()-? AND SYSDATE() ORDER BY ODNUM ASC"; // 주문목록:
	final String SELECTALL_CAN_CAL = "SELECT ODate, PIMG, M.ONUM, PNAME, SELPRICE, CNT, OSTATUS  "
			+ "FROM MORDER M, ORDERDETAIL O, PRODUCT P WHERE M.ONUM=O.ONUM AND O.PNUM=P.PNUM AND M.OSTATUS BETWEEN 1 AND 3 AND MNUM=? AND M.ODATE BETWEEN SYSDATE()-? AND SYSDATE() ORDER BY ODNUM ASC"; // 취소목록:날짜별검색
	final String UPDATE = "UPDATE MORDER SET OSTATUS=? WHERE ONUM=?"; // 주문상태 변경: 1: 배송준비중, 2: 배송대기, 3 : 배송중, 4:취소

	public boolean insert(OrderVO ovo) {
		try {
			template.update(INSERT_OR, ovo.getmNum(), ovo.getoShipName(), ovo.getoZipCode(), ovo.getoUserAddr(), ovo.getoDetailAddr(), ovo.getoTel(), ovo.getoPoint());
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean insert(OrderDetail odvo) {
		try {
			template.update(INSERT_ORD, odvo.getoNum(), odvo.getpNum(), odvo.getCnt());
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public OrderVO selectOne(OrderVO ovo) {
		OrderVO data = null;
		try {
			data = template.queryForObject(SELECTONE_ONUM, (rs, rowNum) -> {
				OrderVO tmpData = new OrderVO();
				tmpData.setoNum(rs.getInt("ONUM"));
				tmpData.setmNum(rs.getInt("MNUM"));
				return tmpData;
			}, ovo.getmNum());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	public List<OrderVO> selectAll_ADMIN(OrderVO ovo) {
		List<OrderVO> datas = new ArrayList<OrderVO>();
		try {
			datas = template.query(SELECTALL_STATUS, (rs, rowNum) -> {
				OrderVO tmpData = new OrderVO();
				tmpData.setoStatus(rs.getInt("OSTATUS"));
				tmpData.setTempCnt(rs.getInt("CNT"));
				return tmpData;
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
		return datas;
	}

	public List<OrderVO> selectAll_SALES(OrderVO ovo) {
		List<OrderVO> datas = new ArrayList<OrderVO>();
		try {
			datas = template.query(SELECTALL_SALES, (rs, rowNum) -> {
				OrderVO tmpData = new OrderVO();
				tmpData.setTempDate(rs.getString("TDATE"));
				tmpData.setTempCnt(rs.getInt("CNT"));
				return tmpData;
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
		return datas;
	}

	public List<OrderVO> selectAll(OrderVO ovo) {
		List<OrderVO> datas = new ArrayList<OrderVO>();
		String query=null;
		Object[] obj=null;
		try {
			if (ovo.getoStatus() != 4) {
				if (ovo.getSearchCal() != 0) {
					query = SELECTALL_ORDER_CAL;
					obj = new Object[] {ovo.getmNum(), ovo.getSearchCal()};
				} else {
					query = SELECTALL_ORDER;
					obj = new Object[] {ovo.getmNum()};
				}
			} else if (ovo.getoStatus() == 4) {
				if (ovo.getSearchCal() != 0) {
					query = SELECTALL_CAN_CAL;
					obj = new Object[] {ovo.getmNum(), ovo.getSearchCal()};
				} else {
					query = SELECTALL_CAN;
					obj = new Object[] {ovo.getmNum()};
				}
			}
			datas = template.query(query, obj, new OrderRowMapper());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return datas;
	}

	public boolean update(OrderVO ovo) {
		try {
			template.update(UPDATE, ovo.getoStatus(), ovo.getoNum());
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}

class OrderRowMapper implements RowMapper<OrderVO> {
	@Override
	public OrderVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		OrderVO data = new OrderVO();
		data.setoDate(rs.getTimestamp("ODate"));
		data.setoNum(rs.getInt("ONUM"));
		data.setoStatus(rs.getInt("OSTATUS"));
		data.setpNumPimg(rs.getString("PIMG"));
		data.setpNumPname(rs.getString("PNAME"));
		data.setpNumSelPrice(rs.getInt("SELPRICE"));
		data.setpNumcnt(rs.getInt("CNT"));
		return data;
	}
}