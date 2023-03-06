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
	
	//매칭 신청
	private final String INSERT="INSERT INTO APPLICANT(BNUM, MNUM, ACHK) VALUES(?, ?, '0')";
	//마이 페이지 내가 신청한 매칭 신청 취소 
	private final String DELETE="DELETE FROM BOARD WHERE ANUM=?";
	//해당 매치 모든 신청자 목록
	private final String SELECTALL_APPLICANT = "SELECT ANUM, A.MNUM, A.MID, SCORE, MIMG, ACHK FROM MEMBER M, BOARD B, APPLICANT A WHERE A.BNUM = B.BNUM AND A.MNUM=M.MNUM AND B.BNUM=? ORDER BY A.ANUM ASC";
	//나를 제외한 해당 매치 신청자 목록
    private final String SELECTALL_MATCHING = "SELECT ANUM, A.MNUM, A.MID, M.SCORE, M.MIMG, ACHK FROM MEMBER M, BOARD B, APPLICANT A WHERE A.MNUM = M.MNUM AND A.BNUM = B.BNUM AND B.BNUM=? AND A.MNUM !=? ORDER BY A.ANUM ASC";
	//평가 완료
	private final String UPDATE_EVAL = "UPDATE APPLICANT SET ACHK=1 WHERE ANUM=?";
	
	
	public boolean insert(ApplicantVO vo) {
		try {
			jdbcTemplate.update(INSERT, vo.getbNum(),vo.getmNum());
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}	
	
	public List<ApplicantVO> selectAll(ApplicantVO vo){
		List<ApplicantVO> datas = new ArrayList<ApplicantVO>();
		Object[] arg;
		String query;
		try {
			if(vo.getmNum() != 0) {
				query = SELECTALL_MATCHING;
				arg = new Object[] {vo.getbNum(), vo.getmNum()};
			} else {
				query = SELECTALL_APPLICANT;
				arg = new Object[] {vo.getbNum()};
			}
			datas = jdbcTemplate.query(query, arg, new ApplicantRowMapper());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return datas;
	}
	
	public boolean update(ApplicantVO vo) {
		try {
			jdbcTemplate.update(UPDATE_EVAL, vo.getaNum());
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
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
}

class ApplicantRowMapper implements RowMapper<ApplicantVO> {
	@Override
	public ApplicantVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ApplicantVO data = new ApplicantVO();
		data.setaNum(rs.getInt("ANUM"));
		data.setmNum(rs.getInt("MNUM"));
		data.setmId(rs.getString("MID"));
		data.setmImg(rs.getString("MIMG"));
		data.setaChk(rs.getString("ACHK"));
		return data;
	}

}
