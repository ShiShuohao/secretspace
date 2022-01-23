package com.servlet;

import com.dao.FocusDao;
import com.pojo.Focus;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class FocusServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String username_from = (String) session.getAttribute("username");
        String username_to = req.getParameter("username_to");
        List<Focus> list = null;
        try {
            list = FocusDao.selectFocus();
        } catch (Exception e) {
            e.printStackTrace();
        }
        boolean focused = false;
        for (int i=0;i<list.size();i++){
            if (list.get(i).getUsername_from().equals(username_from)&&list.get(i).getUsername_to().equals(username_to)){
                focused = true;
                break;
            }
        }
        if (focused==false){
            try {
                FocusDao.insertFocus(new Focus(0,username_from,username_to));
            } catch (Exception e) {
                e.printStackTrace();
            }
            resp.sendRedirect("focusSuccess.jsp");
        }else {
            resp.sendRedirect("focusError.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
