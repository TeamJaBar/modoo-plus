package com.spring.biz.board;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

//@Repository("commentDAO")
public class CommentDAO {
//	@Autowired
	private JdbcTemplate jdbcTemplate;
	//매칭 댓글 INSERT,UPDATE,DELETE,SELECTALL
	private final String SQL_INSERT="INSERT INTO COMMENT (BNUM, MNUM, CCONTENT, CWDATE) VALUES(?, ?, ?, SYSDATE())";
	private final String SQL_UPDATE="UPDATE COMMENT SET CCONTENT=?, CCDATE=SYSDATE() WHERE CNUM=?";
	private final String SQL_DELETE="DELETE FROM COMMENT WHERE CNUM=?";
	//전체 댓글 출력(수정)
	private final String SQL_SELECTALL="SELECT C.CNUM, CCONTENT, CWDATE, MID, C.MNUM, CCDATE FROM COMMENT C JOIN MEMBER M ON C.MNUM = M.MNUM JOIN BOARD B ON B.BNUM=C.BNUM WHERE B.BNUM= ? ORDER BY CWDATE ASC";

	public boolean insertComment(CommentVO cvo) {
		try {
			System.out.println("CommentDAO의 insert()");
			jdbcTemplate.update(SQL_INSERT,cvo.getbNum(), cvo.getmNum(), cvo.getcContent());
		}catch(Exception e) {
			return false;
		}
		return true;
	}

	public boolean updateComment(CommentVO cvo) {
		try {
			System.out.println("CommentDAO의 update()");
			jdbcTemplate.update(SQL_UPDATE, cvo.getcContent(), cvo.getcNum());
		}catch(Exception e) {
			return false;
		}
		return true;
	}

	public boolean deleteComment(CommentVO cvo) {
		try {
			System.out.println("CommentDAO의 delete()");
			jdbcTemplate.update(SQL_DELETE,cvo.getcNum());
		}catch(Exception e) {
			return false;
		}
		return true;
	}
	
	public List<CommentVO> selectAll(CommentVO cvo){
		try {
			return jdbcTemplate.query(SQL_SELECTALL, new CommentRowMapper(),cvo.getbNum());
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	class CommentRowMapper implements RowMapper<CommentVO>{

		@Override
		public CommentVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			CommentVO datas=new CommentVO();
			datas.setcContent(rs.getString("CCONTENT"));
			datas.setcWdate(rs.getTimestamp("CWDATE"));
//			datas.setcWdate(rs.getTimestamp("CWDATE"));
			datas.setmId(rs.getString("MID"));
			datas.setcCdate(rs.getTimestamp("CCDATE"));
			datas.setcNum(rs.getInt("CNUM"));
			datas.setmNum(rs.getInt("MNUM"));
			return datas;
		}

	}
}
