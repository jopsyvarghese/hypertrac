<%@page import="com.hypertrac.commons.Helper"%>
<%@page import="java.sql.Timestamp"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<%
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (!isMultipart) {
		} else {
			String contractorName = request.getParameter("contractorName");
			String rc = request.getParameter("rc");
			String addr = request.getParameter("addr");
			String phone = request.getParameter("phone");
			String phone2 = request.getParameter("phone2");
			String email = request.getParameter("email");
			String website = request.getParameter("website");
			String buzzType = request.getParameter("buzzType");
			String docName = request.getParameter("docName");
			String majorClient = request.getParameter("majorClient");
			String subDept = request.getParameter("subDept");
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
						String relativePath = "/img/service/";
						String realPath = getServletContext().getRealPath(relativePath);
						File destinationDir = new File(realPath);
						if(!destinationDir.exists()) {
							destinationDir.mkdir();
						}
						Timestamp timestamp = new Timestamp(System.currentTimeMillis());
						File savedFile = new File(destinationDir, ""+timestamp.getTime()+itemName);
							try {
								item.write(savedFile);
							} catch (SecurityException se) {
								se.printStackTrace();
							} catch (FileNotFoundException fne) {
								fne.printStackTrace();
							}
							out.println(savedFile.getName());
						out.println(savedFile.getAbsolutePath());
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
%>