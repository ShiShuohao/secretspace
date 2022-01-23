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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

public class Logon_1_Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Map<String, String> map = null;
        try {
            map = UserPsdUtil.username_password();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (map.containsKey(username)){
            resp.sendRedirect("logonError.jsp");
        }else{
            try {
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date date = dateFormat.parse("2000-01-01");
                UserDao.insertUser(new User(username,password,null, date,null,null,"你出生的城市是哪里？",null,0));
            } catch (Exception e) {
                e.printStackTrace();
            }
            HttpSession session = req.getSession();
            session.setAttribute("username",username);
            resp.sendRedirect("logon_2.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
