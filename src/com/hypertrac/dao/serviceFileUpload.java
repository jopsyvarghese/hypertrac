package com.hypertrac.dao;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.hypertrac.commons.Helper;

/**
 * Servlet implementation class serviceFileUpload
 */
@WebServlet("/serviceFileUpload")
public class serviceFileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public serviceFileUpload() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (!isMultipart) {
		} else {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List items = null;
			try {
				items = upload.parseRequest(request);
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
			Iterator itr = items.iterator();
			while (itr.hasNext()) {
				FileItem item = (FileItem) itr.next();
				if (item.isFormField()) {
				} else {
					try {
						String itemName = item.getName();
						Helper help = new Helper();
						String relativePath = "/img/service/" + help.getYear() +"/"+ help.getMonth() +"/"+ help.getDay()+"/";
						String realPath = getServletContext().getRealPath(relativePath);
						File destinationDir = new File(realPath);
						File savedFile = new File(destinationDir, itemName);
						boolean result = false;
						if (!savedFile.exists()) {
							
							try {
								destinationDir.mkdir();
								item.write(savedFile);
								result = true;
							} catch (SecurityException se) {
								se.printStackTrace();
							}
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
}
