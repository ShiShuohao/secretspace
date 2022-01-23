package com.servlet;

import com.dao.BlogDao;
import com.pojo.Blog;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UpBlogServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String headline = req.getParameter("headline");
        String type = req.getParameter("type");
        String up = req.getParameter("uptime");
        String content = req.getParameter("content");
        System.out.println(content);
        HttpSession session = req.getSession();
        String  author = (String) session.getAttribute("username");
        Date uptime = null;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            uptime = simpleDateFormat.parse(up);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        try {
            BlogDao.insertBlog(new Blog(0,headline,author,content,type,0,0,uptime));
        } catch (Exception e) {
            e.printStackTrace();
        }
        resp.sendRedirect("admin_home.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
