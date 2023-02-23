package com.spring.biz.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.spring.biz.common.JDBCUtil;

public class OrderDAO {
	ArrayList<OrderVO> ovo;
	Connection conn;
	PreparedStatement pstmt;

	final String INSERT_OR = "INSERT INTO MORDER VALUES(ONUM_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, SYSDATE, 1, ?)";
	final String INSERT_ORD = "INSERT INTO ORDERDETAIL VALUES(ODNUM_SEQ.NEXTVAL, ?, ?, ?)";
	// 관리자 페이지
	final String SELECTALL_STATUS = "SELECT OSTATUS, COUNT(*) AS CNT FROM MORDER GROUP BY OSTATUS";
	final String SELECTALL_SALES = "SELECT TO_CHAR(ODATE, 'YY/MM/DD') AS TDATE, SUM(P.SELPRICE*O.CNT) CNT FROM MORDER M, ORDERDETAIL O, PRODUCT P WHERE M.ONUM=O.ONUM AND O.PNUM=P.PNUM AND ROWNUM<=14 GROUP BY TO_CHAR(ODATE, 'YY/MM/DD') ORDER BY TO_CHAR(ODATE, 'YY/MM/DD') ASC";
	// 사용자 페이지
	final String SELECTONE_ONUM = "SELECT ONUM, MNUM FROM (SELECT ONUM, MNUM FROM MORDER WHERE MNUM=? ORDER BY ODATE DESC) WHERE ROWNUM=1";
	final String SELECTALL_ORDER = "SELECT ODate, PIMG, M.ONUM, PNAME, SELPRICE, CNT, OSTATUS"
			+ " FROM MORDER M, ORDERDETAIL O, PRODUCT P WHERE M.ONUM=O.ONUM AND O.PNUM=P.PNUM AND M.OSTATUS BETWEEN 1 AND 3 AND MNUM=? ORDER BY ODNUM ASC"; // 주문 목록
	final String SELECTALL_CAN = "SELECT ODate, PIMG, M.ONUM, PNAME, SELPRICE, CNT, OSTATUS  "
			+ "FROM MORDER M, ORDERDETAIL O, PRODUCT P WHERE M.ONUM=O.ONUM AND O.PNUM=P.PNUM AND M.OSTATUS=4 AND MNUM=? ORDER BY ODNUM ASC"; // 취소 목록
	final String SELECTALL_ORDER_CAL = "SELECT ODate, PIMG, M.ONUM, PNAME, SELPRICE, CNT, OSTATUS FROM MORDER M, ORDERDETAIL O, PRODUCT P WHERE M.ONUM=O.ONUM AND O.PNUM=P.PNUM AND M.OSTATUS BETWEEN 1 AND 3 AND MNUM=? AND M.ODATE BETWEEN SYSDATE-? AND SYSDATE ORDER BY ODNUM ASC"; // 주문목록:
																																																																						// 날짜별
																																																																						// 검색
	final String SELECTALL_CAN_CAL = "SELECT ODate, PIMG, M.ONUM, PNAME, SELPRICE, CNT, OSTATUS  "
			+ "FROM MORDER M, ORDERDETAIL O, PRODUCT P WHERE M.ONUM=O.ONUM AND O.PNUM=P.PNUM AND M.OSTATUS BETWEEN 1 AND 3 AND MNUM=? AND M.ODATE BETWEEN SYSDATE-? AND SYSDATE ORDER BY ODNUM ASC"; // 취소목록:날짜별검색
	final String UPDATE = "UPDATE MORDER SET OSTATUS=? WHERE ONUM=?"; // 주문상태 변경: 1: 배송준비중, 2: 배송대기, 3 : 배송중, 4:취소

	public boolean insert(OrderVO ovo) {
		try {
			conn = JDBCUtil.connect();
			pstmt = conn.prepareStatement(INSERT_OR);
			pstmt.setInt(1, ovo.getmNum());
			pstmt.setString(2, ovo.getoShipName());
			pstmt.setString(3, ovo.getoZipCode());
			pstmt.setString(4, ovo.getoUserAddr());
			pstmt.setString(5, ovo.getoDetailAddr());
			pstmt.setString(6, ovo.getoTel());
			pstmt.setInt(7, ovo.getoPoint());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		return true;
	}

	public boolean insert(OrderDetail odvo) {
		try {
			conn = JDBCUtil.connect();
			pstmt = conn.prepareStatement(INSERT_ORD);
			pstmt.setInt(1, odvo.getoNum());
			pstmt.setInt(2, odvo.getpNum());
			pstmt.setInt(3, odvo.getCnt());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		return true;
	}

	public OrderVO selectOne(OrderVO ovo) {
		OrderVO data = null;
		try {
			conn = JDBCUtil.connect();
			pstmt = conn.prepareStatement(SELECTONE_ONUM);
			pstmt.setInt(1, ovo.getmNum());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				data = new OrderVO();
				data.setoNum(rs.getInt("ONUM"));
				data.setmNum(rs.getInt("MNUM"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(conn, pstmt);
		return data;
	}

	public ArrayList<OrderVO> selectAll_ADMIN(OrderVO ovo) {
		ArrayList<OrderVO> datas = new ArrayList<OrderVO>();
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(SELECTALL_STATUS);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderVO data = new OrderVO();
				data = new OrderVO();
				data.setoStatus(rs.getInt("OSTATUS"));
				data.setTempCnt(rs.getInt("CNT"));
				datas.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(conn, pstmt);
		return datas;
	}

	public ArrayList<OrderVO> selectAll_SALES(OrderVO ovo) {
		ArrayList<OrderVO> datas = new ArrayList<OrderVO>();
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(SELECTALL_SALES);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderVO data = new OrderVO();
				data = new OrderVO();
				data.setTempDate(rs.getString("TDATE"));
				data.setTempCnt(rs.getInt("CNT"));
				datas.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(conn, pstmt);
		return datas;
	}

	public ArrayList<OrderVO> selectAll(OrderVO ovo) {
		ArrayList<OrderVO> datas = new ArrayList<OrderVO>();
		conn = JDBCUtil.connect();
		try {
			if (ovo.getoStatus() != 4) {
				if (ovo.getSearchCal() != 0) {
					pstmt = conn.prepareStatement(SELECTALL_ORDER_CAL);
					pstmt.setInt(1, ovo.getmNum());
					pstmt.setInt(2, ovo.getSearchCal());
				} else {
					pstmt = conn.prepareStatement(SELECTALL_ORDER);
					pstmt.setInt(1, ovo.getmNum());
				}
			} else if (ovo.getoStatus() == 4) {
				if (ovo.getSearchCal() != 0) {
					pstmt = conn.prepareStatement(SELECTALL_CAN_CAL);
					pstmt.setInt(1, ovo.getmNum());
					pstmt.setInt(2, ovo.getSearchCal());
				} else {
					pstmt = conn.prepareStatement(SELECTALL_CAN);
					pstmt.setInt(1, ovo.getmNum());
				}
			}
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderVO data = new OrderVO();
				data = new OrderVO();
				data.setoDate(rs.getTimestamp("ODate"));
				data.setoNum(rs.getInt("ONUM"));
				data.setoStatus(rs.getInt("OSTATUS"));
				data.setpNumPimg(rs.getString("PIMG"));
				data.setpNumPname(rs.getString("PNAME"));
				data.setpNumSelPrice(rs.getInt("SELPRICE"));
				data.setpNumcnt(rs.getInt("CNT"));
				datas.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(conn, pstmt);
		return datas;
	}

	public boolean update(OrderVO ovo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(UPDATE);
			pstmt.setInt(1, ovo.getoStatus());
			pstmt.setInt(2, ovo.getoNum());

			int res = pstmt.executeUpdate();
			if (res <= 0) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

}