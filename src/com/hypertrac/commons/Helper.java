package com.hypertrac.commons;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Helper {
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
    	Connection con = com.hypertrac.dao.database.getConnection();
    	Statement st = con.createStatement();
    	ResultSet rs = null;
    	rs = st.executeQuery(sql);
    	if (rs.next()) {
    	  return rs.getString(2);
    	}
    	return "";
    }
    
    public String getMajorClient(int id) throws SQLException {
    	String sql = "SELECT * FROM major_client WHERE id="+id;
    	Connection con = com.hypertrac.dao.database.getConnection();
    	Statement st = con.createStatement();
    	ResultSet rs = null;
    	rs = st.executeQuery(sql);
    	if (rs.next()) {
    	  return rs.getString(2);
    	}
    	return "";
    }
    
    public ResultSet getDept() throws SQLException {
    	String arr[] = {};
    	String sql = "SELECT * FROM dept";
    	Connection con = com.hypertrac.dao.database.getConnection();
    	Statement st = con.createStatement();
    	ResultSet rs = null;
    	return st.executeQuery(sql);
    }
    
    public String getDeptById(int id) throws SQLException {
    	String arr[] = {};
    	String sql = "SELECT * FROM dept WHERE id="+id;
    	Connection con = com.hypertrac.dao.database.getConnection();
    	Statement st = con.createStatement();
    	ResultSet rs = null;
    	rs = st.executeQuery(sql);
    	if(rs.next()) {
    		return rs.getString(2);
    	}
    	return "";
    }
    
    public String getSubDept(int id) throws SQLException {
    	String sql = "SELECT * FROM dept_sub WHERE id="+id;
    	Connection con = com.hypertrac.dao.database.getConnection();
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
    
    public String getNameById(int id) throws SQLException {
    	String sql = "SELECT * FROM auth WHERE id="+id;
    	Connection con = com.hypertrac.dao.database.getConnection();
    	Statement st = con.createStatement();
    	ResultSet rs = null;
    	rs = st.executeQuery(sql);
    	if (rs.next()) {
    	  return rs.getString(2) + " " + rs.getString(3);
    	}
    	return "";
    }
    
    public String getRoleById(int id) throws SQLException {
    	String sql = "SELECT * FROM role WHERE id="+id;
    	Connection con = com.hypertrac.dao.database.getConnection();
    	Statement st = con.createStatement();
    	ResultSet rs = null;
    	rs = st.executeQuery(sql);
    	if (rs.next()) {
    	  return rs.getString(2);
    	}
    	return "";
    }
}
