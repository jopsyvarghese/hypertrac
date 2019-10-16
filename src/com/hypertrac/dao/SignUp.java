package com.hypertrac.dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.hypertrac.commons.Helper;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Helper helper;

	/**
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @see HttpServlet#HttpServlet()
	 */
	public SignUp() throws ClassNotFoundException, SQLException {
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
		String fname = request.getParameter("fname");
		String addr = request.getParameter("addr");
		String email = request.getParameter("email");
		Long mob = Long.parseLong(request.getParameter("mob"));
		String dob = request.getParameter("dob");
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("pwd");
		String proPic = "";
		int role = 0;
		try {
			role = Integer.parseInt(request.getParameter("role"));	
		} catch(NumberFormatException ne) {}
		String rc = request.getParameter("rc");
		Connection con = null;
		try {
			con = com.hypertrac.dao.database.getConnection();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String currentTime = helper.getDateTime();

		PreparedStatement ps;
		try {
			ps = con.prepareStatement(
					"INSERT INTO auth(fname, addr, uname, pwd, email, mob, role, created_at, rc, mob2, created_by, pro_pic, dob) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, fname);
			ps.setString(2, addr);
			ps.setString(3, uname);
			ps.setString(4,  helper.encryptPwd(pwd));
			ps.setString(5, email);
			ps.setLong(6, mob);
			ps.setInt(7, role);
			ps.setString(8, currentTime);
			ps.setString(9, rc);
			ps.setInt(10, 0);
            ps.setInt(11, 0);
            ps.setString(12, proPic);
            ps.setString(13, dob);
			int i = ps.executeUpdate();
			RequestDispatcher rd = request.getRequestDispatcher("signin.jsp");
			request.setAttribute("status", "<strong class='text-success'>Registration Successful! Account will be activated in 24 Hrs.</strong>");
			rd.forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	

}
