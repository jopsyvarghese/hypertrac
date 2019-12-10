package com.hypertrac.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class database {

	private static database jdbc;

	public static database getInstance() {
		if (jdbc == null) {
			jdbc = new database();
		}
		return jdbc;
	}

	/**
	 * @return con
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Connection con = null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hypertrac", "root", "");
//		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/admin_hypertrac?useLegacyDatetimeCode=false&serverTimezone=GMT%2B1","hypertrac_user7", "H7Yp$60$3r_432");
		return con;
	}
}
