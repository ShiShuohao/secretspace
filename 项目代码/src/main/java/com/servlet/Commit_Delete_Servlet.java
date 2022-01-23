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

public class Commit_Delete_Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id_ = req.getParameter("id");
        int id = Integer.parseInt(id_);
        Commit commit = null;
        try {
            commit = CommitDao.selectCommit(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        int blog_id = commit.getBlog_id();
        //更新Blog表使commitnum减1的操作由触发器实现
//        try {
//            BlogDao.updateBlogForCommitnumDec(blog_id);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        try {
            CommitDao.deleteCommitById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        resp.sendRedirect("userCommit.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
