package com.hypertrac.commons;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.KeySpec;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;  
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.sql.Timestamp;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

public class Helper {
	Connection con;
	private String secretKey = "SJDl129734fjweojfdsfd!!!!";
	private String salt = "AEWufodjklfu23487yewo!!!!";
	
	public Helper() throws ClassNotFoundException, SQLException {
		con = com.hypertrac.dao.database.getConnection();
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
		String sql = "SELECT * FROM dept";
		Statement st = con.createStatement();
		return st.executeQuery(sql);
	}

	public String getDeptById(int id) throws SQLException {
		String sql = "SELECT * FROM dept WHERE id="+id;
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		if(rs.next()) {
			return rs.getString(2);
		}
		return "";
	}
	
	public ResultSet getDeptByMcId(int id) throws SQLException {
		String sql = "SELECT * FROM dept WHERE mc_id="+id;
		Statement st = con.createStatement();
		return st.executeQuery(sql);
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
		Calendar calendar = Calendar.getInstance();
	    calendar.setTime(dt);
	    calendar.add(Calendar.HOUR_OF_DAY, 1);
	    java.text.SimpleDateFormat sdf = 
				new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    return sdf.format(calendar.getTime());
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
	
	public int getUserRoleById(int id) throws SQLException {
		String sql = "SELECT role FROM auth WHERE id="+id;
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		if (rs.next()) {
			return rs.getInt(1);
		}
		return -1;
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
	
	public ArrayList<Integer> getStaffNameByDeptId(int id) throws SQLException
	{
		Statement st = con.createStatement();
		ResultSet rs = null;
		String query = "SELECT id FROM staff WHERE dept=" + id;
		rs = st.executeQuery(query);
		ArrayList<Integer> staffIds = new ArrayList<Integer>();
        while(rs.next()) {
         	staffIds.add(rs.getInt(1));
        }
			
		return staffIds;
	}
	
	public ArrayList<Integer> getStaffNamesByMcId(int id) throws SQLException
	{
		Statement st = con.createStatement();
		ResultSet rs = null;
		String query = "SELECT id FROM staff WHERE mc_id=" + id;
		rs = st.executeQuery(query);
		ArrayList<Integer> staffIds = new ArrayList<Integer>();
        while(rs.next()) {
         	staffIds.add(rs.getInt(1));
        }
			
		return staffIds;
	}
	
	public String getStaffDeptById(int id) throws SQLException
	{
		Statement st = con.createStatement();
		ResultSet rs = null;
		String sql = "SELECT dname FROM dept WHERE id=(SELECT dept FROM staff WHERE id=" + id+");";
		rs = st.executeQuery(sql);
		if(rs.next()) {
			return rs.getString(1);
		}
		return "";
	}
	
	public String encryptPwd(String input) 
    { 
        try { 
            MessageDigest md = MessageDigest.getInstance("SHA-512"); 
            byte[] messageDigest = md.digest(input.getBytes()); 
            BigInteger no = new BigInteger(1, messageDigest); 
            String hashtext = no.toString(16); 
            while (hashtext.length() < 32) { 
                hashtext = "0" + hashtext; 
            } 
            return hashtext; 
        } 
        catch (NoSuchAlgorithmException e) { 
            throw new RuntimeException(e); 
        } 
    }
	
	public String encrypt(String strToEncrypt)
	{
	    try
	    {
	        byte[] iv = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
	        IvParameterSpec ivspec = new IvParameterSpec(iv);
	         
	        SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
	        KeySpec spec = new PBEKeySpec(secretKey.toCharArray(), salt.getBytes(), 65536, 256);
	        SecretKey tmp = factory.generateSecret(spec);
	        SecretKeySpec secretKey = new SecretKeySpec(tmp.getEncoded(), "AES");
	         
	        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
	        cipher.init(Cipher.ENCRYPT_MODE, secretKey, ivspec);
	        return Base64.getEncoder().encodeToString(cipher.doFinal(strToEncrypt.getBytes("UTF-8")));
	    }
	    catch (Exception e)
	    {
	        System.out.println("Error while encrypting: " + e.toString());
	    }
	    return null;
	}
	
	public String decrypt(String strToDecrypt) {
	    try
	    {
	        byte[] iv = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
	        IvParameterSpec ivspec = new IvParameterSpec(iv);
	         
	        SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
	        KeySpec spec = new PBEKeySpec(secretKey.toCharArray(), salt.getBytes(), 65536, 256);
	        SecretKey tmp = factory.generateSecret(spec);
	        SecretKeySpec secretKey = new SecretKeySpec(tmp.getEncoded(), "AES");
	         
	        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
	        cipher.init(Cipher.DECRYPT_MODE, secretKey, ivspec);
	        return new String(cipher.doFinal(Base64.getDecoder().decode(strToDecrypt)));
	    }
	    catch (Exception e) {
	        System.out.println("Error while decrypting: " + e.toString());
	    }
	    return null;
	}
	
	public String getGTTxnKey() {
		return "D3D1D05AFE42AD50818167EAC73C109168A0F108F32645C8B59E897FA930DA44F9230910DAC9E20641823799A107A02068F7BC0F4CC41D2952E249552255710F";
	}
	
	public Long getTimeStamp() {
		Date date= new Date();
		long time = date.getTime();
		return time;
	}
	
	/**
	 * 
	 * @param appId
	 * @return
	 * @throws SQLException
	 */
	public String getSubDeptByAppId(int appId) throws SQLException {
		String sql = "SELECT sub_dept FROM applications_more WHERE id="+appId;
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		String subDeptName = "";
		int deptId = 0;
		if (rs.next()) {
			deptId = rs.getInt(1);
		}
		if (deptId > 0) {
			subDeptName = getSubDept(deptId);
		}
		return subDeptName;
	}
	
	/**
	 * 
	 * @param loggedInId
	 * @return
	 * @throws SQLException
	 */
	public ResultSet getAllChats(int loggedInId) throws SQLException {
		String sql = "SELECT DISTINCT id, c_by, c_to FROM chat_head WHERE c_to=? OR c_by=? ORDER BY id";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, loggedInId);
		ps.setInt(2, loggedInId);
		return ps.executeQuery();
		
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public int getDeptHeadById(int id) throws SQLException {
		String sql = "SELECT dept_head FROM dept WHERE id="+id;
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		if(rs.next()) {
			return rs.getInt(1);
		}
		return 0;
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public ResultSet getAppNotificationByStaffId(int id) throws SQLException {
		String sql = "SELECT * FROM applications_realtime WHERE staff_id="+id+" AND staff_read=0";
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		return rs;
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public ResultSet getAppNotificationByMcId(int id) throws SQLException {
		String sql = "SELECT * FROM applications_realtime WHERE mc_id="+id+" AND mc_read=0";
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		return rs;
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public String getAppSubmittedOnById(int id) throws SQLException {
		String sql = "SELECT submitted_on FROM applications WHERE id="+id;
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		if(rs.next()) {
			return rs.getString(1);
		}
		return "";
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public String getSubjectById(int id) throws SQLException {
		String sql = "SELECT subject FROM applications WHERE id="+id;
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		if(rs.next()) {
			return rs.getString(1);
		}
		return "";
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public int getAppsUnreadCountByStaffId(int id) throws SQLException {
		String sql = "SELECT count(*) FROM applications_realtime WHERE staff_id="+id+" AND staff_read=0";
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		if(rs.next()) {
			return rs.getInt(1);
		}
		return 0;
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public int getAppsUnreadCountByMcId(int id) throws SQLException {
		String sql = "SELECT count(*) FROM applications_realtime WHERE mc_id="+id+" AND mc_read=0";
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		if(rs.next()) {
			return rs.getInt(1);
		}
		return 0;
	}
	
	/**
	 * 
	 * @return
	 * @throws SQLException
	 */
	public int getAppsUnreadCountAdmin() throws SQLException {
		String sql = "SELECT count(*) FROM applications_realtime WHERE admin_id=4 AND admin_read=0";
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		if(rs.next()) {
			return rs.getInt(1);
		}
		return 0;
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public ResultSet getAppNotificationAdmin() throws SQLException {
		String sql = "SELECT * FROM applications_realtime WHERE admin_id=4 AND admin_read=0";
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		return rs;
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public int getMcIdByDeptId(int id) throws SQLException {
		String sql = "SELECT mc_id FROM dept WHERE id="+id;
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		if (rs.next()) {
			return rs.getInt(1);
		}
		return 0;
	}
	
	public ResultSet getAllBuzzTypes() throws SQLException {
		String sql = "SELECT * FROM business";
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		return rs;
	}
	
	public ResultSet getAllBuzzTypeById(int id) throws SQLException {
		String sql = "SELECT * FROM business WHERE id="+id;
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		return rs;
	}
	
	public int getMcIdByStaffId(int id) throws SQLException {
		String sql = "SELECT mc_id FROM staff WHERE id="+id;
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		if (rs.next()) {
			return rs.getInt(1);
		}
		return 0;
	}
	
	public String getDeptNameByStaffId(int id) throws SQLException {
		String sql = "SELECT dname FROM dept WHERE id=(SELECT dept FROM staff WHERE id="+id+")";
		Statement st = con.createStatement();
		ResultSet rs = null;
		rs = st.executeQuery(sql);
		if(rs.next()) {
			return rs.getString(1);
		}
		return "";
	}
	
}
