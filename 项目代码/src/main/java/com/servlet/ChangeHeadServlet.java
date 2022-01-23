package com.servlet;

import com.dao.UserDao;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

public class ChangeHeadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String username = (String) session.getAttribute("username");
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload sfu = new ServletFileUpload(factory);
        sfu.setHeaderEncoding("utf-8");
        List<FileItem> fileItemList = null;
        try {
            fileItemList = sfu.parseRequest(req);
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        FileItem fileItem = fileItemList.get(0);
        String fileName = fileItem.getName();
        String suffix = fileName.substring(fileName.lastIndexOf('.'));//扩展名
        String newFileName = new Date().getTime() + username + "head" + suffix;
        String path = req.getSession().getServletContext().getRealPath("/")+newFileName;//重要，存入服务器
        File file = new File(path);
        try {
            fileItem.write(file);
        } catch (Exception e) {
            e.printStackTrace();
        }
        fileItem.delete();
        try {
            UserDao.updateUser(username,newFileName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        resp.sendRedirect("userHome.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
