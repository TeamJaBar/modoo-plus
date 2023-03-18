package com.spring.biz.member;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("memberDAO")
public class MemberDAO {

	@Autowired
	private JdbcTemplate template;

	final String INSERT = "INSERT INTO MEMBER (MID, MPW, MNAME, MEMAIL, MTEL, ZIPCODE, USERADDR, DETAILADDR, MDATE, KAKAO, MIMG, MPOINT) VALUES(?, ?, ?, ?, ?, ?, ?, ?, SYSDATE(), ?, ?, 0)";
	final String SELECTONE_LOGIN = "SELECT MNUM, MID, MNAME, MIMG, MSTATUS FROM MEMBER WHERE MID=? AND MPW=?";
	final String SELECTONE_KAKAOCHK = "SELECT MNUM, MID, MNAME, MIMG, MSTATUS, KAKAO FROM MEMBER WHERE MEMAIL=?";
	final String SELECTONE_INFO = "SELECT MNUM, MID, MPW, MNAME, MEMAIL, MTEL, MPOINT, ZIPCODE, USERADDR, DETAILADDR, SCORE, MSTATUS, MIMG FROM MEMBER WHERE MNUM=?";
	final String SELECTONE_ID = "SELECT MID FROM MEMBER WHERE MNAME=? AND MEMAIL=?";
	final String SELECTONE_IDCHK = "SELECT MID FROM MEMBER WHERE MID=?";
	final String SELECTONE_EMAIL = "SELECT REPLACE(MEMAIL, SUBSTR(MEMAIL,INSTR4(MEMAIL, '@', 1, 1)-4, 4 ), '****') AS FINDPW, MEMAIL FROM MEMBER WHERE MID=?";
	final String SELECTONE_EMAILCHK = "SELECT MEMAIL FROM MEMBER WHERE MEMAIL=?";
	// 관리자페이지
	final String SELECTALL = "SELECT DATE_FORMAT(MDATE, '%d/%a') AS TDATE, COUNT(*) AS CNT FROM MEMBER GROUP BY DATE_FORMAT(MDATE, '%d/%a') ORDER BY TDATE DESC LIMIT 7";
	// 멤버페이지
	final String SELECTALL_MEMBER = "SELECT * FROM MEMBER ORDER BY MNUM ASC";
	final String UPDATE_USER = "UPDATE MEMBER SET MPW=?, MEMAIL=?, MTEL=?, ZIPCODE=?, USERADDR=?, DETAILADDR=?, MIMG=? WHERE MNUM=?";
	final String UPDATE_ADMIN = "UPDATE MEMBER SET MPW=?, MNAME=?, MEMAIL=?, MTEL=?, ZIPCODE=?, USERADDR=?, DETAILADDR=?, MPOINT=? WHERE MNUM=?";
	final String UPDATE_PW = "UPDATE MEMBER SET MPW=? WHERE MID=?";
	final String DELETE_USER = "DELETE FROM MEMBER WHERE MNUM=? AND MPW=?";
	final String DELETE_ADMIN = "DELETE FROM MEMBER WHERE MNUM=?";
	// 멤버 상태
	final String UPDATE_STATUS = "UPDATE MEMBER SET MSTATUS=? WHERE MNUM=?";
	// 멤버 포인트
	final String UPDATE_POINT = "UPDATE MEMBER SET MPOINT=MPOINT+? WHERE MNUM=?";
	// 멤버 점수
	final String UPDATE_SCORE = "UPDATE MEMBER SET SCORE=SCORE+? WHERE MNUM=?";

	public boolean insert(MemberVO vo) {
		template.update(INSERT, vo.getmId(), vo.getmPw(), vo.getmName(), vo.getmEmail(), vo.getmTel(), vo.getZipCode(), vo.getUserAddr(), vo.getDetailAddr(), vo.getKakao(), vo.getmImg());
		return true;
	}
    
	public boolean update(MemberVO vo) {
		try {
			if(vo.getmId()!=null) {
				template.update(UPDATE_PW, vo.getmPw(), vo.getmId());
			} else if(vo.getmName()!=null){
				template.update(UPDATE_ADMIN, vo.getmPw(), vo.getmName(), vo.getmEmail(), vo.getmTel(), vo.getZipCode(), vo.getUserAddr(), vo.getDetailAddr(), vo.getmPoint(), vo.getmNum());	
			} else if(vo.getmStatus()!=null) {
				template.update(UPDATE_STATUS, vo.getmStatus(), vo.getmNum());
			} else if(vo.getScore()!=0) {
				template.update(UPDATE_SCORE, vo.getScore(), vo.getmNum());
			} else if(vo.getmPoint()!=0 &&vo.getmNum()!=0) {
				template.update(UPDATE_POINT, vo.getmPoint(), vo.getmNum());
			} else {
				template.update(UPDATE_USER, vo.getmPw(), vo.getmEmail(), vo.getmTel(), vo.getZipCode(), vo.getUserAddr(), vo.getDetailAddr(), vo.getmImg(),vo.getmNum());
			}	
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean delete(MemberVO vo) {
		try {
			if(vo.getmPw()!=null) {
				template.update(DELETE_USER, vo.getmNum(), vo.getmPw());
			} else {
				template.update(DELETE_ADMIN, vo.getmNum());
			}
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public MemberVO selectOneMember(MemberVO vo) {
		String query;
		Object[] args;
		try {
			if(vo.getmPw()!=null) {
				args = new Object[] { vo.getmId(), vo.getmPw() };
				query=SELECTONE_LOGIN;
				System.out.println("1");
			} else if(vo.getKakao() != null) {
				args = new Object[] { vo.getmEmail() };
				query=SELECTONE_KAKAOCHK;
				System.out.println("2");
			} else if(vo.getmNum()!=0) {
				args = new Object[]  { vo.getmNum() };
				query=SELECTONE_INFO;
				System.out.println("3");
			} else if(vo.getmName()!=null) {
				args = new Object[] { vo.getmName(), vo.getmEmail() };
				query=SELECTONE_ID;
			} else if(vo.getmEmail()!=null) {
				args = new Object[] { vo.getmEmail() };
				query = SELECTONE_EMAILCHK;
			} else {
				args = new Object[]  { vo.getmId() };
				query=SELECTONE_IDCHK;
			}
			return template.queryForObject(query, args, BeanPropertyRowMapper.newInstance(MemberVO.class));
		}catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//selectOneMember의 SELECTONE_IDCHK와 인자가 같아서 메서드를 따로 생성
	public MemberVO selectOneEmail(MemberVO vo) {
		try {
			return template.queryForObject(SELECTONE_EMAIL, BeanPropertyRowMapper.newInstance(MemberVO.class), vo.getmId());
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	public List<MemberVO> selectAll(MemberVO vo) {
		List<MemberVO> datas = new ArrayList<MemberVO>();
		try {
			datas = template.query(SELECTALL, (rs, rowNum) -> {
				MemberVO tmpData = new MemberVO();
				tmpData.setTempDate(rs.getString("TDATE"));
				tmpData.setTempCnt(rs.getInt("CNT"));
				return tmpData;
			});
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return datas;
	}

	public List<MemberVO> selectAllMember(MemberVO vo) {
		List<MemberVO> datas = new ArrayList<MemberVO>();
		try {
			datas = template.query(SELECTALL_MEMBER, new MemberRowMapper());
		} catch(Exception e) {
			e.printStackTrace();
		}
		return datas;
	}
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
		data.setKakao(rs.getString("KAKAO"));
		return data;
	}
}