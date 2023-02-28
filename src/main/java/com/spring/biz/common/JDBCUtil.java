package com.spring.biz.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class JDBCUtil {

	static final String driverClassName = "com.mysql.cj.jdbc.Driver";
	static final String url = "jdbc:mysql://localhost/modoodb";
	static final String username = "root";
	static final String password = "1234";

	public static Connection connect() {
		Connection conn = null;
		try {
			Class.forName(driverClassName);
			conn = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			System.out.println("\t로그: connect() 수행완료");
		}
		return conn;
	}

	public static void disconnect(Connection conn, PreparedStatement pstmt) {
		try {
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			System.out.println("\t로그: disconnect() 수행완료");
		}
	}
}
