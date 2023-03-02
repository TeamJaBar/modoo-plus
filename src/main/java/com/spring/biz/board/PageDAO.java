package com.spring.biz.board;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.spring.biz.member.MemberVO;

@Repository("pageDAO")
public class PageDAO {
	// 전체 게시글
	final String BOARD_COUNT = "SELECT * FROM BOARD ORDER BY BNUM DESC LIMIT ?, ?";
	// 나의 작성글
	final String MYBOARD_COUNT = "SELECT * FROM BOARD WHERE MNUM=? ORDER BY BNUM DESC LIMIT ?, ?";
	//아직 사용 안하는 곳들
	
	//총 게시글
	final String PAGE_COUNT = "select count(*) as total from board";
	
	//나의 총 게시글 수
	final String MYPAGE_COUNT = "select count(*) as total from board where mnum=?";

	final String PRE_PAGE = "select * " + "from (select rownum rn," + " a.* " + "from (select *" + " from board order by bno desc) a ) " + "where rn > ? and rn <= ?";

	@Autowired
	private JdbcTemplate jdbcTemplate;

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
	public int getTotal() {
		int count = jdbcTemplate.queryForObject(PAGE_COUNT, Integer.class);
		return count;
	}
	
	// 나의 총 게시글 갯수
	public int getMyTotal(MemberVO mvo) {
		int count = jdbcTemplate.queryForObject(PAGE_COUNT, Integer.class ,mvo.getmNum());
		return count;
	}

	
	// 각 페이지마다 나와야될 게시글 구간 지정
	public List<BoardVO> getList(int pageNum, int amount) {
		
		List<BoardVO> bList = jdbcTemplate.query(PRE_PAGE, new RowMapper<BoardVO>() {
			@Override
			public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				BoardVO bvo = new BoardVO();
				bvo.setbNum(rs.getInt("bNum"));
				bvo.setbTitle(rs.getString("bTitle"));
				bvo.setmNum(rs.getInt("mNum"));
				bvo.setbContent(rs.getString("bRate"));
				bvo.setbCnt(rs.getInt("bCnt"));
				bvo.setbDate(rs.getTime("bDate"));
				bvo.setbLatitude(rs.getString("bLatitude"));
				bvo.setbLongitude(rs.getString("bLongitude"));
				bvo.setbAddress(rs.getString("bAddress"));
				bvo.setbAction(rs.getString("bAction"));
				return bvo;
			}
		},(pageNum - 1) * amount , pageNum * amount);
			//첫번째 물음표 = (현재 페이지 - 1) * 보여줄 게시글 개수
			//두번째 물음표 = 현재 페이지 * 보여줄 게시글 개수
		return bList;
	}
}
