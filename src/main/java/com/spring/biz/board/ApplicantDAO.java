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

import com.spring.biz.member.DibVO;


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
	private final String DELETE="DELECT FROM BOARD WHERE ANUM=?";
	
	public boolean insert(ApplicantVO vo) {
		jdbcTemplate.update(INSERT, vo.getbNum(),vo.getmNum());
		return true;
	}	
	public List<ApplicantVO> selectAll(ApplicantVO vo){
		return jdbcTemplate.query(SELECTALL_ACTION, new ApplicantRowMapper());
	}
	
	public ApplicantVO selectOne(ApplicantVO vo) {
		Object[] args= {vo.getaNum()};
		return jdbcTemplate.queryForObject(SELECTONE,args,new SelectOneRowMapper());
	}
	public boolean delete(ApplicantVO vo) {
		jdbcTemplate.update(DELETE, vo.getaNum());
		return true;
	}
	
	class ApplicantRowMapper implements RowMapper<ApplicantVO> {
		@Override
		public ApplicantVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			ApplicantVO data = new ApplicantVO();
			data.setbNum(rs.getInt("BNUM"));
			data.setmNum(rs.getInt("MNUM"));
			data.setAchk(rs.getString("ACHK"));
			data.setaNum(rs.getInt("ANUM"));
			data.setmName(rs.getString("MNAME"));
			data.setmImg(rs.getString("MIMG"));
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
	
}
