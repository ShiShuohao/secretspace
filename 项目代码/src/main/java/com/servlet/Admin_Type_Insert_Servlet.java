package com.servlet;

import com.dao.TypeDao;
import com.pojo.Type;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class Admin_Type_Insert_Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        List<Type> list = null;
        try {
            list = TypeDao.selectType();
        } catch (Exception e) {
            e.printStackTrace();
        }
        boolean contains = false;
        for (Type t:list){
            if (t.getName().equals(type)){
                contains = true;
                break;
            }
        }
        if (contains==true){
            resp.sendRedirect("typeInsertError.jsp");
        }else{
            try {
                TypeDao.insertType(new Type(type,1));
            } catch (Exception e) {
                e.printStackTrace();
            }
            resp.sendRedirect("admin_type.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
