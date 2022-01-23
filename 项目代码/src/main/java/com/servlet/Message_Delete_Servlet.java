package com.servlet;

import com.dao.MessageDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Message_Delete_Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id_ = req.getParameter("id");
        int id = Integer.parseInt(id_);
        try {
            MessageDao.deleteMessage(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        resp.sendRedirect("userMessage.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
