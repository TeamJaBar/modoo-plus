package com.spring.biz.board;

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


@Repository("applicantDAO")
public class ApplicantDAO {
	ArrayList<ApplicantVO> applicant;
	Connection conn;
	PreparedStatement pstmt;

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//마이 페이지 내가 신청한 매칭
	private final String INSERT="INSERT INTO APPLICANT (BNUM, MNUM, ACHK) VALUES(?, ?, '0')";
	//평가하기 눌렀을 때 나오는 SELECTALL
	private final String SELECTALL_ACTION="SELECT A.MNUM, MNAME, MIMG ACHK FROM APPLICANT A LEFT JOIN `member` m ON A.MNUM =M.MNUM WHERE ACHK = 0 ORDER BY ANUM ASC";
	//MVP 평가할 SELECTONE
	private final String SELECTONE="SELECT A.MNUM, MNAME, MIMG ACHK FROM APPLICANT A LEFT JOIN `member` m ON A.MNUM = M.MNUM WHERE ACHK = 0 AND ANUM=?";
	//마이 페이지 내가 신청한 매칭 신청 취소 
	private final String DELETE="DELETE FROM BOARD WHERE ANUM=?";
	//해당 매치 모든 신청자 목록
	private final String SELECTALL_APPLICANT = "SELECT ANUM, A.MNUM, MID, SCORE, MIMG FROM MEMBER M, BOARD B, APPLICANT A WHERE A.BNUM = B.BNUM AND A.MNUM=M.MNUM AND B.BNUM=? ORDER BY M.MNUM ASC";
	//나를 제외한 해당 매치 신청자 목록
    private final String SELECTALL_MATCHING = "SELECT ANUM, M.MNUM, M.MID, M.SCORE, M.MIMG FROM MEMBER M, BOARD B, APPLICANT A WHERE A.MNUM = M.MNUM AND A.BNUM = B.BNUM AND B.BNUM=? AND A.MNUM !=? ORDER BY M.MNUM asc";
	//평가 완료
	private final String UPDATE_EVAL = "UPDATE MEMBER M, APPLICANT A set A.ACHK =1 where M.MNUM = A.MNUM;";
	
	
	public boolean insert(ApplicantVO vo) {
		try {
		jdbcTemplate.update(INSERT, vo.getbNum(),vo.getmNum());
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}	
	
	public List<ApplicantVO> selectAllAction(ApplicantVO vo){
		List<ApplicantVO> datas = new ArrayList<ApplicantVO>();
		try {
		datas = jdbcTemplate.query(SELECTALL_ACTION, new ApplicantActionRowMapper());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return datas;
		}
	
	public List<ApplicantVO> selectAllApplicant(ApplicantVO vo){
		List<ApplicantVO> datas = new ArrayList<ApplicantVO>();
		try {
		datas = jdbcTemplate.query(SELECTALL_APPLICANT, new ApplicantSelectAllRowMapper());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return datas;
	}
	
	public List<ApplicantVO> selectAllMatching(ApplicantVO vo){
		List<ApplicantVO> datas = new ArrayList<ApplicantVO>();
		try {
		datas = jdbcTemplate.query(SELECTALL_MATCHING, new ApplicantMatchingRowMapper());
		} catch(Exception e) {
			e.printStackTrace();
		}
		return datas;
	}
	
	public ApplicantVO selectOne(ApplicantVO vo) {
		Object[] args= {vo.getaNum()};
		try {
		return jdbcTemplate.queryForObject(SELECTONE,args,new SelectOneRowMapper());
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean delete(ApplicantVO vo) {
		try {
		jdbcTemplate.update(DELETE, vo.getaNum());
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean update(ApplicantVO vo) {
		try {
			jdbcTemplate.update(UPDATE_EVAL, vo.getAchk(), vo.getmNum());
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	
}



class ApplicantMatchingRowMapper implements RowMapper<ApplicantVO>{
	@Override
	public ApplicantVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ApplicantVO data = new ApplicantVO();
		data.setaNum(rs.getInt("ANUM"));
		data.setmNum(rs.getInt("MNUM"));
		data.setmId(rs.getString("MID"));
		data.setScore(rs.getInt("SCORE"));
		data.setmImg(rs.getString("MIMG"));
		return data;
}
	
}

class ApplicantSelectAllRowMapper implements RowMapper<ApplicantVO>{
	@Override
	public ApplicantVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ApplicantVO data = new ApplicantVO();
		data.setaNum(rs.getInt("ANUM"));
		data.setmNum(rs.getInt("MNUM"));
		data.setmId(rs.getString("MID"));
		data.setScore(rs.getInt("SCORE"));
		data.setmImg(rs.getString("MIMG"));
		return data;
	}
}

class ApplicantActionRowMapper implements RowMapper<ApplicantVO> {
	@Override
	public ApplicantVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ApplicantVO data = new ApplicantVO();
		data.setmNum(rs.getInt("MNUM"));
		data.setmName(rs.getString("MNAME"));
		data.setaNum(rs.getInt("ANUM"));
		data.setAchk(rs.getString("ACHK"));
		return data;
	}

}


class SelectOneRowMapper implements RowMapper<ApplicantVO> {
	@Override
	public ApplicantVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ApplicantVO data = new ApplicantVO();
		data.setmNum(rs.getInt("MNUM"));
		data.setmName(rs.getString("MNAME"));
		data.setmImg(rs.getString("MIMG"));
		data.setAchk(rs.getString("ACHK"));
		return data;
		
	}

}
