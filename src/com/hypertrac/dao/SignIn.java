package com.hypertrac.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.CryptoPrimitive;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hypertrac.commons.Helper;

import sun.misc.BASE64Encoder;

/**
 * Servlet implementation class SignIn
 */
@WebServlet("/SignIn")
public class SignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Helper helper;
	public static final String DEFAULT_ENCODING = "UTF-8";
	static BASE64Encoder enc = new BASE64Encoder();
	/**
     * @see HttpServlet#HttpServlet()
     */
    public SignIn() {
        super();
        helper = new Helper();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String username = request.getParameter("uname");
		String password = request.getParameter("pwd");
		String pwd = helper.getHashedPwd(password);
		System.out.println(pwd);
		byte[] salt = null;
		try {
			salt = Helper.getSalt();
		} catch (NoSuchAlgorithmException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Connection con = null;
		ResultSet rs = null;
		con = com.hypertrac.dao.database.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("SELECT * FROM auth WHERE uname = ? AND pwd = ?");
			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if (rs.next()) {
				HttpSession session = request.getSession();
				session.setAttribute("loggedInUserId", rs.getInt(1));
				session.setAttribute("loggedInUserName", rs.getString(2));
				session.setAttribute("loggedInUserRole", rs.getInt(8));
				int role = rs.getInt(8);
				if (role == 0 ) {
					response.sendRedirect("Dept/User");
				} else if(role == 1) {
					response.sendRedirect("Dept/Staff");
				} else if(role == 2) {
					response.sendRedirect("Dept/Major");
				}else if(role == 3) {
					response.sendRedirect("Dept/Admin");
				}
			} else {
				out.println("Invalid Credentials");
				RequestDispatcher rd = request.getRequestDispatcher("signin.jsp");
				request.setAttribute("status", "<strong class='text-danger'>Invalid Credentials, Please Try Again...</strong><br/>");
				rd.forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}



}
