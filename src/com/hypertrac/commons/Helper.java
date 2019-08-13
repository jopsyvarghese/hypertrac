package com.hypertrac.commons;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;  
import java.time.format.DateTimeFormatter;

public class Helper {
	Connection con;
	public Helper() throws ClassNotFoundException, SQLException {
		con = com.hypertrac.dao.database.getConnection();
	}

	public String getHashedPwd(String password) {
		byte[] salt = new byte[0];
		try {
			salt = getSalt();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA-256");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		md.update(salt);
		byte[] bytes = md.digest(password.getBytes());
		StringBuilder sb = new StringBuilder();
		for(int i=0; i< bytes.length ;i++)
		{
			sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
		}
		return sb.toString();
	}

	public static byte[] getSalt() throws NoSuchAlgorithmException
	{
		SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
		byte[] salt = new byte[16];
		sr.nextBytes(salt);
		return salt;
	}

	public String buzzType(int id) throws SQLException {
		String sql = "SELECT * FROM business WHERE id="+id;
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		if (rs.next()) {
			return rs.getString(2);
		}
		return "";
	}

	public String getMajorClient(int id) throws SQLException {
		String sql = "SELECT fname FROM auth WHERE id="+id;
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		if (rs.next()) {
			return rs.getString(1);
		}
		return "";
	}

	public ResultSet getDept() throws SQLException {
		String arr[] = {};
		String sql = "SELECT * FROM dept";
		Statement st = con.createStatement();
		ResultSet rs = null;
		return st.executeQuery(sql);
	}

	public String getDeptById(int id) throws SQLException {
		String arr[] = {};
		String sql = "SELECT * FROM dept WHERE id="+id;
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		if(rs.next()) {
			return rs.getString(2);
		}
		return "";
	}
	
	public String getMajorClientByDeptId(int id) throws SQLException {
		String arr[] = {};
		String sql = "SELECT * FROM dept WHERE id="+id;
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		if(rs.next()) {
			int mId =  Integer.parseInt(rs.getString(3));
			String sql2 = "SELECT fname FROM auth WHERE id="+mId;
			Statement st2 = con.createStatement();
			ResultSet rs2 = null;
			rs2 = st2.executeQuery(sql2);
			if(rs2.next()) {
				return rs2.getString(1);
			}
		}
		return "";
	}

	public String getSubDept(int id) throws SQLException {
		String sql = "SELECT * FROM dept_sub WHERE id="+id;
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		if (rs.next()) {
			return rs.getString(3);
		}
		return "";
	}

	public String getDateTime() {
		java.util.Date dt = new java.util.Date();
		java.text.SimpleDateFormat sdf = 
				new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentTime = sdf.format(dt);
		return currentTime;
	}

	public String getDay() {
		java.util.Date dt = new java.util.Date();
		java.text.SimpleDateFormat sdf = 
				new java.text.SimpleDateFormat("dd");
		String currentTime = sdf.format(dt);
		return currentTime;
	}

	public String getMonth() {
		java.util.Date dt = new java.util.Date();
		java.text.SimpleDateFormat sdf = 
				new java.text.SimpleDateFormat("MM");
		String currentTime = sdf.format(dt);
		return currentTime;
	}

	public String getYear() {
		java.util.Date dt = new java.util.Date();
		java.text.SimpleDateFormat sdf = 
				new java.text.SimpleDateFormat("YYYY");
		String currentTime = sdf.format(dt);
		return currentTime;
	}

	public String getNameById(int id) throws SQLException {
		String sql = "SELECT fname FROM auth WHERE id="+id;
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		if (rs.next()) {
			return rs.getString(1);
		}
		return "";
	}
	
	public String getFirstNameById(int id) throws SQLException {
		String sql = "SELECT fname FROM auth WHERE id="+id;
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		if (rs.next()) {
			return rs.getString(1);
		}
		return "";
	}

	public String getEmailById(int id) throws SQLException {
		String sql = "SELECT email FROM auth WHERE id="+id;
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		if (rs.next()) {
			return rs.getString(1);
		}
		return "";
	}
	
	public String getPhoneById(int id) throws SQLException {
		String sql = "SELECT mob FROM auth WHERE id="+id;
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		if (rs.next()) {
			return rs.getString(1);
		}
		return "";
	}
	
	public String getPositionById(int id) throws SQLException {
		String sql = "SELECT role FROM role WHERE id="+id;
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		if (rs.next()) {
			return rs.getString(1);
		}
		return "";
	}
	
	public ResultSet getAllPositions() throws SQLException {
		String sql = "SELECT * FROM role";
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		return rs;
	}
	
	public String getRoleById(int id) throws SQLException {
		String sql = "SELECT * FROM role WHERE id="+id;
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		if (rs.next()) {
			return rs.getString(2);
		}
		return "";
	}
	
	public ResultSet getRole() throws SQLException {
		String sql = "SELECT * FROM role";
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		return rs;
	}

	public String getRc(int id) throws SQLException {
		String rc = "";
		String sql = "SELECT rc FROM auth WHERE id="+id;
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		if (rs.next()) {
			return rs.getString(1);
		}
		return rc;
	}

	public ResultSet getBuzzType() throws SQLException {
		String sql = "SELECT * FROM business";
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		return rs;
	}

	public ResultSet getMajorClients() throws SQLException {
		String sql = "SELECT id,fname FROM auth WHERE role=2";
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		return rs;
	}

	public ResultSet getSubDept() throws SQLException {
		String sql = "SELECT id,fname FROM auth WHERE id=2";
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		return rs;
	}

	public String getLocalDateTime() {
		LocalDateTime now = LocalDateTime.now();  
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");  
		String formatDateTime = now.format(format);
		return formatDateTime;
	}

	public ResultSet getImagesByFKey(int id) throws SQLException
	{
		Statement st = con.createStatement();
		ResultSet rs = null;
		String sql = "SELECT img_path FROM applications_img WHERE fk_id=" + id;
		rs = st.executeQuery(sql);
		return rs;
	}
	
	public String[] getAppStatus(){
		String arr[] = new String[5];
		arr[0] = "New / Open";
		arr[1] = "In Progress";
		arr[2] = "On Hold";
		arr[3] = "Redirected";
		arr[4] = "Completed";
		return arr;
	}
	
	public ResultSet getStaffNameByDeptId(int id) throws SQLException
	{
		Statement st = con.createStatement();
		ResultSet rs = null;
		String sql = "SELECT id,fname FROM auth WHERE id=(SELECT id FROM staff WHERE dept=" + id+");";
		rs = st.executeQuery(sql);
		return rs;
	}
}
