package com.cirdles;

import org.zeroturnaround.zip.ZipUtil;

import java.io.*;
import java.nio.file.*;
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
@WebServlet(name = "DeleteServlet", urlPatterns = {"/delete/*"})


public class DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String contextPath = request.getPathInfo();
        try {
            Files.delete(Paths.get(contextPath));
        }
        catch (IOException | SecurityException e) {
            response.getWriter().println(e);
        }
    }
    public void DoDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String contextPath = request.getPathInfo();

        //Fixes removal of _ in user_files directory relative to provided context.
        //Alternatively we can just remove the _ in the path.
        //Not used in PostMan Trial steps
        //contextPath = contextPath.substring(0,15) + "_" + contextPath.substring(15);
        try {
            Files.delete(Paths.get(contextPath));
        }
        catch (IOException | SecurityException e) {
            response.getWriter().println(e);
        }
        }
    }


