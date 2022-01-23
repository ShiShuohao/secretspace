package com.dao;

import com.pojo.Focus_User;
import com.utils.DButil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Focus_UserDao {
    public static List<Focus_User> selectFocus_User(String username_from) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from focus,user where focus.username_to=user.username and focus.username_from='" + username_from + "'");
        List<Focus_User> list = new ArrayList<>();
        while (resultSet.next()){
            list.add(new Focus_User(resultSet.getInt("id"),
                    resultSet.getString("username_from"),
                    resultSet.getString("username_to"),
                    resultSet.getString("password"),
                    resultSet.getString("sex"),
                    resultSet.getDate("birthday"),
                    resultSet.getString("area"),
                    resultSet.getString("headphoto"),
                    resultSet.getString("question"),
                    resultSet.getString("answer"),
                    resultSet.getInt("role")));
        }
        DButil.close(resultSet,statement,connection);
        return list;
    }
}
