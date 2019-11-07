package com.hypertrac.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.hypertrac.beans.*;

public class ApplicationsDao {
	
	/**
	 * 
	 * @param start
	 * @param total
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public static List<Applications> getRecords(int start, int total) throws ClassNotFoundException, SQLException {
		List<Applications> list = new ArrayList<Applications>();
		Connection con = database.getConnection();
		String sql = "SELECT * FROM applications ORDER BY id DESC limit " + start + "," + total;
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = null;
		rs = ps.executeQuery();
		while (rs.next()) {
			Applications app = new Applications();
			app.setId(rs.getInt(1));
			app.setApp_by(rs.getInt(8));
			app.setDept(rs.getInt(3));
			app.setNameOrNo(rs.getString(2));
			app.setStatus(7);
			app.setSubject(rs.getString(4));
			app.setSubmitted_on(rs.getString(5));
			app.setValidity(rs.getString(6));
			app.setItemCount(getItemCount());
			list.add(app);
		}
		con.close();
		return list;
	}
	
	/**
	 * 
	 * @param start
	 * @param total
	 * @param mcId
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public static List<Applications> getRecordsByMcId(int start, int total, int mcId)
			throws ClassNotFoundException, SQLException {
		List<Applications> list = new ArrayList<Applications>();
		Connection con = database.getConnection();
		String deptQ = "SELECT id FROM dept where mc_id=" + mcId;
		Statement st = null;
		ResultSet rs = null;
		st = con.createStatement();
		rs = st.executeQuery(deptQ);
		ArrayList<Integer> rowValues = new ArrayList<Integer>();
		while (rs.next()) {
			rowValues.add(rs.getInt(1));
		}
		String selectIds = "";
		int i = 0;
		for (int object : rowValues) {
			if (i == 0) {
				selectIds = "" + object;
			} else {
				selectIds += " OR dept=" + object;
			}
			i++;
		}
		String sql = "SELECT * FROM applications WHERE dept=" + selectIds + " ORDER BY id DESC limit " + start + ","
				+ total;
		ResultSet rs1 = null;
		rs1 = st.executeQuery(sql);
		while (rs1.next()) {
			Applications app = new Applications();
			app.setId(rs1.getInt(1));
			app.setApp_by(rs1.getInt(8));
			app.setDept(rs1.getInt(3));
			app.setNameOrNo(rs1.getString(2));
			app.setStatus(7);
			app.setSubject(rs1.getString(4));
			app.setSubmitted_on(rs1.getString(5));
			app.setValidity(rs1.getString(6));
			app.setItemCount(getItemCountForMc(selectIds));
			list.add(app);
		}
		con.close();
		return list;
	}
	
	/**
	 * 
	 * @param start
	 * @param total
	 * @param role
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public static List<Applications> getRecordsByRole(int start, int total, int role)
			throws ClassNotFoundException, SQLException {
		List<Applications> list = new ArrayList<Applications>();
		Connection con = database.getConnection();
		String query = "SELECT id FROM auth WHERE role=?";
		PreparedStatement pst = con.prepareStatement(query);
		pst.setInt(1, role);
		ResultSet rst = pst.executeQuery();
		ArrayList<Integer> rowValues = new ArrayList<Integer>();
		while (rst.next()) {
			rowValues.add(rst.getInt(1));
		}

		String selectIds = "";
		int i = 0;
		for (int object : rowValues) {
			if (i == 0) {
				selectIds = "" + object;
			} else {
				selectIds += " OR app_by=" + object;
			}
			i++;
		}
			String sql = "SELECT * FROM applications WHERE app_by=" + selectIds + " ORDER BY id DESC limit " + start + ","
					+ total;
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = null;
			rs = ps.executeQuery();
			while (rs.next()) {
				Applications app = new Applications();
				app.setId(rs.getInt(1));
				app.setApp_by(rs.getInt(8));
				app.setDept(rs.getInt(3));
				app.setNameOrNo(rs.getString(2));
				app.setStatus(7);
				app.setSubject(rs.getString(4));
				app.setSubmitted_on(rs.getString(5));
				app.setValidity(rs.getString(6));
				app.setItemCount(getItemCountByRole(selectIds));
				list.add(app);
			}
		
		con.close();
		return list;
	}
	
	/**
	 * 
	 * @param start
	 * @param total
	 * @param myDept
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public static List<Applications> getRecordsByDeptId(int start, int total, int myDept) throws ClassNotFoundException, SQLException {
		List<Applications> list = new ArrayList<Applications>();
		Connection con = database.getConnection();
		String sql = "SELECT * FROM applications WHERE dept="+ myDept +" ORDER BY id DESC limit " + start + "," + total;
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = null;
		rs = ps.executeQuery();
		System.out.println(sql);
		while (rs.next()) {
			Applications app = new Applications();
			app.setId(rs.getInt(1));
			app.setApp_by(rs.getInt(8));
			app.setDept(rs.getInt(3));
			app.setNameOrNo(rs.getString(2));
			app.setStatus(7);
			app.setSubject(rs.getString(4));
			app.setSubmitted_on(rs.getString(5));
			app.setValidity(rs.getString(6));
			app.setItemCount(getItemCountByDeptId(myDept));
			list.add(app);
		}
		con.close();
		return list;
	}
	
	
	/**
	 * 
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public static int getItemCount() throws ClassNotFoundException, SQLException {
		int count = 0;
		String sql = "SELECT count(*) FROM applications";
		Statement st = null;
		Connection con = database.getConnection();
		st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		if (rs.next()) {
			count = rs.getInt(1);
		}
		return count;
	}

	/**
	 * 
	 * @param role
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public static int getItemCountByRole(String role) throws ClassNotFoundException, SQLException {
		int count = 0;
		String sql = "SELECT count(*) FROM applications WHERE app_by=" + role;
		Statement st = null;
		Connection con = database.getConnection();
		st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		if (rs.next()) {
			count = rs.getInt(1);
		}
		return count;
	}

	/**
	 * 
	 * @param selectIds
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public static int getItemCountForMc(String selectIds) throws ClassNotFoundException, SQLException {
		int count = 0;
		String sql = "SELECT count(*) FROM applications WHERE dept=" + selectIds;
		Statement st = null;
		Connection con = database.getConnection();
		st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		if (rs.next()) {
			count = rs.getInt(1);
		}
		return count;
	}
	
	/**
	 * 
	 * @param myDept
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public static int getItemCountByDeptId(int myDept) throws ClassNotFoundException, SQLException {
		int count = 0;
		String sql = "SELECT count(*) FROM applications WHERE dept=" + myDept;
		Statement st = null;
		Connection con = database.getConnection();
		st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		if (rs.next()) {
			count = rs.getInt(1);
		}
		return count;
	}
}
