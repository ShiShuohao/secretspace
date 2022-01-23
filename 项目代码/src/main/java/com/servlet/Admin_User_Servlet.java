package com.servlet;

import com.dao.*;
import com.pojo.Commit;
import com.utils.DButil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class Admin_User_Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        //删除用户时，需要先将用户的收藏、回复、私信、关注、个性信息都删除，再将用户从用户表里删除！
        //本来可以使用下面的一组语句删除，现在将数据库操作写在这个方法里，不再调用Dao层，同时将下面六个SQL操作并为一个事务，因为这六个必须同时进行！
//        try {
//            CollectDao.deleteCollect(username);
//            CommitDao.deleteCommit(username);
//            FocusDao.deleteFocus(username);
//            MessageDao.deleteMessage(username);
//            HobbyDao.deleteHobby(username);
//            UserDao.deleteUser(username);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        Connection connection = DButil.getConnection();
        try {
            Statement statement = connection.createStatement();
            connection.setAutoCommit(false); //更改默认提交方式
            statement.executeUpdate("delete from collect where user='"+username+"'");
            statement.executeUpdate("delete from commit where author='"+username+"'");
            statement.executeUpdate("delete from focus where username_from='"+username+"' or username_to='"+username+"'");
            statement.executeUpdate("delete from message where username_from='"+username+"' or username_to='"+username+"'");
            statement.executeUpdate("delete from hobby where username='"+username+"'");
            statement.executeUpdate("delete from user where username='"+username+"'");
            connection.commit();//提交事务
            connection.setAutoCommit(true);//恢复默认提交方式
            statement.close();
            connection.close();
        } catch (SQLException e) {
            try {
                connection.rollback();//回滚
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            try {
                connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        resp.sendRedirect("admin_user.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
