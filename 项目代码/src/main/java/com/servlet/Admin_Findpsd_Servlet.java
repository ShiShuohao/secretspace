package com.servlet;

import com.dao.FindpsdDao;
import com.pojo.Findpsd;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Admin_Findpsd_Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String psd = req.getParameter("psd");
        try {
            FindpsdDao.insertFindpsd(new Findpsd(psd));
        } catch (Exception e) {
            e.printStackTrace();
        }
        resp.sendRedirect("admin_findpsd.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
