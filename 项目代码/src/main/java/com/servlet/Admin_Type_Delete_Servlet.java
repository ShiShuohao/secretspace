package com.servlet;

import com.dao.BlogDao;
import com.dao.TypeDao;
import com.pojo.Blog;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class Admin_Type_Delete_Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        List<Blog> list = null;
        try {
            list = BlogDao.selectBlog(type);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (list.isEmpty()==false){
            resp.sendRedirect("typeDeleteError.jsp");
        }else {
            try {
                TypeDao.deleteType(type);
            } catch (Exception e) {
                e.printStackTrace();
            }
            resp.sendRedirect("admin_type.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
