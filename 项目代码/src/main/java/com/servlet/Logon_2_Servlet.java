package com.servlet;

import com.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Logon_2_Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sex = req.getParameter("sex");
        String birth = req.getParameter("birthday");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date birthday = null;
        try {
            birthday = simpleDateFormat.parse(birth);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String province = req.getParameter("province");
        String city = req.getParameter("city");
        String area = province + city;
        String question = req.getParameter("question");
        String answer = req.getParameter("answer");
        HttpSession session = req.getSession();
        String username = (String) session.getAttribute("username");
        try {
            UserDao.updateUser(username,sex,birthday,area,question,answer);
        } catch (Exception e) {
            e.printStackTrace();
        }
        resp.sendRedirect("logon_3.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
