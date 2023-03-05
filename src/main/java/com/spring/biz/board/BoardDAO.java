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
			+ " UNION ALL "
			+ "SELECT * FROM (SELECT BNUM, MNUM, BTITLE, BRATE, BCNT, BDATE, BLOCAL, BACTION FROM BOARD WHERE BACTION=1 ORDER BY BWDATE ASC) AS B";
	// 시합 날짜순
	private final String SQL_SELECTALL_MATCH = "SELECT * FROM (SELECT BNUM, MNUM, BTITLE, BRATE, BCNT, BDATE, BLOCAL, BACTION FROM BOARD WHERE BACTION=0 ORDER BY BDATE ASC) AS A"
			+ " UNION ALL "
			+ "SELECT * FROM (SELECT BNUM, MNUM, BTITLE, BRATE, BCNT, BDATE, BLOCAL, BACTION FROM BOARD WHERE BACTION=1 ORDER BY BDATE ASC) AS B";
	// 지역 선택
	private final String SQL_SELECTALL_AREA = "SELCT * FROM BOARD WHERE BLOCAL=? ORDER BY BDATE ASC";
	// 날짜 선택
	private final String SQL_SELECTALL_DATE = "SELECT * FROM (SELECT * FROM (SELECT BNUM, MNUM, BTITLE, BRATE, BCNT, BDATE, BLOCAL, BACTION FROM BOARD WHERE BACTION=0 ORDER BY BDATE ASC) AS A"
			+ "SELECT * FROM (SELECT BNUM, MNUM, BTITLE, BRATE, BCNT, BDATE, BLOCAL, BACTION FROM BOARD WHERE BACTION=1 ORDER BY BDATE ASC) AS B)AS C"
			+ "WHERE BDATE BETWEEN SYSDATE-? AND SYSDATE-?";
	// 헤더 부분 검색(제목만 가능)
	private final String SQL_SELECTALL_SEARCH = "SELECT * FROM BOARD WHERE BTITLE LIKE CONCAT('%',?,'%')";
	
	// 글 관리 페이지 상태별 게시글 개수
	private final String SQL_SELECTALL_ADMIN_CNT = "SELECT COUNT(*) AS CNT FROM BOARD WHERE BACTION = ?";
	//private final String SQL_SELECTALL_ADMIN_CNT = "SELECT BACTION, COUNT(*) AS CNT FROM BOARD GROUP BY BACTION ORDER BY BACTION ASC";
	// 글 관리 페이지 글 목록
	private final String SQL_SELECTALL_ADMIN = "SELECT BNUM, BTITLE, MID, BDATE, BACTION FROM BOARD B JOIN MEMBER M ON B.MNUM=M.MNUM ORDER BY BDATE ASC"; //LIMIT 0+?, 9
	// 글 관리 페이지 글 목록 - 상태별 필터링
	private final String SQL_SELECTALL_ADMIN_STATUS = "SELECT BNUM, BTITLE, MID, BDATE, BACTION FROM BOARD B JOIN MEMBER M ON B.MNUM=M.MNUM WHERE BACTION=? ORDER BY BDATE ASC";
	// 마이 페이지 내가 작성한 글 목록
	private final String SQL_SELECTALL_MYBOARD = "SELECT B.BNUM, BTITLE, BADDRESS, BDATE, BCNT, BACTION, COUNT(*) ACNT FROM BOARD B LEFT JOIN APPLICANT A ON B.BNUM=A.BNUM WHERE B.MNUM=? GROUP BY B.BNUM ORDER BY A.BNUM ASC";
	// 마이 페이지 내가 신청한 매칭 목록
	private final String SQL_SELECTALL_MYMATCH = "SELECT * FROM (SELECT B.BNUM, COUNT(*) ACNT FROM BOARD B LEFT JOIN APPLICANT A ON B.BNUM=A.BNUM GROUP BY B.BNUM) C, (SELECT A.ANUM, A.ACHK, B.BNUM, BTITLE, BADDRESS, BDATE, BCNT, BACTION FROM BOARD B, APPLICANT A WHERE B.BNUM=A.BNUM AND A.MNUM=?) D WHERE C.BNUM = D.BNUM ORDER BY C.BNUM ASC";
	// 마이 페이지 내가 신청한 매칭 페이지 상태별 게시글 개수
	private final String SQL_SELECTALL_MYMATCH_CNT = "SELECT COUNT(*) AS CNT FROM BOARD B JOIN APPLICANT A ON B.BNUM=A.BNUM WHERE A.MNUM=? AND BACTION=?";
	/*private final String SQL_SELECTALL_MYMATCH_CNT = "SELECT BACTION, COUNT(*) AS CNT FROM BOARD B JOIN APPLICANT A ON B.BNUM=A.BNUM WHERE A.MNUM=? GROUP BY BACTION ORDER BY BACTION";*/
	// 마이 페이지 내가 신청한 매칭 - 페이지 상태별 필터링
	private final String SQL_SELECTALL_MYMATCH_STATUS = "SELECT * FROM (SELECT B.BNUM, COUNT(*) ACNT FROM BOARD B LEFT JOIN APPLICANT A ON B.BNUM=A.BNUM GROUP BY B.BNUM) C, (SELECT A.ANUM, A.ACHK, B.BNUM, BTITLE, BADDRESS, BDATE, BCNT, BACTION FROM BOARD B, APPLICANT A WHERE B.BNUM=A.BNUM AND A.MNUM=?) D WHERE C.BNUM = D.BNUM AND BACTION=? ORDER BY C.BNUM ASC";
			
	// 마이 페이지 내가 신청한 매칭 목록(프로필 목록)
	//private final String SQL_SELECTALL_IMG = "SELECT MIMG FROM MEMBER M, BOARD B, APPLICANT A WHERE A.BNUM = B.BNUM AND A.MNUM=M.MNUM AND B.BNUM=?";

	// 매칭 상세 페이지
	private final String SELECTONE_MATCH = "SELECT BNUM, BTITLE, MNUM, BCONTENT, BRATE, BCNT, BDATE, BLATITUDE, BLONGITUDE, BADDRESS, BACTION FROM BOARD B WHERE BNUM=?";
	// 매칭 상세 페이지(신청자)-applicant 이동
	//private final String SELECTALL_APPLICANT = "SELECT A.MNUM, MID, SCORE, MIMG FROM MEMBER M, BOARD B, APPLICANT A WHERE A.BNUM = B.BNUM AND A.MNUM=M.MNUM AND B.BNUM=? ORDER BY M.MNUM ASC";

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
	
	public List<BoardVO> selectAllMain(BoardVO bvo){
		List<BoardVO> datas = new ArrayList<BoardVO>();
		String query=null;
		try {
			if(bvo.getSortBy()!=0) { //정렬
				if(bvo.getSortBy()==1) {
					query=SQL_SELECTALL_REGISTER;//등록순
				}else {
					query=SQL_SELECTALL_MATCH;//시합날짜순
				}
				datas=jdbcTemplate.query(query, new BoardSelectAllMapper());
			} else { //검색
				Object[] obj=null;
				if(bvo.getbLocal() != null) {//지역 검색
					query = SQL_SELECTALL_AREA;
					obj = new Object[] {bvo.getbLocal()};
				}
				else if(bvo.getsSearchDate()!= null) {//날짜 검색
					query = SQL_SELECTALL_DATE;
					obj = new Object[] {bvo.getsSearchDate(), bvo.geteSearchDate()};
				}
				else if(bvo.getbTitle()!=null) {//헤더 검색
					query = SQL_SELECTALL_SEARCH;
					obj= new Object[] {bvo.getSearchContent()};
				}
				datas=jdbcTemplate.query(query, obj, new BoardSelectAllMapper());
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return datas;
	}
	
	
	public List<BoardVO> selectAllManage(BoardVO bvo) { //글 관리
		List<BoardVO> datas=new ArrayList<BoardVO>();
		try {
			if(bvo.getbAction() != null) { //관리자페이지 글관리 - 모집 상태별 게시글(매칭) 개수
				datas = jdbcTemplate.query(SQL_SELECTALL_ADMIN_CNT, (rs,rowNum)-> {
					BoardVO tmpData = new BoardVO();
					tmpData.setbCnt(rs.getInt("CNT"));
					return tmpData;
				}, bvo.getbAction());
			} else if(bvo.getmNum() != 0) {//마이페이지 - 내가 작성한 글 목록
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
				}, bvo.getmNum());
			} else {
				Object[] obj=null;
				String query;
				if(bvo.getSearchContent() != null){//관리자 페이지- 글 목록에서 상태별 필터링
					query = SQL_SELECTALL_ADMIN_STATUS;
					obj = new Object[] {bvo.getSearchContent()};
				} else { //관리자 페이지 - 게시글 전체 목록
					query = SQL_SELECTALL_ADMIN;
				}
				datas=jdbcTemplate.query(query, obj, (rs, rowNum)->{
					BoardVO tmpData= new BoardVO();
					tmpData.setbNum(rs.getInt("BNUM"));
					tmpData.setbTitle(rs.getString("BTITLE"));
					tmpData.setbMname(rs.getString("MID"));
					tmpData.setbDate(rs.getDate("BDATE"));
					tmpData.setbAction(rs.getString("BACTION"));
					return tmpData;
				});
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return datas;
	}

	public List<BoardVO> selectAllMatch(BoardVO bvo){
		List<BoardVO> datas=new ArrayList<BoardVO>();
		try {
			if(bvo.getbAction()!=null) { //마이페이지 - 내가 신청한 매칭 목록 (모집 상태별 개수)
				datas = jdbcTemplate.query(SQL_SELECTALL_MYMATCH_CNT, (rs,rowNum)-> {
					BoardVO tmpData = new BoardVO();
					tmpData.setbCnt(rs.getInt("CNT"));
					return tmpData;
				}, bvo.getbAction());
			} else {
				Object[] args;
				String query;
				if(bvo.getSearchContent()!=null) { //마이페이지 - 내가 신청한 매칭 목록 (모집 상태별 필터링)
					query = SQL_SELECTALL_MYMATCH_STATUS;
					args = new Object[] {bvo.getmNum(), bvo.getSearchContent()};
				} else { // 마이페이지 - 내가 신청한 매칭 목록
					query = SQL_SELECTALL_MYMATCH;
					args = new Object[] {bvo.getmNum()};
				}
				datas= jdbcTemplate.query(query, args, (rs, rowNum)->{
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
				});
			}
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return datas;
	}
	
	public BoardVO selectOne(BoardVO bvo) {
		try {
			return jdbcTemplate.queryForObject(SELECTONE_MATCH, new BoardRowMapper(), bvo.getbNum());
		} catch (Exception e) {
			return null;
		}
	}
}

class BoardSelectAllMapper implements RowMapper<BoardVO> {
	@Override
	public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		BoardVO data= new BoardVO();
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
}

class BoardRowMapper implements RowMapper<BoardVO> {
	// 스프링에서 제공되는 근본 인터페이스: rowMapper<BoardVO>
	@Override
	public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		BoardVO data = new BoardVO();
		data.setbNum(rs.getInt("BNUM"));
		data.setbTitle(rs.getString("BTITLE"));
		data.setmNum(rs.getInt("MNUM"));
		data.setbContent(rs.getString("BRATE"));
		data.setbCnt(rs.getInt("BCNT"));
		data.setbDate(rs.getTimestamp("BDATE"));
		data.setbLatitude(rs.getString("BLATITUDE"));
		data.setbLongitude(rs.getString("BLONGITUDE"));
		data.setbAddress(rs.getString("BADDRESS"));
		data.setbAction(rs.getString("BACTION"));
		return data;
	}

}
