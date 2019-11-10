package com.hypertrac.commons;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionFilter implements Filter {

	private FilterConfig config;

	public SessionFilter() {
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		this.config = filterConfig;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpSession session = ((HttpServletRequest) request).getSession(false);
		if (session != null && !session.isNew() && session.getAttribute("loggedInUserId") != null
				&& session.getAttribute("loggedInUserId") != "") {
			((HttpServletResponse) response).setHeader("Pragma", "No-cache");
			((HttpServletResponse) response).setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			((HttpServletResponse) response).setDateHeader("Expires", -1);
			chain.doFilter(request, response);
		} else {
			((HttpServletResponse) response).sendRedirect("../../signin.jsp");
		}
	}

}
