package com.spring.biz.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class MemberDAO {
	ArrayList<MemberVO> member;
	Connection conn;
	PreparedStatement pstmt;

	@Autowired
	private JdbcTemplate jdbcTemplate;
	final String INSERT = "INSERT INTO MEMBER (?, ?, ?, ?, ?, 0, ?, ?, ?, SYSDATE, NULL, ?, ?, ?)";
	final String INSERT_KAKAO = "INSERT INTO MEMBER (?, ?, ?, ?, ?, 0, ?, ?, ?, SYSDATE, ?)";
	// final String SELECTONE_LOGIN = "SELECT MNUM, MID, MPW, MNAME, MEMAIL, MTEL,
	// MPOINT, ZIPCODE, USERADDR, DETAILADDR FROM MEMBER WHERE MID=? AND MPW=?";
	final String SELECTONE_LOGIN = "SELECT MNUM, MID, MNAME FROM MEMBER WHERE MID=? AND MPW=?";
	final String SELECTONE_KAKAOCHK = "SELECT KAKAOLOGIN FROM MEMBER WHERE MNUM=?";
	final String SELECTONE_INFO = "SELECT MNUM, MID, MPW, MNAME, MEMAIL, MTEL, MPOINT, ZIPCODE, USERADDR, DETAILADDR, MDATE, SCORE, MSTATUS, MIMG FROM MEMBER WHERE MNUM=?";
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
	// 멤버 상태
	final String UPDATE_STATUS = "UPDATE MEMBER SET MSTATUS=? WHERE MNUM=?";
	// 멤버 포인트
	final String UPDATE_POINT = "UPDATE MEMBER SET MPOINT=? WHERE MNUM=?";
	// 멤버 점수
	final String UPDATE_SCORE = "UPDATE MEMBER SET SCORE=? WHERE MNUM=?";
	// 매칭디테일
	final String SELECTALL_MATCHING = "SELECT M.MNUM, M.MNAME, M.SCORE,B.BRATE, M.MIMG FROM MEMBER M, BOARD B, APPLICANT A WHERE M.MNUM = B.MNUM and A.MNUM = B.MNUM and B.BNUM=? ORDER BY M.MNUM asc";

	public boolean insertMember(MemberVO vo) {
		jdbcTemplate.update(INSERT, vo.getmId(), vo.getmPw(), vo.getmName(), vo.getmEmail(), vo.getmTel(), vo.getmPoint(), vo.getZipCode(), vo.getUserAddr(), vo.getDetailAddr(), vo.getScore(),
				vo.getMstatus(), vo.getmImg());
		return true;
	}

	public boolean updatePw(MemberVO vo) {
		int res = jdbcTemplate.update(UPDATE_PW, vo.getmPw(), vo.getmNum());
		if (res < 1) {
			return false;
		}
		return true;
	}

	public boolean updateUser(MemberVO vo) {
		int res = jdbcTemplate.update(UPDATE_USER, vo.getmPw(), vo.getmEmail(), vo.getmTel(), vo.getZipCode(), vo.getUserAddr(), vo.getDetailAddr(), vo.getmNum());
		if (res < 1) {
			return false;
		}
		return true;
	}

	public boolean updateAdmin(MemberVO vo) {
		int res = jdbcTemplate.update(UPDATE_ADMIN, vo.getmPw(), vo.getmName(), vo.getmEmail(), vo.getmTel(), vo.getZipCode(), vo.getUserAddr(), vo.getDetailAddr(), vo.getmPoint(), vo.getmNum());
		if (res < 1) {
			return false;
		}
		return true;
	}

	public boolean updateStatus(MemberVO vo) {
		int res = jdbcTemplate.update(UPDATE_STATUS, vo.getMstatus(), vo.getmNum());

		if (res < 1) {
			return false;
		}
		return true;
	}

	public boolean updateScore(MemberVO vo) {
		int res = jdbcTemplate.update(UPDATE_SCORE, vo.getScore(), vo.getmNum());

		if (res < 1) {
			return false;
		}
		return true;
	}

	public boolean updatePoint(MemberVO vo) {
		int res = jdbcTemplate.update(UPDATE_POINT, vo.getmPoint(), vo.getmNum());

		if (res < 1) {
			return false;
		}
		return true;
	}

	public boolean deleteAdmin(MemberVO vo) {
		int res = jdbcTemplate.update(DELETE_ADMIN, vo.getmNum());
		if (res < 1) {
			return false;
		}
		return true;
	}

	public boolean deleteUser(MemberVO vo) {
		int res = jdbcTemplate.update(DELETE_USER, vo.getmNum(), vo.getmPw());
		if (res < 1) {
			return false;
		}
		return true;
	}

	public List<MemberVO> selectAll(MemberVO vo) {
		return jdbcTemplate.query(SELECTALL, new MemberRowMapper());
	}

	public List<MemberVO> selectAllMember(MemberVO vo) {
		return jdbcTemplate.query(SELECTALL_MEMBER, new MemberRowMapper());
	}

	public MemberVO selectOneLogin(MemberVO vo) {
		Object[] args = { vo.getmId(), vo.getmPw() };
		return jdbcTemplate.queryForObject(SELECTONE_LOGIN, args, new MemberRowMapper());
	}

	public MemberVO selectOneInfo(MemberVO vo) {
		Object[] args = { vo.getmNum() };
		return jdbcTemplate.queryForObject(SELECTONE_INFO, args, new MemberRowMapper());
	}

	public MemberVO selectOneId(MemberVO vo) {
		Object[] args = { vo.getmName(), vo.getmEmail() };
		return jdbcTemplate.queryForObject(SELECTONE_ID, args, new MemberRowMapper());
	}

	public MemberVO selectOneEmailCHK(MemberVO vo) {
		Object[] args = { vo.getmId() };
		return jdbcTemplate.queryForObject(SELECTONE_IDCHK, args, new MemberRowMapper());
	}

	public MemberVO selectOneFindPw(MemberVO vo) {
		Object[] args = { vo.getmId() };
		return jdbcTemplate.queryForObject(SELECTONE_EMAIL, args, new MemberRowMapper());
	}

	public List<MemberVO> selectAllMatching(MemberVO vo) {
		return jdbcTemplate.query(SELECTALL, new MemberRowMapper());

	}

	class MemberRowMapper implements RowMapper<MemberVO> {

		@Override
		public MemberVO mapRow(ResultSet rs, int rowNum) throws SQLException {
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
			data.setScore(rs.getInt("SCORE"));
			data.setMstatus(rs.getString("DELETE_ADMIN"));
			data.setmImg(rs.getString("DELETE_ADMIN"));
			return data;
		}

	}

}
