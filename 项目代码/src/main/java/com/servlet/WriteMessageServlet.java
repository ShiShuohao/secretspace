package com.servlet;

import com.dao.MessageDao;
import com.pojo.Message;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class WriteMessageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String username_from = (String) session.getAttribute("username");
        String username_to = (String) session.getAttribute("username_to");
        String headline = req.getParameter("headline");
        String content = req.getParameter("content");
        int state = 0;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String format = simpleDateFormat.format(new Date());
        Date sendtime = null;
        try {
            sendtime = simpleDateFormat.parse(format);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        try {
            MessageDao.insertMessage(new Message(0,username_from,username_to,headline,content,sendtime,state));
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
