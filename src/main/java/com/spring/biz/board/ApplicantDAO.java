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
	private final String INSERT="INSERT INTO APPLICANT (BNUM, MNUM) VALUES(?, ?)";
	//마이 페이지 내가 신청한 매칭 신청 취소 
	private final String DELETE="DELETE FROM APPLICANT WHERE ANUM=?";
	//해당 매치 모든 신청자 목록
	private final String SELECTALL_APPLICANT = "SELECT ANUM, A.MNUM, M.MID, SCORE, MIMG, ACHK FROM MEMBER M, BOARD B, APPLICANT A WHERE A.BNUM = B.BNUM AND A.MNUM=M.MNUM AND B.BNUM=? ORDER BY A.ANUM ASC";
	//나를 제외한 해당 매치 신청자 목록
    private final String SELECTALL_MATCHING = "SELECT ANUM, A.MNUM, M.MID, M.SCORE, M.MIMG, ACHK FROM MEMBER M, BOARD B, APPLICANT A WHERE A.MNUM = M.MNUM AND A.BNUM = B.BNUM AND B.BNUM=? AND A.MNUM !=? ORDER BY A.ANUM ASC";
	//평가 완료
	private final String UPDATE_EVAL = "UPDATE APPLICANT SET ACHK=1 WHERE ANUM=?";
	
	// 차단된 BOARD에 대한 모든 APPLICANT 삭제 (회원정지, 게시글 블락)
	private final String DELETE_SUED = "DELETE A FROM APPLICANT A JOIN BOARD B ON A.BNUM=B.BNUM WHERE NOW()<=B.BDATE AND B.BNUM=?";
	// 정지당한 회원이 신청한 모든 APPLICANT 삭제 (회원정지)
	private final String DELETE_PAUSED_APPLI = "DELETE A FROM APPLICANT A JOIN BOARD B ON A.MNUM=B.MNUM WHERE NOW()<=B.BDATE AND B.MNUM=?";
	// 정지당한 회원이 작성한 모든 BOARD에 대한 APPLICANT 삭제 (회원정지)
	private final String DELETE_PAUSED_BOARD = "DELETE A FROM APPLICANT A JOIN BOARD B ON A.BNUM=B.BNUM WHERE NOW()<=B.BDATE AND B.MNUM=?";
	
	public boolean insertApplicant(ApplicantVO vo) {
		try {
			jdbcTemplate.update(INSERT, vo.getbNum(),vo.getmNum());
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}	
	
	public List<ApplicantVO> selectAllApplicant(ApplicantVO vo){
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
	
	public boolean updateApplicant(ApplicantVO vo) {
		try {
			jdbcTemplate.update(UPDATE_EVAL, vo.getaNum());
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean deleteApplicant(ApplicantVO vo) {
		try {
			if (vo.getaNum() != 0) {
				jdbcTemplate.update(DELETE, vo.getaNum());
			} else if (vo.getbNum() != 0) { // 순서 변경 X
				jdbcTemplate.update(DELETE_SUED, vo.getbNum());
			} else if (vo.getmNum() != 0) { // 순서 변경 X
				jdbcTemplate.update(DELETE_PAUSED_APPLI, vo.getmNum());
				jdbcTemplate.update(DELETE_PAUSED_BOARD, vo.getmNum());
			}
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
		data.setScore(rs.getInt("SCORE"));
		return data;
	}

}
