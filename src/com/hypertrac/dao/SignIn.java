package com.hypertrac.dao;

import java.io.IOException;
import java.io.PrintWriter;
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
	 * 
	 * @see HttpServlet#HttpServlet()
	 */
	public SignIn() throws ClassNotFoundException, SQLException {
		super();
		helper = new Helper();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String username = request.getParameter("uname");
		String password = request.getParameter("pwd");
		Connection con = null;
		ResultSet rs = null;
		try {
			con = com.hypertrac.dao.database.getConnection();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			PreparedStatement ps = con
					.prepareStatement("SELECT * FROM auth WHERE uname = ? AND pwd = ? AND pwd_reset=? AND state=?");
			ps.setString(1, username);
			ps.setString(2, helper.encryptPwd(password));
			ps.setInt(3, 0);
			ps.setInt(4, 1);
			rs = ps.executeQuery();
			if (rs.next()) {
				HttpSession session = request.getSession();
				session.setAttribute("loggedInUserId", rs.getInt(1));
				session.setAttribute("loggedInUserName", rs.getString(2));
				session.setAttribute("loggedInUserRole", rs.getInt(8));
				session.setAttribute("myImg", rs.getString(15));
				int role = rs.getInt(8);

				// Store Logged In Details
				int id = 0;
				ResultSet rsLog = null;
				id = Integer.parseInt("" + rs.getInt(1));
				String sqlLog = "SELECT in_time FROM login_logs WHERE id=?";
				PreparedStatement psLog = con.prepareStatement(sqlLog);
				psLog.setInt(1, id);
				rsLog = ps.executeQuery();
				if (rsLog.next()) {
					String query = "UPDATE login_logs SET in_time=? WHERE id=?";
					PreparedStatement pst = con.prepareStatement(query);
					pst.setString(1, helper.getDateTime());
					pst.setInt(2, id);
					pst.executeUpdate();
				} else {
					String query = "INSERT INTO login_logs(id, in_time, out_time) VALUES (?,?,?)";
					PreparedStatement pst = con.prepareStatement(query);
					pst.setInt(1, id);
					pst.setString(2, helper.getDateTime());
					pst.setString(3, helper.getDateTime());
					pst.executeUpdate();
				}

				if (role == 0) {
					response.sendRedirect("Dept/User");
				} else if (role == 1) {
					response.sendRedirect("Dept/Staff");
				} else if (role == 2) {
					response.sendRedirect("Dept/Major");
				} else if (role == 3) {
					response.sendRedirect("Dept/Admin");
				} else if (role == 4) {
					response.sendRedirect("Dept/User");
				}
			} else {
				out.println("Invalid Credentials");
				RequestDispatcher rd = request.getRequestDispatcher("signin.jsp");
				request.setAttribute("status",
						"<center><strong class='text-danger'>" + "Invalid Credentials / Account Disabled</strong><br/>"
								+ "<small style='color:blue;font-weight:bold'>"
								+ "Please do Re-Try / Forgot Password / Contact Administrator" + "</small></center>");
				rd.forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
