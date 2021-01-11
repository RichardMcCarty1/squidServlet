package com.cirdles;

import org.apache.http.ConnectionClosedException;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntity;
import org.apache.http.entity.mime.content.FileBody;
import org.zeroturnaround.zip.ZipBreakException;
import org.zeroturnaround.zip.ZipException;
import org.zeroturnaround.zip.ZipUtil;

import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
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
@WebServlet(name = "FileSenderServlet", urlPatterns = { "/filesenderservlet" })
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)


public class FileSenderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //POSSIBLE ISSUES: REQUEST TIMEOUT BECAUSE CLIENT DISCONNECTS, CANT PACK USER_FILES BECAUSE SOMETHINGS BEING WRITTEN
            String send = "send";
            response.getWriter().println("frick");
            ZipUtil.pack(new File("/usr/local/user_files"), new File("/usr/local/testuser.zip"));
            //Create Endpoint Connection
            URLConnection connection = new URL("http://192.168.56.1:8080/Services/fileretriever").openConnection();
            //Casting to HTTPUrlConnection type for requestMethod
            HttpURLConnection http = (HttpURLConnection) connection;
            http.setRequestMethod("POST");
            http.setDoOutput(true);
            FileBody fileBody = new FileBody(new File("/usr/local/testuser.zip"));
            MultipartEntity multipartEntity = new MultipartEntity(HttpMultipartMode.STRICT);
            multipartEntity.addPart("file", fileBody);
            connection.setRequestProperty("Content-Type", multipartEntity.getContentType().getValue());
            OutputStream out = connection.getOutputStream();
            try {
                multipartEntity.writeTo(out);
                response.getWriter().println("POSTED");
            } finally {
                out.close();
            }
        }
        catch (IOException | NullPointerException | ZipException | ZipBreakException e){
            response.getWriter().println(e);
        }
    }

}
