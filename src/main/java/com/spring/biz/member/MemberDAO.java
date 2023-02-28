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
	private JdbcTemplate template;

	final String INSERT = "INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MTEL, ZIPCODE, USERADDR, DETAILADDR, MDATE, KAKAOLOGIN, MIMG) VALUES(?, ?, ?, ?, ?, ?, ?, ?, SYSDATE(), NULL, ?)";
	final String INSERT_KAKAO = "INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MTEL, ZIPCODE, USERADDR, DETAILADDR, MDATE, KAKAOLOGIN, MIMG) VALUES(?, ?, ?, ?, ?, ?, ?, ?, SYSDATE(), ?, ?)";
	// final String SELECTONE_LOGIN = "SELECT MNUM, MID, MPW, MNAME, MEMAIL, MTEL,
	// MPOINT, ZIPCODE, USERADDR, DETAILADDR FROM MEMBER WHERE MID=? AND MPW=?";
	final String SELECTONE_LOGIN = "SELECT MNUM, MID, MNAME FROM MEMBER WHERE MID=? AND MPW=?";
	final String SELECTONE_KAKAOCHK = "SELECT KAKAOLOGIN FROM MEMBER WHERE MNUM=?";
	final String SELECTONE_INFO = "SELECT MNUM, MID, MPW, MNAME, MEMAIL, MTEL, MPOINT, ZIPCODE, USERADDR, DETAILADDR, SCORE, MSTATUS, MIMG FROM MEMBER WHERE MNUM=?";
	final String SELECTONE_ID = "SELECT MID FROM MEMBER WHERE MNAME=? AND MEMAIL=?";
	final String SELECTONE_IDCHK = "SELECT MID FROM MEMBER WHERE MID=?";
	final String SELECTONE_EMAIL = "SELECT REPLACE(MEMAIL, SUBSTR(MEMAIL,INSTR4(MEMAIL, '@', 1, 1)-4, 4 ), '****') AS FINDPW, MEMAIL FROM MEMBER WHERE MID=?";
	final String SELECTONE_EMAILCHK = "SELECT MEMAIL FROM MEMBER WHERE MEMAIL=?";
	// 관리자페이지
	final String SELECTALL = "SELECT DATE_FORMAT(MDATE, '%d/%a') AS TDATE, COUNT(*) AS CNT FROM MEMBER GROUP BY DATE_FORMAT(MDATE, '%d/%a') ORDER BY TDATE DESC LIMIT 7";
	// 멤버페이지
	final String SELECTALL_MEMBER = "SELECT * FROM MEMBER ORDER BY MNUM ASC";
	final String UPDATE_USER = "UPDATE MEMBER SET MPW=?, MEMAIL=?, MTEL=?, ZIPCODE=?, USERADDR=?, DETAILADDR=? WHERE MNUM=?";
	final String UPDATE_ADMIN = "UPDATE MEMBER SET MPW=?, MNAME=?, MEMAIL=?, MTEL=?, ZIPCODE=?, USERADDR=?, DETAILADDR=?, MPOINT=? WHERE MNUM=?";
	final String UPDATE_PW = "UPDATE MEMBER SET MPW=? WHERE MID=?";
	final String DELETE_USER = "DELETE FROM MEMBER WHERE MNUM=? AND MPW=?";
	final String DELETE_ADMIN = "DELETE FROM MEMBER WHERE MNUM=?";
	// 멤버 상태
	final String UPDATE_STATUS = "UPDATE MEMBER SET MSTATUS=? WHERE MNUM=?";
	// 멤버 포인트
	final String UPDATE_POINT = "UPDATE MEMBER SET MPOINT=? WHERE MNUM=?";
	// 멤버 점수
	final String UPDATE_SCORE = "UPDATE MEMBER SET SCORE=? WHERE MNUM=?";
	// 매칭디테일
	final String SELECTALL_MATCHING = "SELECT M.MNUM, M.MNAME, M.SCORE,B.BRATE, M.MIMG FROM MEMBER M, BOARD B, APPLICANT A WHERE M.MNUM = B.MNUM AND A.MNUM = B.MNUM AND B.BNUM=? ORDER BY M.MNUM ASC";

	
	
	
	public boolean insertMember(MemberVO vo) {
		template.update(INSERT, vo.getmId(), vo.getmPw(), vo.getmName(), vo.getmEmail(), vo.getmTel(), vo.getmPoint(), vo.getZipCode(), vo.getUserAddr(), vo.getDetailAddr(), vo.getScore(),
				vo.getMstatus(), vo.getmImg());
		return true;
	}
    
	public boolean updateMember(MemberVO vo) {
		try {
	if(vo.getmId()!=null) {
		template.update(UPDATE_PW, vo.getmPw(), vo.getmId());
	}else if(vo.getmName()!=null){
		template.update(UPDATE_ADMIN, vo.getmPw(), vo.getmName(), vo.getmEmail(), vo.getmTel(), vo.getZipCode(),
				vo.getUserAddr(), vo.getDetailAddr(), vo.getmPoint(), vo.getmNum());	
	}else if(vo.getMstatus()!=null) {
		template.update(UPDATE_STATUS, vo.getMstatus(), vo.getmNum());
	}else if(vo.getScore()!=0) {
		template.update(UPDATE_SCORE, vo.getScore(), vo.getmNum());
	}else if(vo.getmPoint()!=0 &&vo.getmNum()!=0) {
		template.update(UPDATE_POINT, vo.getmPoint(), vo.getmNum());
	}else {
		template.update(UPDATE_USER, vo.getmPw(), vo.getmEmail(), vo.getmTel(),
		vo.getZipCode(), vo.getUserAddr(), vo.getDetailAddr(), vo.getmNum());
	}	
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean deleteMember(MemberVO vo) {
		try {
		if(vo.getmPw()!=null) {
			template.update(DELETE_USER, vo.getmNum(), vo.getmPw());
		}else {
			template.update(DELETE_ADMIN, vo.getmNum());
		}
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
		
	}

	public MemberVO selectOneMember(MemberVO vo) {
		try {
		if(vo.getmPw()!=null) {
		Object[] args = { vo.getmId(), vo.getmPw() };
		return template.queryForObject(SELECTONE_LOGIN, args, new MemberRowMapper());
		}else if(vo.getmNum()!=0) {
			Object[] args = { vo.getmNum() };
		return template.queryForObject(SELECTONE_INFO, args, new MemberRowMapper());
		}else if(vo.getmName()!=null && vo.getmEmail()!=null) {
			Object[] args = { vo.getmName(), vo.getmEmail() };
		return template.queryForObject(SELECTONE_ID, args, new MemberRowMapper());
		}else {
			Object[] args = { vo.getmId() };
		return template.queryForObject(SELECTONE_IDCHK, args, new MemberRowMapper());
		}
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	//selectOneMember의 SELECTONE_IDCHK와 인자가 같아서 메서드를 따로 생성
	public MemberVO selectOneEmailCHK(MemberVO vo) {
		Object[] args = { vo.getmId() };
		return template.queryForObject(SELECTONE_IDCHK, args, new MemberRowMapper());
	}
	
	
	public List<MemberVO> selectAll(MemberVO vo) {
		return template.query(SELECTALL, new MemberRowMapper());
	}

	public List<MemberVO> selectAllMember(MemberVO vo) {
		return template.query(SELECTALL_MEMBER, new MemberRowMapper());
	}
	
	public List<MemberVO> selectAllMatching(MemberVO vo) {
		return template.query(SELECTALL, new MemberRowMapper());

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
