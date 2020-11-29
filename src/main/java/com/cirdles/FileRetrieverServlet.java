package com.cirdles;

import org.zeroturnaround.zip.ZipUtil;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class FileRetrieverServlet
 */
@WebServlet(name = "FileRetrieverServlet", urlPatterns = { "/retrieve" })
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)


public class FileRetrieverServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //Part fileNamePart = request.getPart("filename");
            //String fileName = fileNamePart.getSubmittedFileName();
            File f = new File("/usr/local/user_files/");
            f.mkdir();
            for (Part part : request.getParts()) {
                part.write("/usr/local/user_files/" + "test.zip");
            }
            ZipUtil.unpack(new File("/usr/local/user_files/" + "test.zip"), new File("/usr/local/user_files/"));
        }
        catch (NullPointerException | ServletException | IOException e) {
            response.getWriter().println(e);
            }
        //String req = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
        //response.getWriter().println(req);
    }

}
