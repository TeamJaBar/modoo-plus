package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCUtil;

public class AddressDAO {
	ArrayList<AddressVO> addr;
	Connection conn;
	PreparedStatement pstmt;

	final String INSERT = "INSERT INTO ADDRESS VALUES(ANUM_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?)";
	final String SELECTONE = "SELECT ANUM, SHIPNAME, DESTINATION, ZIPCODE, USERADDR, DETAILADDR, TEL, ISDEFAULT FROM ADDRESS WHERE ANUM=?";
	final String SELECTONE_DEFAULT = "SELECT ANUM, SHIPNAME, DESTINATION, ZIPCODE, USERADDR, DETAILADDR, TEL, ISDEFAULT FROM ADDRESS WHERE ISDEFAULT=1 AND MNUM=?";
	final String SELECTALL = "SELECT ANUM, SHIPNAME, DESTINATION, ZIPCODE, USERADDR, DETAILADDR, TEL, ISDEFAULT FROM ADDRESS WHERE MNUM=? ORDER BY ISDEFAULT DESC, ANUM ASC";
	final String UPDATE = "UPDATE ADDRESS SET SHIPNAME=?, DESTINATION=?, ZIPCODE=?, USERADDR=?, DETAILADDR=?, TEL=?, ISDEFAULT=? WHERE ANUM=?";
	final String UPDATE_DEFAULT = "UPDATE ADDRESS SET ISDEFAULT=0 WHERE MNUM=? AND ISDEFAULT=1";
	final String DELETE = "DELETE FROM ADDRESS WHERE ANUM=?";

	public boolean insert(AddressVO avo) {
		try {
			conn = JDBCUtil.connect();
			pstmt = conn.prepareStatement(INSERT);

			pstmt.setInt(1, avo.getmNum());
			pstmt.setString(2, avo.getShipName());
			pstmt.setString(3, avo.getDestination());
			pstmt.setString(4, avo.getZipCode());
			pstmt.setString(5, avo.getUserAddr());
			pstmt.setString(6, avo.getDetailAddr());
			pstmt.setString(7, avo.getTel());
			pstmt.setString(8, avo.getIsDefault());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.disconnect(conn, pstmt);
		}
		return true;
	}

	public AddressVO selectOne(AddressVO avo) {
		AddressVO data = null;
		conn = JDBCUtil.connect();
		try {
			if (avo.getaNum() == 0) {
				pstmt = conn.prepareStatement(SELECTONE_DEFAULT);
				pstmt.setInt(1, avo.getmNum());
			} else {
				pstmt = conn.prepareStatement(SELECTONE);
				pstmt.setInt(1, avo.getaNum());
			}

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				data = new AddressVO();
				data.setaNum(rs.getInt("ANUM"));
				data.setShipName(rs.getString("SHIPNAME"));
				data.setDestination(rs.getString("DESTINATION"));
				data.setZipCode(rs.getString("ZIPCODE"));
				data.setUserAddr(rs.getString("USERADDR"));
				data.setDetailAddr(rs.getString("DETAILADDR"));
				data.setTel(rs.getString("TEL"));
				data.setIsDefault(rs.getString("ISDEFAULT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(conn, pstmt);
		return data;
	}

	public ArrayList<AddressVO> selectAll(AddressVO avo) {
		ArrayList<AddressVO> datas = new ArrayList<AddressVO>();
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(SELECTALL);
			pstmt.setInt(1, avo.getmNum());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
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
				datas.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(conn, pstmt);
		return datas;
	}

	public boolean update(AddressVO avo) {
		conn = JDBCUtil.connect();
		try {
			if (avo.getaNum() != 0) {
				pstmt = conn.prepareStatement(UPDATE);
				pstmt.setString(1, avo.getShipName());
				pstmt.setString(2, avo.getDestination());
				pstmt.setString(3, avo.getZipCode());
				pstmt.setString(4, avo.getUserAddr());
				pstmt.setString(5, avo.getDetailAddr());
				pstmt.setString(6, avo.getTel());
				pstmt.setString(7, avo.getIsDefault());
				pstmt.setInt(8, avo.getaNum());
			} else {
				pstmt = conn.prepareStatement(UPDATE_DEFAULT);
				pstmt.setInt(1, avo.getmNum());
			}

			int res = pstmt.executeUpdate();
			if (res <= 0) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean delete(AddressVO avo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(DELETE);
			pstmt.setInt(1, avo.getaNum());
			int res = pstmt.executeUpdate();
			if (res <= 0) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		JDBCUtil.disconnect(conn, pstmt);
		return true;
	}
}
