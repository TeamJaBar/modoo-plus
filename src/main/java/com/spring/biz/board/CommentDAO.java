package com.spring.biz.board;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("commentDAO")
public class CommentDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	//매칭 댓글 INSERT,UPDATE,DELETE,SELECTALL
	private final String SQL_INSERT="INSERT INTO COMMENT (MNUM, CCONTENT, CWDATE) VALUES(?, ?, SYSDATE())";
	//INSERT 한거 보여주는 SELECTALL
	private final String SQL_I_SELECTALL="SELECT CCONTENT, CWDATE, MNAME FROM COMMENT C LEFT JOIN `member` M ON C.MNUM = M.MNUM WHERE CNUM=?";
	private final String SQL_UPDATE="UPDATE COMMENT SET CCONTENT=?, CCDATE=SYSDATE()  WHERE CNUM=?";
	private final String SQL_DELETE="DELETE FROM COMMENT WHERE CNUM=?";
	//전체 댓글 출력
	private final String SQL_SELECTALL="SELECT CCONTENT, CWDATE, MNAME FROM COMMENT C LEFT JOIN `member` M ON C.MNUM = M.MNUM ORDER BY CWDATE ASC";

	public boolean insertComment(CommentVO cvo) {
		try {
			System.out.println("CommentDAO의 insert()");
			jdbcTemplate.update(SQL_INSERT,cvo.getmNum(),cvo.getcContent(),cvo.getcWdate());
		}catch(Exception e) {
			return false;
		}
		return true;
	}

	public List<CommentVO> selectAll_Comment(CommentVO cvo) {
		Object[] args= {cvo.getcNum()};
		return jdbcTemplate.query(SQL_I_SELECTALL, args, new CommentRowMapper());
	}

	public boolean updateComment(CommentVO cvo) {
		try {
			System.out.println("CommentDAO의 update()");
			jdbcTemplate.update(SQL_UPDATE, cvo.getcContent(),cvo.getcCdate(),cvo.getcNum());
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
			return jdbcTemplate.query(SQL_SELECTALL, new CommentRowMapper(),cvo.getcCdate());
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	class CommentRowMapper implements RowMapper<CommentVO>{

		@Override
		public CommentVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			CommentVO datas=new CommentVO();
			datas.setcContent(rs.getString("CCOMMENT"));
			datas.setcWdate(rs.getDate("CWDATE"));
			datas.setmName(rs.getString("MNAME"));
			datas.setcNum(rs.getInt("CNUM"));
			return datas;
		}

	}
}
