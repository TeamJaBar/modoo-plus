package com.spring.biz.sue;

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
	@Autowired
	private JdbcTemplate jdbcTemplate;

	// 신고하기
	final String INSERT_SUE = "INSERT INTO SUE (BNUM, MNUM, SCNUM, SDATE) VALUES(?, ?, ?, SYSDATE())";
	// 신고 취소
	final String UPDATE_SUE = "UPDATE SUE SET SRESULT=1 WHERE SNUM=?";
	// 신고글 총합
	final String COUNT_SUE = "SELECT COUNT(B.BNUM) AS ACNT, COUNT(CASE WHEN BSTATUS='0' THEN 1 END) AS NCNT, COUNT(CASE WHEN BSTATUS='1' THEN 1 END) AS CCNT FROM MEMBER M,BOARD B,SUE S WHERE M.MNUM = B.MNUM AND B.BNUM = S.BNUM";
	// 신고글 목록
	final String SELECTALL_SUE = "SELECT S.SNUM, S.MNUM, B.BNUM, B.BTITLE, M.MID, M.MIMG, B.BWDATE, B.BSTATUS FROM MEMBER M,BOARD B,SUE S WHERE M.MNUM = B.MNUM AND B.BNUM = S.BNUM ORDER BY B.BNUM DESC";
	// 신고글 내용
	final String SELECTONE_SUE = "SELECT S.BNUM, B.BTITLE, M.MID, B.BCONTENT, SC.SCNAME, B.BWDATE, S.SDATE, S.SRESULT FROM BOARD B, SUE S, SUECATEGORY SC, member M WHERE B.BNUM = S.BNUM AND S.SCNUM = SC.SCNUM AND M.MNUM = B.MNUM AND S.BNUM = ?";
	// 신고하기 카테고리
	final String SELECTALL_SUECA = "SELECT * FROM SUECATEGORY";

	public boolean insertSue(SueVO svo) {
		try {
			jdbcTemplate.update(INSERT_SUE, svo.getbNum(), svo.getmNum(), svo.getScNum(), svo.getsDate());
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean updateSue(SueVO svo) {
		try {
			jdbcTemplate.update(UPDATE_SUE, svo.getsNum());
		} catch (DataAccessException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public List<SueCategoryVO> selectAllSueCa(SueCategoryVO svo) {
		List<SueCategoryVO> datas = new ArrayList<SueCategoryVO>();
		try {
			datas = jdbcTemplate.query(SELECTALL_SUECA, (rs, rowNum) -> {
				SueCategoryVO tmpData = new SueCategoryVO();
				tmpData.setScNum(rs.getInt("SCNUM"));
				tmpData.setScName(rs.getString("SCNAME"));
				return tmpData;
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
		return datas;
	}

	public SueVO selectCount(SueVO svo) {
		return jdbcTemplate.queryForObject(COUNT_SUE, new SueCountRowMapper());
	}

	public List<SueVO> selectAllSue(SueVO svo) {
		List<SueVO> datas = new ArrayList<SueVO>();
		try {
			datas = jdbcTemplate.query(SELECTALL_SUE, new SueRowMapper());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return datas;
	}

	public SueVO selectOneSue(SueVO svo) {
		try {
			return jdbcTemplate.queryForObject(SELECTONE_SUE, new SelectOneRowMapper(), svo.getbNum());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}

class SueCountRowMapper implements RowMapper<SueVO> {
	@Override
	public SueVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		SueVO data = new SueVO();
		data.setaCnt(rs.getInt("ACNT"));
		data.setnCnt(rs.getInt("NCNT"));
		data.setcCnt(rs.getInt("CCNT"));
		return data;
	}
}

class SueRowMapper implements RowMapper<SueVO> {
	@Override
	public SueVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		SueVO data = new SueVO();
		data.setsNum(rs.getInt("SNUM"));
		data.setbNum(rs.getInt("BNUM"));
		data.setmNum(rs.getInt("MNUM"));
		data.setbTitle(rs.getString("BTITLE"));
		data.setmId(rs.getString("MID"));
		data.setmImg(rs.getString("MIMG"));
		data.setbWdate(rs.getTimestamp("BWDATE"));
		data.setbStatus(rs.getString("BSTATUS"));
		return data;
	}
}

class SelectOneRowMapper implements RowMapper<SueVO> {
	@Override
	public SueVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		SueVO data = new SueVO();
		data.setbNum(rs.getInt("BNUM"));
		data.setbTitle(rs.getString("BTITLE"));
		data.setmId(rs.getString("MID"));
		data.setbContent(rs.getString("BCONTENT"));
		data.setsCname(rs.getString("SCNAME"));
		data.setbWdate(rs.getTimestamp("BWDATE"));
		data.setsDate(rs.getTimestamp("SDATE"));
		data.setsResult(rs.getString("SRESULT"));
		return data;
	}

}
