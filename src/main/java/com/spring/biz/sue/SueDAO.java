package com.spring.biz.sue;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("sueDAO")
public class SueDAO {
	List<SueVO> sue;
	Connection conn;
	PreparedStatement pstmt;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	// 신고하기
	final String INSERT_SUE = "INSERT INTO SUE (BNUM, MNUM, SCNUM, SDATE) VALUES(?, ?, ?, SYSDATE())";
	// 신고 취소
	final String UPDATE_SUE = "UPDATE SUE SET SRESULT=1 WHERE SNUM=?";
	// 신고글 총합
	final String COUNT_SUE = "SELECT COUNT(B.BNUM) AS ACNT, COUNT(CASE WHEN BSTATUS='0' THEN 1 END) AS NCNT, COUNT(CASE WHEN BSTATUS='1' THEN 1 END) AS CCNT FROM MEMBER M,BOARD B,SUE S WHERE M.MNUM = B.MNUM AND B.BNUM = S.BNUM";
	// 신고글 목록
	final String SELECTALL_SUE = "SELECT B.BNUM, B.BTITLE, M.MNAME, M.MIMG, B.BWDATE, B.BSTATUS FROM MEMBER M,BOARD B,SUE S WHERE M.MNUM = B.MNUM AND B.BNUM = S.BNUM ORDER BY B.BNUM DESC";
	// 신고글 내용
	final String SELECTONE_SUE = "SELECT S.BNUM, B.BTITLE, M.MNAME, B.BCONTENT, SC.SCNAME, B.BWDATE, S.SDATE, S.SRESULT FROM BOARD B, SUE S, SUECATEGORY SC, member M WHERE B.BNUM = S.BNUM AND S.SCNUM = SC.SCNUM AND M.MNUM = B.MNUM AND S.BNUM = ?";

	public boolean insertSue(SueVO vo) {
		try {
			jdbcTemplate.update(INSERT_SUE, vo.getbNum(), vo.getmNum(), vo.getScNum());
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean updateSue(SueVO vo) {
		try {
			jdbcTemplate.update(UPDATE_SUE, vo.getsNum());
		} catch (DataAccessException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public List<SueVO> selectCount(SueVO vo) {
		return jdbcTemplate.query(COUNT_SUE, new SueRowMapper());
	}

	public List<SueVO> selectAllSue(SueVO vo) {
		List<SueVO> datas = new ArrayList<SueVO>();
		try {
			datas = jdbcTemplate.query(SELECTALL_SUE, new SueRowMapper());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return datas;
	}

	public SueVO selectOneSue(SueVO vo) {
		try {
			return jdbcTemplate.queryForObject(SELECTONE_SUE, new SelectOneRowMapper(), vo.getbNum());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}

class SueRowMapper implements RowMapper<SueVO> {
	@Override
	public SueVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		SueVO data = new SueVO();
		data.setsNum(rs.getInt("SNUM"));
		data.setbNum(rs.getInt("BNUM"));
		data.setmNum(rs.getInt("MNUM"));
		data.setScNum(rs.getInt("SCNUM"));
		data.setsDate(rs.getDate("SDATE"));
		data.setsResult(rs.getString("SRESULT"));
		data.setbTitle(rs.getString("BTITLE"));
		data.setmName(rs.getString("MNAME"));
		data.setmImg(rs.getString("MIMG"));
		data.setBwDate(rs.getString("BWDATE"));
		data.setbStatus(rs.getString("BSTATUS"));
		data.setbContent(rs.getString("BCONTENT"));
		data.setScName(rs.getString("SCNAME"));
		return data;
	}
}

class SelectOneRowMapper implements RowMapper<SueVO> {
	@Override
	public SueVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		SueVO data = new SueVO();
		data.setbNum(rs.getInt("BNUM"));
		data.setbTitle(rs.getString("BTITLE"));
		data.setmName(rs.getString("MNAME"));
		data.setbContent(rs.getString("BCONTENT"));
		data.setScName(rs.getString("SCNAME"));
		data.setBwDate(rs.getString("BWDATE"));
		data.setsDate(rs.getDate("SDATE"));
		data.setsResult(rs.getString("SRESULT"));
		return data;
	}

}
