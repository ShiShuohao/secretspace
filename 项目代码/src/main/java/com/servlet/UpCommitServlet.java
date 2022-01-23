package com.servlet;

import com.dao.BlogDao;
import com.dao.CommitDao;
import com.pojo.Commit;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UpCommitServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int id = (int) session.getAttribute("blog_id");
        String author = (String) session.getAttribute("username");
        String content = req.getParameter("content");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date = simpleDateFormat.parse(simpleDateFormat.format(new Date()));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        try {
            CommitDao.insertCommit(new Commit(0,id,author,content,date));
        } catch (Exception e) {
            e.printStackTrace();
        }
//        commitnum的更新操作使用触发器来实现
//        try {
//            BlogDao.updateBlogForCommitnumInc(id);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        resp.sendRedirect("text.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
