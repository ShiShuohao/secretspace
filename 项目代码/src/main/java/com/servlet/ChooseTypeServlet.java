package com.servlet;

import com.dao.BlogDao;
import com.pojo.Blog;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class ChooseTypeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        List<Blog> list = null;
        if (type.equals("all")){
            try {
                list = BlogDao.selectBlog();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else {
            try {
                list = BlogDao.selectBlog(type);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        HttpSession session = req.getSession();
        session.setAttribute("blogList",list);
        resp.sendRedirect("type.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
