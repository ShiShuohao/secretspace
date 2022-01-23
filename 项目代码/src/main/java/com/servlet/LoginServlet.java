package com.servlet;

import com.utils.StringUtil;
import com.utils.UserPsdUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        if (StringUtil.isEmpty(username)||StringUtil.isEmpty(password)){
            resp.sendRedirect("loginError.jsp");
        }else{
            Map<String,String> map = null;
            try {
                map = UserPsdUtil.username_password();
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (map.containsKey(username)==false){
                resp.sendRedirect("loginError.jsp");
            }else if (map.get(username).equals(password)==false){
                resp.sendRedirect("loginError.jsp");
            }else{
                HttpSession session = req.getSession();
                session.setAttribute("username",username);
                resp.sendRedirect("chooseType.jsp");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
