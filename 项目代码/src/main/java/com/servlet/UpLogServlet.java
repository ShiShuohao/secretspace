package com.servlet;

import com.dao.LogDao;
import com.pojo.Log;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UpLogServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String version = req.getParameter("version");
        String update = req.getParameter("date");
        Date date = null;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            date = simpleDateFormat.parse(update);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String content = req.getParameter("content");
        try {
            LogDao.insertLog(new Log(0,version,date,content));
        } catch (Exception e) {
            e.printStackTrace();
        }
        resp.sendRedirect("admin_home.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
