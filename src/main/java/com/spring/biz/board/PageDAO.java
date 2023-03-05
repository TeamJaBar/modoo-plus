package com.spring.biz.board;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.spring.biz.member.MemberVO;
import com.spring.biz.sue.SueVO;

@Repository("pageDAO")
public class PageDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	// 전체 게시글
	final String MAIN_PAGE = "SELECT * FROM BOARD ORDER BY BNUM DESC LIMIT ?, ?";
	// 나의 작성글
//	final String MYBOARD_PAGE = "SELECT * FROM BOARD WHERE MNUM=? ORDER BY BNUM DESC LIMIT ?, ?";
	final String MYBOARD_PAGE = "SELECT B.BNUM, BTITLE, BADDRESS, BDATE, BCNT, BACTION, COUNT(*) ACNT FROM BOARD " + "B LEFT JOIN APPLICANT A ON B.BNUM=A.BNUM "
			+ "WHERE B.MNUM=? GROUP BY B.BNUM ORDER BY A.BNUM DESC LIMIT ?, ?";
	// 신고 게시글
//	final String SUE_PAGE = "SELECT * FROM SUE ORDER BY SNUM DESC LIMIT ?, ?";
	final String SUE_PAGE = "SELECT B.BNUM, B.BTITLE, M.MNAME, M.MIMG, B.BWDATE, B.BSTATUS " + "FROM MEMBER M,BOARD B,SUE S WHERE M.MNUM = B.MNUM AND B.BNUM = S.BNUM "
			+ "ORDER BY B.BNUM DESC LIMIT ?, ?";
	// 내가 신청한 매칭글
	final String MYMATCH_PAGE = "SELECT * FROM (SELECT B.BNUM, COUNT(*) ACNT FROM BOARD B "
			+ "LEFT JOIN APPLICANT A ON B.BNUM=A.BNUM GROUP BY B.BNUM) C, "
			+ "(SELECT B.BNUM, BTITLE, BADDRESS, BDATE, BCNT, BACTION FROM BOARD B, APPLICANT A WHERE B.BNUM=A.BNUM AND A.MNUM=?) D "
			+ "WHERE C.BNUM = D.BNUM ORDER BY C.BNUM DESC LIMIT ?, ?";

	// 총 게시글 수
	final String MAIN_COUNT = "select count(*) as total from board";
	// 나의 총 게시글 수
	final String MYPAGE_COUNT = "select count(*) as total from board where mnum=?";
	// 나의 총 매치 수
	final String MYMATCH_COUNT = "select count(*) as total from applicant where mnum=?";
	// 총 신고글 수
	final String SUE_COUNT = "SELECT COUNT(*) AS TOTAL FROM SUE";

	// 현재 페이지에 나타낼 게시글 계산 (ORACLE 문법)
//	final String PRE_PAGE = "select * " 
//							+ "from (select rownum rn," 
//							+ " a.* " 
//							+ "from (select *" 
//							+ " from board order by bnum desc) a ) " 
//							+ "where rn > ? and rn <= ?";


	// 전체 게시글 수
	/*
	 * public int getTotal() {
	 * 
	 * try { conn = ds.getConnection();
	 * 
	 * pstmt = conn.prepareStatement(sql);
	 * 
	 * rs = pstmt.executeQuery();
	 * 
	 * if (rs.next()) { result = rs.getInt("total"); }
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); } finally {
	 * JdbcUtil.close(conn, pstmt, rs); }
	 * 
	 * return result; }
	 */

	// 총 게시글이 몇개인지 (type.1)
//	public int getTotal() {
//		List<PageVO> resPage = jdbcTemplate.query(PAGE_COUNT, new RowMapper<PageVO>() {
//			@Override
//			public PageVO mapRow(ResultSet rs, int rowNum) throws SQLException {
//				PageVO vo = new PageVO();
//				vo.setResTotal(rs.getInt("TOTAL"));
//				return vo;
//			}
//		});
//		int result = 0;
//		try {
//			result = resPage.get(0).getResTotal();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return result;
//	}

	// 총 게시글이 몇개인지 (type.2)
	public int getMainTotal() {
		int count = jdbcTemplate.queryForObject(MAIN_COUNT, Integer.class);
		return count;
	}

	// 총 신고글이 몇개인지
	public int getSueTotal() {
		System.out.println("PageDAO : getSueTotal 실행");
		int count = jdbcTemplate.queryForObject(SUE_COUNT, Integer.class);
		return count;
	}

	// 나의 총 게시글 개수
	public int getMyTotal(MemberVO mvo) {
		int count = jdbcTemplate.queryForObject(MYPAGE_COUNT, Integer.class, mvo.getmNum());
		return count;
	}

	// 나의 총 매치 개수
	public int getMyMatchTotal(MemberVO mvo) {
		int count = jdbcTemplate.queryForObject(MYMATCH_COUNT, Integer.class, mvo.getmNum());
		return count;
	}

	// 각 페이지마다 나와야될 게시글 구간 지정
	//메인 페이지
	public List<BoardVO> getMainList(int pageNum, int amount) {

		List<BoardVO> bList = jdbcTemplate.query(MAIN_PAGE, new RowMapper<BoardVO>() {
			@Override
			public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				BoardVO data = new BoardVO();
				data.setbNum(rs.getInt("BNUM"));
				data.setmNum(rs.getInt("MNUM"));
				data.setbTitle(rs.getString("BTITLE"));
				data.setbRate(rs.getString("BRATE"));
				data.setbCnt(rs.getInt("BCNT"));
				data.setbDate(rs.getTimestamp("BDATE"));
				data.setbLocal(rs.getString("BLOCAL"));
				data.setbAction(rs.getString("BACTION"));
				return data;
			}
		}, (pageNum - 1) * amount, pageNum * amount);
		// 첫번째 물음표 = (현재 페이지 - 1) * 보여줄 게시글 개수
		// 두번째 물음표 = 현재 페이지 * 보여줄 게시글 개수
		return bList;
	}

	//신고글 페이지
	public List<SueVO> getSueList(int pageNum, int amount) {
		System.out.println("PageDAO : getSueList 실행");

		List<SueVO> sList = jdbcTemplate.query(SUE_PAGE, new RowMapper<SueVO>() {
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
		}, (pageNum - 1) * amount, pageNum * amount);
		// 첫번째 물음표 = (현재 페이지 - 1) * 보여줄 게시글 개수
		// 두번째 물음표 = 현재 페이지 * 보여줄 게시글 개수
		return sList;
	}

	//내가 작성글 페이지
	public List<BoardVO> getMyList(int pageNum, int amount) {

		List<BoardVO> bList = jdbcTemplate.query(MYBOARD_PAGE, new RowMapper<BoardVO>() {
			@Override
			public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				BoardVO tmpData = new BoardVO();
				tmpData.setbNum(rs.getInt("BNUM"));
				tmpData.setbTitle(rs.getString("BTITLE"));
				tmpData.setbAddress(rs.getString("BADDRESS"));
				tmpData.setbDate(rs.getTimestamp("BDATE"));
				tmpData.setaCnt(rs.getInt("ACNT"));
				tmpData.setbCnt(rs.getInt("BCNT"));
				tmpData.setbAction(rs.getString("BACTION"));
				return tmpData;
			}
		}, (pageNum - 1) * amount, pageNum * amount);
		// 첫번째 물음표 = (현재 페이지 - 1) * 보여줄 게시글 개수
		// 두번째 물음표 = 현재 페이지 * 보여줄 게시글 개수
		return bList;
	}
	
	//내가 매칭한 글 페이지
	public List<BoardVO> getMyMatchList(int pageNum, int amount) {

		List<BoardVO> bList = jdbcTemplate.query(MYBOARD_PAGE, new RowMapper<BoardVO>() {
			@Override
			public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				BoardVO tmpData= new BoardVO();
				tmpData.setbNum(rs.getInt("BNUM"));
				tmpData.setbTitle(rs.getString("BTITLE"));
				tmpData.setbAddress(rs.getString("BADDRESS"));
				tmpData.setbDate(rs.getTimestamp("BDATE"));
				tmpData.setaCnt(rs.getInt("ACNT"));
				tmpData.setbCnt(rs.getInt("BCNT"));
				tmpData.setbAction(rs.getString("BACTION"));
				return tmpData;
			}
		}, (pageNum - 1) * amount, pageNum * amount);
		// 첫번째 물음표 = (현재 페이지 - 1) * 보여줄 게시글 개수
		// 두번째 물음표 = 현재 페이지 * 보여줄 게시글 개수
		return bList;
	}
}
