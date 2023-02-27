package com.spring.biz.member;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;


@Repository("dibDAO")
public class DibDAO {
	
	JdbcTemplate template;

	final String INSERT = "INSERT INTO DIB (PNUM, MNUM, DCNT) VALUES(?, ?, 1)";
	final String SELECTALL = "SELECT D.DIBNUM, P.PNUM, D.MNUM, P.PIMG, P.PNAME, P.SELPRICE, D.DCNT FROM DIB D, PRODUCT P WHERE D.PNUM=P.PNUM AND MNUM=? ORDER BY DIBNUM ASC";
	final String SELECTONE = "SELECT DIBNUM FROM DIB WHERE MNUM=? AND PNUM=?";
	final String DELETE = "DELETE FROM DIB WHERE DIBNUM=?";
	final String DELETE_QUICK = "DELETE FROM DIB WHERE DIBNUM=(SELECT DIBNUM FROM (SELECT DIBNUM, MNUM, PNUM FROM DIB) A WHERE A.MNUM=? AND A.PNUM=?)";

	public boolean insert(DibVO dvo) {
		try {
			template.update(INSERT, dvo.getpNum(), dvo.getmNum());
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public DibVO selectOne(DibVO dvo) {
		DibVO data = new DibVO();
		try {
			data = template.queryForObject(SELECTONE, (rs, rowNum) -> {
				DibVO tmpData = new DibVO();
				tmpData.setDibNum(rs.getInt("DIBNUM"));
				return tmpData;
			}, dvo.getmNum(), dvo.getpNum());
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return data;
	}
	
	public List<DibVO> selectAll(DibVO dvo) {
		List<DibVO> datas = new ArrayList<DibVO>();
		try {			
			datas = template.query(SELECTALL, new DibRowMapper(), dvo.getmNum());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return datas;
	}


	public boolean delete(DibVO dvo) {
		try {
			if(dvo.getpNum()==0) {
				template.update(DELETE, dvo.getDibNum());
			} else {
				template.update(DELETE_QUICK, dvo.getmNum(), dvo.getpNum());
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

}

class DibRowMapper implements RowMapper<DibVO> {
	@Override
	public DibVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		DibVO data = new DibVO();
		data.setDibNum(rs.getInt("DIBNUM"));
		data.setpNum(rs.getInt("PNUM"));
		data.setmNum(rs.getInt("MNUM"));
		data.setpNumPimg(rs.getString("PIMG"));
		data.setpNumPname(rs.getString("PNAME"));
		data.setpNumSelPrice(rs.getInt("SELPRICE"));
		data.setdCnt(rs.getInt("DCNT"));
		return data;
	}
}
