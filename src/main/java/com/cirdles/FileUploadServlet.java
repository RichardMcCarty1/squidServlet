package com.cirdles;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class FileUploadServlet
 */

@WebServlet(name = "FileUploadServlet", urlPatterns = { "/fileuploadservlet" })
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 *1, // MB
		maxFileSize = 1024 * 1024 * 10, // 10 MB
		maxRequestSize = 1024 * 1024 * 100 // 100 MB
)


public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String dirPath = "/usr/local/user_files";
		File dir = new File(dirPath);
		String[] files = dir.list();
		if (files.length == 0) {
			out.print("The directory is empty");
		} else {
			for (String aFile : files) {
				out.print(aFile + "***");
			}
		}
		out.close();
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Part filePart = request.getPart("file");
		String fileName = filePart.getSubmittedFileName();
		for (Part part : request.getParts()) {
			part.write("/usr/local/user_files/" + fileName);
		}
		response.setStatus(HttpServletResponse.SC_NO_CONTENT);
	}

}
