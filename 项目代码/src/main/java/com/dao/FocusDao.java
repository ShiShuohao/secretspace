package com.dao;

import com.pojo.Focus;
import com.utils.DButil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class FocusDao {
    public static int insertFocus(Focus focus) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("insert into focus(username_from, username_to) values('" + focus.getUsername_from() + "','" + focus.getUsername_to() + "')");
        DButil.close(null,statement,connection);
        return i;
    }
    public static List<Focus> selectFocus() throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        List<Focus> list = new ArrayList<>();
        ResultSet resultSet = statement.executeQuery("select * from focus");
        while (resultSet.next()){
            list.add(new Focus(resultSet.getInt("id"),resultSet.getString("username_from"),resultSet.getString("username_to")));
        }
        DButil.close(resultSet,statement,connection);
        return list;
    }
    public static int deleteFocus(int id) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("delete from focus where id='" + id + "'");
        DButil.close(null,statement,connection);
        return i;
    }
    public static int deleteFocus(String username) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("delete from focus where username_from='" + username + "' or username_to='" + username + "';");
        DButil.close(null,statement,connection);
        return i;
    }
}
