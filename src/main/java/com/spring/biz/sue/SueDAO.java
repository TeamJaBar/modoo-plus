package com.spring.biz.sue;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
	final String SUE_INSERT = "INSERT INTO SUE (BNUM, MNUM, SCNUM, SDATE, SRESULT) VALUES(?, ?, ?, SYSDATE(), ?)";
	// 신고글 총합
	final String SUE_COUNT = "SELECT COUNT(B.BNUM) AS ACNT, COUNT(CASE WHEN BSTATUS='0' THEN 1 END) AS NCNT, COUNT(CASE WHEN BSTATUS='1' THEN 1 END) AS CCNT FROM MEMBER M,BOARD B,SUE S WHERE M.MNUM = B.MNUM AND B.BNUM = S.BNUM";
	// 신고글 목록
	final String SELECTALL_SUE = "SELECT B.BNUM, B.BTITLE, M.MNAME, M.MIMG, B.BWDATE, B.BSTATUS FROM MEMBER M,BOARD B,SUE S WHERE M.MNUM = B.MNUM AND B.BNUM = S.BNUM ORDER BY B.BNUM DESC";
	// 신고글 내용
	final String SELECTONE_SUE = "SELECT S.BNUM, B.BTITLE,M.MNAME,B.BCONTENT,SC.SCNAME,B.BWDATE,S.SDATE,S.SRESULT FROM BOARD B, SUE S, SUECATEGORY SC, member M WHERE B.BNUM = S.BNUM and S.SCNUM = SC.SCNUM and M.MNUM = B.MNUM";
	// 신고하기

	public boolean insert(SueVO vo) {
		try {
			jdbcTemplate.update(SUE_INSERT, vo.getbNum(), vo.getmNum(), vo.getScNum(), null, vo.getsResult());
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public List<SueVO> selectCount(SueVO vo) {
		return jdbcTemplate.query(SUE_COUNT, new SueRowMapper());
	}

	public List<SueVO> selectAll(SueVO vo) {
		List<SueVO> datas = new ArrayList<SueVO>();
		try {
			datas = jdbcTemplate.query(SELECTALL_SUE, new SueRowMapper());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return datas;
	}

	public boolean selectOne(SueVO vo) {
		try {
			jdbcTemplate.query(SELECTONE_SUE, new SelectOneRowMapper());
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
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
