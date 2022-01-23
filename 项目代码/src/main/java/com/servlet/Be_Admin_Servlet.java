package com.servlet;

import com.dao.UserDao;
import com.pojo.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Be_Admin_Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        User user = null;
        try {
            user = UserDao.selectUser(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        int role = user.getRole();
        if (role==0){
            try {
                UserDao.updateUser(username,2);
            } catch (Exception e) {
                e.printStackTrace();
            }
            resp.sendRedirect("admin_role_waiting.jsp");
        }else if (role==1){
            resp.sendRedirect("admin_role_success.jsp");
        }else {
            resp.sendRedirect("admin_role_waiting.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
