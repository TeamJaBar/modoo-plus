package com.spring.biz.member;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("addressDAO")
public class AddressDAO {
	
	@Autowired
	private JdbcTemplate template;

	final String INSERT = "INSERT INTO ADDRESS (MNUM, SHIPNAME, DESTINATION, ZIPCODE, USERADDR, DETAILADDR, TEL, ISDEFAULT) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
	final String SELECTONE = "SELECT ANUM, SHIPNAME, DESTINATION, ZIPCODE, USERADDR, DETAILADDR, TEL, ISDEFAULT FROM ADDRESS WHERE ANUM=?";
	final String SELECTONE_DEFAULT = "SELECT ANUM, SHIPNAME, DESTINATION, ZIPCODE, USERADDR, DETAILADDR, TEL, ISDEFAULT FROM ADDRESS WHERE ISDEFAULT=1 AND MNUM=?";
	final String SELECTALL = "SELECT ANUM, SHIPNAME, DESTINATION, ZIPCODE, USERADDR, DETAILADDR, TEL, ISDEFAULT FROM ADDRESS WHERE MNUM=? ORDER BY ISDEFAULT DESC, ANUM ASC";
	final String UPDATE = "UPDATE ADDRESS SET SHIPNAME=?, DESTINATION=?, ZIPCODE=?, USERADDR=?, DETAILADDR=?, TEL=?, ISDEFAULT=? WHERE ANUM=?";
	final String UPDATE_DEFAULT = "UPDATE ADDRESS SET ISDEFAULT=0 WHERE MNUM=? AND ISDEFAULT=1";
	final String DELETE = "DELETE FROM ADDRESS WHERE ANUM=?";

	public boolean insert(AddressVO avo) {
		try {
			template.update(INSERT, avo.getmNum(), avo.getShipName(), avo.getDestination(), avo.getZipCode(), avo.getUserAddr(), avo.getDetailAddr(), avo.getTel(), avo.getIsDefault());
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public AddressVO selectOne(AddressVO avo) {
		String query;
		try {
			if (avo.getaNum() == 0) {
				query = SELECTONE_DEFAULT;
			} else {
				query = SELECTONE;
			}
			return template.queryForObject(query, new AddressRowMapper(), avo.getaNum());
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<AddressVO> selectAll(AddressVO avo) {
		List<AddressVO> datas = new ArrayList<AddressVO>();
		try {
			datas = template.query(SELECTALL,new AddressRowMapper(), avo.getmNum());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return datas;
	}

	public boolean update(AddressVO avo) {
		try {
			if (avo.getaNum() != 0) {
				template.update(UPDATE, avo.getShipName(), avo.getDestination(), avo.getZipCode(), avo.getUserAddr(), avo.getDetailAddr(), avo.getTel(), avo.getIsDefault(), avo.getaNum());
			} else {
				template.update(UPDATE_DEFAULT, avo.getmNum());
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean delete(AddressVO avo) {
		try {
			template.update(DELETE, avo.getaNum());
		} catch (Exception e) {
			return false;
		}
		return true;
	}
}

class AddressRowMapper implements RowMapper<AddressVO> {

	@Override
	public AddressVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		AddressVO data = new AddressVO();
		data = new AddressVO();
		data.setaNum(rs.getInt("ANUM"));
		data.setShipName(rs.getString("SHIPNAME"));
		data.setDestination(rs.getString("DESTINATION"));
		data.setZipCode(rs.getString("ZIPCODE"));
		data.setUserAddr(rs.getString("USERADDR"));
		data.setDetailAddr(rs.getString("DETAILADDR"));
		data.setTel(rs.getString("TEL"));
		data.setIsDefault(rs.getString("ISDEFAULT"));
		return data;
	}

}