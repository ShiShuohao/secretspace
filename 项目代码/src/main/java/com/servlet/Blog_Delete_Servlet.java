package com.servlet;

import com.utils.DButil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

public class Blog_Delete_Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id_ = req.getParameter("id");
        int id = Integer.parseInt(id_);
//        try {
//            CommitDao.deleteCommit(id);
//            CollectDao.deleteCollect(id);
//            BlogDao.deleteBlog(id);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        //删除帖子时需要先将该帖子的全部回复和收藏删除，再将Blog表里的帖子删除，因此要将这三个操作放到一个事务中!
        //因此本部分的操作不在调用Dao层，此处与Admin_User_Servlet中删除用户时类似!
//        Connection connection = DButil.getConnection();
//        try {
//            Statement statement = connection.createStatement();
//            connection.setAutoCommit(false);
//            statement.executeUpdate("delete from commit where blog_id='"+id+"'");
//            statement.executeUpdate("delete from collect where blog_id='"+id+"'");
//            statement.executeUpdate("delete from blog where id='"+id+"'");
//            connection.commit();
//            connection.setAutoCommit(true);
//            statement.close();
//            connection.close();
//        } catch (SQLException e) {
//            try {
//                connection.rollback();
//            } catch (SQLException ex) {
//                ex.printStackTrace();
//            }
//            e.printStackTrace();
//            try {
//                connection.close();
//            } catch (SQLException ex) {
//                ex.printStackTrace();
//            }
//        }
        Connection connection = DButil.getConnection();
        CallableStatement callableStatement = null;
        try {
            callableStatement = connection.prepareCall("{call deleteBlog('" + id + "')}");
            callableStatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            callableStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("admin_blog.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
