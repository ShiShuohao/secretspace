package com.servlet;

import com.dao.BlogDao;
import com.dao.HobbyDao;
import com.pojo.Blog;
import com.pojo.Hobby;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class TypeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String want = req.getParameter("want");
        List<Blog> list = null;
        List<Blog> newList = new ArrayList<>();
        try {
            list = BlogDao.selectBlog();
        } catch (Exception e) {
            e.printStackTrace();
        }
        for (Blog blog:list){
            if (blog.getHeadline().contains(want)){
                newList.add(blog);
            }
        }
        HttpSession session = req.getSession();
        String username = (String) session.getAttribute("username");
        List<Hobby> hobbyList = null;
        try {
            hobbyList = HobbyDao.selectHobby(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        boolean contains = false;
        for (Hobby hobby : hobbyList){
            if (hobby.getContent().equals(want)){
                contains = true;
                break;
            }
        }
        if (contains==false){
            try {
                HobbyDao.insertHobby(new Hobby(0,username,want));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        session.setAttribute("blogList",newList);
        resp.sendRedirect("type.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}