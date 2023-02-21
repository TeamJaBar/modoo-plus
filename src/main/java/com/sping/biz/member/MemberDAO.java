package com.sping.biz.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCUtil;

public class MemberDAO {
	ArrayList<MemberVO> member;
	Connection conn;
	PreparedStatement pstmt;

	final String INSERT = "INSERT INTO MEMBER VALUES(MNUM_SEQ.NEXTVAL, ?, ?, ?, ?, ?, 0, ?, ?, ?, SYSDATE, NULL)";
	final String INSERT_KAKAO = "INSERT INTO MEMBER VALUES(MNUM_SEQ.NEXTVAL, ?, ?, ?, ?, ?, 0, ?, ?, ?, SYSDATE, ?)";
	// final String SELECTONE_LOGIN = "SELECT MNUM, MID, MPW, MNAME, MEMAIL, MTEL,
	// MPOINT, ZIPCODE, USERADDR, DETAILADDR FROM MEMBER WHERE MID=? AND MPW=?";
	final String SELECTONE_LOGIN = "SELECT MNUM, MID, MNAME FROM MEMBER WHERE MID=? AND MPW=?";
	final String SELECTONE_KAKAOCHK = "SELECT KAKAOLOGIN FROM MEMBER WHERE MNUM=?";
	final String SELECTONE_INFO = "SELECT MNUM, MID, MPW, MNAME, MEMAIL, MTEL, MPOINT, ZIPCODE, USERADDR, DETAILADDR FROM MEMBER WHERE MNUM=?";
	final String SELECTONE_ID = "SELECT MID FROM MEMBER WHERE MNAME=? AND MEMAIL=?";
	final String SELECTONE_IDCHK = "SELECT MID FROM MEMBER WHERE MID=?";
	final String SELECTONE_EMAIL = "SELECT REPLACE(MEMAIL, SUBSTR(MEMAIL,INSTR(MEMAIL, '@', 1, 1)-4, 4 ), '****') AS FINDPW, MEMAIL FROM MEMBER WHERE MID=?";
	final String SELECTONE_EMAILCHK = "SELECT MEMAIL FROM MEMBER WHERE MEMAIL=?";
	// 관리자페이지
	final String SELECTALL = "SELECT TO_CHAR(MDATE, 'DD/DAY') AS TDATE, COUNT(*) AS CNT FROM MEMBER WHERE ROWNUM<=7 GROUP BY TO_CHAR(MDATE, 'DD/DAY') ORDER BY TDATE DESC";
	// 멤버페이지
	final String SELECTALL_MEMBER = "SELECT * FROM MEMBER ORDER BY MNUM ASC";
	final String UPDATE_USER = "UPDATE MEMBER SET MPW=?, MEMAIL=?, MTEL=?, ZIPCODE=?, USERADDR=?, DETAILADDR=? WHERE MNUM=?";
	final String UPDATE_ADMIN = "UPDATE MEMBER SET MPW=?, MNAME=?, MEMAIL=?, MTEL=?, ZIPCODE=?, USERADDR=?, DETAILADDR=?, MPOINT=? WHERE MNUM=?";
	final String UPDATE_PW = "UPDATE MEMBER SET MPW=? WHERE MNUM=?";
	final String DELETE_USER = "DELETE FROM MEMBER WHERE MNUM=? AND MPW=?";
	final String DELETE_ADMIN = "DELETE FROM MEMBER WHERE MNUM=?";

	public boolean insert(MemberVO mvo) {
		conn = JDBCUtil.connect();
		int cnt = 0;
		try {
			if (mvo.getKakao() != null) {
				pstmt = conn.prepareStatement(INSERT_KAKAO);
				cnt++;
			} else {
				pstmt = conn.prepareStatement(INSERT);
			}

			pstmt.setString(1, mvo.getmId());
			pstmt.setString(2, mvo.getmPw());
			pstmt.setString(3, mvo.getmName());
			pstmt.setString(4, mvo.getmEmail());
			pstmt.setString(5, mvo.getmTel());
			pstmt.setString(6, mvo.getZipCode());
			pstmt.setString(7, mvo.getUserAddr());
			pstmt.setString(8, mvo.getDetailAddr());
			if (cnt == 1) {
				pstmt.setString(9, mvo.getKakao());
			}

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		return true;
	}

	public ArrayList<MemberVO> selectAll(MemberVO mvo) {
		ArrayList<MemberVO> datas = new ArrayList<MemberVO>();
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(SELECTALL);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO data = new MemberVO();
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

	public ArrayList<MemberVO> selectAllMember(MemberVO mvo) {
		ArrayList<MemberVO> datas = new ArrayList<MemberVO>();
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(SELECTALL_MEMBER);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO data = new MemberVO();
				data.setmNum(rs.getInt("MNUM"));
				data.setmId(rs.getString("MID"));
				data.setmPw(rs.getString("MPW"));
				data.setmName(rs.getString("MNAME"));
				data.setmEmail(rs.getString("MEMAIL"));
				data.setmTel(rs.getString("MTEL"));
				data.setmPoint(rs.getInt("MPOINT"));
				data.setZipCode(rs.getString("ZIPCODE"));
				data.setUserAddr(rs.getString("USERADDR"));
				data.setDetailAddr(rs.getString("DETAILADDR"));
				data.setmDate(rs.getDate("MDATE"));
				data.setKakao(rs.getString("KAKAOLOGIN"));
				datas.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(conn, pstmt);
		return datas;
	}

	public MemberVO selectOneLogin(MemberVO mvo) {
		MemberVO data = null;
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(SELECTONE_LOGIN);
			pstmt.setString(1, mvo.getmId());
			pstmt.setString(2, mvo.getmPw());

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				data = new MemberVO();
				data.setmNum(rs.getInt("MNUM"));
				data.setmId(rs.getString("MID"));
				data.setmName(rs.getString("MNAME"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(conn, pstmt);
		return data;
	}

	public MemberVO selectOneInfo(MemberVO mvo) {
		MemberVO data = null;
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(SELECTONE_INFO);
			pstmt.setInt(1, mvo.getmNum());

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				data = new MemberVO();
				data.setmNum(rs.getInt("MNUM"));
				data.setmId(rs.getString("MID"));
				data.setmPw(rs.getString("MPW"));
				data.setmName(rs.getString("MNAME"));
				data.setmEmail(rs.getString("MEMAIL"));
				data.setmTel(rs.getString("MTEL"));
				data.setmPoint(rs.getInt("MPOINT"));
				data.setZipCode(rs.getString("ZIPCODE"));
				data.setUserAddr(rs.getString("USERADDR"));
				data.setDetailAddr(rs.getString("DETAILADDR"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(conn, pstmt);
		return data;
	}

	public MemberVO selectOneId(MemberVO mvo) {
		MemberVO data = null;
		conn = JDBCUtil.connect();
		try {
			if (mvo.getmEmail() == null) {
				pstmt = conn.prepareStatement(SELECTONE_IDCHK);
				pstmt.setString(1, mvo.getmId());
			} else {
				pstmt = conn.prepareStatement(SELECTONE_ID);
				pstmt.setString(1, mvo.getmName());
				pstmt.setString(2, mvo.getmEmail());
			}
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				data = new MemberVO();
				data.setmId(rs.getString("MID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(conn, pstmt);
		return data;
	}

	public MemberVO selectOneEmailCHK(MemberVO mvo) {
		MemberVO data = null;
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(SELECTONE_EMAILCHK);
			pstmt.setString(1, mvo.getmEmail());

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				data = new MemberVO();
				data.setmEmail(rs.getString("MEMAIL"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(conn, pstmt);
		return data;
	}

	public MemberVO selectOneFindPw(MemberVO mvo) {
		MemberVO data = null;
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(SELECTONE_EMAIL);
			pstmt.setString(1, mvo.getmId());

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				data = new MemberVO();
				data.setmEmail(rs.getString("MEMAIL"));
				data.setFindPw(rs.getString("FINDPW"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(conn, pstmt);
		return data;
	}

	public boolean update(MemberVO mvo) {
		conn = JDBCUtil.connect();
		try {
			if (mvo.getmTel() == null) {
				pstmt = conn.prepareStatement(UPDATE_PW);
				pstmt.setString(1, mvo.getmPw());
				pstmt.setInt(2, mvo.getmNum());
			} else if (mvo.getmName() == null) {
				pstmt = conn.prepareStatement(UPDATE_USER);
				pstmt.setString(1, mvo.getmPw());
				pstmt.setString(2, mvo.getmEmail());
				pstmt.setString(3, mvo.getmTel());
				pstmt.setString(4, mvo.getZipCode());
				pstmt.setString(5, mvo.getUserAddr());
				pstmt.setString(6, mvo.getDetailAddr());
				pstmt.setInt(7, mvo.getmNum());
			} else {
				pstmt = conn.prepareStatement(UPDATE_ADMIN);
				pstmt.setString(1, mvo.getmPw());
				pstmt.setString(2, mvo.getmName());
				pstmt.setString(3, mvo.getmEmail());
				pstmt.setString(4, mvo.getmTel());
				pstmt.setString(5, mvo.getZipCode());
				pstmt.setString(6, mvo.getUserAddr());
				pstmt.setString(7, mvo.getDetailAddr());
				pstmt.setInt(8, mvo.getmPoint());
				pstmt.setInt(9, mvo.getmNum());
			}

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

	public boolean delete(MemberVO mvo) {
		conn = JDBCUtil.connect();
		try {
			if (mvo.getmPw() == null) {
				pstmt = conn.prepareStatement(DELETE_ADMIN);
				pstmt.setInt(1, mvo.getmNum());
			} else {
				pstmt = conn.prepareStatement(DELETE_USER);
				pstmt.setInt(1, mvo.getmNum());
				pstmt.setString(2, mvo.getmPw());
			}

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
