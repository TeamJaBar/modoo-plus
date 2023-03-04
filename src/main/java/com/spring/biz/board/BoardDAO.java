package com.spring.biz.board;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("boardDAO")
public class BoardDAO {
	@Autowired // 메모리에 있는 jdbcTemplate 객체 넣어주는 어노테이션
	private JdbcTemplate jdbcTemplate;

	private final String SQL_INSERT = "INSERT INTO BOARD (BTITLE, BCONTENT, BRATE, BCNT, BDATE, BWDATE, BSTATUS, BLATITUDE, BLONGITUDE, BLOCAL) VALUES(?,?,?,?,SYSDATE(),SYSDATE(),0,?,?,?)";
	private final String SQL_UPDATE = "UPDATE BOARD SET BTITLE=?, BCONTENT=? BRATE=?, BCNT=?, BDATE=?, BCDATE=SYSDATE(), BLATITUDE=?, BLONGITUDE=? WHERE BNUM =?";
	private final String SQL_UPDATE_BACTION = "UPDATE BOARD SET BACTION=? WHERE BNUM=?";
	private final String SQL_DELETE = "DELETE FROM BOARD WHERE BNUM=?";
	// 등록순
	private final String SQL_SELECTALL_REGISTER = "SELECT * FROM (SELECT BNUM, MNUM, BTITLE, BRATE, BCNT, BDATE, BLOCAL, BACTION FROM BOARD WHERE BACTION=0 ORDER BY BWDATE ASC) AS A"
			+ "UNION ALL"
			+ "SELECT * FROM (SELECT BNUM, MNUM, BTITLE, BRATE, BCNT, BDATE, BLOCAL, BACTION FROM BOARD WHERE BACTION=1 ORDER BY BWDATE ASC) AS B";
	// 시합 날짜순
	private final String SQL_SELECTALL_MATCH = "SELECT * FROM (SELECT BNUM, MNUM, BTITLE, BRATE, BCNT, BDATE, BLOCAL, BACTION FROM BOARD WHERE BACTION=0 ORDER BY BDATE ASC) AS A"
			+ "UNION ALL"
			+ "SELECT * FROM (SELECT BNUM, MNUM, BTITLE, BRATE, BCNT, BDATE, BLOCAL, BACTION FROM BOARD WHERE BACTION=1 ORDER BY BDATE ASC) AS B";
	// 지역 선택
	private final String SQL_SELECTALL_AREA = "SELCT * FROM BOARD WHERE BLOCAL=? ORDER BY BDATE ASC";
	// 날짜 선택
	private final String SQL_SELECTALL_DATE = "SELECT * FROM (SELECT * FROM (SELECT BNUM, MNUM, BTITLE, BRATE, BCNT, BDATE, BLOCAL, BACTION FROM BOARD WHERE BACTION=0 ORDER BY BDATE ASC) AS A"
			+ "SELECT * FROM (SELECT BNUM, MNUM, BTITLE, BRATE, BCNT, BDATE, BLOCAL, BACTION FROM BOARD WHERE BACTION=1 ORDER BY BDATE ASC) AS B)AS C"
			+ "WHERE BDATE BETWEEN SYSDATE-? AND SYSDATE-?";
	// 헤더 부분 검색(제목만 가능)
	private final String SQL_SELECTALL_SEARCH = "SELECT * FROM BOARD WHERE BTITLE LIKE concat('%',?,'%')";
	// 글 관리 페이지 상태바
	private final String SQL_SELECTALL_STATUS = "SELECT COUNT(*) AS CNT FROM BOARD WHERE BACTION = ? ORDER BY BDATE ASC";
	// 글 관리 페이지 글 목록
	private final String SQL_SELECTALL_TITLE = "SELECT * FROM board WHERE BACTION =? ORDER BY BDATE ASC LIMIT  0+?,9";
	// 마이 페이지 내가 작성한 글 목록
	private final String SQL_MYBOARD_SELECTALL = "SELECT B.BNUM, BTITLE, BADDRESS, BDATE, BCNT, BACTION, COUNT(*) ACNT FROM BOARD B LEFT JOIN APPLICANT A ON B.BNUM=A.BNUM WHERE B.MNUM=? GROUP BY B.BNUM ORDER BY A.BNUM ASC";
	// 마이 페이지 내가 신청한 매칭 목록
	private final String SQL_SELECTALL = "SELECT B.BNUM, B.MNUM, BTITLE, BADDRESS, BDATE, BACTION FROM BOARD B LEFT JOIN `member` m ON B.MNUM = M.MNUM WHERE BACTION = ?";
	// 마이 페이지 내가 신청한 매칭 목록(프로필 목록)
	private final String SQL_IMG_SELECTALL = "SELECT MIMG FROM MEMBER M, BOARD B, APPLICANT A WHERE A.BNUM = B.BNUM AND A.MNUM=M.MNUM  and B.BNUM=?";

	// 매칭 상세 페이지
	private final String MATCH_SELECTONE = "SELECT BNUM, BTITLE, MNUM, BCONTENT, BRATE, BCNT, BDATE, BLATITUDE, BLONGITUDE, BADDRESS, BACTION from BOARD B where BNUM=?";
	// 매칭 상세 페이지(신청자)
	private final String USER_SELECTALL = "SELECT A.MNUM, MNAME, SCORE, MIMG FROM MEMBER M, BOARD B, APPLICANT A WHERE A.BNUM = B.BNUM AND A.MNUM=M.MNUM  and B.BNUM=? ORDER BY M.MNUM ASC";

	public boolean insertBoard(BoardVO bvo) {
		try {
			System.out.println("BoardDAO의 insert()");
			jdbcTemplate.update(SQL_INSERT, bvo.getbTitle(), bvo.getbContent(), bvo.getbRate(), bvo.getbCnt(),
					bvo.getbDate(), bvo.getbWdate(), bvo.getbStatus(), bvo.getbLatitude(), bvo.getbLongitude(),
					bvo.getbLocal());
		}catch(Exception e){
			return false;
		}
		return true;
	}

	public boolean updateBoard(BoardVO bvo) {
		try {
			System.out.println("BoardDAO의 update()");
			if(bvo.getbAction()==null) {
				jdbcTemplate.update(SQL_UPDATE, bvo.getbTitle(), bvo.getbContent(), bvo.getbRate(), bvo.getbCnt(),
						bvo.getbDate(), bvo.getbCdate(), bvo.getbLatitude(), bvo.getbLongitude(), bvo.getbNum());
			} else {
				jdbcTemplate.update(SQL_UPDATE_BACTION, bvo.getbAction(), bvo.getbNum());
			}
		}catch(Exception e) {
			return false;
		}
		return true;
	}

	public boolean deleteBoard(BoardVO bvo) {
		try {
			System.out.println("BoardDAO의 delete()");
			jdbcTemplate.update(SQL_DELETE, bvo.getbNum());
		}catch(Exception e) {
			return false;
		}
		return true;
	}
	public List<BoardVO> selectAll_Date(BoardVO bvo){
		List<BoardVO> datas = new ArrayList<BoardVO>();
		String query;
		try {
			if(bvo.getbWdate()!=null) {
				query=SQL_SELECTALL_REGISTER;//등록순
			}else {
				query=SQL_SELECTALL_MATCH;//시합날짜순
			}
			datas=jdbcTemplate.query(query, (rs,rowNum) -> {
				BoardVO tmpData= new BoardVO();
				tmpData.setbNum(rs.getInt("BNUM"));
				tmpData.setmNum(rs.getInt("MNUM"));
				tmpData.setbTitle(rs.getString("BTITLE"));
				tmpData.setbRate(rs.getString("BRATE"));
				tmpData.setbCnt(rs.getInt("BCNT"));
				tmpData.setbDate(rs.getTimestamp("BDATE"));
				tmpData.setbLocal(rs.getString("BLOCAL"));
				tmpData.setbAction(rs.getString("BACTION"));
				return tmpData;
			});
		}catch(Exception e) {
			e.printStackTrace();
		}
		return datas;
	}
	public List<BoardVO> selectAll_Seach(BoardVO bvo){
		List<BoardVO> datas=new ArrayList<BoardVO>();
		String query=null;
		Object[] obj=null;
		try {
			if(bvo.getbLocal() != null) {//지역 검색
				query = SQL_SELECTALL_AREA;
				obj = new Object[] {bvo.getbLocal()};
			}
			else if(bvo.getaSerchDate()!= null) {//날짜 검색
				query = SQL_SELECTALL_DATE;
				obj = new Object[] {bvo.getaSerchDate(),bvo.getbSerchDate()};
			}
			else if(bvo.getbTitle()!=null) {//헤더 검색
				query = SQL_SELECTALL_SEARCH;
				obj= new Object[] {bvo.getSearchTitle()};
			}
			datas=jdbcTemplate.query(query, obj,(rs, rowNum)->{
				BoardVO tmpData=new BoardVO();
				tmpData.setbNum(rs.getInt("BNUM"));
				tmpData.setmNum(rs.getInt("MNUM"));
				tmpData.setbTitle(rs.getString("BTITLE"));
				tmpData.setbRate(rs.getString("BRATE"));
				tmpData.setbCnt(rs.getInt("BCNT"));
				tmpData.setbDate(rs.getDate("BDATE"));
				tmpData.setbLocal(rs.getString("BLOCAL"));
				tmpData.setbAction(rs.getString("BACTION"));
				return tmpData;
			});
		}catch(Exception e) {
			e.printStackTrace();
		}
		return datas;
	}
	public List<BoardVO> selectAll_My(BoardVO bvo){
		List<BoardVO> datas=new ArrayList<BoardVO>();
		String query=null;
		Object[] obj=null;
		try {
			if(bvo.getbAction() != null) {//글 상세 페이지 상세바
				query=SQL_SELECTALL_STATUS;
				obj=new Object[] {bvo.getbAction()};
			}
			if(bvo.getSearchAction() != null) {//글 상세 페이지 글 목록
				query=SQL_SELECTALL_TITLE;
				obj=new Object[] {bvo.getSearchAction()};
			}
			datas=jdbcTemplate.query(query, obj, (rs, rowNum)->{
				BoardVO tmpData= new BoardVO();
				tmpData.setbNum(rs.getInt("BNUM"));
				tmpData.setbTitle(rs.getString("BTITLE"));
				tmpData.setbMname(rs.getString("MNAME"));
				tmpData.setbDate(rs.getDate("BDATE"));
				tmpData.setSearchAction(rs.getString("BACTION"));
				return tmpData;
			});
		}catch(Exception e) {
			e.printStackTrace();
		}
		return datas;
	}

	public List<BoardVO> MyBoardSelectAll(BoardVO bvo){
		try {
			Object [] args = {bvo.getmNum()};
			return jdbcTemplate.query(SQL_MYBOARD_SELECTALL, args, (rs, rowNum)->{
				BoardVO tmpData= new BoardVO();
				tmpData.setbNum(rs.getInt("BNUM"));
				tmpData.setbTitle(rs.getString("BTITLE"));
				tmpData.setbAddress(rs.getString("BADDRESS"));
				tmpData.setbDate(rs.getTimestamp("BDATE"));
				tmpData.setaCnt(rs.getInt("ACNT"));
				tmpData.setbCnt(rs.getInt("BCNT"));
				tmpData.setbAction(rs.getString("BACTION"));
				return tmpData;
			});
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<BoardVO> MySelectAll(BoardVO bvo){
		Object [] args = {bvo.getbAction()};
		return jdbcTemplate.query(SQL_SELECTALL, args, new BoardRowMapper());
	}
	public List<BoardVO> ImgSelectAll(BoardVO bvo){//매칭 상세페이지 신청자 프로필
		List<BoardVO> datas=new ArrayList<BoardVO>();
		try {
			datas=jdbcTemplate.query(SQL_IMG_SELECTALL, (rs,rowNum) -> {
				BoardVO tempData=new BoardVO();
				tempData.setbMimg(rs.getString("BMIMG"));
				return tempData;
			},bvo.getbNum());
		}catch(Exception e) {
			e.printStackTrace();
		}
		return datas;
	}
	public List<BoardVO> UserSelectAll(BoardVO bvo){//매칭 상세 페이지(신청자)
		List<BoardVO> datas=new ArrayList<BoardVO>();
		try {
			Object[] args= {bvo.getbNum()};
			datas= jdbcTemplate.query(USER_SELECTALL, args,(rs,rowNum) -> {
				BoardVO temData = new BoardVO();
				temData.setbNum(rs.getInt("BNUM"));
				temData.setmNum(rs.getInt("MNUM"));
				temData.setbMname(rs.getString("MNAME"));
				temData.setbAction(rs.getString("BACTION"));
				temData.setbMscore(rs.getInt("SCORE"));
				temData.setbMimg(rs.getString("MIMG"));
				return temData;
			});
		}catch(Exception e) {
			e.printStackTrace();
		}
		return datas;
	}
	
	public BoardVO selectOne(BoardVO bvo) {
		try {
			return jdbcTemplate.queryForObject(MATCH_SELECTONE, new BoardRowMapper(), bvo.getbNum());
		} catch (Exception e) {
			return null;
		}
	}
}

class BoardRowMapper implements RowMapper<BoardVO> {
	// 스프링에서 제공되는 근본 인터페이스: rowMapper<BoardVO>
	@Override
	public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		BoardVO data = new BoardVO();
		data.setbNum(rs.getInt("bNum"));
		data.setbTitle(rs.getString("bTitle"));
		data.setmNum(rs.getInt("mNum"));
		data.setbContent(rs.getString("bRate"));
		data.setbCnt(rs.getInt("bCnt"));
		data.setbDate(rs.getTime("bDate"));
		data.setbLatitude(rs.getString("bLatitude"));
		data.setbLongitude(rs.getString("bLongitude"));
		data.setbAddress(rs.getString("bAddress"));
		data.setbAction(rs.getString("bAction"));
		return data;
	}

}
