package com.servlet;

import com.dao.BlogDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class Blog_Content_Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id_ = req.getParameter("id");
        int id = Integer.parseInt(id_);
        HttpSession session = req.getSession();
        session.setAttribute("blog_id",id);
        try {
            BlogDao.updateBlog(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        resp.sendRedirect("text.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
