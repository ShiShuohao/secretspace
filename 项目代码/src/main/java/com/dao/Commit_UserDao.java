package com.dao;

import com.pojo.Commit_User;
import com.utils.DButil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Commit_UserDao {
    public static List<Commit_User> selectCommit_User(int blog_id) throws Exception{
        Connection connection = DButil.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from commit_user where blog_id='" + blog_id + "' order by uptime desc");
        List<Commit_User> list = new ArrayList<>();
        while (resultSet.next()){
            list.add(new Commit_User(resultSet.getInt("id"),
                    resultSet.getInt("blog_id"),
                    resultSet.getString("author"),
                    resultSet.getString("content"),
                    resultSet.getDate("uptime"),
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
