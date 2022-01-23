package com.servlet;

import com.dao.BlogDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UpdateBlogServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String headline = req.getParameter("headline");
        String type = req.getParameter("type");
        String up = req.getParameter("uptime");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date uptime = null;
        try {
            uptime = simpleDateFormat.parse(up);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String content = req.getParameter("content");
        HttpSession session = req.getSession();
        int id = (int) session.getAttribute("blog_id");
        try {
            BlogDao.updateBlog(id,headline,content,type,uptime);
        } catch (Exception e) {
            e.printStackTrace();
        }
        resp.sendRedirect("admin_blog.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
