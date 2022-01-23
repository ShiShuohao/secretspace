package com.servlet;

import com.dao.UserDao;
import com.pojo.User;
import com.utils.UserPsdUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

public class FindPsdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String question = req.getParameter("question");
        String answer = req.getParameter("answer");
        Map<String,String> map = null;
        try {
            map = UserPsdUtil.username_password();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (map.containsKey(username)==false){
            resp.sendRedirect("findError.jsp");
        }else {
            User user = null;
            try {
                user = UserDao.selectUser(username);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (user.getQuestion().equals(question)==false||user.getAnswer().equals(answer)==false){
                resp.sendRedirect("findError.jsp");
            }else {
                HttpSession session = req.getSession();
                session.setAttribute("password",user.getPassword());
                resp.sendRedirect("findSuccess.jsp");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
