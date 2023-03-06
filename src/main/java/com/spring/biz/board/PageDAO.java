package com.spring.biz.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("pageDAO")
public class PageDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	// 나의 총 게시글 수
	private final String MYPAGE_COUNT = "SELECT COUNT(*) AS TOTAL FROM BOARD WHERE MNUM=?";
	// 나의 총 매치 수
	private final String MYMATCH_COUNT = "SELECT COUNT(*) AS TOTAL FROM APPLICANT WHERE MNUM=?";
	// 총 신고글 수
	private final String SUE_COUNT = "SELECT COUNT(*) AS TOTAL FROM SUE";
	
	// 마이 페이지 내가 작성한 글 목록
	private final String SQL_SELECTALL_MYBOARD = "SELECT B.BNUM, BTITLE, BADDRESS, BDATE, BCNT, BACTION, COUNT(*) ACNT FROM BOARD B LEFT JOIN APPLICANT A ON B.BNUM=A.BNUM WHERE B.MNUM=? GROUP BY B.BNUM ORDER BY B.BNUM ASC LIMIT ?,?";
	// 마이 페이지 내가 신청한 매칭 목록
	private final String SQL_SELECTALL_MYMATCH = "SELECT * FROM (SELECT B.BNUM, COUNT(*) ACNT FROM BOARD B LEFT JOIN APPLICANT A ON B.BNUM=A.BNUM GROUP BY B.BNUM) C, (SELECT A.ANUM, A.ACHK, B.BNUM, BTITLE, BADDRESS, BDATE, BCNT, BACTION FROM BOARD B, APPLICANT A WHERE B.BNUM=A.BNUM AND A.MNUM=?) D WHERE C.BNUM = D.BNUM ORDER BY C.BNUM ASC LIMIT ?,?";

	// 총 신고글이 몇개인지
	public int getSueTotal() {
		System.out.println("PageDAO : getSueTotal 실행");
		return jdbcTemplate.queryForObject(SUE_COUNT, Integer.class);
	}

	// 나의 총 게시글 개수
	public int getMyTotal(BoardVO bvo) {
		return jdbcTemplate.queryForObject(MYPAGE_COUNT, Integer.class, bvo.getmNum());
	}

	// 나의 총 매치 개수
	public int getMyMatchTotal(BoardVO bvo) {
		return jdbcTemplate.queryForObject(MYMATCH_COUNT, Integer.class, bvo.getmNum());
	}
	
	public List<BoardVO> selectAllMyBoard(BoardVO bvo) {
		List<BoardVO> datas=new ArrayList<BoardVO>();
		try {
			//마이페이지 - 내가 작성한 글 목록
				datas = jdbcTemplate.query(SQL_SELECTALL_MYBOARD, (rs, rowNum)->{
					BoardVO tmpData= new BoardVO();
					tmpData.setbNum(rs.getInt("BNUM"));
					tmpData.setbTitle(rs.getString("BTITLE"));
					tmpData.setbAddress(rs.getString("BADDRESS"));
					tmpData.setbDate(rs.getTimestamp("BDATE"));
					tmpData.setaCnt(rs.getInt("ACNT"));
					tmpData.setbCnt(rs.getInt("BCNT"));
					tmpData.setbAction(rs.getString("BACTION"));
					return tmpData;
				}, bvo.getmNum(), (bvo.getPageNum() - 1) * bvo.getAmount(), bvo.getAmount());
		} catch(Exception e) {
			e.printStackTrace();
		}
		return datas;
	}
	
	public List<BoardVO> selectAllMatch(BoardVO bvo){
		List<BoardVO> datas=new ArrayList<BoardVO>();
		try {
				datas= jdbcTemplate.query(SQL_SELECTALL_MYMATCH, (rs, rowNum)->{
					BoardVO tmpData= new BoardVO();
					tmpData.setaNum(rs.getInt("ANUM"));
					tmpData.setaChk(rs.getString("ACHK"));
					tmpData.setbNum(rs.getInt("BNUM"));
					tmpData.setbTitle(rs.getString("BTITLE"));
					tmpData.setbAddress(rs.getString("BADDRESS"));
					tmpData.setbDate(rs.getTimestamp("BDATE"));
					tmpData.setaCnt(rs.getInt("ACNT"));
					tmpData.setbCnt(rs.getInt("BCNT"));
					tmpData.setbAction(rs.getString("BACTION"));
					return tmpData;
				}, bvo.getmNum(), (bvo.getPageNum() - 1) * bvo.getAmount(), bvo.getAmount());
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return datas;
	}
}
