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
import com.hypertrac.commons.Helper;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Helper helper;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignUp() {
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
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		Long mob = Long.parseLong(request.getParameter("mob"));
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("pwd");
//		String pwdHash = helper.getHashedPwd(pwd);
		Connection con = null;
		con = com.hypertrac.dao.database.getConnection();
		String currentTime = helper.getDateTime();

		PreparedStatement ps;
		try {
			ps = con.prepareStatement(
					"INSERT INTO auth(fname, lname, uname, pwd, email, mob, role, created_at) VALUES(?,?,?,?,?,?,?,?)");
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, uname);
			ps.setString(4, pwd);
			ps.setString(5, email);
			ps.setLong(6, mob);
			ps.setInt(7, 0);
			ps.setString(8, currentTime);
			out.print(ps);
			int i = ps.executeUpdate();
			RequestDispatcher rd = request.getRequestDispatcher("signin.jsp");
			request.setAttribute("status",
					"<strong class='text-success'>Registration Successful! Please Login...</strong>"+i);
			rd.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	

}
