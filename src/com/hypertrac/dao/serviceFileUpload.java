package com.hypertrac.dao;

import java.io.File;
import java.io.IOException;
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
						System.out.println("Day: " + help.getDay());
						System.out.println("Month: " + help.getMonth());
						System.out.println("Year: " + help.getYear());

//						File savedFile = new File("img\\" + help.getYear() + "\\" + help.getMonth() + "\\"
//								+ help.getDay() + "\\" + itemName);
						
						File savedFile = new File("applications");
						if (!savedFile.exists()) {
							boolean result = false;

							try {
								savedFile.mkdir();
								result = true;
							} catch (SecurityException se) {
								// handle it
							}
							item.write(savedFile);
						}
						System.out.println("Agterdflj lsdf ls");
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
}
